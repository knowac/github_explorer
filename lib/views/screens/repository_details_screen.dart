import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:github_explorer/core/constants/constants.dart';
import 'package:github_explorer/generated/l10n.dart';
import 'package:github_explorer/viewmodels/details.dart';
import 'package:github_explorer/viewmodels/issues.dart';
import 'package:github_explorer/viewmodels/pulls.dart';
import 'package:github_explorer/views/widgets/boxes/default_vertical_sized_box.dart';
import 'package:github_explorer/views/widgets/lists/issue_tile.dart';
import 'package:github_explorer/views/widgets/lists/list_separator.dart';
import 'package:github_explorer/views/widgets/loading_indicator.dart';
import 'package:github_explorer/views/widgets/texts/center_body_medium_text.dart';
import 'package:url_launcher/url_launcher.dart';

class RepositoryDetailsScreen extends ConsumerStatefulWidget {
  final String? owner;
  final String? name;

  const RepositoryDetailsScreen({
    super.key,
    required this.owner,
    required this.name,
  });

  @override
  ConsumerState createState() => _RepositoryDetailsScreenState();
}

class _RepositoryDetailsScreenState
    extends ConsumerState<RepositoryDetailsScreen>
    with SingleTickerProviderStateMixin {
  final _scrollIssuesController = ScrollController();
  final _scrollPullsController = ScrollController();

  bool _isLoadingMoreIssues = false;
  bool _isLoadingMorePulls = false;

  @override
  void dispose() {
    _scrollIssuesController.dispose();
    _scrollPullsController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    if (widget.owner != null && widget.name != null) {
      Future.microtask(
        () async {
          await _reload();
        },
      );
    }
    _scrollIssuesController.addListener(_onScrollIssues);
    _scrollPullsController.addListener(_onScrollPulls);
  }

  Future<void> _reload() async {
    await ref.read(detailsProvider.notifier).loadRepoDetails(
          widget.owner!,
          widget.name!,
        );
    await ref.read(issuesProvider.notifier).fetch(
          widget.owner!,
          widget.name!,
        );
    await ref.read(pullsProvider.notifier).fetch(
          widget.owner!,
          widget.name!,
        );
  }

  /// Action specific for scrolling issues
  void _onScrollIssues() {
    final maxScroll = _scrollIssuesController.position.maxScrollExtent;
    final currentScroll = _scrollIssuesController.position.pixels;
    if (maxScroll - currentScroll <= kScrollDelta) {
      setState(() {
        _isLoadingMoreIssues = true;
      });
      ref.read(issuesProvider.notifier).loadMore();
      setState(() {
        _isLoadingMoreIssues = false;
      });
    }
  }

  /// Action specific for scrolling pull requests
  void _onScrollPulls() {
    final maxScroll = _scrollPullsController.position.maxScrollExtent;
    final currentScroll = _scrollPullsController.position.pixels;
    if (maxScroll - currentScroll <= kScrollDelta) {
      setState(() {
        _isLoadingMorePulls = true;
      });
      ref.read(pullsProvider.notifier).loadMore();
      setState(() {
        _isLoadingMorePulls = false;
      });
    }
  }

  var isExpanded = true;

  @override
  Widget build(BuildContext context) {
    final details = ref.watch(detailsProvider);
    final issues = ref.watch(issuesProvider);
    final pulls = ref.watch(pullsProvider);

    return DefaultTabController(
      length: 2,
      child: Padding(
        padding:
            const EdgeInsets.symmetric(horizontal: kDefaultHorizontalPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.min,
          children: [
            details.maybeWhen(
              orElse: () => CenterBodyMediumText(S.current.noData),
              loading: () => const LoadingIndicator(),
              error: (error, st) {
                return Column(
                  children: [
                    Center(
                      child: Text(
                        error.toString(),
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.error,
                        ),
                      ),
                    ),
                    DefaultVerticalSizedBox(),
                    Center(
                      child: TextButton(
                        onPressed: () async => await _reload(),
                        child: CenterBodyMediumText(
                          S.current.retry,
                        ),
                      ),
                    )
                  ],
                );
              },
              data: (value) {
                if (value == null) {
                  return Center(
                    child: CenterBodyMediumText(S.current.noData),
                  );
                }

                return Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    InkWell(
                      onTap: () {
                        setState(() {
                          isExpanded = !isExpanded;
                        });
                      },
                      child: Card(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            vertical: kDefaultVerticalPadding,
                            horizontal: kDefaultHorizontalPadding,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            mainAxisSize: MainAxisSize.min,
                            spacing: kDefaultVerticalSpacing,
                            children: [
                              Center(
                                child: Row(
                                  spacing: kDefaultHorizontalSpacing,
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    if (value.owner?.avatarUrl != null)
                                      Image.network(
                                        value.owner!.avatarUrl,
                                        width: 24,
                                      ),
                                    Text(
                                      value.name,
                                      style: Theme.of(context)
                                          .textTheme
                                          .headlineMedium,
                                    ),
                                  ],
                                ),
                              ),
                              if (isExpanded)
                                Center(
                                  child: CenterBodyMediumText(
                                    value.description,
                                  ),
                                ),
                              Center(
                                child: RichText(
                                  text: TextSpan(
                                    style:
                                        Theme.of(context).textTheme.bodyMedium,
                                    children: [
                                      TextSpan(
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyMedium
                                            ?.copyWith(
                                              color: Colors.blue,
                                            ),
                                        text: value.url,
                                        recognizer: TapGestureRecognizer()
                                          ..onTap = () async {
                                            final uri = Uri.parse(value.url);
                                            if (await canLaunchUrl(uri)) {
                                              await launchUrl(
                                                uri,
                                                mode: LaunchMode.inAppWebView,
                                              );
                                            } else {
                                              if (context.mounted) {
                                                ScaffoldMessenger.of(context)
                                                    .showSnackBar(
                                                  SnackBar(
                                                    content:
                                                        CenterBodyMediumText(
                                                      S.current.cannotOpenLink,
                                                    ),
                                                  ),
                                                );
                                              }
                                            }
                                          },
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              if (isExpanded)
                                Center(
                                  child: CenterBodyMediumText(
                                    '${S.current.language}: ${value.language}',
                                  ),
                                ),
                              if (isExpanded)
                                Center(
                                  child: CenterBodyMediumText(
                                    '${S.current.stars}: ${value.stars.toString()}',
                                  ),
                                ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
            DefaultVerticalSizedBox(),
            TabBar(
              tabs: [
                Tab(
                  child: CenterBodyMediumText(
                    S.current.issues,
                  ),
                ),
                Tab(
                  child: CenterBodyMediumText(
                    S.current.pullRequests,
                  ),
                ),
              ],
            ),
            Expanded(
              child: TabBarView(
                children: [
                  ListView.separated(
                    shrinkWrap: true,
                    controller: _scrollIssuesController,
                    itemBuilder: (context, index) {
                      return issues.maybeWhen(
                        orElse: () => ListTile(
                          title: Center(
                            child: CenterBodyMediumText(S.current.noIssues),
                          ),
                        ),
                        data: (value) {
                          if (index == value.length - 1 &&
                              value.length >= kGithubPerPage) {
                            return const Padding(
                              padding: EdgeInsets.symmetric(
                                vertical: kDefaultVerticalPadding,
                                horizontal: kDefaultHorizontalPadding,
                              ),
                              child: LoadingIndicator(),
                            );
                          }
                          if (value.isEmpty) {
                            return ListTile(
                              title: Center(
                                child: CenterBodyMediumText(S.current.noIssues),
                              ),
                            );
                          }
                          return RepositoryDetailsListTile(
                            url: value[index].url,
                            title: value[index].title,
                          );
                        },
                      );
                    },
                    separatorBuilder: (context, index) =>
                        const ListSeparator(0),
                    itemCount: issues.maybeWhen(
                      orElse: () => 1,
                      data: (value) => value.isEmpty
                          ? 1
                          : value.length + (_isLoadingMoreIssues ? 1 : 0),
                    ),
                  ),
                  ListView.separated(
                    shrinkWrap: true,
                    controller: _scrollPullsController,
                    itemBuilder: (context, index) {
                      return pulls.maybeWhen(
                        orElse: () => ListTile(
                          title: Center(
                            child:
                                CenterBodyMediumText(S.current.noPullRequests),
                          ),
                        ),
                        data: (value) {
                          if (index == value.length - 1) {
                            return const Padding(
                              padding: EdgeInsets.symmetric(
                                vertical: kDefaultVerticalPadding,
                                horizontal: kDefaultHorizontalPadding,
                              ),
                              child: LoadingIndicator(),
                            );
                          }

                          if (value.isEmpty) {
                            return ListTile(
                              title: Center(
                                child: CenterBodyMediumText(
                                  S.current.noPullRequests,
                                ),
                              ),
                            );
                          }
                          return RepositoryDetailsListTile(
                            url: value[index].url,
                            title: value[index].title,
                          );
                        },
                      );
                    },
                    separatorBuilder: (context, index) =>
                        const ListSeparator(0),
                    itemCount: pulls.maybeWhen(
                      orElse: () => 1,
                      data: (value) => value.isEmpty
                          ? 1
                          : value.length + (_isLoadingMorePulls ? 1 : 0),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

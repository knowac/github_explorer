import 'dart:async';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/semantics.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:github_explorer/core/constants/constants.dart';
import 'package:github_explorer/generated/l10n.dart';
import 'package:github_explorer/viewmodels/search.dart';
import 'package:github_explorer/views/widgets/texts/body_large_text.dart';
import 'package:github_explorer/views/widgets/texts/center_body_medium_text.dart';
import 'package:github_explorer/views/widgets/boxes/default_vertical_sized_box.dart';
import 'package:github_explorer/views/widgets/lists/list_separator.dart';
import 'package:github_explorer/views/widgets/loading_indicator.dart';
import 'package:go_router/go_router.dart';

class SearchScreen extends ConsumerStatefulWidget {
  const SearchScreen({super.key});

  @override
  SearchScreenState createState() => SearchScreenState();
}

class SearchScreenState extends ConsumerState<SearchScreen> {
  final _controller = TextEditingController();
  final _scrollController = ScrollController();
  static const int _debounceTimeMillis = 500;
  bool _isLoadingMore = false;
  Timer? _debounceTimer;

  @override
  void dispose() {
    _controller.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScrollListener);
  }

  /// Action of debouncing on text change
  void _onTextChanged(String query) {
    if (_debounceTimer != null) {
      _debounceTimer?.cancel();
    }
    _debounceTimer = Timer(
      const Duration(milliseconds: _debounceTimeMillis),
      () async {
        await _submit(query);
      },
    );
  }

  /// Action of detecting the "load more" event
  void _onScrollListener() {
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.position.pixels;
    if (maxScroll - currentScroll <= kScrollDelta) {
      setState(() {
        _isLoadingMore = true;
      });
      ref.read(searchProvider.notifier).loadMore();
      setState(() {
        _isLoadingMore = false;
      });
    }
  }

  /// Action for submitting the search query
  Future<void> _submit(value) async {
    final query = _controller.text.trim();
    if (query.isNotEmpty) {
      await ref.read(searchProvider.notifier).search(query);
    }
  }

  /// Action for clearing the search field
  Future<void> _clearSearch() async {
    setState(() {
      _controller.clear();
    });
    await ref.read(searchProvider.notifier).clearSearch('');
  }

  @override
  Widget build(BuildContext context) {
    final search = ref.watch(searchProvider);
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(
            vertical: kDefaultVerticalPadding,
            horizontal: kDefaultHorizontalPadding,
          ),
          child: Semantics(
            enabled: true,
            textField: true,
            sortKey: OrdinalSortKey(0),
            label: S.current.enterKeywordHint,
            inputType: SemanticsInputType.text,
            child: TextField(
              controller: _controller,
              decoration: InputDecoration(
                labelText: S.current.enterKeyword,
                hintText: S.current.enterKeywordHint,
                suffixIcon: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    if (_controller.text.isNotEmpty)
                      Semantics(
                        sortKey: OrdinalSortKey(1),
                        button: true,
                        enabled: true,
                        label: S.current.clearQueryButtonAccessibility,
                        child: Tooltip(
                          message: S.current.clearQueryButtonAccessibility,
                          child: IconButton(
                            onPressed: _clearSearch,
                            icon: const Icon(
                              Icons.close,
                            ),
                          ),
                        ),
                      ),
                    Semantics(
                      sortKey: OrdinalSortKey(2),
                      button: true,
                      enabled: true,
                      label: S.current.searchButtonAccessibility,
                      child: Tooltip(
                        message: S.current.searchButtonAccessibility,
                        child: IconButton(
                          onPressed: () async {
                            await _submit(_controller.text);
                          },
                          icon: const Icon(
                            Icons.search,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              onSubmitted: _submit,
              onChanged: _onTextChanged,
            ),
          ),
        ),
        Expanded(
          child: ListView.separated(
            controller: _scrollController,
            itemCount: search.maybeWhen(
              orElse: () => 1,
              error: (error, st) => 1,
              data: (value) => value.length + (_isLoadingMore ? 1 : 0),
            ),
            itemBuilder: (context, index) {
              return search.maybeWhen(
                orElse: () => null,
                loading: () => const Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: kDefaultVerticalPadding,
                    horizontal: kDefaultHorizontalPadding,
                  ),
                  child: LoadingIndicator(),
                ),
                error: (error, st) {
                  return Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ListTile(
                        horizontalTitleGap: kDefaultHorizontalMargin,
                        title: Text(
                          error.toString(),
                          style: TextStyle(
                            color: Theme.of(context).colorScheme.error,
                          ),
                        ),
                        isThreeLine: false,
                        style: ListTileStyle.list,
                        minVerticalPadding: 0,
                      ),
                      DefaultVerticalSizedBox(),
                      Semantics(
                        button: true,
                        enabled: true,
                        child: TextButton(
                          onPressed: () =>
                              ref.read(searchProvider.notifier).search(),
                          child: CenterBodyMediumText(
                            S.current.retry,
                          ),
                        ),
                      )
                    ],
                  );
                },
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
                  return ListTile(
                    horizontalTitleGap: kDefaultHorizontalMargin,
                    title: BodyLargeText(
                      value[index].fullName,
                    ),
                    onTap: () {
                      GoRouter.of(context).push(
                        '/repository/${value[index].fullName}',
                      );
                    },
                    isThreeLine: false,
                    style: ListTileStyle.list,
                    minVerticalPadding: 0,
                  );
                },
              );
            },
            separatorBuilder: (BuildContext context, int index) =>
                const ListSeparator(kDefaultHorizontalMargin),
          ),
        ),
      ],
    );
  }
}

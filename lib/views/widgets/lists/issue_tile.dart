import 'package:flutter/material.dart';
import 'package:github_explorer/generated/l10n.dart';
import 'package:github_explorer/views/widgets/texts/body_large_text.dart';
import 'package:url_launcher/url_launcher.dart';

class RepositoryDetailsListTile extends StatefulWidget {
  final String title;

  final String url;

  /// One lined list tile for RepositoryDetailsScreen
  ///
  /// @param String title - Text to display
  /// @param String url - Url to open on tile click
  const RepositoryDetailsListTile({
    super.key,
    required this.title,
    required this.url,
  });

  @override
  State<RepositoryDetailsListTile> createState() =>
      _RepositoryDetailsListTileState();
}

class _RepositoryDetailsListTileState extends State<RepositoryDetailsListTile> {
  void _openLink(String url) async {
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(
        uri,
        mode: LaunchMode.inAppWebView,
      );
    } else {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(S.current.cannotOpenLink),
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () => _openLink(widget.url),
      title: BodyLargeText(
        widget.title,
      ),
    );
  }
}

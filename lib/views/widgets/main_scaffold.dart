import 'package:flutter/material.dart';
import 'package:github_explorer/generated/l10n.dart';

class MainScaffold extends StatelessWidget {
  final Widget child;

  const MainScaffold(this.child, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(S.current.appTitle),
      ),
      body: SafeArea(child: child),
    );
  }
}

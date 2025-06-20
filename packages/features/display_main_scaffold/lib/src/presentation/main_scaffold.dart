import 'package:core/generated/l10n.dart';
import 'package:flutter/material.dart';

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

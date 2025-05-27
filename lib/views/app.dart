import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:github_explorer/views/routes/app_router.dart';
import 'package:github_explorer/generated/l10n.dart';

class App extends ConsumerWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(routeProvider);

    final brightness = View.of(context).platformDispatcher.platformBrightness;
    return MaterialApp.router(
      showSemanticsDebugger: false,
      localizationsDelegates: [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: S.delegate.supportedLocales,
      title: S.current.appTitle,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: Color.fromARGB(1, 129, 163, 79),
      ),
      themeMode:
          brightness == Brightness.light ? ThemeMode.light : ThemeMode.dark,
      routerConfig: router,
    );
  }
}

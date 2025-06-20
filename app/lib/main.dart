import 'package:core/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:dynamic_path_url_strategy/dynamic_path_url_strategy.dart';

import 'app.dart';

void main() async {
  setPathUrlStrategy();
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
  await S.load(Locale.fromSubtags(languageCode: 'en'));
  runApp(
    ProviderScope(
      child: const App(),
    ),
  );
}

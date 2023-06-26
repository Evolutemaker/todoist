import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'package:todoist/provider/date/date_provider.dart';
import 'package:todoist/provider/priority/priority_provider.dart';
import 'package:todoist/provider/status/status_provider.dart';
import 'package:todoist/provider/switch/switch_provider.dart';
import 'package:todoist/provider/task_text/task_text_provider.dart';
import 'package:todoist/provider/theme/theme_provider.dart';
import 'package:todoist/routes/app_router.dart';
import 'package:todoist/routes/router_constants.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ThemeProvider(context)),
        ChangeNotifierProvider(create: (_) => DateProvider()),
        ChangeNotifierProvider(create: (_) => PriorityProvider()),
        ChangeNotifierProvider(create: (_) => SwitchProvider()),
        ChangeNotifierProvider(create: (_) => TaskTextProvider()),
        ChangeNotifierProvider(create: (_) => StatusProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: RouterName.homeRoute,
      onGenerateRoute: AppRouter.generateRoute,
      themeMode: context.watch<ThemeProvider>().themeMode,
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('en', 'US'),
        Locale('ru', 'RU'),
      ],
      locale: const Locale('ru', 'RU'),
    );
  }
}

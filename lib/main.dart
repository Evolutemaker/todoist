import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:todoist/constants/app_themes.dart';
import 'package:todoist/routes/app_router.dart';
import 'package:todoist/routes/router_constants.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Builder(
        builder: (BuildContext context) {
          final Brightness systemBrightness =
              MediaQuery.of(context).platformBrightness;
          final isDarkMode = systemBrightness == Brightness.dark;

          return MaterialApp(
            debugShowCheckedModeBanner: false,
            initialRoute: RouterName.homeRoute,
            onGenerateRoute: AppRouter.generateRoute,
            themeMode: isDarkMode ? ThemeMode.dark : ThemeMode.light,
            theme: AppThemes.lightTheme,
            darkTheme: AppThemes.darkTheme,
          );
        },
      ),
    );
  }
}

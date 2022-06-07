import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shapre/preferences/prefs.dart';
import 'package:shapre/providers/theme_provider.dart';
import 'package:shapre/screens/screens.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Prefs.init();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: ( _ ) => ThemeProvider(isDarkMode: Prefs.isDarkMode)),
      ],
      child: const MyApp(),
      )
    );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: Provider.of<ThemeProvider>(context).currentTheme,
      initialRoute: HomeScreen.routerName,
      routes: {
        HomeScreen.routerName: ( _ ) => const HomeScreen(),
        SettingsScreen.routerName: ( _ ) => const SettingsScreen(),
      },
    );
  }
}
import 'package:flutter/material.dart';
import 'package:movies_app/home/home_screen.dart';
import 'package:movies_app/provider/movies_provider.dart';
import 'package:movies_app/splash/splash_screen.dart';
import 'package:movies_app/theme/my_theme.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(ChangeNotifierProvider<MoviesProvider>(
    create: (_) => MoviesProvider(),
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: MyTheme.appTheme,
      home: SplashScreen(),
    );
  }
}

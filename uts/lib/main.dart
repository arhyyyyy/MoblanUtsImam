import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:uts/data/providers/cart_provider.dart';
import 'package:uts/splash/splashscreen2.dart';
import 'package:uts/splash/splashscreen3.dart';
import 'package:uts/theme/theme.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => CartProvider()),
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
      theme: appTheme,
      debugShowCheckedModeBanner: false,
      home: const SplashScreenWelcome(),
    );
  }
}
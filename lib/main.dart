import 'package:flutter/material.dart';
import 'package:widgets_app/presentation/screens/buttons/button_screen.dart';
import 'package:widgets_app/presentation/screens/cards/cards_screen.dart';
import 'package:widgets_app/presentation/screens/home/home_screen.dart';

import 'config/router/router.dart';
import 'config/theme/app_theme.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: appRouter,
      theme: AppTheme(selectedColor: 0).getTheme(),
      title: 'Material App',
    );
  }
}

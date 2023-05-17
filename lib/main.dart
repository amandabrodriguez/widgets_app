import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widgets_app/presentation/providers/theme_provider.dart';

import 'config/router/app_router.dart';
import 'config/theme/app_theme.dart';

void main() => runApp(const ProviderScope(child: MyApp()));

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, ref) {
    // final bool isDarkMode = ref.watch(isDarkModeProvider);
    // final int selectedColor = ref.watch(selectedIndexColorprovider);
    final AppTheme appTheme = ref.watch(themeNotifierProvider);
    return MaterialApp.router(
      routerConfig: appRouter,
      theme: appTheme.getTheme(),
      title: 'Flutter Widgets',
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../providers/theme_provider.dart';

class ThemeChangerScreen extends ConsumerWidget {
  const ThemeChangerScreen({super.key});

  static const name = 'theme_changer_screen';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isDarkMode = ref.watch(isDarkModeProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Theme Changer'),
        actions: [
          IconButton(
            onPressed: () {
              ref.read(isDarkModeProvider.notifier).state = !isDarkMode;
            },
            icon: Icon(
              (isDarkMode)
                  ? Icons.dark_mode_outlined
                  : Icons.light_mode_outlined,
            ),
          ),
        ],
      ),
      body: const _ThemeChangerView(),
    );
  }
}

class _ThemeChangerView extends ConsumerWidget {
  const _ThemeChangerView();

  @override
  Widget build(BuildContext context, ref) {
    final List<Color> listColors = ref.watch(colorListProvider);
    final int selectedIndexColor = ref.watch(selectedIndexColorprovider);

    return ListView.builder(
      itemCount: listColors.length,
      itemBuilder: (context, index) {
        return RadioListTile(
          title: Text('Color', style: TextStyle(color: listColors[index])),
          subtitle: Text('${listColors[index].value}'),
          activeColor: listColors[index],
          value: index,
          groupValue: selectedIndexColor,
          onChanged: (value) {
            ref.read(selectedIndexColorprovider.notifier).state = index;
          },
        );
      },
    );
  }
}

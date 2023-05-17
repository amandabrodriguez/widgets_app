import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../config/theme/app_theme.dart';

/*NOTAS:
Provider: para valores inmutables
Stateprovider: para mantener alguna pieza de estado
StateNotifierProvider: para mantener el estado cuando dicho estado es un objeto más elabordao
 */

final isDarkModeProvider = StateProvider((ref) => false);
final selectedIndexColorprovider = StateProvider((ref) => 0);
//Listado de colores inmutables
final colorListProvider = Provider((ref) => colorList);
final themeNotifierProvider =
    StateNotifierProvider<ThemeNotifier, AppTheme>((ref) => ThemeNotifier());

class ThemeNotifier extends StateNotifier<AppTheme> {
  //Esta clase se va a encargar de mantener una instancia de AppTheme(el state va a ser
  //una nueva instancia de AppTheme). Esta clase es quien controla el estado. También se
  //puede encontrar con el nombre de Controller o Notifier
  ThemeNotifier() : super(AppTheme());
  void toggleDarkMode() {
    state = state.copyWih(isDarkMode: !state.isDarkMode);
  }

  void changeColorIndex(int colorIndex) {
    state = state.copyWih(selectedColor: colorIndex);
  }
}

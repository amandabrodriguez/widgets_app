import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../config/theme/app_theme.dart';

final isDarkModeProvider = StateProvider((ref) => false);
final selectedIndexColorprovider = StateProvider((ref) => 0);
//Listado de colores inmutables
final colorListProvider = Provider((ref) => colorList);

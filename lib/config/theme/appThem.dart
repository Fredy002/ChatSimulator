// ignore_for_file: file_names
import 'package:flutter/material.dart';

const Color _customColor = Color(0xFF49149f);

const List<Color> _colorThemes = [
  _customColor,
  Colors.blue,
  Colors.green,
  Colors.red,
  Colors.teal,
  Colors.yellow,
  Colors.orange,
  Colors.pink,
];

class AppTheme {
  final int selectedColor;

  AppTheme({this.selectedColor = 0})
      : assert(selectedColor >= 0 && selectedColor <= _colorThemes.length,
            'Colors must between 0 and ${_colorThemes.length}');

  ThemeData theme() {
    return ThemeData(
        useMaterial3: true,
        colorSchemeSeed: _colorThemes[selectedColor],
        //poner la pantalla en modo oscuro
        //brightness: Brightness.dark
      );
  }
}

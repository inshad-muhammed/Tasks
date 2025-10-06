import 'package:flutter/material.dart';
import 'package:flutter_riverpod/legacy.dart';

// Theme toggle provider
final themeToggleProvider = StateProvider<int>(
  (ref) => 1,
); // 0 = dark, 1 = light

// Language toggle provider
final languageToggleProvider = StateProvider<int>(
  (ref) => 1,
); // 0 = بي, 1 = English

import 'package:flutter_riverpod/legacy.dart';

/// Holds the current language state — true = English, false = Arabic
final languageProvider = StateProvider<bool>((ref) => true);

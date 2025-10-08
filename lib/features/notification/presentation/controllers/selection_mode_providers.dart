import 'package:flutter_riverpod/legacy.dart';

final selectionModeProvider = StateProvider<bool>((ref) => false);
final selectedNotificationsProvider = StateProvider<Set<String>>((ref) => {});

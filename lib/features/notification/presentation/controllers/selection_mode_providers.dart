import 'package:flutter_riverpod/legacy.dart';

class SelectionModeNotifier extends StateNotifier<bool> {
  SelectionModeNotifier() : super(false);

  void toggle() {
    state = !state;
  }
}

final selectionModeProvider =
    StateNotifierProvider<SelectionModeNotifier, bool>(
      (ref) => SelectionModeNotifier(),
    );
final selectedNotificationsProvider = StateProvider<Set<String>>((ref) => {});

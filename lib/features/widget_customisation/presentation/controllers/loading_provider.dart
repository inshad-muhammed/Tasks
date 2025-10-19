import 'dart:async';

import 'package:flutter_riverpod/legacy.dart';

final loadingProvider = StateNotifierProvider<LoadingNotifier, bool>(
  (ref) => LoadingNotifier(),
);

class LoadingNotifier extends StateNotifier<bool> {
  LoadingNotifier() : super(true) {
    _simulateLoading();
  }

  Future<void> _simulateLoading() async {
    // simulate network delay or initialization
    await Future.delayed(const Duration(seconds: 2));
    state = false; // stop shimmer
  }

  void resetLoading() {
    state = true;
    _simulateLoading();
  }
}

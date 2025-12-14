import 'package:flutter_riverpod/legacy.dart';

final requestFilterProvider = StateProvider<String>((ref) {
  return "received";
});

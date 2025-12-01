import 'package:flutter_riverpod/legacy.dart';

final accountNumberProvider = StateProvider<String>((ref) => "");
final isVerifiedProvider = StateProvider<bool>((ref) => false);
final showFullProfileProvider = StateProvider<bool>((ref) => false);
final nicknameProvider = StateProvider<String>((ref) => "");

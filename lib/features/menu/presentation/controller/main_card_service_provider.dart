import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tasks/features/menu/data/data_source/main_card_model.dart';
import 'package:tasks/features/menu/data/repository/main_card_service.dart';

final mainCardServiceProvider = Provider((ref) => MainCardService());

final mainCardProvider = FutureProvider<List<MainCardModel>>((ref) async {
  final service = ref.read(mainCardServiceProvider);
  return service.fetchMainCardItems();
});

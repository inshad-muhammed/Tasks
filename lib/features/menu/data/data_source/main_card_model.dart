import 'package:freezed_annotation/freezed_annotation.dart';

part 'main_card_model.freezed.dart';
part 'main_card_model.g.dart';

@freezed
class MainCardModel with _$MainCardModel {
  const factory MainCardModel({
    required String label,
    required String imagePath,
  }) = _MainCardModel;

  factory MainCardModel.fromJson(Map<String, dynamic> json) =>
      _$MainCardModelFromJson(json);
}

// class MainCardModel {
//   final String label;
//   final String imagePath;
//   MainCardModel({required this.label, required this.imagePath});
//   factory MainCardModel.fromJson(Map<String, dynamic> json) {
//     return MainCardModel(
//       label: json['label'] as String,
//       imagePath: json['imagePath'] as String,
//     );
//   }
// }

import 'package:freezed_annotation/freezed_annotation.dart';
part 'quick_link_model.freezed.dart';
part 'quick_link_model.g.dart';

@freezed
class QuickLinkModel with _$QuickLinkModel {
  const factory QuickLinkModel({
    required String label,
    required String imagePath,
  }) = _QuickLinkModel;

  factory QuickLinkModel.fromJson(Map<String, dynamic> json) =>
      _$QuickLinkModelFromJson(json);
}

// class QuickLinkModel {
//   final String label;
//   final String imagePath;

//   QuickLinkModel({required this.label, required this.imagePath});

//   factory QuickLinkModel.fromJson(Map<String, dynamic> json) {
//     return QuickLinkModel(label: json['label'], imagePath: json['imagePath']);
//   }
// }

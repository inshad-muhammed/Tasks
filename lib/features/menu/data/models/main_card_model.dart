class MainCardModel {
  final String label;
  final String imagePath;
  MainCardModel({required this.label, required this.imagePath});
  factory MainCardModel.fromJson(Map<String, dynamic> json) {
    return MainCardModel(
      label: json['label'] as String,
      imagePath: json['imagePath'] as String,
    );
  }
}

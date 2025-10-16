class QuickLinkModel {
  final String label;
  final String imagePath;

  QuickLinkModel({required this.label, required this.imagePath});

  factory QuickLinkModel.fromJson(Map<String, dynamic> json) {
    return QuickLinkModel(label: json['label'], imagePath: json['imagePath']);
  }
}

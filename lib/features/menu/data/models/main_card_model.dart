class MainCardModel {
  final String lable;
  final String imagePath;
  MainCardModel({required this.lable, required this.imagePath});
  factory MainCardModel.fromJson(Map<String, dynamic> json) {
    return MainCardModel(lable: json['lable'], imagePath: json['imagePath']);
  }
}

import 'package:dio/dio.dart';
import 'package:tasks/features/menu/data/data_source/main_card_model.dart';
import 'package:tasks/features/menu/presentation/constants/main_card.dart';

class MainCardService {
  Future<List<MainCardModel>> fetchMainCardItems() async {
    await Future.delayed(Duration(seconds: 4));
    final response = Response(
      requestOptions: RequestOptions(path: ""),
      data: mainCardItems,
      statusCode: 200,
    );
    if (response.statusCode == 200) {
      return (response.data as List)
          .map((item) => MainCardModel.fromJson(item))
          .toList();
    } else {
      throw Exception("Failed to fetch data");
    }
  }
}

import 'package:dio/dio.dart';
import 'package:tasks/features/quick_link/data/data_source/quick_link_model.dart';
import 'package:tasks/features/quick_link/presentation/constants/quick_link_icons.dart';

class QuickLinkService {
  Future<List<QuickLinkModel>> fetchQuickLinks() async {
    await Future.delayed(Duration(seconds: 3));
    final response = Response(
      requestOptions: RequestOptions(path: ''),
      data: labels,
      statusCode: 200,
    );
    if (response.statusCode == 200) {
      return (response.data as List)
          .map((item) => QuickLinkModel.fromJson(item))
          .toList();
    } else {
      throw Exception("Failed to fetch quick links");
    }
  }
}

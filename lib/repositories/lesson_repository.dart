import 'package:banao_flutter_task_1/models/responses/product_model.dart';

import '../models/responses/programs_response.dart';
import '../networks/api_endpoints.dart';
import '../networks/dio_client.dart';

class LessonRepository {
  final DioClient dioClient;

  LessonRepository({required this.dioClient});

  Future<ProductModel> fetchLessonsData() async {
    try {
      final response = await dioClient.dio.get(ApiEndpoints.lessons);
      if (response.statusCode == 200) {
        final data = response.data;
        return ProductModel.fromJson(data);
      } else {
        throw Exception('Failed to fetch API data');
      }
    } catch (e) {
      throw Exception('Failed to fetch API data: $e');
    }
  }
}

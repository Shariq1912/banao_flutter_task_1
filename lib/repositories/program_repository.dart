
import 'package:banao_flutter_task_1/models/responses/programs_response.dart';
import 'package:banao_flutter_task_1/networks/api_endpoints.dart';

import '../networks/dio_client.dart';


class ProgramsRepository {
  final DioClient dioClient;

  ProgramsRepository({required this.dioClient});

  Future<ApiModel> fetchProgramData() async {
    try {
      final response = await dioClient.dio.get(ApiEndpoints.programs); // Replace '/api-endpoint' with your API endpoint
      if (response.statusCode == 200) {
        final data = response.data;
        return ApiModel.fromJson(data);
      } else {
        throw Exception('Failed to fetch API data');
      }
    } catch (e) {
      throw Exception('Failed to fetch API data: $e');
    }
  }


}



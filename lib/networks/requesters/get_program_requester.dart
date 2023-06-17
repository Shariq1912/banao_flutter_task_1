import 'package:banao_flutter_task_1/models/responses/programs_response.dart';
import 'package:banao_flutter_task_1/networks/api_endpoints.dart';
import 'package:banao_flutter_task_1/networks/api_requester.dart';
import 'package:dio/src/response.dart';

import '../dio_client.dart';

/*
class ProgramsRequester extends ApiRequest<List<ApiModel>>{
  final DioClient dioClient;

  ProgramsRequester({required this.dioClient});

  @override
  Future<Response> createCall() {
    return dioClient.dio.get(ApiEndpoints.programs);
  }

  @override
  List<ApiModel> parseData(data) {
    */
/*var responseData = data.data;
    return Item.fromJson(responseData);*//*

    var responseData = data.data as List;
    var listOfObject =
    responseData.map((json) => ApiModel.fromJson(json)).toList();
    return listOfObject;
  }
  
}*/
/*



class ProgramsRequester extends ApiRequest<List<ApiModel>> {
  final DioClient dioClient;

  ProgramsRequester({required this.dioClient});

  @override
  Future<Response> createCall() {
    return dioClient.dio.get(ApiEndpoints.programs);
  }

  @override
  List<ApiModel> parseData(data) {
    final responseData = data.data as List<dynamic>;
    final listOfObjects = responseData.map((json) => ApiModel.fromJson(json as Map<String, dynamic>)).toList();
    return listOfObjects;
  }
}
*/

class ProgramsRequester extends ApiRequest<List<ApiModel>> {
  final DioClient dioClient;

  ProgramsRequester({required this.dioClient});

  @override
  Future<Response<dynamic>> createCall() {
    return dioClient.dio.get<dynamic>(ApiEndpoints.programs);
  }

  @override
  List<ApiModel> parseData(data) {
    final responseData = data.data as List<dynamic>;
    final listOfObjects =
    responseData.map((json) => ApiModel.fromJson(json as Map<String, dynamic>)).toList();
    return listOfObjects;
  }
}

import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class DioClient {
  final dio = Dio();

  DioClient(){
    dio.options.baseUrl = "https://632017e19f82827dcf24a655.mockapi.io/api";
    dio.interceptors.add(PrettyDioLogger());
  }
}
import 'package:dio/dio.dart';
import 'package:rxdart/rxdart.dart';

import 'api_response.dart';

abstract class ApiRequest<RequestType> {
  final _result = BehaviorSubject<ApiResponse<RequestType>>();

  ApiRequest() {
    _processRequest();
  }

  Future<void> _processRequest() async {
    _result.add(const ApiResponse.loading());
    createCall()
        .then((value) => _processSuccess(value))
        .catchError((e) => _handleError(e))
        .whenComplete(() => _result.close());
  }

  void _processSuccess(Response response) {
    var data = parseData(response);
    _result.add(ApiResponse.success(data: data));
  }

  void _handleError(e) {
    //TODO add exception handling
    String errorMsg = "";
    try {
      errorMsg = e.response.data["error_description"];
    } catch (_) {
      errorMsg = "Something went wrong";
    }
    _result.add(ApiResponse.error(errorMsg: errorMsg));
  }

  ValueStream<ApiResponse<RequestType>> stream() {
    return _result.stream;
  }

  Future<Response<dynamic>> createCall();

  RequestType parseData(dynamic data);
}

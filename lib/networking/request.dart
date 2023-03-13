import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart';
import 'package:network_layer_flutter/networking/http/http_request.dart';
import 'package:network_layer_flutter/networking/service/endpoint_builder.dart';
import 'network/network_exception.dart';

abstract class RequestControllerImp {
  Future<dynamic> execute({required EndpointBuilder endpoint});
}

class RequestController implements RequestControllerImp {

  final _client = Client();

  @override
  Future execute({required EndpointBuilder endpoint}) async {

    BaseRequest request = HTTPRequest(endpoint);

    try {
      final response = await _client.send(request);
      if (response.statusCode >= 200 &&
          response.statusCode <= 299) {
        final data = await response.stream.transform(utf8.decoder).join();
        return jsonDecode(data.toString());
      } else {
        returnException(response);
      }
    } on SocketException {
      throw FetchDataException('No Internet Connection');
    }
  }

  dynamic returnException(StreamedResponse response) {
    switch (response.statusCode) {
      case 400:
        throw BadRequestException(response.toString());
      case 401:
      case 403:
      case 404:
        throw UnauthorisedException(response);
      case 500:
      default:
        throw FetchDataException(
            'Error occurred while communication with server' ' with status code : ${response.statusCode}');
    }
  }
}

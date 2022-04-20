import 'package:http/http.dart';
import 'dart:convert';
import 'dart:typed_data';
import '../service/endpoint_builder.dart';
import '../http/content_encoding.dart';

class HTTPRequest extends Request {

  final EndpointBuilder service;

  HTTPRequest(this.service)
      : super(
      service.httpMethod.value,
      Uri.parse(
          service.path));

  @override
  String get body => json.encode(service.parameters);

  @override
  Map<String, String> get headers {
    var values = {"content-type": service.contentType.value};
    values.addAll(service.headers);
    return values;
  }

  @override
  Uint8List get bodyBytes {
    if (service.parameters == null) {
      return Uint8List(0);
    }
    if (service.contentEncoding == ContentEncoding.body) {
      final queryParameters = Uri(queryParameters: service.parameters);
      List<int> bodyBytes = utf8.encode(queryParameters.query);
      return Uint8List.fromList(bodyBytes);
    } else {
      final encodedBody = const Utf8Codec().encode(body);
      return Uint8List.fromList(encodedBody);
    }
  }

  @override
  Uri get url {
    if (service.contentEncoding == ContentEncoding.url) {
      return Uri.parse('${service.path}${service.queryParameters}');
    }
    return Uri.parse(service.path);
  }

}

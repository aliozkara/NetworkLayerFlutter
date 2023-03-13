import 'package:http/http.dart';
import '../http/body_encoding.dart';
import '../http/http_method.dart';
import '../http/content_type.dart';

abstract class Endpoint {
  late String path;
  late HTTPMethod httpMethod;
  late ContentType contentType;
  late BodyEncoding bodyEncoding;
  late Map<String, String> headers;
  Map<String, dynamic>? parameters;
}

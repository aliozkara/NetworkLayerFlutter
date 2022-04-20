import '../http/content_encoding.dart';
import '../http/content_type.dart';
import '../http/http_method.dart';
import '../service/endpoint.dart';

class EndpointBuilder implements Endpoint {

  @override
  late String path;

  @override
  late ContentType contentType;

  @override
  late ContentEncoding contentEncoding;

  @override
  late HTTPMethod httpMethod;

  @override
  Map<String, dynamic>? parameters;

  @override
  late Map<String, String> headers = {
    "Authorization": "YOUR TOKEN"
  };

  String get queryParameters {
    if (httpMethod == HTTPMethod.get && parameters != null) {
      final jsonString = Uri(queryParameters: parameters);
      return '?${jsonString.query}';
    }
    return '';
  }

}

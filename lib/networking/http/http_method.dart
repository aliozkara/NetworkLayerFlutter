import 'package:network_layer_flutter/extensions/enum_ex.dart';

class HTTPMethod extends Enum<String> {
  const HTTPMethod(String val) : super(val);

  static const HTTPMethod get = HTTPMethod('GET');
  static const HTTPMethod post = HTTPMethod('POST');
  static const HTTPMethod put = HTTPMethod('PUT');
  static const HTTPMethod delete = HTTPMethod('DELETE');
  static const HTTPMethod patch = HTTPMethod('PATCH');
}

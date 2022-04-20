import 'package:network_layer_flutter/extensions/enum_ex.dart';

class ContentType extends Enum<String> {
  const ContentType(String val) : super(val);

  static const ContentType json = ContentType('application/json');
  static const ContentType body = ContentType('application/x-www-form-urlencoded; charset=utf-8');
  static const ContentType multipart = ContentType('multipart/form-data');
  static const ContentType xml = ContentType('application/xml');
}

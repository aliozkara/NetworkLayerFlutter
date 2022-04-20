import '../../models/request/pokemon_list_req.dart';
import '../../networking/http/content_encoding.dart';
import '../../networking/network/network_environment.dart';
import '../../networking/service/endpoint_builder.dart';
import '../../networking/http/content_type.dart';
import '../../networking/http/http_method.dart';

const environment = NetworkEnvironment.qa;

abstract class _Endpoints {
  String get baseUrl;

  EndpointBuilder pokeList(PokeListReq req);
}

class Endpoints implements _Endpoints {

  @override
  String get baseUrl {
    switch (environment) {
      case NetworkEnvironment.production:
        return "https://pokeapi.co/api/v2";
      case NetworkEnvironment.qa:
        return "https://pokeapi.co/api/v2";
    }
  }

  @override
  EndpointBuilder pokeList(PokeListReq req) {
    var request = EndpointBuilder();
    request.path = baseUrl+"/pokemon";
    request.contentEncoding = ContentEncoding.url;
    request.contentType = ContentType.body;
    request.httpMethod = HTTPMethod.get;
    request.parameters = req.toMap();
    return request;
  }

}

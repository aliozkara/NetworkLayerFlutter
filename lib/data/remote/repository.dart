import 'package:http/http.dart';
import 'package:network_layer_flutter/data/remote/poke_api.dart';
import '../../models/request/pokemon_list_req.dart';
import '../../models/response/poke_list_res.dart';
import '../../networking/request.dart';

abstract class RepositoryImp {
  Future<PokeListRes?> pokeList(PokeListReq req) async {
    return null;
  }
}

class Repository implements RepositoryImp {

  @override
  Future<PokeListRes?> pokeList(PokeListReq req) async {
    var router = RequestController();
    final serverResponse = await router.execute(endpoint: PokeApi().pokeList(req));
    final jsonData = PokeListRes.fromJson(serverResponse);
    return jsonData;
  }


}

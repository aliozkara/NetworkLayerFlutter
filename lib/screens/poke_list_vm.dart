import 'package:flutter/cupertino.dart';
import 'package:network_layer_flutter/data/remote/repository.dart';
import 'package:network_layer_flutter/models/request/pokemon_list_req.dart';
import 'package:network_layer_flutter/models/response/poke_list_res.dart';
import 'package:network_layer_flutter/models/response/pokemon.dart';

class PokeListVM with ChangeNotifier {

  final _myRepo = Repository();

  String? errorMsg;
  bool loading = false;
  bool error = false;

  List<Pokemon>? pokemonList = [];

  PokeListVM() {
    _init();
  }

  void _init() async {
    await pokeList("100");
  }

  Future<void> pokeList(String limit) async {
    loading = true;
    notifyListeners();
    _myRepo.pokeList(PokeListReq(limit: limit))
        .then((value) => _setResponse(value))
        .onError((error, stackTrace) => _setError(error.toString()));
  }

  void _setResponse(PokeListRes? response) {
    loading = false;
    pokemonList = response?.results;
    notifyListeners();
  }

  void _setError(String msg) {
    errorMsg = msg;
    error = true;
    loading = false;
    notifyListeners();
  }

  void hideError(){
    error = false;
    errorMsg = null;
    notifyListeners();
  }

}

import 'package:network_layer_flutter/models/response/pokemon.dart';

class PokeListRes {
  PokeListRes({
    this.results,
  });

  List<Pokemon>? results;

  factory PokeListRes.fromJson(Map<String, dynamic> json) => PokeListRes(
    results: json["results"] == null ? null : List<Pokemon>.from(json["results"].map((x) => Pokemon.fromJson(x))),
  );
}

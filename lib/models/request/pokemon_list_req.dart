class PokeListReq {

  PokeListReq({
    required this.limit
  });

  String limit;

  Map<String, dynamic> toMap() {
    var params = {
      "limit": limit,
    };
    return params;
  }
}

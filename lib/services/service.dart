import 'dart:convert';
import 'package:flutterfinal/models/character-model.dart';
import 'package:http/http.dart' as http;

// main(List<String> args) async {
//   var teste = await Service().getAllCharacters();
//   print(teste);
// }

class Service {
  Future<List<CharacterModel>> getAllCharacters(pagina) async {
    var res = await http
        .get("https://rickandmortyapi.com/api/character/?page=${pagina}");
    var resDecode = jsonDecode(res.body) as Map<String, dynamic>;
    var resCharacter = (resDecode['results'] as List)
        .map((e) => CharacterModel.fromJSON(e))
        .toList();
    return resCharacter;
  }
}

import 'package:lifepet_app/models/pet_model.dart';

class Remedio {
  String nome;
  String data;
  int id;
  int pet;

  Remedio({
    this.nome,
    this.data,
    this.id, 
    this.pet});

  Map<String, dynamic> toMap(){
    return {
      'id':id,
      'nome':nome,
      'data':data,
      'pet':pet,
    };
  }

  Remedio.fromMap(Map map){
    id = map["id"];
    nome = map["nome"];
    data = map["data"];
    pet = map["pet"];
  }
}

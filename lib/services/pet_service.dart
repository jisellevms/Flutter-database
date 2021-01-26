import 'dart:math';

import 'package:lifepet_app/models/pet_model.dart';
import 'package:lifepet_app/utils/db_util.dart';

class PetService {
  List<Pet> _petList = [];

  Future<List> getAllPets() async {
    final dataList = await DBUtil.getData('pets'); 
    _petList = dataList.map((pets) => Pet.fromMap(pets)).toList();
    return _petList;
  }

  void addPet(Pet pet){
    DBUtil.insertData('pets', pet.toMap());
  }

  // void editPet(int id, Pet newPet) {
  //   Pet petEditar = getPet(id);
  //   petEditar.nome = newPet.nome;
  //   petEditar.descricao = newPet.descricao;
  //   petEditar.idade = newPet.idade;
  //   petEditar.sexo = newPet.sexo;
  //   petEditar.cor = newPet.cor;
  //   petEditar.bio = newPet.bio;
  // }

  Future<Pet> getPet(int id) async {
   List<String> colunas = [
     "id",
     "nome",
     "idade",
     "imageUrl",
     "descricao",
     "sexo",
     "cor",
     "bio"
   ];
   String whereString = "id = ?";
   List<dynamic> whereArgument = [id];
   final dataList = await DBUtil.getDataWhere('pets', colunas, whereString, whereArgument);
   return Pet.fromMap(dataList.first);
  }
}
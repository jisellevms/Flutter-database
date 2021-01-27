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

  void editPet(int id, Pet pet) {
    String whereString = "id = ?";
    List<dynamic> whereArgument = [id];
    DBUtil.editData('pets', pet.toMap(), whereString, whereArgument);
  }

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
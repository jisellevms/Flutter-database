import 'dart:math';

import 'package:lifepet_app/models/remedio_model.dart';
import 'package:lifepet_app/services/pet_service.dart';
import 'package:lifepet_app/utils/db_util.dart';

class RemedioService{
  final List<Remedio> _remedioList = [];
  final PetService petService = PetService();

  Future<List> getRemediosPet(int id) async {
   String whereString = "pet = ?";
   List<dynamic> whereArgument = [id];
   List<String> colunas = [
     "id",
     "nome",
     "data",
     "pet"
   ];
   final dataList = await DBUtil.getDataWhere('remedios', colunas, whereString, whereArgument);
   return dataList.map((remedios) => Remedio.fromMap(remedios)).toList();
  }

  void addRemedio(Remedio remedio) {
    DBUtil.insertData('remedios', remedio.toMap());
  }
}
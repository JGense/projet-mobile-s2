import 'package:colocgame/data/model/Tache.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class TacheProvider {

  Future<Response> getTaches() async {
    var dio = Dio();
    Response tachesResponse = await dio.get("https://firestore.googleapis.com/v1/projects/colocgame/databases/(default)/documents/taches");
    return tachesResponse;
  }

  void patchTache(Tache tache) {
    var dio = Dio();
    String idTache = tache.name.substring(56);
    print(tache.toJson());
    dio.patch("https://firestore.googleapis.com/v1/projects/colocgame/databases/(default)/documents/taches/"+idTache+"?updateMask.fieldPaths=isDone", data: tache.toJson());
  }

  Future<Response> postTache(Tache tache){
    var dio = Dio();
    print(tache);
    return dio.post("https://firestore.googleapis.com/v1/projects/colocgame/databases/(default)/documents/taches", data: tache.toJson());
  }
}
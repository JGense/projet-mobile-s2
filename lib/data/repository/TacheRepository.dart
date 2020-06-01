import 'package:colocgame/data/model/Tache.dart';
import 'package:colocgame/data/provider/TacheProvider.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class TacheRepository {

  TacheRepository._privateConstructor();
  static final TacheRepository _instance = TacheRepository._privateConstructor();
  static TacheRepository get instance => _instance;

  Future<List<Tache>> getTaches() async {
    Response response = await TacheProvider().getTaches();
    if(response.data != null){
      List data = response.data['documents'];
      List<Tache> taches = data.map((object) => Tache.fromJson(object)).toList();
      return taches;
    } else if(response.statusCode == 204){
      return null;
    }
  }

  void majTache(Tache tache) {
    TacheProvider().putTache(tache);
  }
}
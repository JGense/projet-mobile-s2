import 'package:colocgame/data/model/Tache.dart';
import 'package:colocgame/data/repository/TacheRepository.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class TacheDetails extends StatelessWidget{
  static const String routeName = "/tacheDetails";
  final _tacheRepository = TacheRepository.instance;

  @override
  Widget build(BuildContext context) {
    final Map arguments = ModalRoute.of(context).settings.arguments as Map;
    Tache tache;
    if(arguments != null) tache = arguments['tache'];

    return Scaffold(
        appBar: AppBar(
          title: Text("Tache " + tache.name),
          centerTitle: true,
        ),
        body: Center(
            child : Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children : <Widget> [
                  Text(tache.fields.titre.stringValue),
                  Text(tache.fields.description.stringValue),
                  RaisedButton(
                      onPressed: () {
                        tache.fields.isDone.booleanValue = !tache.fields.isDone.booleanValue;
                        _tacheRepository.majTache(tache);
                      },
                      textColor: Colors.white,
                      padding: const EdgeInsets.all(0.0),
                      child: Container(
                        decoration: const BoxDecoration(
                          gradient: LinearGradient(
                            colors: <Color>[
                              Color(0xFF0D47A1),
                              Color(0xFF1976D2),
                              Color(0xFF42A5F5),
                            ],
                          ),
                        ),
                        padding: const EdgeInsets.all(10.0),
                        child:
                        tache.fields.isDone.booleanValue ? const Text('TACHE A REFAIRE') : const Text('TACHE EFFECTUÉ'),
                      ),
                  )
                ]
            )
        )
    );
  }

}
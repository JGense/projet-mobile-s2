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
          title: Text(tache.fields.titre.stringValue),
          centerTitle: true,
        ),
        body: Center(
            child : Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children : <Widget> [
                  Image.network(
                    tache.fields.urlPhoto.stringValue,
                  ),
                  Divider(),
                  Text("Description: ", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),
                  Text(tache.fields.description.stringValue),
                  Divider(),
                  Text("Date de création: ", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),
                  Text(tache.fields.dateCreation.timestampValue.split('T')[0]),
                  Divider(),
                  tache.fields.isRecurrent.booleanValue ?  Text("Tâche récurrente", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),) : Text("Tâche non récurrente", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),
                ]
            )
        ),
        persistentFooterButtons: <Widget>[
          ButtonTheme(
            minWidth: 400,
            child: RaisedButton(
              onPressed: () {
                tache.fields.isDone.booleanValue = !tache.fields.isDone.booleanValue;
                _tacheRepository.majTache(tache);
              },
              textColor: Colors.white,
              padding: const EdgeInsets.all(0.0),
              child: Container(
                  decoration: const BoxDecoration(
                    color: Colors.blue,
                  ),
                  padding: const EdgeInsets.all(10.0),
                  child:
                  tache.fields.isDone.booleanValue ? const Text('TACHE A REFAIRE') : const Text('TACHE EFFECTUÉE')
              ),
            ),
          )
        ],
    );
  }

}
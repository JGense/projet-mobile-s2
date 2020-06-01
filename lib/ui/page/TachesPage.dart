import 'package:colocgame/data/model/Tache.dart';
import 'package:colocgame/data/repository/TacheRepository.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class TachesPages extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _tachesPageState();
}

class _tachesPageState extends State<TachesPages> {

  final _tacheRepository = TacheRepository.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: FutureBuilder(
            future: _tacheRepository.getTaches(),
            builder: (BuildContext context, AsyncSnapshot<List<Tache>> tache) {
              if(tache.hasData){
                return ListView.builder(
                    itemCount: tache.data.length,
                    itemBuilder: (context, position){
                      return
                        Card(
                          color: tache.data[position].fields.isDone.booleanValue ? Colors.green : Colors.red,
                          child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                          ListTile(
                          leading: Icon(Icons.album),
                          title: Text(tache.data[position].fields.titre.stringValue),
                          subtitle: Text(tache.data[position].fields.description.stringValue),
                        ),
                        ButtonBar(
                        children: <Widget>[
                        FlatButton(
                        child: tache.data[position].fields.isDone.booleanValue ? const Text('REFAIRE LA TACHE') : const Text('TACHE EFFECTUÉ'),
                        onPressed: () {
                          Tache tacheModif = tache.data[position];
                          tacheModif.fields.isDone.booleanValue = !tacheModif.fields.isDone.booleanValue;
                          _tacheRepository.majTache(tacheModif);
                          setState(() {});
                          },
                        ),
                        ],
                        )],
                        )
                       );
                    }
                );
              } else {
                return CircularProgressIndicator();
              }
            }
        )
    );
  }
}
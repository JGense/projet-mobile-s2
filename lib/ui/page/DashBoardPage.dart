import 'package:colocgame/data/model/Tache.dart';
import 'package:colocgame/data/provider/authentication.dart';
import 'package:colocgame/data/repository/TacheRepository.dart';
import 'package:flutter/material.dart';

import 'TacheDetails.dart';


class DashBoardPage extends StatefulWidget {
  DashBoardPage();


  @override
  State<StatefulWidget> createState() => new _DashBoardPageState();
}

class _DashBoardPageState extends State<DashBoardPage> {

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
                    itemBuilder: (context, position) {
                      if (!tache.data[position].fields.isDone.booleanValue) {
                        return
                          Card(
                              color: Colors.red,
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                  ListTile(
                                    leading: Icon(Icons.album),
                                    title: Text(
                                        tache.data[position].fields.titre
                                            .stringValue),
                                    subtitle: Text(
                                        tache.data[position].fields.description
                                            .stringValue),
                                  ),
                                  ButtonBar(
                                    children: <Widget>[
                                      FlatButton(
                                        child: const Text(
                                            'DETAILS DE LA TACHE'),
                                        onPressed: () {
                                          Navigator.pushNamed(
                                              context, TacheDetails.routeName,
                                              arguments: {
                                                "tache": tache.data[position]
                                              });
                                        },
                                      ),
                                    ],
                                  )
                                ],
                              )
                          );
                      }
                      else {

                      }
                      // ignore: missing_return
                    });
              } else {
                return CircularProgressIndicator();
              }
            }
        )
    );
  }
}
/*  List<String> _taskItems =[];

  void addTaskItem(String task){
    if (task.length>0){
      setState(() => _taskItems.add(task));
    }
  }

  @override
  void initState() {
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        body:
            buildTasksList(),
            floatingActionButton: new FloatingActionButton(
                onPressed: _pushAddTaskScreen,
                tooltip: 'Ajouter une tâche',
                child: new Icon(Icons.add)),
    );
  }

  void _pushAddTaskScreen() {
    Navigator.of(context).push(
        new MaterialPageRoute(
            builder: (context) {
              return new Scaffold(
                  body: new TextField(
                    autofocus: true,
                    onSubmitted: (val) {
                      addTaskItem(val);
                      Navigator.pop(context); // Close the add todo screen
                    },
                    decoration: new InputDecoration(
                        hintText: 'Intitulé de la tâche',
                        contentPadding: const EdgeInsets.all(16.0)
                    ),
                  )
              );
            }
        )
    );
  }
  Widget buildTasksList() {
    return new ListView.builder(
        itemBuilder: (context,index){
          if(index< _taskItems.length){
            return buildTaskItem(_taskItems[index]);
          }
        },
    );
  }

  Widget buildTaskItem(String tasktext){
    return new ListTile(
      title : new Text(tasktext)
    );
  } */



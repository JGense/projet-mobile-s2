import 'package:colocgame/data/provider/authentication.dart';
import 'package:flutter/material.dart';


class DashBoardPage extends StatefulWidget {
  DashBoardPage();


  @override
  State<StatefulWidget> createState() => new _DashBoardPageState();
}

class _DashBoardPageState extends State<DashBoardPage> {

  List<String> _taskItems =[];

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
  }
}


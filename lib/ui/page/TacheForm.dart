import 'package:colocgame/data/model/Tache.dart';
import 'package:colocgame/data/repository/TacheRepository.dart';
import 'package:colocgame/ui/page/TachesPage.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TacheForm extends StatefulWidget {
  static const String routeName = "/tacheForm";

  @override
  State<TacheForm> createState() => _tacheFormState();
}

class _tacheFormState extends State<TacheForm> {
  final _tacheRepository = TacheRepository.instance;
  final _formKey = GlobalKey<FormState>();
  bool isRecurrent = false;

  final controllerTitre = TextEditingController();
  final controllerDescription = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: AppBar(
          title: const Text('Ajout d\'une tache'),
        ),
        body: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text("Titre"),
              TextFormField(
                controller: controllerTitre,
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Please enter some text';
                  }
                  return null;
                },
              ),
              Text("Description"),
              TextFormField(
                controller: controllerDescription,
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Please enter some text';
                  }
                  return null;
                },
              ),
              Text("Tache récurrente"),
              Checkbox(value: isRecurrent, onChanged: (bool value) => setState(() => isRecurrent = value)),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: RaisedButton(
                  onPressed: () {
                    if (_formKey.currentState.validate()) {
                      Titre titre = Titre(stringValue: controllerTitre.text);
                      Titre description = Titre(stringValue: controllerDescription.text);
                      IsRecurrent recurrent = IsRecurrent(booleanValue: isRecurrent);
                      IsRecurrent isDone = IsRecurrent(booleanValue: false);
                      DateFormat dateFormatJ = DateFormat("yyyy-MM-dd");
                      DateFormat dateFormatH = DateFormat("HH:mm:ss");
                      DateCreation dateCreation = DateCreation(timestampValue: dateFormatJ.format(DateTime.now()) + "T" + dateFormatH.format(DateTime.now()) + "Z");
                      Fields fields = Fields(titre: titre, description: description, isRecurrent: recurrent, isDone: isDone, dateCreation: dateCreation, dateRealisation: null);
                      Future<Response> response = _tacheRepository.postTache(new Tache(fields:fields));
                      response.then((value) => Navigator.pop(context));
                    }
                  },
                  child: Text('Ajouter la tache'),
                ),
              ),
            ],
          ),
        ));
  }
}

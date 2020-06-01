import 'package:colocgame/data/provider/authentication.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class SettingsPage extends StatefulWidget {
  SettingsPage({Key key, this.auth, this.userId, this.logoutCallback})
      : super(key: key);

  final BaseAuth auth;
  final VoidCallback logoutCallback;
  final String userId;

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {

  @override
  void initState() {
    super.initState();
  }

  _logout() {
    print('logout');
    widget.auth.signOut();
    widget.logoutCallback();
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        Card(child: ListTile(title: Text('Théme'))),
        Card(child: ListTile(title: Text('Déconnexion'), onTap: () => _logout(),)),
      ],
    );
  }

}
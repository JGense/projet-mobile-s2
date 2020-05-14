import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class DashBoard extends StatefulWidget {
  static const String routeName = "/dashboard";
  DashBoard({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _DashBoardState createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Text('Ceci est un dashboard'),
      ),
    );
  }
}
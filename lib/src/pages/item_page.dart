import 'package:flutter/material.dart';

class ItemPage extends StatefulWidget {
  ItemPage({Key key}) : super(key: key);

  @override
  _ItemPageState createState() => _ItemPageState();
}

class _ItemPageState extends State<ItemPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
         title: Text('lsdk'),
       ),
    );
  }
}
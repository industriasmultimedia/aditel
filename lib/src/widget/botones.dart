// import 'dart:js';

import 'package:app/src/pages/lista_items.dart';
import 'package:flutter/material.dart';

Widget botones(BuildContext context){
  return Column(
    children: <Widget>[
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          FlatButton.icon(
            icon: Icon(Icons.hotel),
            onPressed: ()=> Navigator.pushNamed(context, ListaItemsPage.routeName),
            label: Text('Hoteles'),
            color: Colors.white,
            textColor: Colors.orange,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(50)
            ),
          ),
          VerticalDivider(),
          FlatButton.icon(
            icon: Icon(Icons.fastfood),
            onPressed: ()=> Navigator.pushNamed(context, ListaItemsPage.routeName),
            label: Text('Restaurantes'),
            color: Colors.white,
            textColor: Colors.orange,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(50)
            ),
          ),
          
          
        ],
      ),
       Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          FlatButton.icon(
            icon: Icon(Icons.verified_user),
            onPressed: ()=> Navigator.pushNamed(context, ListaItemsPage.routeName),
            label: Text('Abogados'),
            color: Colors.white,
            textColor: Colors.orange,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(50)
            ),
          ),
          VerticalDivider(),
          FlatButton.icon(
            icon: Icon(Icons.beenhere),
            onPressed: ()=> Navigator.pushNamed(context, ListaItemsPage.routeName),
            label: Text('Emergencias'),
            color: Colors.white,
            textColor: Colors.orange,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(50)
            ),
          ),
          
          
        ],
      ),
       Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          FlatButton.icon(
            icon: Icon(Icons.directions_car),
            onPressed: ()=> Navigator.pushNamed(context, ListaItemsPage.routeName),
            label: Text('Talleres'),
            color: Colors.white,
            textColor: Colors.orange,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(50)
            ),
          ),
          VerticalDivider(),
          FlatButton.icon(
            icon: Icon(Icons.school),
            onPressed: ()=> Navigator.pushNamed(context, ListaItemsPage.routeName),
            label: Text('Colegio/Universidad'),
            color: Colors.white,
            textColor: Colors.orange,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(50)
            ),
          ),
          
          
        ],
      ),
    ],
  );
}
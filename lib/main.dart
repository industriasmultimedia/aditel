import 'package:app/src/pages/home_page.dart';
import 'package:app/src/pages/item_page.dart';
import 'package:app/src/pages/lista_items.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
 
void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'ADITEL',
      initialRoute: 'home',
      routes: {
        HomePage.routeName          : (BuildContext context) => HomePage(),
        'itempage'                  : (BuildContext context) => ItemPage(),
        ListaItemsPage.routeName    : (BuildContext context) => ListaItemsPage()
        
      },
      theme: ThemeData(
        textTheme: GoogleFonts.ralewayTextTheme(
          Theme.of(context).textTheme,
        ),
        
        primaryColor: Color.fromRGBO(34, 40, 49, 1.0),
        iconTheme: IconThemeData(
          
        ),
        appBarTheme: AppBarTheme(
          elevation: 0.0,
          color: Color.fromRGBO(242,242,242,1),
          // textTheme: TextTheme(
          //   title: TextStyle( color: Color.fromRGBO(34, 40, 49, 1.0), fontSize: 20) 
          // ),
          textTheme: GoogleFonts.ralewayTextTheme(
          Theme.of(context)
          .textTheme          
          ),
          iconTheme: IconThemeData(color: Color.fromRGBO(34, 40, 49, 1.0))
        ),
        scaffoldBackgroundColor: Color.fromRGBO(220, 220, 220, 1),        
        cardTheme: CardTheme(
          elevation: 0.0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(0)
          ),
        )
      ),
      
     
    );
  }
}
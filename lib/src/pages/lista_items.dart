// import 'package:admob_flutter/admob_flutter.dart';
import 'package:flutter/material.dart';
import 'package:app/src/provider/wp-api.dart';
// import 'package:empleos/src/widgets/menu_widget.dart';
import 'package:html/parser.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:share/share.dart';


class ListaItemsPage extends StatelessWidget {
  ListaItemsPage({Key key}) : super(key: key);
  static final String routeName = 'lista1';


  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        title: Text('A D I T E L'),
        // leading: Builder(
        //   builder: (BuildContext context){
        //     return IconButton(
        //       icon: const Icon(Icons.menu),
        //       onPressed: (){ Scaffold.of(context).openDrawer();},
        //       tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
        //     );
        //   },
        //  ),
      ),
      // drawer: MenuWidget(),
      body: Container(
        color: Color.fromRGBO(235,235,233,1.0),
        child: FutureBuilder(
          future: wpaditel(),
          
          builder: (BuildContext context, AsyncSnapshot snapshot) {

            if(snapshot.hasData){
              return ListView.builder(
                padding: EdgeInsets.all(0),
                itemCount: snapshot.data.length,
                itemBuilder: (BuildContext context, int index){
                  Map wppost = snapshot.data[index];
                  // var imageurl = wppost["_embedded"]["wp:featuredmedia"][0]["source_url"];
                  var posturl = wppost["link"];
                  // var imageurl = wppost["_embedded"]["wp:featuredmedia"][0]["source_url"];
                  var direccion = wppost["_embedded"]["wp:term"][1][0]["name"];
                  var lat = wppost["ait-latitude"];
                  var lon = wppost["ait-longitude"];
                  var coordenadas = "https://www.google.com/maps/search/$lat,$lon";
                  var phone = wppost["_ait-item_item-data"]["telephone"];
                  var telefono = "tel:$phone";
                  const locale = 'es';

                  initializeDateFormatting(locale).then((_) {});
                  DateTime _fechavigente = DateTime.parse(wppost["modified"]);
                  String _fechavigente1 = new DateFormat.yMMMMd(locale).format(_fechavigente);
                  return Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(0),
                    ),
                    margin: EdgeInsets.only(bottom: 20),
                    elevation: 0,
                    
                    child: Padding(
                      padding: const EdgeInsets.only(left: 0, right: 0,top: 0,bottom: 6),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Row(
                              children: <Widget>[
                                CircleAvatar(
                                  backgroundImage: AssetImage('assets/adisa.png'),
                                  backgroundColor: Colors.white,
                                ),
                                VerticalDivider(width: 5,),
                                Column(
                                  children: <Widget>[
                                    Text('ADITEL', textAlign:TextAlign.start, style: TextStyle(fontWeight: FontWeight.w900),),
                                    Text(direccion, textAlign:TextAlign.start)
                                  ],
                                )
                              ],
                            ),
                          ),
                          Divider(height: 0),
                          Image.network(wppost["_ait-item_item-data"]["headerImage"]),
                          SizedBox(
                            height: 20,
                          ),
                          // Image.asset('assets/icono/adisa.jpg'),
                          Container(
                            padding: EdgeInsets.only(left: 20, right: 20, top: 0,bottom: 0),
                            child: Column(
                              children: <Widget>[
                                
                                // Text('PUBLICIDAD', style: TextStyle(color: Colors.grey),),
                                // Divider(),
                                Text(parse((wppost['title']['rendered']).toString()).documentElement.text,
                                 style: TextStyle(fontSize: 20, fontWeight: FontWeight.w900),
                                  textAlign: TextAlign.center,
                                ),
                                Divider(),
                                
                                SizedBox(
                                  height: 50,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Icon(Icons.access_time, size: 10),
                                      SizedBox(width: 5.0),
                                      Text('Fecha de actualización: ', style: TextStyle(fontSize: 10)),
                                      // Text(fechamod.toString())
                                      // Text(wppost["modified"]),
                                      Text(_fechavigente1, style: TextStyle(fontSize: 10),)
                                    ],
                                  ),
                                ),
                                Text(parse((wppost['content']['rendered']).toString()).documentElement.text,
                                  maxLines: 10,
                                  style: GoogleFonts.montserrat(
                                    textStyle: TextStyle(
                                      // fontSize: 16,
                                      // fontWeight: FontWeight.w500,
                                      color: Colors.black87
                                    )
                                  ),
                                ),
                                SizedBox(height: 10,),
                                Card(
                                    color: Color.fromRGBO(242,242,242, 1),
                                    elevation: 0,
                                    child:ListTile(
                                      leading: Icon(Icons.map),
                                      title: Text("Dirección "+ direccion, style: TextStyle( fontWeight: FontWeight.bold, height: 2, ) ),
                                      subtitle: Text(wppost["_ait-item_item-data"]["map"]["address"]),
                                    ) ,
                                  ),
                              ],
                            ),
                          ),
                          SizedBox(height: 10,),
                          Divider(height: 1),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              FlatButton.icon(
                                label: Text('Compartir'),
                                icon: Icon(Icons.share),
                                onPressed: ()=>Share.share('Esta oferta de empleo puede interesarte *'+parse((wppost['title']['rendered']).toString()).documentElement.text+'* \n\n'+posturl),
                                color: Color.fromRGBO(240, 240, 240, 1.0),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(50.0)
                                ),
                              ),
                              FlatButton.icon(
                                label: Text('Ver detalles...'),
                                icon: Icon(Icons.open_in_new),
                                onPressed: ()=> launch(posturl),
                                color: Color.fromRGBO(240, 240, 240, 1.0),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(50.0)
                                ),
                              )                       
                            ],
                          ),
                          // Divider(height: 1,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: <Widget>[
                              FlatButton.icon(
                                label: Text('Ver en Mapa'),
                                icon: Icon(Icons.map),
                                onPressed: ()=>launch(coordenadas),
                                color: Colors.red[300],
                                textColor: Colors.white,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(50.0)
                                ),
                              ),
                              FlatButton.icon(
                                label: Text('Teléfono '),
                                icon: Icon(Icons.phone),
                                onPressed: ()=>launch(telefono),
                                color: Colors.green[300],
                                textColor: Colors.white,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(50.0)
                                ),
                              )
                            ],
                          ),
                          
                        ],
                      ),
                    ),
                  );
                },
              );
            }
            return Center(child: CircularProgressIndicator(semanticsLabel: 'cargando',));
          },
        ),
      ),
      // persistentFooterButtons: <Widget>[
      //   AdmobBanner(          
      //     adUnitId: "ca-app-pub-9318301572058478/4177835778",
      //     adSize: AdmobBannerSize.FULL_BANNER, 
      //   ),
      // ],
    );
    
  }
}
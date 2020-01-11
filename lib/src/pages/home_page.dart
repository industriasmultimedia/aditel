import 'package:app/src/pages/lista_items.dart';
import 'package:app/src/provider/wp-api.dart';
import 'package:app/src/widget/botones.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class HomePage extends StatelessWidget {
  HomePage({Key key}) : super(key: key);
  static final String routeName = 'home';

  @override
  Widget build(BuildContext context) {

  
    final _screenSize = MediaQuery.of(context).size;


    return Scaffold(
      appBar: AppBar(
        title: Text('ADITEL - Guatemala'),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.search),onPressed: (){},),
        ],
        leading: Icon(Icons.pin_drop),
      ),
      body: Container(
        child: ListView(
          children: <Widget>[
            SizedBox(height: 20,),
            Center(child: Text('Agregados recientemente...', style: TextStyle(fontWeight: FontWeight.w900),)),
            SizedBox(height: 20,),
            FutureBuilder(
                future: wpaditel(),
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  if(snapshot.hasData){
                    return Swiper(
                      layout: SwiperLayout.CUSTOM,
                      customLayoutOption: new CustomLayoutOption(
                        startIndex: -1,
                        stateCount: 3
                      ).addRotate([
                        0.0,
                        0.0,
                        0.0
                        ]).addTranslate([
                        new Offset(-240.0, 0.0),
                        new Offset(0.0, 0.0),
                        new Offset(300.0, 0.0)
                      ]).addOpacity([
                        0.5,
                        1.0,
                        0.5]
                      ).addScale([
                        0.7,
                        1.0,
                        0.7
                      ], Alignment.bottomCenter),
                      outer: false,
                      itemCount: snapshot.data.length,
                      autoplay: true,
                      autoplayDelay: 10000,
                      autoplayDisableOnInteraction: true,
                      scrollDirection: Axis.horizontal,
                      itemWidth:_screenSize.width*0.8,
                      itemHeight: 210,
                      itemBuilder: (BuildContext context,int index){
                      Map delemp = snapshot.data[index];
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 20),
                        child: GestureDetector(
                          onTap: ()=> Navigator.pushNamed(context, ListaItemsPage.routeName, arguments: items),
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20.0),
                              boxShadow: [ BoxShadow(
                                color: Color.fromRGBO(0, 0, 0, 0.05),
                                offset: new Offset(5.0, 5.0),
                                blurRadius: 10.0
                              )]
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(20.0),
                              child: Column(
                                children: <Widget>[
                                  FadeInImage(
                                    image: NetworkImage(delemp["_embedded"]["wp:featuredmedia"][0]["source_url"]),
                                    placeholder: AssetImage('assets/loading3.gif'),
                                    fit: BoxFit.cover,
                                    height: 160.0,
                                    
                                  ),
                                  SizedBox(
                                    height: 29,
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Text(delemp['title']['rendered'],  overflow: TextOverflow.ellipsis, style: TextStyle( fontWeight: FontWeight.bold, color: Colors.blueGrey), textAlign: TextAlign.center,),
                                        Icon(Icons.art_track, color: Colors.orange,)
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                      }
                    );
                  }else{
                    return Center(
                      child: Container(
                        child: CircularProgressIndicator(
                          semanticsLabel: "cargando...",
                        )
                      ),
                    );
                  }
                  
                },
              ),
              Center(
                child: FlatButton.icon(
                  label: Text("Ver todos"),
                  icon: Icon(Icons.security),
                  onPressed: ()=> Navigator.pushNamed(context, ListaItemsPage.routeName),
                  color: Colors.blue,
                  textColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50.0)
                  ),
                ),
              ),
              Divider(height: 50,),
              Text('Explorar por categorías', textAlign: TextAlign.center, style: TextStyle(fontWeight: FontWeight.w900, fontSize: 20),),
              SizedBox(height: 20,),
              Card(
                child: botones(context),
                color: Colors.transparent, 
              )
              // _localidades(context),
          ],
        ),
      ),
    );
  }

  // Widget _localidades(context){
  //   return FutureBuilder(
  //     future: locations(),
  //     builder: (BuildContext context, AsyncSnapshot snapshot) {
  //       return Container(
  //         child: PageView.builder(
  //           pageSnapping: false,
  //           // controller: snapshot.data,
  //           itemCount: items.length,
  //           itemBuilder: ( context, c){
  //              Map delemp = snapshot.data[c];
  //            return Container(
  //               child: Text(delemp["title"]["rendered"]),
  //             );
  //           },
  //         ),
  //       );
  //     },
  //   );

  // }
  // Widget _tarjeta(BuildContext context, lugar){
    
  // }
}
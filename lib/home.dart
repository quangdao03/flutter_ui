import 'dart:async';
import 'dart:convert';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_ui/battery_detail.dart';
import 'package:http/http.dart' as http;

Future<List<Album>> fetchAlbum() async {
  final headers = {
      'Content-type': 'application/json',
      'Authorization': 'Bearer eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJhZG1pbiIsImF1dGgiOiJST0xFX0FETUlOLFJPTEVfRFJJVkVSLFJPTEVfVVNFUiIsImV4cCI6MTY2OTc5OTQ5N30.JLCz4T3O4muzy00i_S-wvvmUcjzqfZH9KEwv3hGbD8kPj3zxVJKg80ZFsASPs0jMqjaIeRJAicA1gMoV3UTdVw',
    };
  final response = await http
      .get(Uri.parse('http://a64fcdd91dec34a9fbcfcdd93f10c495-2057221956.ap-southeast-1.elb.amazonaws.com/services/batteryservice/api/bss/bss_v1.0_0001/batteries'), headers: headers );

  if (response.statusCode == 200) {
    
    List<dynamic> body = jsonDecode(response.body);
    List<Album> post = body.map((dynamic item) => Album.fromJson(item)).toList();
 
    return post;
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load album');
  }
}

class Album {

  final String serialNumber;
  

  const Album({
    required this.serialNumber,
  });

  factory Album.fromJson(Map<String, dynamic> json) {
    return Album(
      serialNumber: json['serialNumber'],

    );
  }
}
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
 late Future<List<Album>> futureAlbum ;
  List<Album> data = [];
  @override
  void initState() {
    super.initState();
    futureAlbum = fetchAlbum();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // title: 'Battery',
      debugShowCheckedModeBanner: false,
      // theme: ThemeData(
      //   primarySwatch: Colors.blue,
      // ),
      
      home: Scaffold(
        extendBody: true,
        body: Center(
          child: FutureBuilder<List<Album>>(
            future: futureAlbum,
            builder: (context, snapshot) {
           
              if (snapshot.hasData) {
               data = snapshot.data! ;
               
                return _screen(context);
                
              } else if (snapshot.hasError) {
                return Text('${snapshot.error}');
              }

              // By default, show a loading spinner.
              return const CircularProgressIndicator();
            },
          ),
        ),
      ),
    );


  }
  Widget _screen(BuildContext context) {
    return Scaffold(
      
      body: Container(
        child: CustomScrollView(primary: false, slivers: <Widget>[
            SliverPadding(
              padding: const EdgeInsets.all(6),
              sliver: SliverGrid.count(
                childAspectRatio: 0.9,
                crossAxisCount: 2,
                children: [
                  ...List.generate(data.length,
                      (index) => InkWell(
                        onTap: (){
                          // Navigator.of(context).push(
                          //        MaterialPageRoute(builder: (context) => BatteryDetail( album: data[index],)));
                               Navigator.of(context).push(MaterialPageRoute(builder: (context) => BatteryDetail( album: data[index],)));
                        },
                        child: Container(
                        margin: EdgeInsets.all(8), 
                        decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(20)),color: Colors.white,boxShadow: [BoxShadow(color: Colors.black26,blurRadius: 4,offset: Offset(2, 4))]),
                        child:Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 10),
                              child: Text('${data[index].serialNumber}',style: TextStyle(color: Colors.lightBlue)),
                            ),
                            Padding(
                              padding:  const EdgeInsets.symmetric(vertical: 2),
                              child: Image.asset('assets/images/pin 3.png',fit: BoxFit.fill,height: 80,)),

                              Padding(
                                
                                padding: const EdgeInsets.only(left:10 ,right:10,top: 5),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  
                                  children: [
                                  
                                    Text('Số chu kỳ sạc:',style: TextStyle(color: Colors.lightBlue),),
                                    
                                    Text('200',style: TextStyle(color: Colors.lightBlue)),
                                  ],
                                  
                                  
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left:10 ,right:10, top: 5 ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  
                                  children: [
                                  
                                    Text('Dung lượng:',style: TextStyle(color: Colors.lightBlue)),
                                    
                                    Text('19 mAh',style: TextStyle(color: Colors.lightBlue)),
                                  ],
                                  
                                  
                                ),
                              )
                          ],
                          
                        ),
                        
                        ),
                      )
                  )
                ],
              ),
            )
          ]),
      ),
      
    );
  }

}
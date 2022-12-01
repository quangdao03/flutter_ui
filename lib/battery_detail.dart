

import 'package:flutter/material.dart';

import 'home.dart';

class BatteryDetail extends StatefulWidget {
  const BatteryDetail({super.key, required this.album});
  final Album album ;
  
  @override
  State<BatteryDetail> createState() => _BatteryDetailState();
}

class _BatteryDetailState extends State<BatteryDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(  
        title: Text("Thông tin pin"),  
       
      ),  
      body: Container(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Container(
               decoration:  BoxDecoration(borderRadius:BorderRadius.circular(12),gradient: LinearGradient(begin: Alignment.topLeft,
                end: Alignment(0.8, 1),
                colors: <Color>[
                  Color(0xff1f005c),
                  Color(0xff5b0060),
                  Color(0xff870160),
                  Color(0xffac255e),
                  Color(0xffca485c),
                  Color(0xffe16b5c),
                  Color(0xfff39060),
                  Color(0xffffb56b),
                ],)),
              child: Column(
                children: [
                                    
                                  Padding(
                                    padding:  const EdgeInsets.symmetric(vertical: 2),
                                    child: Image.asset('assets/images/pin 3.png',fit: BoxFit.cover,height: 200,)),
                                    Padding(
                                      
                                      padding: const EdgeInsets.only(left:20 ,right:20,top: 10, bottom: 10),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        
                                        children: [
                                          
                                          Text('Mã pin:',style: TextStyle(color: Color.fromARGB(255, 255, 255, 255),fontSize:16,fontWeight: FontWeight.bold)),
                                          
                                          Text(widget.album.serialNumber,style: TextStyle(color: Color.fromARGB(255, 255, 255, 255),fontSize:16,fontWeight: FontWeight.bold)),
                                        ],
                                        
                                        
                                      ),
                                    ),

                                    Padding(
                                      
                                      padding: const EdgeInsets.only(left:20 ,right:20,top: 10, bottom: 10),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        
                                        children: [
                                        
                                          Text('Nhiệt độ pin:',style: TextStyle(color: Color.fromARGB(255, 255, 255, 255),fontSize:16,fontWeight: FontWeight.bold),),
                                          
                                          Text('35 °C',style: TextStyle(color: Color.fromARGB(255, 255, 255, 255),fontSize:16,fontWeight: FontWeight.bold)),
                                        ],
                                        
                                        
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left:20 ,right:20, top: 10, bottom: 10 ),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        
                                        children: [
                                        
                                          Text('SOH:',style: TextStyle(color: Color.fromARGB(255, 255, 255, 255),fontSize:16,fontWeight: FontWeight.bold)),
                                          
                                          Text('98',style: TextStyle(color: Color.fromARGB(255, 255, 255, 255),fontSize:16,fontWeight: FontWeight.bold)),
                                        ],
                                        
                                        
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left:20 ,right:20, top: 10, bottom: 10 ),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        
                                        children: [
                                        
                                          Text('SOC:',style: TextStyle(color: Color.fromARGB(255, 255, 255, 255),fontSize:16,fontWeight: FontWeight.bold)),
                                          
                                          Text('22',style: TextStyle(color: Color.fromARGB(255, 255, 255, 255),fontSize:16,fontWeight: FontWeight.bold)),
                                        ],
                                        
                                        
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left:20 ,right:20, top: 10, bottom: 10 ),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        
                                        children: [
                                        
                                          Text('Chu kỳ:',style: TextStyle(color: Color.fromARGB(255, 255, 255, 255),fontSize:16,fontWeight: FontWeight.bold)),
                                          
                                          Text('200',style: TextStyle(color: Color.fromARGB(255, 255, 255, 255),fontSize:16,fontWeight: FontWeight.bold)),
                                        ],
                                        
                                        
                                      ),
                                    ),
                                    
                                ],
                                
              ),
            ),
          ),
        ),
      ),
    );
  }
}
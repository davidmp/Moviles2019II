import 'package:flutter/material.dart'; 
void main() { runApp(MyApp()); } 
class MyApp extends StatelessWidget { 
  @override Widget build(BuildContext context) { 
    return MaterialApp( 
      title: 'My app title', 
      home: Scaffold( appBar: AppBar( title: Text('My app bar title') ), 
      body: Center( child: Text('Hola mundo!') ) ) ); } }
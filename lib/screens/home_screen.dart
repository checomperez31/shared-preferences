import 'package:flutter/material.dart';
import 'package:shapre/preferences/prefs.dart';
import 'package:shapre/widgets/widgets.dart';

class HomeScreen extends StatelessWidget {

  static const String routerName = 'Home';
   
  const HomeScreen({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      drawer: const SideMenu(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
         children: [
           Text('Darkmode: ${ Prefs.isDarkMode }'),
           const Divider(),
           Text('Genero: ${ Prefs.gender }'),
           const Divider(),
           Text('Nombre de usuario: ${ Prefs.name }'),
           const Divider(),
         ],
      ),
    );
  }
}
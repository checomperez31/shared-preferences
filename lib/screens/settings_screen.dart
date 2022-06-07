import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shapre/preferences/prefs.dart';
import 'package:shapre/providers/theme_provider.dart';

import '../widgets/widgets.dart';

class SettingsScreen extends StatefulWidget {

  static const String routerName = 'Settings';
   
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      drawer: const SideMenu(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Ajustes', style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold)),
            const Divider(),
            SwitchListTile.adaptive(
              value: Prefs.isDarkMode,
              title: const Text('DarkMode'), 
              onChanged: (value) {
                Prefs.isDarkMode = value;
                final tp = Provider.of<ThemeProvider>(context, listen: false);
                value ? tp.setDarkMode() : tp.setLightMode();
                setState(() {});
              }
            ),
            const Divider(),
            RadioListTile<int>(
              title: const Text('Masculino'),
              value: 1,
              groupValue: Prefs.gender,
              onChanged: ( value ) {
                Prefs.gender = value ?? 1;
                setState(() {});
              },
            ),
            const Divider(),
            RadioListTile<int>(
              title: const Text('Femenino'),
              value: 2,
              groupValue: Prefs.gender,
              onChanged: ( value ) {
                Prefs.gender = value ?? 2;
                setState(() {});
              },
            ),
            const Divider(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: TextFormField(
                initialValue: Prefs.name,
                onChanged: ( value ) {
                  Prefs.name = value;
                  setState(() {});
                },
                decoration: const InputDecoration(
                  labelText: 'Nombre',
                  helperText: 'Nombre del usuario'
                ),
              ),
            )
          ],
        ),
      )
    );
  }
}
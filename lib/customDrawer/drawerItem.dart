import 'package:flutter/material.dart';

class Draweritem {
  String title;
  IconData icon;
  Draweritem(this.title,this.icon);
}
class UserPreferences {
  // Atributos de las preferencias del usuario
  String name = "John Doe";  // Nombre por defecto
  String email = "johndoe@example.com";  // Email por defecto

  // Constructor vacío
  UserPreferences();
}
class CustomDrawer{
  static int selectedDrawerIndex = 1;

  static final _drawerItems = [
    Draweritem("Ejemplo 1", Icons.info)
  ];

  static _onTapDrawer(int itemPos, BuildContext context){
    Navigator.pop(context); // cerramos el drawer
    selectedDrawerIndex = itemPos;
  }

  static Widget getDrawer(BuildContext context) {
    final prefs = new UserPreferences();
    List<Widget> drawerOptions = [];
    // armamos los items del menu
    for (var i = 0; i < _drawerItems.length; i++) {
      var d = _drawerItems[i];
      drawerOptions.add(new ListTile(
        leading: new Icon(d.icon),
        title: new Text(d.title),
        selected: i == selectedDrawerIndex,
        onTap: () => _onTapDrawer(i, context),
      ));
    }
    // menu lateral
    return Drawer(
      child: Column(
        children: <Widget>[
          UserAccountsDrawerHeader(
              accountName: Text(prefs.name), accountEmail: Text(prefs.email)),
          Column(children: drawerOptions)
        ],
      ),
    );
}


}
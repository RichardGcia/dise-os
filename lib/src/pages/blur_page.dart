import 'package:flutter/material.dart';

import 'dart:math';
import 'dart:ui';

class BlurPage extends StatelessWidget {
  const BlurPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          _fondoApp(),
          SingleChildScrollView(
            child: Column(
              children: [
                _titulos(),
                _botonesRedondos(),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: _bottomNavigationBar(context),
    );
  }

  Widget _fondoApp() {
    final gradiente = Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(
            begin: FractionalOffset(0.0, 0.6),
            end: FractionalOffset(0.0, 1.0),
            colors: [
              Color.fromRGBO(52, 54, 101, 1.0),
              Color.fromRGBO(35, 37, 57, 1.0),
            ]),
      ),
    );

    final cajaRosa = Transform.rotate(
      angle: -pi / 4.0,
      child: Container(
        height: 340.0,
        width: 340.0,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(80.0),
          gradient: LinearGradient(colors: [
            Color.fromRGBO(236, 98, 188, 1.0),
            Color.fromRGBO(241, 142, 172, 1.0),
          ]),
          color: Colors.pink,
        ),
      ),
    );

    return Stack(
      children: [
        gradiente,
        Positioned(top: -100.0, child: cajaRosa),
      ],
    );
  }

  Widget _titulos() {
    return SafeArea(
      child: Container(
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Classify transaction',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 30.0,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10.0),
            Text(
              'Classify this transaction into a particular category',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18.0,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _bottomNavigationBar(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
        canvasColor: Color.fromRGBO(55, 57, 84, 1.0),
        primaryColor: Colors.pinkAccent,
        textTheme: Theme.of(context).textTheme.copyWith(
              caption: TextStyle(
                color: Color.fromRGBO(116, 117, 152, 1.0),
              ),
            ),
      ),
      child: BottomNavigationBar(items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.calendar_today, size: 30.0),
          label: 'Calendario',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.bubble_chart, size: 30.0),
          label: 'Gráficas',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.supervised_user_circle, size: 30.0),
          label: 'Grupos',
        ),
      ]),
    );
  }

  Widget _botonesRedondos() {
    return Table(
      children: [
        TableRow(children: [
          _crearBoton(Colors.blue, Icons.border_all, 'General'),
          _crearBoton(Colors.purpleAccent, Icons.directions_bus, 'Bus'),
        ]),
        TableRow(children: [
          _crearBoton(Colors.blue, Icons.shop, 'Shop'),
          _crearBoton(Colors.orange, Icons.insert_drive_file, 'File'),
        ]),
        TableRow(children: [
          _crearBoton(Colors.blueAccent, Icons.movie_filter, 'Movies'),
          _crearBoton(Colors.green, Icons.cloud, 'Clouds'),
        ]),
        TableRow(children: [
          _crearBoton(Colors.red, Icons.collections, 'Photos'),
          _crearBoton(Colors.teal, Icons.help_outline, 'Help'),
        ]),
      ],
    );
  }

  Widget _crearBoton(Color color, IconData icon, String texto) {
    return Padding(
      padding: EdgeInsets.all(10.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20.0),
        child: BackdropFilter(
          filter: ImageFilter.blur(
            sigmaX: 7.0,
            sigmaY: 0.0,
          ),
          child: Container(
            height: 180.0,
            // margin: EdgeInsets.all(10.0),
            decoration: BoxDecoration(
              color: Color.fromRGBO(62, 66, 102, 0.7),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SizedBox(height: 5.0),
                CircleAvatar(
                  backgroundColor: color,
                  radius: 35.0,
                  child: Icon(
                    icon,
                    color: Colors.white,
                    size: 30.0,
                  ),
                ),
                Text(
                  texto,
                  style: TextStyle(
                    color: color,
                  ),
                ),
                SizedBox(height: 5.0),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

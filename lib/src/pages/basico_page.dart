import 'package:flutter/material.dart';

class BasicoPage extends StatelessWidget {
  final estiloTitulo = TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold);
  final estiloSubT = TextStyle(fontSize: 18.0, color: Colors.grey);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            _crearImagen(),
            _crearTitulo(),
            _crearAcciones(),
            _crearTexto(),
            _crearTexto(),
            _crearTexto(),
            _crearTexto(),
            _crearTexto(),
            _crearTexto(),
            _crearTexto(),
            _crearTexto(),
            _crearTexto(),
          ],
        ),
      ),
    );
  }

  Widget _crearImagen() {
    return Container(
      width: double.infinity,
      child: Image(
        height: 300.0,
        fit: BoxFit.cover,
        image: NetworkImage(
            'https://cdn.pixabay.com/photo/2012/08/27/14/19/evening-55067__340.png'),
      ),
    );
  }

  Widget _crearTitulo() {
    return SafeArea(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 30.0, vertical: 10.0),
        child: Row(
          children: [
            Expanded(
              //Ocupa todo el espacio posible en la columna
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start, //Vertical,
                children: [
                  Text('Lago con un puente', style: estiloTitulo),
                  SizedBox(height: 7.0), //Separacion entre ambos textos
                  Text('Lago sin un puente', style: estiloSubT),
                ],
              ),
            ),
            Icon(
              Icons.star,
              color: Colors.red,
              size: 30.0,
            ),
            Text(
              '4.1',
              style: TextStyle(fontSize: 20.0),
            )
          ],
        ),
      ),
    );
  }

  Widget _crearAcciones() {
    return Row(
      //Row es Horizontal, Column es vertical
      mainAxisAlignment: MainAxisAlignment
          .spaceEvenly, //Distribuye  los hijos de  manera proporcional
      children: [
        _accion(Icons.call, 'Call'),
        _accion(Icons.near_me, 'Route'),
        _accion(Icons.share, 'Share'),
      ],
    );
  }

  Widget _accion(IconData icon, String texto) {
    return Column(
      children: [
        Icon(icon, color: Colors.blue, size: 40.0),
        SizedBox(height: 10.0),
        Text(
          texto,
          style: TextStyle(fontSize: 15.0, color: Colors.blue),
        ),
      ],
    );
  }

  Widget _crearTexto() {
    return SafeArea(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20.0),
        child: Text(
          'Texto de prueba Texto de prueba Texto de prueba Texto de prueba Texto de prueba Texto de prueba Texto de prueba Texto de prueba Texto de prueba Texto de prueba ',
          textAlign: TextAlign.justify, //Justifica el texto
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'hoverboard.dart';
import 'hoverboard_service.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hoverboard App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _hoverboardService = HoverboardService();
  final _marcaController = TextEditingController();
  final _modeloController = TextEditingController();
  final _velocidadMaximaController = TextEditingController();
  final _autonomiaController = TextEditingController();

  @override
  void dispose() {
    _marcaController.dispose();
    _modeloController.dispose();
    _velocidadMaximaController.dispose();
    _autonomiaController.dispose();
    super.dispose();
  }

  Future<void> _createHoverboard() async {
    final hoverboard = Hoverboard(
      id: 0,
      marca: _marcaController.text,
      modelo: _modeloController.text,
      velocidadMaxima: double.parse(_velocidadMaximaController.text),
      autonomia: double.parse(_autonomiaController.text),
    );

    try {
      await _hoverboardService.createHoverboard(hoverboard);
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Hoverboard creado con éxito')));
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Error al crear el hoverboard: $e')));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hoverboard App'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _marcaController,
              decoration: InputDecoration(labelText: 'Marca'),
            ),
            TextField(
              controller: _modeloController,
              decoration: InputDecoration(labelText: 'Modelo'),
            ),
            TextField(
              controller: _velocidadMaximaController,
              decoration: InputDecoration(labelText: 'Velocidad Máxima'),
              keyboardType: TextInputType.number,
            ),
            TextField(
              controller: _autonomiaController,
              decoration: InputDecoration(labelText: 'Autonomía'),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _createHoverboard,
              child: Text('Crear Hoverboard'),
            ),
          ],
        ),
      ),
    );
  }
}

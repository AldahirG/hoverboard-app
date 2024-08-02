import 'package:http/http.dart' as http;
import 'dart:convert';
import 'hoverboard.dart';

class HoverboardService {
  static const String apiUrl = 'https://zghp8m6ree.execute-api.us-east-2.amazonaws.com/dev/hoverboards';

  Future<void> createHoverboard(Hoverboard hoverboard) async {
    final response = await http.post(
      Uri.parse(apiUrl),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(hoverboard.toJson()),
    );

    if (response.statusCode == 201) {
      print('Hoverboard creado con éxito');
    } else {
      throw Exception('Error al crear el hoverboard: ${response.body}');
    }
  }
}

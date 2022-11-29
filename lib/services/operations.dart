import 'dart:convert';
import 'dart:async';
import '../pages/homeworks/homework.dart';
import 'package:http/http.dart' as http;

Future<List<Homework>> fetchHomework() async {
  // respuesta de la petición
  final response =
    await http.get(Uri.parse('https://fgl-fruits.glitch.me/mostrarhomeworks'));
  // si la respuesta es correcta
  if (response.statusCode == 200) {
    // devolver un objeto con el json interpretado ya como un objeto Homework
    return decodeHomework(response.body);
  } else {
    // si no, lanzar una excepción
    throw Exception('Unable to fetch data from the REST API');
  }
}

List<Homework> decodeHomework(String responseBody) {
  // interpretar cadena como texto y castear el jason a map de String y dynamic
  final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
  print("$parsed");
  // devolver un objeto Homework creado y funcionando con las caracteristicas del map
  return parsed.map<Homework>((json) => Homework.fromMap(json)).toList();
}

/// Esto de abajo no está funcionando especialmente para esta aplicación, 
/// puede ser una funcionalidad extra en el futuro
Future<Homework> sendHomework(String title, int id, String imageurl, int quantity) async {
  final http.Response response = await http.post(
    Uri.parse('https://fgl-fruits.glitch.me/mostrarhomeworks'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, String>{
      'title': title,
      'imageurl': imageurl,
      'quantity': quantity.toString()
    }),
  );
  if (response.statusCode == 201) {
    return Homework.fromJson(json.decode(response.body));
  } else {
    throw Exception('Failed to load');
  }
}

Future<Homework> deleteHomework(int id) async {
  final http.Response response = await http.delete(
    Uri.parse('url/$id'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
  );

  if (response.statusCode == 200) {
    return Homework.fromJson(json.decode(response.body));
  } else {
    throw Exception('Failed to delete Homework.');
  }
}

import 'dart:convert';
import 'dart:async';
import '../pages/classes/class.dart';
import 'package:http/http.dart' as http;

Future<List<Class>> fetchClass() async {
  // respuesta de la petición
  final response = await http
      .get(Uri.parse('https://fgl-fruits.glitch.me/mostrarhomeworks'));
  // si la respuesta es correcta
  if (response.statusCode == 200) {
    // devolver un objeto con el json interpretado ya como un objeto Class
    return decodeClass(response.body);
  } else {
    // si no, lanzar una excepción
    throw Exception('Unable to fetch data from the REST API');
  }
}

List<Class> decodeClass(String responseBody) {
  // interpretar cadena como texto y castear el jason a map de String y dynamic
  final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
  print("$parsed");
  // devolver un objeto Class creado y funcionando con las caracteristicas del map
  return parsed.map<Class>((json) => Class.fromMap(json)).toList();
}

/// Esto de abajo no está funcionando especialmente para esta aplicación,
/// puede ser una funcionalidad extra en el futuro
Future<Class> uploadClass(String classImage, String name, String schedule,
    String classroom, String days) async {
  print(
      "entre en el enviar y tengo $classImage $name $schedule $classroom $days");
  final http.Response response = await http.post(
    Uri.parse('https://fgl-fruits.glitch.me/insertclass'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, String>{
      'class_image': classImage,
      'name': name,
      'schedule': schedule,
      'classroom': classroom,
      'days': days
    }),
  );
  if (response.statusCode == 200) {
    print("volvi bien");
    print(response.body);
    return Class.fromJson(json.decode(response.body));
  } else {
    print("volvi con un error");
    throw Exception('There was an error');
  }
}

Future<Class> deleteClass(int id) async {
  final http.Response response = await http.delete(
    Uri.parse('url/$id'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
  );

  if (response.statusCode == 200) {
    return Class.fromJson(json.decode(response.body));
  } else {
    throw Exception('Failed to delete Class.');
  }
}

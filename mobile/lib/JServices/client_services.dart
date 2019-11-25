import 'dart:io';
import 'package:mobile/JModels/signup_model.dart';
import 'package:http/http.dart' as http;
import 'dart:async';

String _url = 'http://192.168.0.4:9999/clients';

Future<http.Response> getClient(int cpf, String password) async {
  final response = await http.get('$_url?cpf=$cpf&password=$password',
      headers: {
        HttpHeaders.contentTypeHeader: 'application/json',
        HttpHeaders.authorizationHeader: ''
      });
  return response;
}

Future<http.Response> createClient(SignUp post) async {
  final response = await http.post('$_url',
      headers: {
        HttpHeaders.contentTypeHeader: 'application/json',
        HttpHeaders.authorizationHeader: ''
      },
      body: postToJson(post));
  return response;
}

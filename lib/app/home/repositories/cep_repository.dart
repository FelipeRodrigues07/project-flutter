import 'package:buscador_cep/app/home/models/cep_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class CepRepository {
  Future<CepModel> getCep(String cep) async{
    String url = 'https://viacep.com.br/ws/$cep/json/';
      final response = await http.get(Uri.parse(url));
      final json = jsonDecode(response.body);
      return CepModel.fromJson(json);
  }
}
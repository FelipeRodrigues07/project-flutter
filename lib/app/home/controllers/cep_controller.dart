import 'package:buscador_cep/app/home/models/cep_model.dart';
import 'package:buscador_cep/app/home/repositories/cep_repository.dart';
import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'dart:convert';

class CepController extends ChangeNotifier{
  bool isLoading = false;
  bool isError = false;

  final  cepRepository = CepRepository();


  Future<CepModel> searchCep(String cep) async {
    isLoading = true;
    notifyListeners();
    try {
      // String url = 'https://viacep.com.br/ws/$cep/json/';
      // final response = await http.get(Uri.parse(url));
      // final json = jsonDecode(response.body);
      final response = await cepRepository.getCep(cep);
      isLoading = false;
      notifyListeners();
      return response;
      // return CepModel.fromJson(json);
    } catch (e) {
      isError = true;
      notifyListeners();
      throw Exception('Houve erro na requisição: $e');
    }
  }
}

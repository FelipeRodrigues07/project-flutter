import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController controllerCep =
      TextEditingController(); //função para pegar o valor

  String? cidade = '';
  String? estado = '';
  String? ddd = '';

  bool isLoading = false;

  Future<void> searchCep(String cep) async {
    setState(() {
      isLoading = true;
    });
    String url = 'https://viacep.com.br/ws/$cep/json/';
    final response = await http.get(Uri.parse(url));
    final json = jsonDecode(response.body);
    // print(json);
    setState(() {
      cidade = json['localidade'];
      estado = json['uf'];
      ddd = json['ddd'];
    });
    setState(() {
      isLoading = false;
    });
  }

  bool isValidFields() {
    return cidade == null || estado == null || ddd == null ? false : true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title:
            const Text("Buscador Cep", style: TextStyle(color: Colors.white)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            const Text("Digite o seu Cep"),
            TextFormField(
              controller: controllerCep,
              decoration: const InputDecoration(
                  labelText: "Digite um cep", border: OutlineInputBorder()),
            ),
            ElevatedButton(
                onPressed: () => {
                      searchCep(controllerCep.text),
                    },
                child: const Text("Buscar")),
            isLoading == true
                ? const CircularProgressIndicator()
                : isValidFields()
                    ? Text('Cidade: $cidade - Estado: $estado - DDD: $ddd')
                    : Text("Houve um erro na requisição")
          ],
        ),
      ),
    );
  }
}

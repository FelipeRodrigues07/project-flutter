import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  TextEditingController controllerCep = TextEditingController();  //função para pegar o valor 

  Future<void> searchCep(String cep) async{
    String url = 'https://viacep.com.br/ws/$cep/json/';
    final reponse = await http.get(Uri.parse(url))
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text("Buscador Cep", style: TextStyle(color: Colors.white)),
        ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
        children: [
          const Text("Digite o seu Cep"),
          TextFormField(
            controller: controllerCep,
            decoration: const InputDecoration(
              labelText: "Digite um cep",
              border: OutlineInputBorder()
            ),
          ),
          ElevatedButton(onPressed: ()=>{
            print("Foi digitado: ${controllerCep.text}")
            }, child: const Text("Buscar")),

        ],
      ),
      ),
    );
  }
}
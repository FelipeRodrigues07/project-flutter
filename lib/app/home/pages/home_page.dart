
import 'package:buscador_cep/app/home/controllers/cep_controller.dart';
import 'package:buscador_cep/app/home/models/cep_model.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController controllerCep =
      TextEditingController(); //função para pegar o valor

  var cep = CepModel();
  final controller = CepController();


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
                onPressed: () async => {
                     cep = await controller.searchCep(controllerCep.text),
                    },
                child: const Text("Buscar")),
            ListenableBuilder(
              listenable: controller, 
              builder: (context, child){
                if(controller.isLoading == true ){
                  return const CircularProgressIndicator();
                }
                if(controller.isError == true){
                 const Text("Houve um erro na requisição"); 
                }
                return Text('Cidade: ${cep.logradouro} - Estado: ${cep.uf} - DDD: ${cep.ddd}');
              }
              ), 
          ],
        ),
      ),
    );
  }
}



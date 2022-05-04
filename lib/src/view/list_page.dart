import 'package:flutter/material.dart';
import 'package:get_cep/src/models/cep_model.dart';
import 'package:get_cep/src/widget/cep_detail.dart';

class ListPage extends StatefulWidget {
  const ListPage({Key? key }) : super(key: key);

  @override
  State<ListPage> createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  List<CepModel> listCep = [
    CepModel(
      cep: '85503355',
      logradouro: 'Algemiro Mari',
      bairro: 'Fraron',
      localidade: 'Pato Branco',
      uf: 'PR',
    ),
    CepModel(
      cep: '85503355',
      logradouro: 'Algemiro Mari',
      bairro: 'Fraron',
      localidade: 'Pato Branco',
      uf: 'PR',
    ),
    CepModel(
      cep: '85503355',
      logradouro: 'Algemiro Mari',
      bairro: 'Fraron',
      localidade: 'Pato Branco',
      uf: 'PR',
    ),
    CepModel(
      cep: '85503355',
      logradouro: 'Algemiro Mari',
      bairro: 'Fraron',
      localidade: 'Pato Branco',
      uf: 'PR',
    ),
    CepModel(
      cep: '85503355',
      logradouro: 'Algemiro Mari',
      bairro: 'Fraron',
      localidade: 'Pato Branco',
      uf: 'PR',
    ),
    CepModel(
      cep: '85503355',
      logradouro: 'Algemiro Mari',
      bairro: 'Fraron',
      localidade: 'Pato Branco',
      uf: 'PR',
    ),
    CepModel(
      cep: '85503355',
      logradouro: 'Algemiro Mari',
      bairro: 'Fraron',
      localidade: 'Pato Branco',
      uf: 'PR',
    ),                        
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black87,
        title: const Text(
          'Lista de CEP',
          style: TextStyle(
            color: Colors.white
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(bottom: 10),
        child: ListView.builder(
          itemCount: listCep.length,
          itemBuilder: (context, index) {
            return CepDetail(
              cep: listCep[index].cep!,
              logradouro: listCep[index].logradouro!,
              bairro: listCep[index].bairro!,
              localidade: listCep[index].localidade!,
              uf: listCep[index].uf!,
            );
          },
        ),
      ),
    );
  }
}
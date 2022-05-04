import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get_cep/src/http/rest_client.dart';
import 'package:get_cep/src/models/cep_model.dart';
import 'package:get_cep/src/widget/default_button.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({
    Key? key,
    required this.cep,
  }) : super(key: key);

  final String cep;

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  final _restClient = RestClient(Dio());
  CepModel? _cep;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black87,
        title: const Text(
          'Detalhes',
          style: TextStyle(
            color: Colors.white
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Column(
          children: [
            FutureBuilder<CepModel?>(
              future: _restClient.getCep(widget.cep),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Expanded(
                    child: Center(
                      child: CircularProgressIndicator(color: Colors.black87),
                    ),
                  );
                }

                if (snapshot.connectionState == ConnectionState.done && snapshot.hasData) {
                  _cep = snapshot.data!;
                  
                  return Column(
                    children: [
                      ListTile(
                        title: const Text('CEP'),
                        subtitle: Text(_cep!.cep ?? '-'),
                      ),
                      ListTile(
                        title: const Text('Rua'),
                        subtitle: Text(_cep!.logradouro ?? '-'),
                      ),
                      ListTile(
                        title: const Text('Bairro'),
                        subtitle: Text(_cep!.bairro ?? '-'),
                      ),
                      ListTile(
                        title: const Text('Localidade'),
                        subtitle: Text(_cep!.localidade ?? '-'),
                      ),
                      ListTile(
                        title: const Text('UF'),
                        subtitle: Text(_cep!.uf ?? '-'),
                      ),
                    ],        
                  );
                }

                if (snapshot.hasError || !snapshot.hasData) {
                  return Expanded(
                    child: Center(
                      child: Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: Colors.grey[200],
                          borderRadius: BorderRadius.circular(10)
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: const [
                            Icon(
                              Icons.error_sharp
                            ),
                            SizedBox(width: 10),
                            Text('Nenhum CEP Encontrado :('),
                          ],
                        ),
                      ),
                    ),
                  );
                }
                
                return const CircularProgressIndicator();
              },
            ),
            const Expanded(
              child: SizedBox(),
            ),
            DefaultButton(
              label: 'Salvar CEP',
              backgroundColor: const Color.fromRGBO(38, 63, 47, 1),
              labelColor: const Color.fromRGBO(133, 221, 164, 1),
              onTap: () => print(''),
            )
          ],
        ),
      ),
    );
  }
}
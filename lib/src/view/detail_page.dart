import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get_cep/src/http/rest_client.dart';
import 'package:get_cep/src/model/cep_model.dart';
import 'package:get_cep/src/widget/circular_indicator.dart';
import 'package:get_cep/src/widget/default_button.dart';
import 'package:get_cep/src/widget/error_message.dart';
import 'package:sqflite/sqflite.dart';

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

  static const String createCepsTableScript = "CREATE TABLE ceps(cep TEXT, logradouro TEXT, bairro TEXT, localidade TEXT, uf TEXT)";
  static const String tableName = 'ceps';

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
                  return const Expanded(child: CircularIndicator());
                }

                if (snapshot.connectionState == ConnectionState.done && snapshot.hasData) {
                  _cep = snapshot.data!;
                  
                  return _itemCep(_cep);
                }

                if (snapshot.hasError || !snapshot.hasData) {
                  return const Expanded(
                    child: ErrorMessage(
                      text: 'Nenhum CEP Encontrado :(',
                    ),
                  );
                }
                
                return const Expanded(child: CircularIndicator());
              },
            ),
            const Expanded(
              child: SizedBox(),
            ),
            DefaultButton(
              label: 'Salvar CEP',
              backgroundColor: const Color.fromRGBO(38, 63, 47, 1),
              labelColor: const Color.fromRGBO(133, 221, 164, 1),
              onTap: () {
                _saveCep(_cep!);
              },
            )
          ],
        ),
      ),
    );
  }

  Widget _itemCep(CepModel? cep) {
    return Column(
      children: [
        ListTile(
          title: const Text('CEP'),
          subtitle: Text(cep!.cep ?? '-'),
        ),
        ListTile(
          title: const Text('Rua'),
          subtitle: Text(cep.logradouro ?? '-'),
        ),
        ListTile(
          title: const Text('Bairro'),
          subtitle: Text(cep.bairro ?? '-'),
        ),
        ListTile(
          title: const Text('Localidade'),
          subtitle: Text(cep.localidade ?? '-'),
        ),
        ListTile(
          title: const Text('UF'),
          subtitle: Text(cep.uf ?? '-'),
        ),
      ],        
    );
  }

  Future<Database> _getDatabase() async {
    return openDatabase(
      await getDatabasesPath() + 'cep.db',
      onCreate: (db, version) {
        return db.execute(createCepsTableScript);
      },
      version: 1,
    );
  }  

  Future<void> _saveCep(CepModel cep) async {
    try {
      final Database db = await _getDatabase();

      await db.insert(
        tableName,
        cep.toMap(),
      );
      _showSnackBar('CEP salvo com Sucesso :)');

    } catch (err) {
      _showSnackBar('Erro ao salvar o CEP :(');
      throw('Error saving CEP $err');
    }
  }

  void _showSnackBar(String label) {
    final snackBar = SnackBar(
      content: Text(label),
      padding: const EdgeInsets.all(20),
      behavior: SnackBarBehavior.floating,
    );

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
import 'package:flutter/material.dart';
import 'package:get_cep/src/model/cep_model.dart';
import 'package:get_cep/src/widget/cep_detail.dart';
import 'package:get_cep/src/widget/circular_indicator.dart';
import 'package:get_cep/src/widget/error_message.dart';
import 'package:sqflite/sqflite.dart';

class ListPage extends StatefulWidget {
  const ListPage({Key? key }) : super(key: key);

  @override
  State<ListPage> createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {

  static const String tableName = 'ceps';
  // static const String selectCepsTableScript = "SELECT DISTINCT ceps.cep * FROM ceps";

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
        child: FutureBuilder<List<CepModel>>(
          future: _getCeps(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const CircularIndicator();
            }

            if (snapshot.connectionState == ConnectionState.done && snapshot.hasData) {
              List<CepModel> ceps = snapshot.data!;

              return _listCeps(ceps);
            }

            if (snapshot.hasError || !snapshot.hasData) {
              return const ErrorMessage(
                text: 'Nenhum CEP Encontrado :(',
              );
            }

            return const CircularIndicator();
          },
        ),
      ),
    );
  }

  Widget _listCeps(List<CepModel> ceps) {
    return ListView.builder(
      itemCount: ceps.length,
      itemBuilder: (context, index) {
        return CepDetail(
          cep: ceps[index].cep!,
          logradouro: ceps[index].logradouro!,
          bairro: ceps[index].bairro!,
          localidade: ceps[index].localidade!,
          uf: ceps[index].uf!,
        );
      },
    );    
  }

  Future<Database> _getDatabase() async {
    return openDatabase(
      await getDatabasesPath() + 'cep.db',
    );
  }  

  Future<List<CepModel>> _getCeps() async {
    try {
      final Database db = await _getDatabase();
      final List<Map<String, dynamic>> maps = await db.query(
        tableName,
      );

      return List.generate(
        maps.length,
        (i) {
          return CepModel.fromJson(maps[i]);
        }
      );

    } catch (err) {
      throw('Error get List CEP $err');
    }
  }
}
import 'package:flutter/material.dart';
import 'package:get_cep/src/widget/default_button.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({ Key? key }) : super(key: key);

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
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
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: const [
                ListTile(
                  title: Text('CEP'),
                  subtitle: Text(''),
                ),
                ListTile(
                  title: Text('Rua'),
                  subtitle: Text(''),
                ),
                ListTile(
                  title: Text('Bairro'),
                  subtitle: Text(''),
                ),
                ListTile(
                  title: Text('Localidade'),
                  subtitle: Text(''),
                ),
                ListTile(
                  title: Text('UF'),
                  subtitle: Text(''),
                ),
              ],        
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
import 'package:flutter/material.dart';
import 'package:get_cep/src/view/detail_page.dart';
import 'package:get_cep/src/view/list_page.dart';
import 'package:get_cep/src/widget/default_button.dart';
import 'package:masked_text_field/masked_text_field.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController fieldController = TextEditingController();  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black87,
        title: const Text(
          'Busca CEP',
          style: TextStyle(
            color: Colors.white
          ),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 200,
            // child: Image.asset('location.png')
          ),
          Container(
            padding: const EdgeInsets.all(20),
            child: MaskedTextField(
              textFieldController: fieldController,
              mask: 'xx.xxx-xxx',
              keyboardType: TextInputType.number,
              maxLength: 10,
              inputDecoration: const InputDecoration(
                labelText: 'Informe o CEP',
                labelStyle: TextStyle(
                  color: Color.fromRGBO(38, 63, 47, 1),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Color.fromRGBO(38, 63, 47, 1),
                  ),
                ),
              ),
              onChange: (_) {},
            ),
          ),
          const Expanded(
            child: SizedBox(),
          ),
          DefaultButton(
            label: 'Ver Lista',
            backgroundColor: Colors.white,
            borderColor: const Color.fromRGBO(38, 63, 47, 1),
            labelColor: const Color.fromRGBO(38, 63, 47, 1),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const ListPage()),
              );              
            },
          ),
          const SizedBox(height: 10),
          DefaultButton(
            label: 'Buscar',
            backgroundColor: const Color.fromRGBO(38, 63, 47, 1),
            borderColor: const Color.fromRGBO(38, 63, 47, 1),
            labelColor: Colors.white,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const DetailPage()),
              );              
            },
          ),
          const SizedBox(height: 10),
        ],
      ),
    );
  }
}
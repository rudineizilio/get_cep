import 'package:flutter/material.dart';

class CepDetail extends StatelessWidget {
  const CepDetail({
    Key? key,
    required this.cep,
    required this.logradouro,
    required this.bairro,
    required this.localidade,
    required this.uf,
  }) : super(key: key);

  final String cep;
  final String logradouro;
  final String bairro;
  final String localidade;
  final String uf;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 10, right: 10, top: 10),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(10)
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ListTile(
            title: Text(
              cep,
              style: const TextStyle(
                fontWeight: FontWeight.w500,
              ),
            ),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(logradouro),
                Text(bairro),
              ],
            ),
            trailing: Text(localidade + ' - ' + uf),
          ),
        ],
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:flutter_application_app/suporte/suporte.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ListarLidos extends StatelessWidget {
  const ListarLidos({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              Auxiliar.imagemEmDesenvolvimento,
              width: MediaQuery.of(context).size.width * 0.2,
            ),
            const SizedBox(height: 20),
            // ignore: prefer_const_constructors
            Text(
              'Função listar lidos em desenvolvimento',
              style: const TextStyle(fontSize: 20),
            ),
          ],
        ),
      ),
    );
  }
}

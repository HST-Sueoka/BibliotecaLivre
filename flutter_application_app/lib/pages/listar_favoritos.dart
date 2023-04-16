import 'package:flutter/material.dart';
import 'package:flutter_application_app/suporte/suporte.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ListarFavoritos extends StatelessWidget {
  const ListarFavoritos({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              Auxiliar.imagemEmDesenvolvimento,
              width: MediaQuery.of(context).size.width * 0.4,
            ),
            const SizedBox(height: 20),
            const Text(
              'Função listar favoritos em desenvolvimento',
              style: TextStyle(fontSize: 20),
            ),
          ],
        ),
      ),
    );
  }
}

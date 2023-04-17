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
              width: MediaQuery.of(context).size.width * 0.35,
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 35, 10, 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Expanded(
                    child: Text(
                      "Função Listar Lidos em desenvolvimento.",
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Auxiliar.corDaFonteSimples),
                      maxLines: 4,
                      overflow: TextOverflow.ellipsis,
                      textDirection: TextDirection.ltr,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

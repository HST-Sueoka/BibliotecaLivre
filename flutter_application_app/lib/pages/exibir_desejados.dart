// ignore_for_file: prefer_const_constructors, unused_local_variable, prefer_typing_uninitialized_variables

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_app/suporte/suporte.dart';
import 'package:google_fonts/google_fonts.dart';

class ExibirDesejados extends StatefulWidget {
  final livros;

  const ExibirDesejados(this.livros, {Key? key}) : super(key: key);

  @override
  State<ExibirDesejados> createState() => _ExibirDesejadosState();
}

class _ExibirDesejadosState extends State<ExibirDesejados> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        color: Colors.blueGrey.shade50,
        padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
        child: StreamBuilder<QuerySnapshot>(
          stream: widget.livros.snapshots(),
          builder: (context, snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.none:
                return const Center(
                  child: Text('Não foi possível conectar.'),
                );
              case ConnectionState.waiting:
                return const Center(child: CircularProgressIndicator());
              default:
                final dados = snapshot.requireData;
                if (dados.size > 0) {
                  return ListView.builder(
                    itemCount: dados.size,
                    itemBuilder: (context, index) {
                      dynamic item = dados.docs[index].data();
                      String autor = item['autor'];
                      String titulo = item['titulo'];

                      return Card(
                        color: Auxiliar.corDoCard,
                        child: ListTile(
                          title: Text(autor,
                              style: GoogleFonts.roboto(
                                  fontSize: 16, fontWeight: FontWeight.bold)),
                          subtitle: Text(
                            titulo,
                            style: GoogleFonts.roboto(
                                fontSize: 14,
                                color: Auxiliar.corDaFonteSimples),
                          ),
                        ),
                      );
                    },
                  );
                } else {
                  return Center(
                    child: Text('Nenhuma livro encontrado.'),
                  );
                }
            }
          },
        ),
      ),
    );
  }
}

// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace, prefer_typing_uninitialized_variables


import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../controller/Controlador_de_livros.dart';
import '../suporte/suporte.dart';
import 'exibir_desejados.dart';


class ListarDesejados extends StatefulWidget {
  const ListarDesejados({Key? key}) : super(key: key);

  @override
  State<ListarDesejados> createState() => _ListarDesejadosState();
}

class _ListarDesejadosState extends State<ListarDesejados> {
  var livros;
  var txtAutor = TextEditingController();
  var txtTitulo = TextEditingController();
  
  @override
  void initState() {
    super.initState();
    livros = ControladorDeLivros().listarDesejados();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Auxiliar.corDeFundo,
      child: Column(
        children: [
          Container(
            color: Color.fromARGB(255, 201, 201, 201),
            child: ListTile(
              leading: Icon(Icons.add_task_outlined),
              contentPadding: EdgeInsets.fromLTRB(10, 10, 10, 10),
              title: Text(
                'Adicionar livros desejado',
                style: GoogleFonts.roboto(fontSize: 22),
              ),
              onTap: () {
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: Text(
                      'Adicionar',
                      style: GoogleFonts.roboto(
                        fontSize: 36,
                        color: Color.fromARGB(255, 0, 0, 0),
                      ),
                    ),
                    backgroundColor: Colors.blueGrey.shade50,
                    content: Container(
                      width: 350,
                      height: 260,
                      child: Column(
                        children: [
                          campoTexto('Autor', Icons.title, txtAutor),
                          TextField(
                            style: GoogleFonts.roboto(fontSize: 24),
                            controller: txtTitulo,
                            maxLines: 2,
                            textAlignVertical: TextAlignVertical.top,
                            decoration: InputDecoration(
                              labelText: 'Título',
                              labelStyle: GoogleFonts.roboto(fontSize: 24),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    actionsPadding: EdgeInsets.fromLTRB(0, 0, 20, 20),
                    actions: [
                      TextButton(
                        style: TextButton.styleFrom(
                          minimumSize: Size(120, 50),
                        ),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text(
                          'Cancelar',
                          style: GoogleFonts.roboto(
                            fontSize: 20,
                            color: Auxiliar.corDaFonteSimples,
                          ),
                        ),
                      ),
                      TextButton(
                        style: TextButton.styleFrom(
                          backgroundColor: Auxiliar.corPrincipal,
                          minimumSize: Size(120, 50),
                        ),
                        onPressed: () {
                          if (txtAutor.text.isNotEmpty) {
                            ControladorDeLivros().adicionarDesejados(
                              txtAutor.text,
                              txtTitulo.text,
                            );
                            txtAutor.clear();
                            txtTitulo.clear();
                            sucesso(context, 'Livro adicionada com sucesso.');
                          } else {
                            erro(context, 'Informe o autor do título');
                          }

                          Navigator.pop(context);
                        },
                        child: Text(
                          'salvar',
                          style: GoogleFonts.roboto(
                            fontSize: 20,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),

          //
          // EXIBIR TAREFAS
          //
          ExibirDesejados(
            livros,
          ),
        ],
      ),
    );
  }
}

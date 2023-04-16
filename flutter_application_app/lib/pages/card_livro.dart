// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:google_fonts/google_fonts.dart';

import '../controller/Controlador_de_livros.dart';
import '../suporte/suporte.dart';

class CardLivros extends StatefulWidget {
  final livro;
  final List<String> favoritos;
  final List<String> lidos;

  const CardLivros(this.livro, this.favoritos, this.lidos, {Key? key})
      : super(key: key);

  @override
  State<CardLivros> createState() => _CardLivrosState();
}

class _CardLivrosState extends State<CardLivros> {
  late dynamic livroDados;
  late String autor;
  late String titulo;
  late String livroId;

  @override
  void initState() {
    super.initState();
    livroDados = widget.livro.data();
    autor = livroDados['autor'];
    titulo = livroDados['titulo'];
    livroId = widget.livro.reference.id;
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Auxiliar.corDoCard,
      child: ListTile(
          title: Text(autor,
              style: GoogleFonts.roboto(
                  fontSize: 16, fontWeight: FontWeight.bold)),
          subtitle: Text(
            titulo,
            style: GoogleFonts.roboto(
                fontSize: 14, color: Auxiliar.corDaFonteSimples),
          ),
          trailing: Row(mainAxisSize: MainAxisSize.min, children: [
            //Favoritos
            IconButton(
                icon: Icon(
                  widget.favoritos.contains(livroId)
                      ? Icons.favorite
                      : Icons.favorite_outline,
                  size: 20,
                  color: Auxiliar.corDoIcone,
                ),
                onPressed: () async {
                  ControladorDeLivros().favoritos(livroId);
                  setState(() {
                    if (widget.favoritos.contains(livroId)) {
                      widget.favoritos.remove(livroId);
                    } else {
                      widget.favoritos.add(livroId);
                    }
                  });
                }),
            // Livros Lidos
            IconButton(
                icon: Icon(
                  widget.lidos.contains(livroId)
                      ? Icons.menu_book_sharp
                      : Icons.book,
                  size: 20,
                  color: Auxiliar.corDoIcone,
                ),
                onPressed: () async {
                  ControladorDeLivros().lidos(livroId);
                  setState(() {
                    if (widget.lidos.contains(livroId)) {
                      widget.lidos.remove(livroId);
                    } else {
                      widget.lidos.add(livroId);
                    }
                  });
                }),
            // Download
            IconButton(
              icon: const Icon(
                Icons.download,
                size: 20,
                color: Auxiliar.corDoIcone,
              ),
              onPressed: () async {
                final taskId = await FlutterDownloader.enqueue(
                  url: livroDados['LinkDownload'],
                  savedDir: '/storage/emulated/0/Download',
                  showNotification:
                      true, // show download progress in status bar (for Android)
                  openFileFromNotification:
                      true, // click on notification to open downloaded file (for Android)
                );
              },
            ),
          ])),
    );
  }
}

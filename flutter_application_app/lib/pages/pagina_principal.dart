// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../controller/controlador_de_login.dart';
import '../suporte/suporte.dart';
import 'listar_favoritos.dart';
import 'listar_lidos.dart';
import 'listar_todos_os_livros.dart';

class PaginaPrincipal extends StatefulWidget {
  const PaginaPrincipal({Key? key}) : super(key: key);

  @override
  State<PaginaPrincipal> createState() => _PaginaPrincipalState();
}

class _PaginaPrincipalState extends State<PaginaPrincipal> {
  final List<Widget> telas = [
    PaginaLivroGeral(),
    ListarFavoritos(),
    ListarLidos(),
  ];
  int index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Auxiliar.corPrincipal,
        toolbarHeight: 70,
        centerTitle: true,
        title: Text(
          Auxiliar.nomeAplicativo,
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      endDrawer: Drawer(
        child: ListView(
          padding: EdgeInsets.fromLTRB(15, 15, 15, 0), // alterei aqui
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.account_circle,
                  color: Colors.black,
                ),
                FutureBuilder<String>(
                  future: ControladorDeLogin().retornarUsuarioLogado(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return CircularProgressIndicator();
                    } else if (snapshot.connectionState ==
                        ConnectionState.done) {
                      if (snapshot.hasError) {
                        return const Text('Error');
                      } else if (snapshot.hasData) {
                        return Text(
                          snapshot.data.toString(),
                          overflow: TextOverflow.ellipsis,
                          style: GoogleFonts.roboto(
                            fontSize: 16,
                          ),
                        );
                      } else {
                        return const Text('Empty data');
                      }
                    } else {
                      return Text(
                        'State: ${snapshot.connectionState}',
                        selectionColor: Colors.black,
                      );
                    }
                  },
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 5),
              child: ListTile(
                  leading: Icon(
                    Icons.help_sharp,
                    color: Colors.black,
                  ),
                  title: Text(
                    "Sobre o app",
                    selectionColor: Colors.black,
                  ),
                  onTap: () {
                    Navigator.pushNamed(context, 'sobre_app');
                  }),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 0),
              child: ListTile(
                leading: Icon(
                  Icons.logout,
                  color: Colors.black,
                ),
                title: Text(
                  "Logout",
                  selectionColor: Colors.black,
                ),
                onTap: () {
                  ControladorDeLogin().logout();
                  Navigator.pushNamedAndRemoveUntil(
                    context,
                    'login',
                    (Route<dynamic> route) => false,
                  );
                },
              ),
            ),
          ],
        ),
      ),
      body: telas[index],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Auxiliar.corPrincipal,
        selectedItemColor: Colors.green,
        unselectedItemColor: Colors.white,
        selectedIconTheme: IconThemeData(size: 25),
        unselectedIconTheme: IconThemeData(size: 20),
        unselectedLabelStyle: TextStyle(fontWeight: FontWeight.normal),
        iconSize: 40,
        currentIndex: index,
        onTap: (idx) {
          setState(() {
            index = idx;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.book,
            ),
            label: 'Livros Geral',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.favorite,
            ),
            label: 'Favoritos',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.menu_book,
            ),
            label: 'Lidos',
          ),
        ],
      ),
    );
  }
}

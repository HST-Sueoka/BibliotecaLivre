import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ControladorDeLivros {
  listar() {
    return FirebaseFirestore.instance
        .collection('livros')
        .orderBy('arquivo', descending: false);
  }

  Future<List> livrosFavoritados() async {
    var uid = FirebaseAuth.instance.currentUser!.uid;
    var res;
    await FirebaseFirestore.instance
        .collection('usuarios')
        .doc(uid) // adicionar o UID do usuário autenticado aqui
        .get()
        .then((doc) {
      if (doc.exists) {
        res = doc.data()?['favoritos'] ?? [];
      } else {
        res = [];
      }
    });
    return res;
  }

  Future<List> livrosLidos() async {
    var uid = FirebaseAuth.instance.currentUser!.uid;
    var res;
    await FirebaseFirestore.instance
        .collection('usuarios')
        .doc(uid) // adicionar o UID do usuário autenticado aqui
        .get()
        .then((doc) {
      if (doc.exists) {
        res = doc.data()?['lidos'] ?? [];
      } else {
        res = [];
      }
    });
    return res;
  }

  Future<void> favoritos(String livroId) async {
    final user = FirebaseAuth.instance.currentUser;
    final userRef =
        FirebaseFirestore.instance.collection('usuarios').doc(user?.uid);

    if ((await userRef.get())['favoritos'].contains(livroId)) {
      await userRef.update({
        'favoritos': FieldValue.arrayRemove([livroId])
      });
    } else {
      await userRef.update({
        'favoritos': FieldValue.arrayUnion([livroId])
      });
    }
  }

  Future<void> lidos(String livroId) async {
    final user = FirebaseAuth.instance.currentUser;

    final userRef =
        FirebaseFirestore.instance.collection('usuarios').doc(user?.uid);

    if ((await userRef.get())['lidos'].contains(livroId)) {
      await userRef.update({
        'lidos': FieldValue.arrayRemove([livroId])
      });
    } else {
      await userRef.update({
        'lidos': FieldValue.arrayUnion([livroId])
      });
    }
  }
}

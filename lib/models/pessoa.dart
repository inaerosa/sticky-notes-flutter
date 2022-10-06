import 'categorias.dart';

class Pessoa {
  final int id;
  final String nome;
  String? email;
  final DateTime aniversario;
  Categorias? tag;

  Pessoa(
      {required this.id,
      required this.nome,
      this.email,
      required this.aniversario,
      required this.tag});

  @override
  String toString() {
    return ('Id: $id, Nome: $nome, Email: $email, Aniversário: $aniversario, Categorias: $tag');
  }
}

import "package:flutter/material.dart";
import 'package:lembretes/views/cadastrar_pessoa.dart';
import 'package:lembretes/views/detalhes_aniversario.dart';
import 'my_homepage.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Aprenda de Aniversarios',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        initialRoute: MyHomePage.nomeRota,
        routes: {
          MyHomePage.nomeRota: (context) => MyHomePage(),
          CadastrarPessoa.nomeRota: (context) => CadastrarPessoa(),
          DetalhesAniversario.nomeRota: (context) => DetalhesAniversario()
        });
  }
}

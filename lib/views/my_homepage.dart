// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

import 'cadastrar_pessoa.dart';

class MyHomePage extends StatefulWidget {
  static const nomeRota = "/myhomepage";

  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePage();
}

class _MyHomePage extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: _buildMenu(),
      appBar: AppBar(
        title: Text('não esqueça!'),
      ),
      body: Center(
        child: Column(),
      ),
    );
  }

  Widget _buildMenu() {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        // ignore: prefer_const_literals_to_create_immutables
        children: [
          SizedBox(
            height: 80.0,
            child: DrawerHeader(
              decoration: BoxDecoration(color: Colors.blue),
              child: Text('Opcoes'),
            ),
          ),
          ListTile(
            title: Text('Cadastrar pessoa'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CadastrarPessoa(),
                ),
              );
            },
          ),
          ListTile(title: Text('Pesquisar Pessoa'))
        ],
      ),
    );
  }
}

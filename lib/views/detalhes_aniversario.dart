import 'package:flutter/material.dart';

class DetalhesAniversario extends StatelessWidget {
  static const nomeRota = "/detalhesaniversario";

  DetalhesAniversario({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Map pessoa = ModalRoute.of(context)!.settings.arguments as Map;

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(20),
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: [
              CircleAvatar(
                  child: Text(pessoa['nome']!.substring(0, 1),
                      style: Theme.of(context).textTheme.headline4,
                      textScaleFactor: 1.5),
                  radius: 50),
              SizedBox(height: 20),
              Text(
                pessoa['nome']!,
                style: Theme.of(context).textTheme.headline3,
              ),
              Text(
                pessoa['email']!,
              ),
              Text(pessoa['aniversario']!),
              Text(pessoa['categoria']!)
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/categorias.dart';

class CadastrarPessoa extends StatefulWidget {
  static const nomeRota = "/cadastrarpessoa";

  const CadastrarPessoa({Key? key}) : super(key: key);

  @override
  _CadastrarPessoaState createState() => _CadastrarPessoaState();
}

class _CadastrarPessoaState extends State<CadastrarPessoa> {
  final _formKey = GlobalKey<FormState>();

  String? nome, email, aniversario;

  final controllerNome = TextEditingController();
  final controllerEmail = TextEditingController();
  final controllerAniversario = TextEditingController();

  @override
  void dispose() {
    controllerNome.dispose();
    controllerEmail.dispose();
    controllerAniversario.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    controllerNome.addListener(() {
      nome = controllerNome.text;
    });
    controllerEmail.addListener(() {
      email = controllerEmail.text;
    });
    controllerAniversario.addListener(() {
      aniversario = controllerAniversario.text;
    });
  }

  String categoria = Categorias.amigo.name;

  bool validate = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Formulario com validação'),
        ),
        body: SingleChildScrollView(
          child: Container(
              margin: const EdgeInsets.all(15.0),
              child: Form(key: _formKey, child: _formUI())),
        ));
  }

  Widget _formUI() {
    List<DropdownMenuItem<String>> menuItems = [
      DropdownMenuItem(child: Text('amigo'), value: Categorias.amigo.name),
      DropdownMenuItem(child: Text('familia'), value: Categorias.familia.name),
      DropdownMenuItem(child: Text('colega'), value: Categorias.colega.name),
      DropdownMenuItem(child: Text('vizinho'), value: Categorias.vizinho.name),
      DropdownMenuItem(child: Text('cliente'), value: Categorias.cliente.name),
    ];

    return Column(children: <Widget>[
      TextFormField(
        controller: controllerNome,
        decoration: InputDecoration(hintText: 'Nome completo'),
        maxLength: 40,
        validator: _validarNome,
      ),
      TextFormField(
        controller: controllerEmail,
        decoration: InputDecoration(hintText: 'Email'),
        keyboardType: TextInputType.emailAddress,
        maxLength: 40,
        validator: _validarEmail,
      ),
      TextFormField(
          controller: controllerAniversario,
          decoration: InputDecoration(hintText: 'Aniversario'),
          keyboardType: TextInputType.datetime,
          maxLength: 10,
          validator: _validarData),
      DropdownButtonFormField(
        value: categoria,
        onChanged: (String? newValue) {
          setState(() {
            categoria = newValue!;
          });
        },
        items: menuItems,
      ),
      SizedBox(height: 15.0),
      ElevatedButton(
        onPressed: _sendForm,
        child: new Text(' Enviar'),
      )
    ]);
  }

  String? _validarNome(String? value) {
    String patttern = r'(^[a-zA-Z ]*$)';
    RegExp regExp = RegExp(patttern);
    if (value!.isEmpty) {
      return "Informe o nome";
    } else if (!regExp.hasMatch(value)) {
      return "O nome deve conter caracteres de a-z ou A-Z";
    }
    return null;
  }

  String? _validarEmail(String? value) {
    String pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regExp = RegExp(pattern);
    if (value!.isEmpty) {
      return "Informe o Email";
    } else if (!regExp.hasMatch(value)) {
      return "Email inválido";
    } else {
      return null;
    }
  }

  String? _validarData(String? value) {
    if (value!.isEmpty) {
      return "Informe a data";
    } else {
      try {
        DateTime dateTime1 = DateFormat('dd/MM/yyyy').parseStrict(value);
      } catch (e) {
        return ("Data Incorreta ! Verifique os valores e o uso da / como separador");
      }
    }
  }

  _sendForm() {
    if (_formKey.currentState!.validate()) {
      // Sem erros na validação
      _formKey.currentState!.save();
      print("Nome $nome");
      print("Email $email");
      print("Aniversario $aniversario");
      Navigator.pushReplacementNamed(context, "/detalhesaniversario",
          arguments: {
            "nome": nome,
            "email": email,
            "aniversario": aniversario,
            "categoria": categoria,
          });
    } else {
      // erro de validação
      setState(() {
        validate = true;
      });
    }
  }
}

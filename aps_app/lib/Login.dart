import 'package:aps_app/Cadastro.dart';
import 'package:aps_app/Home.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'model/Usuario.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {

  TextEditingController _controllerEmail = TextEditingController();
  TextEditingController _controllerSenha = TextEditingController();
  String _messageError = "";

  _validarCampos() {
    String email = _controllerEmail.text;
    String senha = _controllerSenha.text;

      if (email.isNotEmpty) {
        if (senha.isNotEmpty) {
          setState(() {
            _messageError = "";
          });
          Usuario usuario = Usuario();
          usuario.email = email;
          usuario.senha = senha;
          _logarUsuario(usuario);
        } else {
          setState(() {
            _messageError = "Senha muito curta";
          });
        }
      } else {
        setState(() {
          _messageError = "Preencha com um e-mail valido";
        });
      }
    }

  _logarUsuario( Usuario usuario ){
      FirebaseAuth auth = FirebaseAuth.instance;
      auth.signInWithEmailAndPassword(email: usuario.email, password: usuario.senha)
      .then((firebaseUser) {
        Navigator.push(context, MaterialPageRoute(
          builder: (context) => Home()
        ));
      }).catchError((onError){
        setState(() {
          _messageError = "Erro ao autenticar usuário";
        });
      });
  }

  Future _verificarUsuarioLogado() async {
    FirebaseAuth auth = FirebaseAuth.instance;
    //auth.signOut()
    User usuarioLogado = await auth.currentUser;
    if( usuarioLogado != null ) {
      Navigator.push(context, MaterialPageRoute(
          builder: (context) => Home()
      ));
    }
  }

  @override
  void initState() {
    super.initState();
    _verificarUsuarioLogado();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(color: Color(0xff075e54)),
        padding: EdgeInsets.all(16),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(bottom: 32),
                  child: Image.asset(
                    "imagens/logo.png",
                    width: 200,
                    height: 150,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 8),
                  child: TextField(
                    controller: _controllerEmail,
                    autofocus: true,
                    keyboardType: TextInputType.emailAddress,
                    style: TextStyle(fontSize: 20),
                    decoration: InputDecoration(
                        contentPadding: EdgeInsets.fromLTRB(32, 16, 32, 16),
                        hintText: "E-mail",
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(32),
                        )),
                  ),
                ),
                TextField(
                  controller: _controllerSenha,
                  obscureText: true,
                  keyboardType: TextInputType.text,
                  style: TextStyle(fontSize: 20),
                  decoration: InputDecoration(
                      contentPadding: EdgeInsets.fromLTRB(32, 16, 32, 16),
                      hintText: "Senha",
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(32),
                      )),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 16, bottom: 10),
                  child: RaisedButton(
                    child: Text(
                      "Entrar",
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                    color: Colors.green,
                    padding: EdgeInsets.fromLTRB(32, 16, 32, 16),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(32)),
                    onPressed: () {
                      _validarCampos();
                    },
                  ),
                ),
                Center(
                  child: GestureDetector(
                    child: Text(
                      "Não tem conta? cadastre-se",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Cadastro()),
                      );
                    },
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 16),
                  child: Center(
                    child: Text(
                      _messageError,
                      style: TextStyle(
                        color: Colors.red,
                        fontSize: 20,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

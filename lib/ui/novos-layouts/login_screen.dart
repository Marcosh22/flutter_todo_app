import 'package:flutter/material.dart';
import 'package:helloword/ui/novos-layouts/home_screen.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return LoginScreenState();
  }
}

class LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold (
      backgroundColor: Color(0xff101639),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(
            left: 28, 
            top: 110, 
            right: 28, 
            bottom: 60
          ) ,
          child: Column(
            children: <Widget>[
              Image(
                image: AssetImage('assets/img/logo.png'),
                fit: BoxFit.fitHeight,
                width: 90,
              ),
              TextField(
                style: TextStyle(color: Colors.white),
                decoration: buildInputDecoration(labelText: 'Usuário', hintText: 'Digite o nome do usuário', icon: Icon(Icons.person_outline, color: Colors.white)),
              ),
              TextField(
                style: TextStyle(color: Colors.white),
                decoration: buildInputDecoration(labelText: 'Senha', hintText: 'Digite a senha do usuário',  icon: Icon(Icons.lock_outline, color: Colors.white)),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => HomeScreen()));
                },
                child: Container(
                  margin: EdgeInsets.only(top: 40),
                  width: double.infinity,
                  height: 50,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(
                      Radius.circular(26),
                    ),
                  ),
                  child: Center(
                    child: Text(
                      'Login', 
                      style: TextStyle(
                        fontSize: 18,
                      )
                    )
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  InputDecoration buildInputDecoration({String labelText, String hintText, Icon icon}) {
    return InputDecoration (
      labelText: labelText,
      prefixIcon: icon,
      labelStyle: TextStyle(color: Colors.white),
      hintText: hintText,
      hintStyle: TextStyle(color: Colors.white),
      enabledBorder: UnderlineInputBorder(
        borderSide: BorderSide(
          color: Colors.white
        ),
      ),
      focusedBorder: UnderlineInputBorder(
        borderSide: BorderSide(
          color: Colors.white
        ),
      ),
      border: UnderlineInputBorder(
        borderSide: BorderSide(
          color: Colors.white
        ),
      ),
    );
  }
}
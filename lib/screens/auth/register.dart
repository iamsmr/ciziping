import 'package:ciziping/services/auth_services/auth_service.dart';
import 'package:ciziping/services/validator/auth_validator.dart';
import 'package:ciziping/widgets/navigation_bar/navigation_bar_logo.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Register extends StatelessWidget {
  final Function toggleScreen;
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();
  final TextEditingController fullName = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  Register({Key key, this.toggleScreen}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final authService = Provider.of<AuthService>(context);

    return Scaffold(
      body: Center(
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Logo(),
              SizedBox(height: 50),
              Container(
                width: 500,
                child: Column(
                  children: [
                    TextFormField(
                      controller: fullName,
                      validator: (val) => Validator.nameValidator(val),
                      style: TextStyle(
                        fontSize: 20,
                        height: 1.7,
                      ),
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 20,
                        ),
                        filled: true,
                        // fillColor: Colors.grey[200],
                        hintText: "Name",
                        enabledBorder: InputBorder.none,
                      ),
                    ),
                    SizedBox(height: 30),
                    TextFormField(
                      controller: email,
                      validator: (val) => Validator.emailValidator(val),
                      style: TextStyle(
                        fontSize: 20,
                        height: 1.7,
                      ),
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 20,
                        ),
                        filled: true,
                        // fillColor: Colors.grey[200],
                        hintText: "Email",
                        enabledBorder: InputBorder.none,
                      ),
                    ),
                    SizedBox(height: 30),
                    TextFormField(
                      obscureText: true,
                      controller: password,
                      validator: (val) => Validator.passwordValidator(val),
                      style: TextStyle(
                        fontSize: 20,
                        height: 1.7,
                      ),
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 20,
                        ),
                        filled: true,
                        // fillColor: Colors.grey[200],
                        hintText: "Password",
                        enabledBorder: InputBorder.none,
                      ),
                    ),
                    SizedBox(height: 30),
                    SizedBox(
                      height: 60,
                      width: double.infinity,
                      child: FlatButton(
                        onPressed: () async {
                          if (_formKey.currentState.validate()) {
                            await authService.register(fullName.text.trim(),
                                email.text.trim(), password.text.trim());
                          }
                          if (authService.user != null &&
                              authService.user.user.token != null) {
                            Navigator.pop(context);
                          }
                        },
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        color: Theme.of(context).primaryColor,
                        child: Text(
                          "Create Acount",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 22,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Alreade have an acount?"),
                        TextButton(
                          onPressed: () {
                            toggleScreen();
                          },
                          child: Text("login"),
                        )
                      ],
                    ),
                    SizedBox(height: 30),
                    authService.error != null
                        ? Container(
                            padding: EdgeInsets.all(10),
                            color: Colors.amberAccent,
                            child: ListTile(
                              leading: Icon(Icons.error, size: 40),
                              title:
                                  Text(authService.error.error.message ?? ""),
                              trailing: IconButton(
                                icon: Icon(Icons.close),
                                onPressed: () {
                                  authService.clearError();
                                },
                              ),
                            ),
                          )
                        : Container()
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

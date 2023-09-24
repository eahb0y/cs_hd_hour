import 'package:flutter/cupertino.dart';

mixin AuthMixin{
  late TextEditingController name;
  late TextEditingController email;
  late TextEditingController password;

  void initController(){
    name = TextEditingController();
    email = TextEditingController();
    password = TextEditingController();
  }

  void disposeController(){
    name.dispose();
    email.dispose();
    password.dispose();
  }
}
import 'package:flutter/cupertino.dart';

mixin LoginMixin {
  late TextEditingController email;
  late TextEditingController password;

  void initController() {
    email = TextEditingController();
    password = TextEditingController();
  }

  void disposeController() {
    email.dispose();
    password.dispose();
  }
}

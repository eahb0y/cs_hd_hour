import 'package:cs_hd_hour/core/widgets/custom_text_field/custom_text_field.dart';
import 'package:cs_hd_hour/feature/login/presentation/bloc/login_bloc.dart';
import 'package:cs_hd_hour/feature/login/presentation/mixin/login_mixin.dart';
import 'package:cs_hd_hour/router/routes_name.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> with LoginMixin {
  @override
  void initState() {
    initController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginState>(
      builder: (context, state) {
        return Scaffold(
          resizeToAvoidBottomInset: false,
          body: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 15,
            ),
            child: Column(
              children: [
                Expanded(
                  child: Column(
                    children: [
                      const SafeArea(
                          child: SizedBox(
                        height: 70,
                      )),
                      Stack(children: [
                        Align(
                          alignment: Alignment.topCenter,
                          child: Ink(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 70,
                            ),
                            child: Image.asset(
                              'assets/images/c_space.png',
                            ),
                          ),
                        ),
                      ]),
                      const SizedBox(
                        height: 40,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      CustomTextField(
                        controller: email,
                        hintText: "Email",
                        onTextChange: (value) {
                          context.read<LoginBloc>().add(EnviableSubmitButton(
                                password: password.text,
                                email: value,
                              ));
                        },
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      CustomTextField(
                        onTextChange: (value) {
                          context.read<LoginBloc>().add(EnviableSubmitButton(
                                password: value,
                                email: email.text,
                              ));
                        },
                        controller: password,
                        hintText: "Password",
                        isVisible: state.isVisible,
                        suffix: GestureDetector(
                          onTap: () {},
                          child: state.isVisible
                              ? const Icon(Icons.remove_red_eye)
                              : const Icon(Icons.remove_red_eye_outlined),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      state.isSuccess
                          ? const SizedBox()
                          : Text(
                        state.errorStatus ?? '',
                        style: const TextStyle(
                          fontSize: 16,
                          color: Colors.red,
                          fontWeight: FontWeight.w600,
                        ),
                        textAlign: TextAlign.center,
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
          bottomNavigationBar: Padding(
            padding: const EdgeInsets.all(15),
            child: SafeArea(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.purple,
                      minimumSize: const Size(double.infinity, 50),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),
                    onPressed: state.enviable
                        ? () {
                            context.read<LoginBloc>().add(
                                  OnSubmitButtonEvent(
                                    email: email.text,
                                    password: password.text,
                                  ),
                                );
                          }
                        : null,
                    child: state.isLoading ? CircularProgressIndicator(backgroundColor: Colors.purple.shade300, color: Colors.purple.shade100,) :  const Text("Войти"),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.purple,
                      minimumSize: const Size(double.infinity, 50),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),
                    onPressed: () {
                      Navigator.pushNamed(context, RoutesName.auth);
                    },
                    child: const Text("Регистрироваться"),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

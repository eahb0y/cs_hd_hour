import 'package:cs_hd_hour/core/widgets/custom_text_field/custom_text_field.dart';
import 'package:cs_hd_hour/feature/auth/presentation/bloc/auth_bloc.dart';
import 'package:cs_hd_hour/feature/auth/presentation/mixin/auth_mixin.dart';
import 'package:cs_hd_hour/router/routes_name.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegistrationPage extends StatefulWidget {
  const RegistrationPage({super.key});

  @override
  State<RegistrationPage> createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> with AuthMixin {
  @override
  void initState() {
    initController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state.isSuccess) {
          Navigator.pushNamedAndRemoveUntil(
            context,
            RoutesName.main,
            (route) => false,
          );
        }
      },
      child: BlocBuilder<AuthBloc, AuthState>(
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
              iconTheme: const IconThemeData(
                color: Colors.black, //change your color here
              ),
            ),
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
                        CustomTextField(
                          controller: name,
                          hintText: "Name",
                          onTextChange: (value) {
                            context.read<AuthBloc>().add(
                                  EnviableSubmitButton(
                                    email: email.text,
                                    name: value,
                                    password: password.text,
                                  ),
                                );
                          },
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        CustomTextField(
                          controller: email,
                          hintText: "Email",
                          onTextChange: (value) {
                            context.read<AuthBloc>().add(
                                  EnviableSubmitButton(
                                    email: value,
                                    name: name.text,
                                    password: password.text,
                                  ),
                                );
                          },
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        CustomTextField(
                          controller: password,
                          hintText: "Password",
                          isVisible: state.isVisible,
                          suffix: GestureDetector(
                            onTap: () {
                              context.read<AuthBloc>().add(
                                  PasswordVisible(isVisible: state.isVisible));
                            },
                            child: state.isVisible
                                ? const Icon(Icons.remove_red_eye)
                                : const Icon(Icons.remove_red_eye_outlined),
                          ),
                          onTextChange: (value) {
                            context.read<AuthBloc>().add(EnviableSubmitButton(
                                email: email.text,
                                name: name.text,
                                password: value));
                          },
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
              padding: const EdgeInsets.all(15.0),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.purple,
                  minimumSize: const Size(double.infinity, 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
                onPressed: state.enviable
                    ? () {
                        context.read<AuthBloc>().add(
                              OnSubmitButtonEvent(
                                password: password.text,
                                email: email.text,
                                name: name.text,
                              ),
                            );
                      }
                    : null,
                child: state.isLoading
                    ? CircularProgressIndicator(
                        backgroundColor: Colors.purple.shade300,
                        color: Colors.purple.shade100,
                      )
                    : const Text("Войти"),
              ),
            ),
          );
        },
      ),
    );
  }
}

// isk123@gmail.com

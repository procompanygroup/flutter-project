import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:task1/Screen/tab_screen.dart';
import 'package:task1/widget/TextFormField.dart';

import '../Bloc/Bloc_Login/login_cubit.dart';
import '../l10n/app_localizations.dart';

class LogIn extends StatelessWidget {
  bool _isLoading = false;
  late String username, _password;
  bool isLogin = false;
  final _formKey = GlobalKey<FormState>();

  LogIn({super.key});

  @override
  Widget build(BuildContext context) {
    void submit() {
      final isValidate = _formKey.currentState!.validate();
      FocusScope.of(context).unfocus();
      if (isValidate) {
        _formKey.currentState?.save();
        BlocProvider.of<LoginCubit>(context)
            .login(username: username, password: _password);
      }
    }

    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: size.height * 0.5,
            decoration: BoxDecoration(
                color: Colors.deepPurple.shade300,
                borderRadius: const BorderRadius.only(
                    bottomRight: Radius.circular(40),
                    bottomLeft: Radius.circular(40))),
            child: Center(
              child: SvgPicture.asset(
                "images/realestate-logo.svg",
                colorFilter: const ColorFilter.mode(
                  Colors.white,
                  BlendMode.srcIn,
                ),
                width: size.width * 0.5,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: size.height * 0.4),
            child: SingleChildScrollView(
              child: Center(
                child: SizedBox(
                  width: size.width * 0.85,
                  height: size.height * 0.5,
                  child: Card(
                    elevation: 3,
                    //color: Colors.pink,
                    child: Form(
                      key: _formKey,
                      child: Container(
                        padding: const EdgeInsets.all(20),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text(
                              AppLocalizations.of(context)!.login,
                              style: const TextStyle(
                                  fontSize: 25,
                                  color: Colors.deepPurple,
                                  fontWeight: FontWeight.bold),
                            ),
                            TFormFiled(
                                keyv: "username",
                                labelName: "username",
                                fOnSaved: (newValue) {
                                  username = newValue!;
                                },
                                fValidator: (value) {
                                  if (value!.isEmpty || value.length < 4) {
                                    return "You Must Enter More Than 4 Character";
                                  } else {
                                    return null;
                                  }
                                }),
                            TFormFiled(
                                keyv: "Password",
                                labelName: "Password",
                                fOnSaved: (newValue) {
                                  _password = newValue!;
                                },
                                fValidator: (value) {
                                  if (value!.isEmpty) {
                                    return "Please Enter your password";
                                  } else {
                                    return null;
                                  }
                                }),
                            BlocListener<LoginCubit, LoginState>(
                              listener: (context, state) {
                                if (state is LoginLoading) {
                                  _isLoading = true;
                                } else if (state is LoginSuccess) {
                                  Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => const TabScreen(),
                                      ));
                                  // _isLoading = false;
                                } else if (state is LoginFailure) {
                                  showDialog(
                                    context: context,
                                    builder: (context) => AlertDialog(
                                      title: const Text('Error'),
                                      content: const Text(
                                          'Invalid email or password'),
                                      actions: [
                                        TextButton(
                                          onPressed: () =>
                                              Navigator.pop(context),
                                          child: const Text('OK'),
                                        ),
                                      ],
                                    ),
                                  );
                                  //_isLoading = false;
                                }
                              },
                              child: SizedBox(
                                width: size.width * 0.65,
                                height: size.height * 0.07,
                                child: ElevatedButton(
                                    onPressed: () {
                                      submit();
                                    },
                                    style: ButtonStyle(
                                      backgroundColor:
                                          MaterialStateProperty.all(
                                              Colors.deepPurple.shade300),
                                    ),
                                    child: _isLoading == true
                                        ? const CircularProgressIndicator()
                                        : Text(
                                            AppLocalizations.of(context)!.login,
                                            style: const TextStyle(
                                                color: Colors.white,
                                                fontSize: 20),
                                          )),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

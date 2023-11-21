import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconly/iconly.dart';
import 'package:recything_mobile/bloc/login/login_cubit.dart';
import 'package:recything_mobile/bloc/login/login_state.dart';
import 'package:recything_mobile/widgets/forms/google_button.dart';
import 'package:recything_mobile/widgets/forms/main_button.dart';
import 'package:recything_mobile/widgets/forms/main_textfield.dart';
import 'package:recything_mobile/widgets/typography/body_link.dart';

import '../../constants/pallete.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool showPwd = false;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SingleChildScrollView(
        child: SizedBox(
          height: height,
          child: Container(
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 80,
                  ),
                  Text(
                    "Masuk",
                    style: ThemeFont.heading3Reguler,
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  SizedBox(
                    width: 242,
                    child: Text(
                      "Masuk akun Anda sekarang dan mulailah menjelajah",
                      style: ThemeFont.bodyNormal
                          .copyWith(color: Pallete.textSecondary),
                    ),
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  MainTextField(
                    controller: emailController,
                    label: "Masukan Email / No HP",
                    prefixIcon: IconlyLight.message,
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  MainTextField(
                    controller: passwordController,
                    label: "Masukan Kata Sandi",
                    prefixIcon: IconlyLight.lock,
                    obscureText: !showPwd,
                    suffixIcon: GestureDetector(
                      onTap: () {
                        setState(() {
                          showPwd = !showPwd;
                        });
                      },
                      child: Icon(
                        !showPwd ? IconlyLight.show : IconlyLight.hide,
                        color: Pallete.dark3,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        "Lupa Password? ",
                        style: ThemeFont.bodySmall
                            .copyWith(color: Pallete.textSecondary),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).pushNamed("/reset_password");
                        },
                        child: Text(
                          "Atur Ulang",
                          style: ThemeFont.bodySmall.copyWith(
                            color: Pallete.main,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: BlocListener<LoginCubit, LoginState>(
                          listener: (context, state) {
                            if (state is LoginFailed) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  backgroundColor: Colors.red,
                                  content: Text(
                                    state.message,
                                    style: const TextStyle(color: Colors.white),
                                  ),
                                ),
                              );
                            }
                            if (state is LoginSuccess) {
                              Navigator.of(context).pushNamedAndRemoveUntil(
                                  "/dashboard", (route) => false);
                            }
                          },
                          child: MainButton(
                            child: BlocBuilder<LoginCubit, LoginState>(
                                builder: (context, state) {
                              if (state is LoginLoading) {
                                return const SizedBox(
                                  height: 23,
                                  width: 23,
                                  child: CircularProgressIndicator(
                                    color: Colors.white,
                                  ),
                                );
                              } else {
                                return Text(
                                  "Login",
                                  style: ThemeFont.heading6Reguler.copyWith(
                                      color: Pallete.textMainButton,
                                      fontWeight: FontWeight.w700),
                                );
                              }
                            }),
                            onPressed: () {
                              context.read<LoginCubit>().login(
                                    email: emailController.text,
                                    password: passwordController.text,
                                  );
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Row(
                    children: [
                      Expanded(
                          child: GoogleButton(
                        text: "Masuk Dengan Google",
                        onPressed: () {},
                      )),
                    ],
                  ),
                  const Expanded(child: SizedBox()),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Tidak Punya Akun? ",
                        style: ThemeFont.bodyNormal
                            .copyWith(color: Pallete.textSecondary),
                      ),
                      GestureDetector(
                        onTap: () => Navigator.pushNamedAndRemoveUntil(
                          context,
                          "/register",
                          (route) => false,
                        ),
                        child: const BodyLink("Register"),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:laura/screens/auth/login_screen.dart';
import 'package:laura/screens/auth/signup_screen.dart';
import 'package:laura/screens/student/dashboardNavigationBar.dart';
import 'package:laura/utils/extension.dart';
import 'package:laura/utils/theme.dart';
import 'package:laura/widgets/base_scaffold.dart';
import 'package:laura/widgets/primary_btn.dart';
import 'package:laura/widgets/text_field.dart';

class StudentLoginScreen extends StatefulWidget {
  const StudentLoginScreen({super.key});

  @override
  State<StudentLoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<StudentLoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  bool _passwordVisible = false;
  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      safeTop: false,
      builder: (x) => SingleChildScrollView(
        child: Column(children: [
          Container(
            height: MediaQuery.sizeOf(context).height * .4,
            width: double.infinity,
            padding: const EdgeInsets.only(left: 22),
            decoration: BoxDecoration(
                color: AppColors.primaryColor,
                borderRadius: const BorderRadius.only(
                  bottomRight: Radius.circular(200),
                )),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/logo.png',
                  // width: 100,
                  height: 35,
                ),
                const Gap(18),
                Text(
                  "Welcome\nBack",
                  style: AppStyles.general(28, FontWeight.w400,
                      color: Colors.white),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 22),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Gap(16),
                  Text(
                    "Sign In",
                    style: AppStyles.general(28, FontWeight.bold),
                  ),
                  const Gap(25),
                  AppTextField(
                    hintText: "Email",
                    labelText: "Email",
                    controller: emailController,
                    keyboardType: TextInputType.emailAddress,
                    // validator: (x) => Validators.validateEmail(x),
                  ),
                  AppTextField(
                    obscureText: _passwordVisible,
                    hintText: "Password",
                    labelText: "Password",
                    controller: passwordController,
                    // validator: Validators.validatePassword(),
                    suffixIcon: IconButton(
                      icon: Icon(
                        _passwordVisible
                            ? Icons.visibility
                            : Icons.visibility_off,
                      ),
                      onPressed: () {
                        setState(() {
                          _passwordVisible = !_passwordVisible;
                        });
                      },
                    ),
                  ),

                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      onPressed: () {
                        // Handle forgot password action
                      },
                      child: const Text('Forgot Password?'),
                    ),
                  ),
                  // Spacer(),
                  // Gap(x.height * .1),
                  const Gap(16),
                  PrimaryButton(
                    onPressed: () {
                      if (!_formKey.currentState!.validate()) return;
                      context.push(DashboardNavigationBar());
                    },
                    label: "Sign in",
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: TextButton(
                      onPressed: () {
                        context.push(const LoginScreen());
                      },
                      child: const Text('Go to guardian login→'),
                    ),
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: InkWell(
                      onTap: () {
                        context.push(const SignupScreen());
                      },
                      child: const Text('Don\'t have an account? Create one'),
                    ),
                  ),
                  Gap(20),
                ],
              ),
            ),
          ),
        ]),
      ),
    );
  }
}

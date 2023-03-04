import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movies_test/business_logic/login_bloc/bloc.dart';
import 'package:movies_test/presentation/rotutes/router.dart';
import 'package:movies_test/presentation/screen/signup_screen/signup_screen.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../../utils/my_const/color.dart';
import '../../../utils/my_const/rounded_button.dart';
import '../../../utils/validators.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorHelper.splashColor,
      // appBar: AppBar(title: const Text('Register')),
      body: Center(
        child: BlocProvider<LoginBloc>(
          create: (context) => LoginBloc(userRepository: null),
          child: const LoginScreen(),
        ),
      ),
    );
  }
}

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  late LoginBloc _loginBloc;

  @override
  void initState() {
    super.initState();
    _loginBloc = BlocProvider.of<LoginBloc>(context);

    _emailController.addListener(_onEmailChanged);
    _passwordController.addListener(_onPasswordChanged);
  }

  void _onEmailChanged() {
    _loginBloc.add(LoginEmailChanged(email: _emailController.text));
  }

  void _onPasswordChanged() {
    _loginBloc.add(LoginPasswordChanged(
      password: _passwordController.text,
    ));
  }

  void _onFormSubmitted() {
    _loginBloc.add(
      LoginSubmitEmailPasswordEvent(
        email: _emailController.text,
        password: _passwordController.text,
      ),
    );

    LoginSubmitEmailPasswordEvent(
      email: _emailController.text,
      password: _passwordController.text,
    ).toString();
  }

  bool isLoginButtonEnabled(LoginState state) {
    return state.isFormValid && isPopulated && !state.isSubmitting;
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();

    super.dispose();
  }

  bool get isPopulated =>
      _emailController.text.isNotEmpty && _passwordController.text.isNotEmpty;

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginBloc, LoginState>(
      listener: (context, state) {
        if (state.isSubmitting) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text('Submitting ... '),
                CircularProgressIndicator(),
              ],
            ),
            duration: const Duration(seconds: 1),
            action: SnackBarAction(
              label: 'ACTION',
              onPressed: () {
                ScaffoldMessenger.of(context).hideCurrentSnackBar;
              },
            ),
          ));
        }

        if (state.isSuccess) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Expanded(
                    child: Text('Login  Succesfully'),
                  ),
                  CircularProgressIndicator(),
                ],
              ),
              duration: const Duration(seconds: 1),
              action: SnackBarAction(
                label: '',
                onPressed: () {
                  ScaffoldMessenger.of(context).hideCurrentSnackBar;
                },
              ),
            ),
          );
          if (isRegisterButtonEnabled()) {
            _loginBloc.add(LoginSubmitEmailPasswordEvent(
                email: _emailController.text,
                password: _passwordController.text));
          }
          openLogin(context);
        }

        if (state.isFailure) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Expanded(
                  child: Text('Failure ... Please Fill all Field correctly '),
                ),
                CircularProgressIndicator(),
              ],
            ),
            duration: const Duration(seconds: 1),
            action: SnackBarAction(
              label: 'ACTION',
              onPressed: () {
                ScaffoldMessenger.of(context).hideCurrentSnackBar;
              },
            ),
          ));
        }
      },
      child: BlocBuilder<LoginBloc, LoginState>(
        builder: (context, state) {
          return Scaffold(
            backgroundColor: ColorHelper.splashColor,
            appBar: AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
              automaticallyImplyLeading: false,
              actions: [
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 20.0),
                      child: Container(
                        width: 50,
                        height: 20,
                        decoration: BoxDecoration(
                          color: ColorHelper.blue,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Center(
                          child: Text(
                            "Skip",
                            style: GoogleFonts.ptMono(
                              color: ColorHelper.black,
                              fontSize: 12,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            body: Form(
              key: _formKey,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Center(
                      child: Text(
                        "Login",
                        style: GoogleFonts.ptMono(
                          color: ColorHelper.white,
                          fontSize: 28,
                        ),
                      ),
                    ),
                    20.heightBox,
                    Text(
                      "Welcome back buddy, login to get started",
                      style: GoogleFonts.ptMono(
                        color: ColorHelper.white,
                        fontSize: 12,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    5.heightBox,
                    Text(
                      "with our awesome features",
                      style: GoogleFonts.ptMono(
                        color: ColorHelper.white,
                        fontSize: 12,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    20.heightBox,
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 20,
                        right: 20,
                        top: 15,
                      ),
                      child: Container(
                        decoration: BoxDecoration(
                          color: const Color(0xFF3D3D3D),
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(
                            left: 15,
                            right: 15,
                          ),
                          child: TextFormField(
                            style: const TextStyle(
                                fontSize: 14, color: Colors.white),
                            onChanged: (value) {
                              _loginBloc.add(LoginEmailChanged(email: value));
                            },
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            validator: (value) {
                              if (value!.isEmpty ||
                                  !Validators.isValidEmail(
                                      _emailController.text)) {
                                return 'Enter correct Email';
                              } else {
                                return null;
                              }
                            },
                            controller: _emailController,
                            decoration: const InputDecoration(
                              contentPadding:
                                  EdgeInsets.fromLTRB(10.0, 5.0, 10.0, 5.0),
                              border: InputBorder.none,
                              labelText: "Email Address",
                              suffixIcon: Icon(Icons.email),
                              labelStyle: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 20,
                        right: 20,
                        top: 15,
                      ),
                      child: Container(
                        decoration: BoxDecoration(
                          color: const Color(0xFF3D3D3D),
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          child: TextFormField(
                            style: const TextStyle(
                                fontSize: 14, color: Colors.white),
                            onChanged: (value) {
                              _loginBloc
                                  .add(LoginPasswordChanged(password: value));
                            },
                            validator: (value) {
                              if (value!.isEmpty ||
                                  !Validators.isValidPassword(
                                      _passwordController.text)) {
                                return 'Enter correct Password';
                              } else {
                                return null;
                              }
                            },
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            controller: _passwordController,
                            decoration: const InputDecoration(
                              contentPadding:
                                  EdgeInsets.fromLTRB(10.0, 5.0, 10.0, 5.0),
                              border: InputBorder.none,
                              labelText: "Password",
                              suffixIcon: Icon(Icons.lock),
                              labelStyle: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    // buildTextfiled(
                    //   tx: emailController,
                    //   backgroundColor: const Color(0xFF3D3D3D),
                    //   label: 'email',
                    //   color: ColorHelper.white,
                    // ),
                    // buildTextfiled(
                    //   tx: passwordController,
                    //   backgroundColor: const Color(0xFF3D3D3D),
                    //   color: ColorHelper.white,
                    //   label: 'password',
                    //   pr: const Icon(Icons.remove_red_eye),
                    // ),
                    Row(
                      children: [
                        8.widthBox,
                        OutlinedButton(
                          onPressed: () {},
                          child: const Text(
                            "Forgot password ?",
                            style: TextStyle(
                              color: Color(0xFF60CFFF),
                            ),
                          ),
                        ),
                      ],
                    ),
                    50.heightBox,
                    RoundedButton(
                      onPress: () {
                        if (_formKey.currentState!.validate()) {
                          Navigator.pushNamed(context, AppRouter.HOME);
                        }
                      },
                      text: 'Get Started',
                      backgroundColor: ColorHelper.red,
                      foregroundColor: ColorHelper.white,
                    ),
                    16.heightBox,
                    OutlinedButton(
                      onPressed: () {
                        Navigator.of(context).pushReplacement(MaterialPageRoute(
                            builder: (_) => const RegisterScreen()));
                      },
                      child: const Text(
                        "Don’t have an account yet? SignUp",
                        style: TextStyle(
                          color: Color(0xFF60CFFF),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  bool isRegisterButtonEnabled() {
    return _loginBloc.state.isFormValid &&
        isPopulated &&
        !_loginBloc.state.isSubmitting;
  }

  void openLogin(BuildContext context) {
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushNamed(context, AppRouter.HOME);
    });
  }
}

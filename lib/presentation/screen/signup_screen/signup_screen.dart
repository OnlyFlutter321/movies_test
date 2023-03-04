import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movies_test/business_logic/register_bloc/register_bloc.dart';
import 'package:movies_test/business_logic/register_bloc/register_state.dart';
import 'package:movies_test/presentation/rotutes/router.dart';
import 'package:movies_test/presentation/screen/login/login_screen.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../../business_logic/register_bloc/register_event.dart';
import '../../../utils/my_const/color.dart';
import '../../../utils/validators.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorHelper.splashColor,
      // appBar: AppBar(title: const Text('Register')),
      body: Center(
        child: BlocProvider<RegisterBloc>(
          create: (context) => RegisterBloc(userRepository: null),
          child: const SignupScreen(),
        ),
      ),
    );
  }
}

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  bool get isPopulated =>
      _emailController.text.isNotEmpty &&
      _passwordController.text.isNotEmpty &&
      _confirmController.text.isNotEmpty &&
      _emailController.text.isNotEmpty;

  bool isRegisterButtonEnabled(RegisterState state) {
    return state.isFormValid && isPopulated && !state.isSubmitting;
  }

  late RegisterBloc _registerBloc;

  void _onEmailChanged() {
    _registerBloc.add(EmailChanged(email: _emailController.text));
  }

  void _onPasswordChanged() {
    _registerBloc.add(PasswordChanged(
      password: _passwordController.text,
      confirmPassword: _confirmController.text,
    ));
  }

  void _onConfirmPasswordChanged() {
    _registerBloc.add(ConfirmPasswordChanged(
      password: _passwordController.text,
      confirmPassword: _confirmController.text,
    ));
  }

  void _onNameChanged() {
    _registerBloc.add(NameChanged(name: _fullNameController.text));
  }

  void _onFormSubmitted() {
    _registerBloc.add(
      Submitted(
        email: _emailController.text,
        password: _passwordController.text,
        confirmPassword: _confirmController.text,
        displayName: _fullNameController.text,
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    _registerBloc = BlocProvider.of<RegisterBloc>(context);
    _emailController.addListener(_onEmailChanged);
    _passwordController.addListener(_onPasswordChanged);
    _confirmController.addListener(_onConfirmPasswordChanged);
    _fullNameController.addListener(_onNameChanged);
  }

  TextEditingController _fullNameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();

  TextEditingController _passwordController = TextEditingController();
  TextEditingController _confirmController = TextEditingController();
  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _confirmController.dispose();
    _fullNameController.dispose();
    super.dispose();
  }

  final _key = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    // blocbuilder blocLister bloconsumer

    return BlocListener<RegisterBloc, RegisterState>(
      listener: (context, state) {
        if (state.isSubmitting) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text('Registering ... '),
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
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Expanded(
                  child: Text('Account created Succesfully'),
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
          ));
          // Navigator.of(context).pop();

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
      child: BlocBuilder<RegisterBloc, RegisterState>(
        builder: (context, state) {
          return Form(
            key: _key,
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: ListView(
                children: [
                  Center(
                    child: Text(
                      "Signup",
                      style: GoogleFonts.ptMono(
                        color: ColorHelper.white,
                        fontSize: 28,
                      ),
                    ),
                  ),
                  5.heightBox,
                  Text(
                    "filter and show you available cinemas around you.",
                    style: GoogleFonts.ptMono(
                      color: ColorHelper.white,
                      fontSize: 12,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  20.heightBox,
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 10,
                      right: 10,
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
                          keyboardType: TextInputType.name,
                          autocorrect: false,
                          validator: (value) {
                            if (value!.isEmpty ||
                                !Validators.isValidName(
                                    _fullNameController.text)) {
                              return 'Enter correct FullName';
                            } else {
                              return null;
                            }
                          },
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          controller: _fullNameController,
                          decoration: const InputDecoration(
                            contentPadding:
                                EdgeInsets.fromLTRB(10.0, 5.0, 10.0, 5.0),
                            border: InputBorder.none,
                            labelText: 'Full Name',
                            suffixIcon: Icon(Icons.person),
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
                      left: 10,
                      right: 10,
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
                          keyboardType: TextInputType.emailAddress,
                          autocorrect: false,
                          validator: (value) {
                            if (value!.isEmpty ||
                                !Validators.isValidEmail(
                                    _emailController.text)) {
                              return 'Enter correct Email';
                            } else {
                              return null;
                            }
                          },
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          controller: _emailController,
                          decoration: const InputDecoration(
                            contentPadding:
                                EdgeInsets.fromLTRB(10.0, 5.0, 10.0, 5.0),
                            border: InputBorder.none,
                            labelText: 'Email Address',
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
                      left: 10,
                      right: 10,
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
                          obscureText: true,
                          autocorrect: false,
                          validator: (value) {
                            if (value!.isEmpty ||
                                !Validators.isValidPassword(
                                    _passwordController.text)) {
                              return 'Enter correct Password';
                            } else {
                              return null;
                            }
                          },
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          controller: _passwordController,
                          decoration: const InputDecoration(
                            contentPadding:
                                EdgeInsets.fromLTRB(10.0, 5.0, 10.0, 5.0),
                            border: InputBorder.none,
                            labelText: 'Password',
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
                      left: 10,
                      right: 10,
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
                          obscureText: true,
                          autocorrect: false,
                          validator: (value) {
                            if (value!.isEmpty ||
                                !Validators.isValidPassword(
                                    _confirmController.text)) {
                              return 'Enter correct ConfirmPassword';
                            } else {
                              return null;
                            }
                          },
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          controller: _confirmController,
                          decoration: const InputDecoration(
                            contentPadding:
                                EdgeInsets.fromLTRB(10.0, 5.0, 10.0, 5.0),
                            border: InputBorder.none,
                            labelText: 'Confirm Password',
                            suffixIcon: Icon(Icons.lock_outline),
                            labelStyle: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  50.heightBox,
                  Padding(
                    padding: const EdgeInsets.only(left: 20.0, right: 20),
                    child: SizedBox(
                      height: 50,
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          if (_key.currentState!.validate()) {
                            Navigator.pushNamed(context, AppRouter.HOME);
                          }
                          // _onFormSubmitted();
                        },
                        style: ElevatedButton.styleFrom(
                          shape: const StadiumBorder(),
                          backgroundColor: ColorHelper.red,
                          foregroundColor: ColorHelper.white,
                        ),
                        child: const Text('Next'),
                      ),
                    ),
                  ),
                  16.heightBox,
                  OutlinedButton(
                    onPressed: () {
                      // Navigator.of(context).pushReplacement(MaterialPageRoute(
                      //     builder: (_) => const LoginScreen()));
                    },
                    child: Text.rich(
                      TextSpan(
                        text: "Already have an account?  ",
                        style: const TextStyle(
                          color: Colors.white,
                        ),
                        children: [
                          TextSpan(
                            text: "Sign In",
                            style: const TextStyle(
                              color: Color(0xFF60CFFF),
                            ),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                // Navigator.of(context).pushReplacement(
                                //   MaterialPageRoute(
                                //     builder: (_) => const LoginScreen(),
                                //   ),
                                // );
                              },
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
// Widget build(BuildContext context) {
//   TextEditingController _fullNameController = TextEditingController();
//   TextEditingController _emailController = TextEditingController();

//   TextEditingController _passwordController = TextEditingController();
//   TextEditingController _confirmController = TextEditingController();

//   late RegisterBloc _registerBloc;

//   final formKey = GlobalKey<FormState>();
//   return Scaffold(
//     backgroundColor: ColorHelper.splashColor,
//     appBar: AppBar(
//       backgroundColor: Colors.transparent,
//       elevation: 0,
//       automaticallyImplyLeading: false,
//       actions: [
//         Row(
//           children: [
//             Padding(
//               padding: const EdgeInsets.only(right: 20.0),
//               child: Container(
//                 width: 50,
//                 height: 20,
//                 decoration: BoxDecoration(
//                   color: ColorHelper.blue,
//                   borderRadius: BorderRadius.circular(12),
//                 ),
//                 child: Center(
//                   child: Text(
//                     "Skip",
//                     style: GoogleFonts.ptMono(
//                       color: ColorHelper.black,
//                       fontSize: 12,
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ],
//     ),
//     body: Form(
//       child: SingleChildScrollView(
//         child: Column(
//           key: formKey,
//           children: [
//             Center(
//               child: Text(
//                 "Signup",
//                 style: GoogleFonts.ptMono(
//                   color: ColorHelper.white,
//                   fontSize: 28,
//                 ),
//               ),
//             ),
//             20.heightBox,
//             Text(
//               "we need to know your location so that we could",
//               style: GoogleFonts.ptMono(
//                 color: ColorHelper.white,
//                 fontSize: 12,
//               ),
//               textAlign: TextAlign.center,
//             ),
//             5.heightBox,
//             Text(
//               "filter and show you available cinemas around you.",
//               style: GoogleFonts.ptMono(
//                 color: ColorHelper.white,
//                 fontSize: 12,
//               ),
//               textAlign: TextAlign.center,
//             ),
//             20.heightBox,
//             buildTextfiled(
//               tx: _fullNameController,
//               backgroundColor: const Color(0xFF3D3D3D),
//               label: 'FullName',
//               color: ColorHelper.white,
//             ),
//             buildTextfiled(
//               tx: _emailController,
//               backgroundColor: const Color(0xFF3D3D3D),
//               color: ColorHelper.white,
//               label: 'Email address',
//             ),
//             buildTextfiled(
//               tx: _passwordController,
//               backgroundColor: const Color(0xFF3D3D3D),
//               color: ColorHelper.white,
//               label: 'Password',
//               pr: const Icon(
//                 Icons.remove_red_eye,
//                 color: ColorHelper.white,
//               ),
//             ),
//             buildTextfiled(
//               tx: _confirmController,
//               backgroundColor: const Color(0xFF3D3D3D),
//               color: ColorHelper.white,
//               label: 'Confirm Password',
//               pr: const Icon(
//                 Icons.remove_red_eye,
//                 color: ColorHelper.white,
//               ),
//             ),
//             50.heightBox,
//             RoundedButton(
//               onPress: () {
//                 Navigator.of(context).push(
//                     MaterialPageRoute(builder: (_) => const Location()));
//               },
//               text: 'Next',
//               backgroundColor: ColorHelper.red,
//               foregroundColor: ColorHelper.white,
//             ),
//             16.heightBox,
//             OutlinedButton(
//               onPressed: () {
//                 Navigator.of(context).pushReplacement(
//                     MaterialPageRoute(builder: (_) => const LoginScreen()));
//               },
//               child: Text.rich(
//                 TextSpan(
//                   text: "Already have an account?  ",
//                   style: const TextStyle(
//                     color: Colors.white,
//                   ),
//                   children: [
//                     TextSpan(
//                       text: "Sign In",
//                       style: const TextStyle(
//                         color: Color(0xFF60CFFF),
//                       ),
//                       recognizer: TapGestureRecognizer()
//                         ..onTap = () {
//                           Navigator.of(context).pushReplacement(
//                             MaterialPageRoute(
//                               builder: (_) => const LoginScreen(),
//                             ),
//                           );
//                         },
//                     ),
//                   ],
//                 ),
//               ),
//             ),

//             // Spacer(
//             //   flex: 1,
//             // ),

//             // Expanded(
//             //   child: Row(
//             //     children: [
//             //       Text(
//             //         "By signing up you agree to our",
//             //         style: GoogleFonts.ptMono(
//             //           color: ColorHelper.grey,
//             //           fontSize: 12,
//             //         ),
//             //       ),
//             //       TextButton(
//             //         style: TextButton.styleFrom(
//             //           minimumSize: const Size(60, 0),
//             //           padding: EdgeInsets.zero,
//             //           visualDensity: VisualDensity.compact,
//             //           tapTargetSize: MaterialTapTargetSize.shrinkWrap,
//             //           elevation: 0,
//             //         ),
//             //         child: Text(
//             //           "Terms and Condtions of using this app",
//             //           style: GoogleFonts.ptMono(
//             //             color: ColorHelper.blue,
//             //             fontSize: 9,
//             //           ),
//             //         ),
//             //         onPressed: () {},
//             //       ),
//             //     ],
//             //   ),
//             // ),
//           ],
//         ),
//       ),
//     ),
//     bottomNavigationBar: Padding(
//       padding: const EdgeInsets.all(20.0),
//       child: Container(
//         height: 45,
//         decoration: BoxDecoration(
//             color: Colors.transparent,
//             borderRadius: BorderRadius.circular(15)),
//         child: Column(
//           children: [
//             Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 InkWell(
//                   onTap: () async {},
//                   child: Text(
//                     "By signing up you agree to our ",
//                     style: GoogleFonts.ptMono(
//                       color: ColorHelper.white,
//                       fontSize: 10,
//                     ),
//                   ),
//                 ),
//                 InkWell(
//                   onTap: () {},
//                   child: Text(
//                     "Terms and Conditions",
//                     style: GoogleFonts.ptMono(
//                       color: ColorHelper.blue,
//                       fontSize: 10,
//                     ),
//                   ),
//                 ),
//                 const SizedBox(
//                   width: 20,
//                 ),
//               ],
//             ),
//             10.heightBox,
//             Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 InkWell(
//                   onTap: () async {},
//                   child: Text(
//                     "of using this app",
//                     style: GoogleFonts.ptMono(
//                       color: ColorHelper.white,
//                       fontSize: 10,
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ),
//     ),
//   );
// }
// }

import 'package:firebase_app/views/screens/register_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../core/services/firebase_service.dart';
import '../../logic/blocs/login/login_bloc.dart';
import '../../logic/blocs/login/login_event.dart';
import '../../logic/blocs/login/login_states.dart';
import 'home.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  final FirebaseService firebaseService = FirebaseService();

  final formKey = GlobalKey<FormState>();

  final emailController = TextEditingController();

  final passController = TextEditingController();

  bool isHidden = true;

  @override
  void dispose() {
    emailController.dispose();
    passController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 80, horizontal: 20),

          child: BlocConsumer<LoginBloc, LoginStates>(
            listener: (context, state) {
              if (state is LoginSuccess) {
                ScaffoldMessenger.of(
                  context,
                ).showSnackBar(const SnackBar(content: Text("Login Success")));

                print("Navigate Home");
                Navigator.pushReplacement(
                  context,

                  MaterialPageRoute(builder: (context) => const Home()),
                );
              }

              if (state is LoginError) {
                print(state.message);
                ScaffoldMessenger.of(
                  context,
                ).showSnackBar(SnackBar(content: Text(state.message)));
              }
            },

            builder: (context, state) {
              return Form(
                key: formKey,

                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,

                  children: [
                    const Text(
                      "Login",

                      style: TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 12),

                    const Text(
                      "Welcome back 👏",

                      style: TextStyle(fontSize: 18),
                    ),

                    const SizedBox(height: 70),

                    TextFormField(
                      controller: emailController,

                      keyboardType: TextInputType.emailAddress,

                      decoration: InputDecoration(
                        labelText: "Email",

                        hintText: "Enter Your Email",

                        prefixIcon: const Icon(Icons.email),

                        suffixIcon: const Icon(
                          Icons.check_circle,
                          color: Colors.green,
                        ),

                        filled: true,

                        fillColor: Colors.grey.shade200,

                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide.none,

                          borderRadius: BorderRadius.circular(20),
                        ),

                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),

                      validator: (val) {
                        if (val == null || val.isEmpty) {
                          return "Email Required";
                        }

                        if (!val.contains("@")) {
                          return "Invalid Email";
                        }

                        return null;
                      },
                    ),

                    const SizedBox(height: 30),

                    TextFormField(
                      controller: passController,

                      obscureText: isHidden,

                      decoration: InputDecoration(
                        labelText: "Password",

                        hintText: "Enter Your Password",

                        prefixIcon: const Icon(Icons.lock),

                        suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              isHidden = !isHidden;
                            });
                          },

                          icon: Icon(
                            isHidden ? Icons.visibility : Icons.visibility_off,
                          ),
                        ),

                        filled: true,

                        fillColor: Colors.blue.shade100,

                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide.none,

                          borderRadius: BorderRadius.circular(20),
                        ),

                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),

                      validator: (val) {
                        if (val == null || val.isEmpty) {
                          return "Password Required";
                        }

                        if (val.length < 8) {
                          return "Password Too Short";
                        }

                        return null;
                      },
                    ),

                    const Spacer(),

                    SizedBox(
                      width: double.infinity,

                      height: 55,

                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue,

                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),

                        onPressed:
                        state is LoginLoading
                            ? null
                            : () {
                          if (formKey.currentState!.validate()) {
                            context.read<LoginBloc>().add(
                              LoginButtonPressed(
                                email: emailController.text.trim(),

                                password: passController.text.trim(),
                              ),
                            );
                          }
                        },

                        child:
                        state is LoginLoading
                            ? const SizedBox(
                          width: 25,

                          height: 25,

                          child: CircularProgressIndicator(
                            color: Colors.white,
                          ),
                        )
                            : const Text(
                          "Login",

                          style: TextStyle(
                            color: Colors.white,

                            fontSize: 18,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 15),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Don't Have an account ?",
                          style: TextStyle(
                            fontWeight: FontWeight.normal,
                            fontSize: 16,
                          ),
                        ),
                        SizedBox(width: 10),
                        InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => const RegisterScreen(),
                              ),
                            );
                          },
                          child: Text(
                            "Sign Up",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                              color: Colors.blue,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Center(
                      child: ElevatedButton(
                        onPressed: () async {
                          final user = await firebaseService.signInWithGoogle();

                          if (user != null && context.mounted) {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(builder: (_) => Home()),
                            );
                          }
                        },
                        child: const Text("Continue with Google"),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}

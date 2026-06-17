import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../logic/blocs/register/register_bloc.dart';
import '../../logic/blocs/register/register_event.dart';
import '../../logic/blocs/register/register_states.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
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
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 80),

          child: BlocConsumer<RegisterBloc, RegisterStates>(
            listener: (context, state) {
              if (state is RegisterSuccess) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text("Account Created")),
                );

                Navigator.pop(context);
              }

              if (state is RegisterError) {
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
                      "Register",

                      style: TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 12),

                    const Text("Create account 👏"),

                    const SizedBox(height: 70),

                    TextFormField(
                      controller: emailController,

                      decoration: InputDecoration(
                        labelText: "Email",

                        prefixIcon: const Icon(Icons.email),

                        filled: true,

                        fillColor: Colors.grey.shade200,

                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),

                      validator: (val) {
                        if (val == null || val.isEmpty) {
                          return "Email Required";
                        }

                        return null;
                      },
                    ),

                    const SizedBox(height: 25),

                    TextFormField(
                      controller: passController,

                      obscureText: isHidden,

                      decoration: InputDecoration(
                        labelText: "Password",

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

                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),

                      validator: (val) {
                        if (val == null || val.isEmpty) {
                          return "Password Required";
                        }

                        if (val.length < 8) {
                          return "Minimum 8 Characters";
                        }

                        return null;
                      },
                    ),

                    const Spacer(),

                    SizedBox(
                      width: double.infinity,

                      height: 55,

                      child: ElevatedButton(
                        onPressed:
                        state is RegisterLoading
                            ? null
                            : () {
                          if (formKey.currentState!.validate()) {
                            context.read<RegisterBloc>().add(
                              RegisterButtonPressed(
                                email: emailController.text.trim(),

                                password: passController.text.trim(),
                              ),
                            );
                          }
                        },

                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue,

                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),

                        child:
                        state is RegisterLoading
                            ? const CircularProgressIndicator(
                          color: Colors.white,
                        )
                            : const Text(
                          "Register",

                          style: TextStyle(color: Colors.white),
                        ),
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

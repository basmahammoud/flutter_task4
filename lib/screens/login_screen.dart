import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_task4/bloc/login/login_bloc.dart';
import 'package:flutter_task4/bloc/login/login_event.dart';
import 'package:flutter_task4/bloc/login/login_state.dart';
import 'package:flutter_task4/bloc/user_name/user_bloc.dart';
import 'package:flutter_task4/bloc/user_name/user_event.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _usernameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'Welcome ',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            const Text(
              'Please enter your username',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
            const SizedBox(height: 32),

            // Username Field
            TextField(
              controller: _usernameController,
              decoration: InputDecoration(
                labelText: 'Username',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),

            const SizedBox(height: 24),

            // Login Button
            BlocBuilder<LoginBloc, LoginState>(
              builder: (context, state) {
                if (state is LoginSuccess) {
                  context.read<UserNameBloc>().add(
                    FetchUserName(name: state.username),
                  );

                  // من اجل التاكد انه تم رسم الصفحة
                  WidgetsBinding.instance.addPostFrameCallback((_) {
                    Navigator.pushReplacementNamed(context, '/home');
                  });
                }
                if (state is LoginFailure) {
                  WidgetsBinding.instance.addPostFrameCallback((_) {
                    ScaffoldMessenger.of(
                      context,
                    ).showSnackBar(SnackBar(content: Text(state.errorMessage)));
                  });
                }
                return ElevatedButton(
                  onPressed: state is LoginLoading
                      ? null
                      : () {
                          final username = _usernameController.text.trim();
                          if (username.isEmpty) return;

                          context.read<LoginBloc>().add(
                            LoginRequested(username: username, password: ''),
                          );
                        },
                  child: state is LoginLoading
                      ? const CircularProgressIndicator()
                      : const Text('Login'),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

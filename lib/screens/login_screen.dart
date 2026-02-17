import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_task4/bloc/session/session_bloc.dart';
import 'package:flutter_task4/bloc/session/session_event.dart';
import 'package:flutter_task4/bloc/session/session_state.dart';
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
            BlocListener<SessionBloc, SessionState>(
              listener: (context, state) {
                if (state is SessionAuthenticated) {
                  context.read<UserNameBloc>().add(
                    FetchUserName(name: state.username),
                  );

                  Navigator.pushReplacementNamed(context, '/home');
                }

                if (state is LoginError) {
                  ScaffoldMessenger.of(
                    context,
                  ).showSnackBar(SnackBar(content: Text(state.errorMessage)));
                }
              },
              child: const SizedBox(),
            ),

            BlocBuilder<SessionBloc, SessionState>(
              builder: (context, state) {
                return ElevatedButton(
                  onPressed: state is LoginLoading
                      ? null
                      : () {
                          final username = _usernameController.text.trim();
                          if (username.isEmpty) return;

                          context.read<SessionBloc>().add(
                            SessionLogin(username),
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

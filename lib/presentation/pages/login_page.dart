import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:what_2_grab/presentation/widgets/app_button.dart';

import '../bloc/auth/auth_bloc.dart';
import '../bloc/auth/auth_event.dart';
import '../bloc/auth/auth_state.dart';
import '../widgets/custom_button.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Login')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: BlocListener<AuthBloc, AuthState>(
          listener: (context, state) {
            if (state is AuthFailureState) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(state.failure.message)),
              );
            } else if (state is AuthSuccess) {
              Navigator.pushReplacementNamed(context, '/home');
            }
          },
          child: Column(
            children: [
              TextField(
                controller: emailController,
                decoration: InputDecoration(labelText: 'Email'),
                keyboardType: TextInputType.emailAddress,
              ),
              TextField(
                controller: passwordController,
                decoration: InputDecoration(labelText: 'Password'),
                obscureText: true,
              ),
              SizedBox(height: 16),
              AppButton.primary(
                text: 'teste',
                onPress: () async => print('teste'),
              ),
              BlocBuilder<AuthBloc, AuthState>(
                builder: (context, state) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          Navigator.pushReplacementNamed(context, '/signup');
                        },
                        child: Text('Registrar'),
                      ),
                      const SizedBox(width: 16),
                      if (state is AuthLoading) ...[
                        CircularProgressIndicator(),
                      ] else ...[
                        ElevatedButton(
                          onPressed: () {
                            final email = emailController.text;
                            final password = passwordController.text;
                            if (email.isEmpty || password.isEmpty) {
                              return;
                            }
                            context
                                .read<AuthBloc>()
                                .add(SignInEvent(email, password));
                          },
                          child: Text('Entrar'),
                        ),
                      ],
                    ],
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

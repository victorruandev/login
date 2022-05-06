
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_start/src/shared/models/auth/auth_controller.dart';


class AuthPage extends StatefulWidget {
  const AuthPage({Key? key}) : super(key: key);

  @override
  _AuthPageState createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  late final AuthController controller;
  @override
  void initState() {
    controller = context.read<AuthController>();
    super.initState();
    controller.addListener(() {
      if (controller.state == AuthState.error) {
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Erro na autenticação')));
      } else if (controller.state == AuthState.success) {
        Navigator.of(context).pushReplacementNamed('/home');
      }
    });
  }

  @override
  void dispose() {
    // controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final controller = context.watch<AuthController>();

    return Scaffold(
      appBar: AppBar(title: const Text('Auth')),
      body: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.all(12),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FractionallySizedBox(
              widthFactor: 0.5,
              child: TextField(
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Usuário',
                ),
                onChanged: (value) {
                  controller.authRequest =
                      controller.authRequest.copyWith(user: value);
                },
              ),
            ),
            const SizedBox(height: 10),
            FractionallySizedBox(
              widthFactor: 0.5,
              child: TextField(
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Senha',
                ),
                onChanged: (value) {
                  controller.authRequest =
                      controller.authRequest.copyWith(password: value);
                },
              ),
            ),
            const SizedBox(height: 30),
            const CustomButton(),
          ],
        ),
      ),
    );
  }
}

class CustomButton extends StatelessWidget {
  const CustomButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<AuthController>(
      builder: (context, controller, child) {
        final Size size = MediaQuery.of(context).size;

        return SizedBox(
          width: size.width * 0.5,
          height: size.height * 0.08,
          child: ElevatedButton(
            onPressed: controller.state == AuthState.loading
                ? null
                : () {
                    controller.loginAction();
                  },
            child: const Text('Login'),
          ),
        );
      },
    );
  }
}

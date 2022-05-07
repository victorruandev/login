
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../shared/models/auth/auth_controller.dart';

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

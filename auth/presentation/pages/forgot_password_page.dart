import 'package:flutter/material.dart';
import '../widgets/auth_widgets.dart';
import '../../../lib/main.dart';

class ForgotPasswordPage extends StatelessWidget {
  const ForgotPasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 16, 20, 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const BackButtonCircle(),
              const SizedBox(height: 12),
              const Text(
                'Забыли пароль?',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.w700,
                  color: AuthColors.text,
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                'Введите вашу электронную почту, указанную при регистрации, и мы отправим код для восстановления.',
                style: TextStyle(
                  fontSize: 14,
                  color: AuthColors.muted,
                ),
              ),
              const AuthIllustration(icon: Icons.mail_outline_rounded),
              const AuthField(
                label: 'Электронная почта',
                hint: 'Введите электронную почту',
              ),
              const Spacer(),
              AuthButton(
                label: 'Продолжить',
                enabled: true,
                onPressed: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}

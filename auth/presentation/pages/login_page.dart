import 'package:flutter/material.dart';
import '../widgets/auth_widgets.dart';
import '../../../lib/main.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final canContinue = emailController.text.isNotEmpty && passwordController.text.isNotEmpty;

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
                'Вход',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.w700,
                  color: AuthColors.text,
                ),
              ),
              const SizedBox(height: 6),
              const Text(
                'Добро пожаловать! Введите данные для авторизации.',
                style: TextStyle(
                  fontSize: 14,
                  color: AuthColors.muted,
                ),
              ),
              const AuthIllustration(icon: Icons.lock_outline_rounded),
              AuthField(
                label: 'Электронная почта',
                hint: 'Введите электронную почту',
                controller: emailController,
              ),
              const SizedBox(height: 16),
              AuthField(
                label: 'Пароль',
                hint: 'Введите пароль',
                controller: passwordController,
                obscureText: true,
              ),
              const SizedBox(height: 10),
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {},
                  child: const Text(
                    'Забыли пароль?',
                    style: TextStyle(
                      color: AuthColors.greenDark,
                    ),
                  ),
                ),
              ),
              const Spacer(),
              AuthButton(
                label: 'Продолжить',
                enabled: canContinue,
                onPressed: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}

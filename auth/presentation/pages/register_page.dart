import 'package:flutter/material.dart';
import '../widgets/auth_widgets.dart';
import '../../../lib/main.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  int _step = 0;
  String city = '';
  String language = '';

  @override
  Widget build(BuildContext context) {
    final titles = [
      'Откуда вы?',
      'Выберите город',
      'Выберите язык',
      'Введите электронную почту',
    ];

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 16, 20, 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (_step > 0) const BackButtonCircle(),
              const SizedBox(height: 12),
              Text(
                titles[_step],
                style: const TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.w700,
                  color: AuthColors.text,
                ),
              ),
              const SizedBox(height: 18),
              Expanded(child: _buildStepContent()),
              const SizedBox(height: 14),
              AuthButton(
                label: 'Продолжить',
                enabled: true,
                onPressed: () {
                  if (_step < 3) {
                    setState(() => _step++);
                    return;
                  }
                },
              ),
              const SizedBox(height: 12),
              Center(
                child: TextButton(
                  onPressed: () {},
                  child: const Text(
                    'Уже есть аккаунт? Войти',
                    style: TextStyle(
                      color: AuthColors.greenDark,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildStepContent() {
    if (_step == 0) {
      return Column(
        children: [
          const AuthIllustration(icon: Icons.location_on_outlined),
          const SizedBox(height: 12),
          ChoiceTile(
            title: 'Город',
            selected: city.isNotEmpty,
            onTap: () => setState(() => _step = 1),
          ),
          ChoiceTile(
            title: 'Язык',
            selected: language.isNotEmpty,
            onTap: () => setState(() => _step = 2),
          ),
        ],
      );
    }

    if (_step == 1) {
      return _buildChooseList(
        ['Ош', 'Бишкек', 'Манас', 'Нарын', 'Баткен'],
        (value) {
          city = value;
          setState(() => _step = 0);
        },
      );
    }

    if (_step == 2) {
      return _buildChooseList(
        ['Русский', 'Кыргызча', 'English'],
        (value) {
          language = value;
          setState(() => _step = 0);
        },
      );
    }

    return Column(
      children: [
        const AuthIllustration(icon: Icons.mail_outline_rounded),
        const SizedBox(height: 4),
        const AuthField(
          label: 'Электронная почта',
          hint: 'Введите электронную почту',
        ),
        const SizedBox(height: 18),
        const Text(
          'Я принимаю условия пользовательского соглашения и политики конфиденциальности',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: AuthColors.muted,
            fontSize: 11,
          ),
        ),
      ],
    );
  }

  Widget _buildChooseList(List<String> items, Function(String) onSelected) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: AuthColors.border),
      ),
      child: Column(
        children: items.map((item) {
          final selected = item == city || item == language;
          return ChoiceTile(
            title: item,
            selected: selected,
            onTap: () => onSelected(item),
          );
        }).toList(),
      ),
    );
  }
}

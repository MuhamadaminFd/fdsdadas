import 'package:flutter/material.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const GreenBonusApp());
}

class GreenBonusApp extends StatelessWidget {
  const GreenBonusApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Green Bonus',
      theme: ThemeData(
        scaffoldBackgroundColor: const Color(0xFF4F4F4F),
        fontFamily: 'Roboto',
        primarySwatch: Colors.green,
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF73C68A)),
        textTheme: const TextTheme(
          titleLarge: TextStyle(fontSize: 28, fontWeight: FontWeight.w700, color: Color(0xFF1A1A1A)),
          titleMedium: TextStyle(fontSize: 22, fontWeight: FontWeight.w700, color: Color(0xFF1A1A1A)),
          bodyLarge: TextStyle(fontSize: 16, color: Color(0xFF1A1A1A)),
          bodyMedium: TextStyle(fontSize: 14, color: Color(0xFF1A1A1A)),
        ),
      ),
      home: const AuthFlowDemoPage(),
    );
  }
}

class AuthFlowDemoPage extends StatelessWidget {
  const AuthFlowDemoPage({super.key});

  @override
  Widget build(BuildContext context) {
    final cards = <Widget>[
      _buildRegistrationCard('регистрация (выбор ...)', _buildCitySelection()),
      _buildRegistrationCard('регистрация (выбор ...)', _buildCountrySelection()),
      _buildRegistrationCard('регистрация все вы...', _buildLanguageSelection()),
      _buildRegistrationCard('регистрация эл почта', _buildEmailPhoneStep()),
      _buildRegistrationCard('регистрация эл почт...', _buildCodeInput()),
      _buildRegistrationCard('регистрация код', _buildCreatePassword()),
      _buildLoginCard('Вход', _buildLoginForm()),
      _buildLoginCard('Вход', _buildLoginReady()),
      _buildLoginCard('Вход', _buildPasswordInput()),
      _buildLoginCard('Забыли пароль?', _buildForgotPassword()),
      _buildRegistrationCard('регистрация город', _buildCitySelectScreen()),
      _buildRegistrationCard('регистрация город (...)', _buildCityChooseList()),
      _buildRegistrationCard('регистрация (выбор ...)', _buildLanguageChoiceList()),
      _buildRegistrationCard('регистрация язык', _buildLanguageSelectionOnly()),
      _buildRegistrationCard('регистрация (выбор ...)', _buildLanguageMenu()),
    ];

    return Scaffold(
      backgroundColor: const Color(0xFF4D4D4D),
      body: Center(
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          padding: const EdgeInsets.symmetric(vertical: 12),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: cards.map((card) => Padding(padding: const EdgeInsets.only(right: 16), child: card)).toList(),
          ),
        ),
      ),
    );
  }

  static Widget _buildRegistrationCard(String label, Widget content) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 18),
      child: PhoneCard(
        width: 288,
        title: label,
        content: content,
      ),
    );
  }

  static Widget _buildLoginCard(String label, Widget content) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 18),
      child: PhoneCard(
        width: 288,
        title: label,
        content: content,
      ),
    );
  }

  static Widget _buildCitySelection() {
    return Column(
      children: [
        const SizedBox(height: 10),
        const MapIllustration(size: Size(200, 180)),
        const SizedBox(height: 18),
        _SelectionField(label: 'Город', value: 'Ош'),
        const SizedBox(height: 12),
        _SelectionField(label: 'Язык', value: 'Русский'),
        const SizedBox(height: 28),
        PrimaryButton(label: 'Продолжить', enabled: false),
      ],
    );
  }

  static Widget _buildCountrySelection() {
    return Column(
      children: [
        const SizedBox(height: 12),
        const MapIllustration(size: Size(200, 180)),
        const SizedBox(height: 18),
        _SelectionField(label: 'Город', value: 'Ош'),
        const SizedBox(height: 12),
        _SelectionField(label: 'Язык', value: 'Русский'),
        const SizedBox(height: 16),
        Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: const Color(0xFFE0E0E0)),
          ),
          child: Column(
            children: [
              _LanguageRow(label: 'Русский', selected: true),
              _LanguageRow(label: 'Кыргызча', selected: false),
              _LanguageRow(label: 'English', selected: false),
            ],
          ),
        ),
        const SizedBox(height: 24),
        PrimaryButton(label: 'Продолжить', enabled: true),
      ],
    );
  }

  static Widget _buildLanguageSelection() {
    return Column(
      children: [
        const SizedBox(height: 8),
        const MapIllustration(size: Size(200, 180)),
        const SizedBox(height: 18),
        _SelectionField(label: 'Город', value: 'Ош'),
        const SizedBox(height: 12),
        _SelectionField(label: 'Язык', value: 'Русский'),
        const SizedBox(height: 18),
        PrimaryButton(label: 'Продолжить', enabled: false),
      ],
    );
  }

  static Widget _buildEmailPhoneStep() {
    return Column(
      children: [
        const SizedBox(height: 18),
        const EmailIllustration(size: Size(180, 160)),
        const SizedBox(height: 18),
        const UnderlinedInput(hintText: 'Введите электронную почту'),
        const SizedBox(height: 14),
        const Text(
          'Я принимаю условия пользовательского соглашения и политики конфиденциальности',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 11, color: Color(0xFF7B7B7B), height: 1.4),
        ),
        const SizedBox(height: 24),
        PrimaryButton(label: 'Продолжить', enabled: true),
      ],
    );
  }

  static Widget _buildCodeInput() {
    return Column(
      children: [
        const SizedBox(height: 14),
        const EmailIllustration(size: Size(180, 160)),
        const SizedBox(height: 18),
        const Text(
          'Введите код',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.w700, color: Color(0xFF1A1A1A)),
        ),
        const SizedBox(height: 8),
        const Text(
          'Введите 4-значный код, отправленный на вашу электронную почту:',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 13, color: Color(0xFF757575), height: 1.5),
        ),
        const SizedBox(height: 18),
        const VerificationCodeField(),
        const SizedBox(height: 18),
        const Text(
          'Отправить повторно можно будет через 115 секунд',
          style: TextStyle(fontSize: 11, color: Color(0xFF7B7B7B)),
        ),
        const SizedBox(height: 18),
        PrimaryButton(label: 'Продолжить', enabled: false),
      ],
    );
  }

  static Widget _buildCreatePassword() {
    return Column(
      children: [
        const SizedBox(height: 14),
        const LockIllustration(size: Size(180, 160)),
        const SizedBox(height: 18),
        const Text(
          'Создайте пароль',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.w700, color: Color(0xFF1A1A1A)),
        ),
        const SizedBox(height: 12),
        const Text(
          'Придумайте надежный пароль для безопасного входа в ваш аккаунт',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 12, color: Color(0xFF757575), height: 1.5),
        ),
        const SizedBox(height: 18),
        const UnderlinedInput(hintText: 'Пароль', obscureText: true),
        const SizedBox(height: 12),
        const UnderlinedInput(hintText: 'Повторите пароль', obscureText: true),
        const SizedBox(height: 22),
        PrimaryButton(label: 'Продолжить', enabled: false),
      ],
    );
  }

  static Widget _buildLoginForm() {
    return Column(
      children: [
        const SizedBox(height: 18),
        const LockIllustration(size: Size(180, 160)),
        const SizedBox(height: 18),
        const UnderlinedInput(hintText: 'Электронная почта'),
        const SizedBox(height: 14),
        const UnderlinedInput(hintText: 'Пароль', obscureText: true),
        const SizedBox(height: 12),
        const Text(
          'Забыли пароль?',
          style: TextStyle(color: Color(0xFF5D9D6D), fontWeight: FontWeight.w500, fontSize: 13),
        ),
        const SizedBox(height: 24),
        PrimaryButton(label: 'Продолжить', enabled: false),
      ],
    );
  }

  static Widget _buildLoginReady() {
    return Column(
      children: [
        const SizedBox(height: 18),
        const LockIllustration(size: Size(180, 160)),
        const SizedBox(height: 18),
        const UnderlinedInput(hintText: 'Электронная почта', value: 'hello@green.com'),
        const SizedBox(height: 14),
        const UnderlinedInput(hintText: 'Пароль', value: '••••••••', obscureText: true),
        const SizedBox(height: 12),
        const Text(
          'Забыли пароль?',
          style: TextStyle(color: Color(0xFF5D9D6D), fontWeight: FontWeight.w500, fontSize: 13),
        ),
        const SizedBox(height: 24),
        PrimaryButton(label: 'Продолжить', enabled: true),
      ],
    );
  }

  static Widget _buildPasswordInput() {
    return Column(
      children: [
        const SizedBox(height: 18),
        const LockIllustration(size: Size(180, 160)),
        const SizedBox(height: 18),
        const UnderlinedInput(hintText: 'Электронная почта', value: 'hello@green.com'),
        const SizedBox(height: 14),
        const UnderlinedInput(hintText: 'Пароль', value: '••••••••', obscureText: true),
        const SizedBox(height: 12),
        const Text(
          'Забыли пароль?',
          style: TextStyle(color: Color(0xFF5D9D6D), fontWeight: FontWeight.w500, fontSize: 13),
        ),
        const SizedBox(height: 24),
        PrimaryButton(label: 'Продолжить', enabled: true),
      ],
    );
  }

  static Widget _buildForgotPassword() {
    return Column(
      children: [
        const SizedBox(height: 18),
        const EmailIllustration(size: Size(180, 160)),
        const SizedBox(height: 14),
        const Text(
          'Забыли пароль?',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.w700, color: Color(0xFF1A1A1A)),
        ),
        const SizedBox(height: 8),
        const Text(
          'Введите вашу электронную почту, указанную при регистрации, и мы отправим вам код для восстановления.',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 12, color: Color(0xFF757575), height: 1.5),
        ),
        const SizedBox(height: 18),
        const UnderlinedInput(hintText: 'Электронная почта', value: 'hello@green.com'),
        const SizedBox(height: 24),
        PrimaryButton(label: 'Продолжить', enabled: true),
      ],
    );
  }

  static Widget _buildCitySelectScreen() {
    return Column(
      children: [
        const SizedBox(height: 20),
        const MapIllustration(size: Size(200, 180)),
        const SizedBox(height: 18),
        _SelectionField(label: 'Город', value: 'Ош'),
        const SizedBox(height: 12),
        _SelectionField(label: 'Язык', value: 'Русский'),
        const SizedBox(height: 18),
        PrimaryButton(label: 'Продолжить', enabled: false),
      ],
    );
  }

  static Widget _buildCityChooseList() {
    return Column(
      children: [
        const SizedBox(height: 12),
        const MapIllustration(size: Size(200, 180)),
        const SizedBox(height: 18),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: const Color(0xFFE0E0E0)),
          ),
          child: Column(
            children: [
              const TextField(
                decoration: InputDecoration(
                  hintText: 'Поиск города',
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.zero,
                  prefixIcon: Icon(Icons.search, size: 18, color: Color(0xFF7A7A7A)),
                ),
              ),
              const SizedBox(height: 8),
              _CityOption(label: 'Ош', selected: false),
              _CityOption(label: 'Бишкек', selected: true),
              _CityOption(label: 'Манас', selected: false),
              _CityOption(label: 'Нарын', selected: false),
              _CityOption(label: 'Баткен', selected: false),
            ],
          ),
        ),
        const SizedBox(height: 18),
        PrimaryButton(label: 'Продолжить', enabled: true),
      ],
    );
  }

  static Widget _buildLanguageChoiceList() {
    return Column(
      children: [
        const SizedBox(height: 12),
        const MapIllustration(size: Size(200, 180)),
        const SizedBox(height: 20),
        Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: const Color(0xFFE0E0E0)),
          ),
          child: Column(
            children: [
              _LanguageRow(label: 'Русский', selected: true),
              _LanguageRow(label: 'Кыргызча', selected: false),
              _LanguageRow(label: 'English', selected: false),
            ],
          ),
        ),
        const SizedBox(height: 18),
        PrimaryButton(label: 'Продолжить', enabled: false),
      ],
    );
  }

  static Widget _buildLanguageSelectionOnly() {
    return Column(
      children: [
        const SizedBox(height: 18),
        const MapIllustration(size: Size(200, 180)),
        const SizedBox(height: 20),
        _SelectionField(label: 'Город', value: 'Ош'),
        const SizedBox(height: 12),
        _SelectionField(label: 'Язык', value: 'Русский'),
        const SizedBox(height: 18),
        PrimaryButton(label: 'Продолжить', enabled: false),
      ],
    );
  }

  static Widget _buildLanguageMenu() {
    return Column(
      children: [
        const SizedBox(height: 18),
        const MapIllustration(size: Size(200, 180)),
        const SizedBox(height: 18),
        _SelectionField(label: 'Город', value: 'Ош'),
        const SizedBox(height: 12),
        _SelectionField(label: 'Язык', value: 'Русский'),
        const SizedBox(height: 18),
        Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: const Color(0xFFE0E0E0)),
          ),
          child: Column(
            children: [
              _LanguageRow(label: 'Русский', selected: true),
              _LanguageRow(label: 'Кыргызча', selected: false),
              _LanguageRow(label: 'English', selected: false),
            ],
          ),
        ),
        const SizedBox(height: 18),
        PrimaryButton(label: 'Продолжить', enabled: true),
      ],
    );
  }
}

class PhoneCard extends StatelessWidget {
  const PhoneCard({
    super.key,
    required this.title,
    required this.content,
    this.width = 288,
  });

  final String title;
  final Widget content;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: 770,
      decoration: BoxDecoration(
        color: const Color(0xFFF4F4F4),
        borderRadius: BorderRadius.circular(14),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.14),
            blurRadius: 12,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(14),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 14),
              const PhoneStatusBar(),
              const SizedBox(height: 8),
              Text(
                title,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                  color: Color(0xFF1E1E1E),
                ),
              ),
              const SizedBox(height: 8),
              Expanded(child: content),
              const SizedBox(height: 12),
            ],
          ),
        ),
      ),
    );
  }
}

class PhoneStatusBar extends StatelessWidget {
  const PhoneStatusBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text(
          '9:41',
          style: TextStyle(fontSize: 12, fontWeight: FontWeight.w700, color: Color(0xFF1D1D1D)),
        ),
        Row(
          children: const [
            Icon(Icons.signal_cellular_4_bar_rounded, size: 16, color: Colors.black),
            SizedBox(width: 4),
            Icon(Icons.wifi_rounded, size: 16, color: Colors.black),
            SizedBox(width: 4),
            Icon(Icons.battery_full_rounded, size: 16, color: Colors.black),
          ],
        )
      ],
    );
  }
}

class PrimaryButton extends StatelessWidget {
  const PrimaryButton({super.key, required this.label, this.enabled = true});

  final String label;
  final bool enabled;

  @override
  Widget build(BuildContext context) {
    final bg = enabled ? const Color(0xFF8BCF7A) : const Color(0xFFCDD0CF);
    return SizedBox(
      width: double.infinity,
      height: 46,
      child: ElevatedButton(
        onPressed: enabled ? () {} : null,
        style: ElevatedButton.styleFrom(
          backgroundColor: bg,
          foregroundColor: Colors.white,
          disabledBackgroundColor: bg,
          disabledForegroundColor: Colors.white,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          elevation: 0,
        ),
        child: Text(
          label,
          style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
        ),
      ),
    );
  }
}

class _SelectionField extends StatelessWidget {
  const _SelectionField({required this.label, required this.value});

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 52,
      padding: const EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: const Color(0xFFD5D5D5)),
      ),
      child: Row(
        children: [
          const Icon(Icons.location_on_outlined, color: Color(0xFF5B5B5B), size: 18),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              label,
              style: const TextStyle(fontSize: 14, color: Color(0xFF7A7A7A)),
            ),
          ),
          Text(
            value,
            style: const TextStyle(fontSize: 14, color: Color(0xFF1E1E1E), fontWeight: FontWeight.w500),
          ),
          const SizedBox(width: 8),
          const Icon(Icons.chevron_right, color: Color(0xFF7A7A7A), size: 18),
        ],
      ),
    );
  }
}

class UnderlinedInput extends StatelessWidget {
  const UnderlinedInput({
    super.key,
    this.hintText = 'Введите текст',
    this.value,
    this.obscureText = false,
  });

  final String hintText;
  final String? value;
  final bool obscureText;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48,
      alignment: Alignment.center,
      decoration: const BoxDecoration(
        border: Border(bottom: BorderSide(color: Color(0xFFB6B6B6), width: 1)),
      ),
      child: TextField(
        controller: value == null ? null : TextEditingController(text: value),
        obscureText: obscureText,
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: const TextStyle(color: Color(0xFFB0B0B0), fontSize: 14),
          border: InputBorder.none,
          contentPadding: const EdgeInsets.only(bottom: 8),
        ),
      ),
    );
  }
}

class VerificationCodeField extends StatelessWidget {
  const VerificationCodeField({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        4,
        (index) => Container(
          width: 40,
          height: 52,
          margin: const EdgeInsets.symmetric(horizontal: 8),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: const Color(0xFFD8D8D8)),
          ),
          child: Text(
            index == 0 ? '1' : index == 1 ? '6' : '',
            style: const TextStyle(fontSize: 24, fontWeight: FontWeight.w500, color: Color(0xFF1E1E1E)),
          ),
        ),
      ),
    );
  }
}

class _LanguageRow extends StatelessWidget {
  const _LanguageRow({required this.label, required this.selected});

  final String label;
  final bool selected;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        children: [
          Text(label, style: const TextStyle(fontSize: 14, color: Color(0xFF202020))),
          const Spacer(),
          Container(
            width: 16,
            height: 16,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: selected ? const Color(0xFF67B77B) : const Color(0xFFB9B9B9), width: 1.2),
              color: selected ? const Color(0xFF67B77B) : Colors.transparent,
            ),
            child: selected
                ? const Icon(Icons.check, size: 12, color: Colors.white)
                : null,
          ),
        ],
      ),
    );
  }
}

class _CityOption extends StatelessWidget {
  const _CityOption({required this.label, required this.selected});

  final String label;
  final bool selected;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          Container(
            width: 18,
            height: 18,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: selected ? const Color(0xFF67B77B) : const Color(0xFFBDBDBD)),
              color: selected ? const Color(0xFF67B77B) : Colors.transparent,
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              label,
              style: const TextStyle(fontSize: 14, color: Color(0xFF1E1E1E)),
            ),
          ),
        ],
      ),
    );
  }
}

class MapIllustration extends StatelessWidget {
  const MapIllustration({super.key, this.size = const Size(200, 180)});

  final Size size;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size.width,
      height: size.height,
      child: CustomPaint(
        painter: _MapPainter(),
      ),
    );
  }
}

class _MapPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final bg = Paint()..color = const Color(0xFFD8F0D4);
    final paint = Paint()..color = const Color(0xFF9FD2A1)..style = PaintingStyle.stroke..strokeWidth = 2.2;
    final fill = Paint()..color = const Color(0xFFBFE3BA)..style = PaintingStyle.fill;
    final accent = Paint()..color = const Color(0xFF73C68A)..style = PaintingStyle.fill;

    final path = Path();
    path.moveTo(18, size.height * 0.64);
    path.quadraticBezierTo(size.width * 0.2, size.height * 0.35, size.width * 0.43, size.height * 0.46);
    path.quadraticBezierTo(size.width * 0.68, size.height * 0.2, size.width * 0.9, size.height * 0.42);
    path.quadraticBezierTo(size.width * 1.06, size.height * 0.56, size.width * 0.78, size.height * 0.82);
    path.quadraticBezierTo(size.width * 0.5, size.height * 0.96, size.width * 0.18, size.height * 0.86);
    path.quadraticBezierTo(0, size.height * 0.72, 18, size.height * 0.64);
    canvas.drawPath(path, fill);
    canvas.drawPath(path, paint);

    final points = [
      Offset(size.width * 0.22, size.height * 0.5),
      Offset(size.width * 0.35, size.height * 0.68),
      Offset(size.width * 0.52, size.height * 0.55),
      Offset(size.width * 0.65, size.height * 0.42),
      Offset(size.width * 0.77, size.height * 0.68),
      Offset(size.width * 0.46, size.height * 0.80),
    ];

    for (final point in points) {
      final circle = Paint()..color = const Color(0xFFBCE3BF)..style = PaintingStyle.fill;
      canvas.drawCircle(point, 20, circle);
      final ring = Paint()..color = const Color(0xFF68B778)..style = PaintingStyle.stroke..strokeWidth = 2;
      canvas.drawCircle(point, 8, ring);
      final dot = Paint()..color = const Color(0xFF68B778)..style = PaintingStyle.fill;
      canvas.drawCircle(point, 4, dot);
    }

    final leafPaint = Paint()..color = const Color(0xFF7ACB83)..style = PaintingStyle.fill;
    final leafs = [
      Offset(size.width * 0.08, size.height * 0.38),
      Offset(size.width * 0.18, size.height * 0.62),
      Offset(size.width * 0.74, size.height * 0.28),
      Offset(size.width * 0.83, size.height * 0.62),
      Offset(size.width * 0.46, size.height * 0.22),
    ];
    for (final leaf in leafs) {
      final leafPath = Path();
      leafPath.moveTo(leaf.dx, leaf.dy);
      leafPath.quadraticBezierTo(leaf.dx + 16, leaf.dy - 10, leaf.dx + 26, leaf.dy + 4);
      leafPath.quadraticBezierTo(leaf.dx + 16, leaf.dy + 18, leaf.dx, leaf.dy);
      canvas.drawPath(leafPath, leafPaint);
      canvas.drawLine(Offset(leaf.dx + 8, leaf.dy + 8), Offset(leaf.dx + 18, leaf.dy + 10), paint);
    }

    canvas.drawCircle(Offset(size.width * 0.46, size.height * 0.58), 15, accent);
    canvas.drawCircle(Offset(size.width * 0.46, size.height * 0.58), 9, bg);
    canvas.drawLine(Offset(size.width * 0.46, size.height * 0.58), Offset(size.width * 0.46, size.height * 0.68), paint);
    canvas.drawLine(Offset(size.width * 0.44, size.height * 0.62), Offset(size.width * 0.48, size.height * 0.62), paint);
    canvas.drawLine(Offset(size.width * 0.46, size.height * 0.58), Offset(size.width * 0.56, size.height * 0.62), paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class LockIllustration extends StatelessWidget {
  const LockIllustration({super.key, this.size = const Size(180, 160)});

  final Size size;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size.width,
      height: size.height,
      child: CustomPaint(
        painter: _LockPainter(),
      ),
    );
  }
}

class _LockPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final darkFill = Paint()..color = const Color(0xFF5DAB76)..style = PaintingStyle.fill;
    final lightFill = Paint()..color = const Color(0xFFBEEBC1)..style = PaintingStyle.fill;
    final outline = Paint()..color = const Color(0xFF1D7D5C)..style = PaintingStyle.stroke..strokeWidth = 2.2;

    final base = RRect.fromRectAndRadius(Rect.fromLTWH(size.width * 0.2, size.height * 0.54, size.width * 0.6, size.height * 0.2), const Radius.circular(16));
    canvas.drawRRect(base, darkFill);
    canvas.drawRRect(base, outline);

    final body = Path();
    body.moveTo(size.width * 0.28, size.height * 0.48);
    body.quadraticBezierTo(size.width * 0.25, size.height * 0.34, size.width * 0.38, size.height * 0.34);
    body.lineTo(size.width * 0.62, size.height * 0.34);
    body.quadraticBezierTo(size.width * 0.74, size.height * 0.34, size.width * 0.72, size.height * 0.48);
    body.close();
    canvas.drawPath(body, lightFill);
    canvas.drawPath(body, outline);

    final circle = Paint()..color = const Color(0xFFEAF8EE)..style = PaintingStyle.fill;
    canvas.drawCircle(Offset(size.width * 0.5, size.height * 0.44), 18, circle);
    canvas.drawCircle(Offset(size.width * 0.5, size.height * 0.44), 16, outline);

    final line = Paint()..color = const Color(0xFF5DAB76)..style = PaintingStyle.stroke..strokeWidth = 5;
    canvas.drawLine(Offset(size.width * 0.5, size.height * 0.42), Offset(size.width * 0.5, size.height * 0.52), line);

    final shield = Paint()..color = const Color(0xFF8AD68A)..style = PaintingStyle.fill;
    canvas.drawRRect(RRect.fromRectAndRadius(Rect.fromLTWH(size.width * 0.62, size.height * 0.15, 22, 22), const Radius.circular(6)), shield);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class EmailIllustration extends StatelessWidget {
  const EmailIllustration({super.key, this.size = const Size(180, 160)});

  final Size size;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size.width,
      height: size.height,
      child: CustomPaint(
        painter: _EmailPainter(),
      ),
    );
  }
}

class _EmailPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final fill = Paint()..color = const Color(0xFFD9F0D8)..style = PaintingStyle.fill;
    final stroke = Paint()..color = const Color(0xFF73C68A)..style = PaintingStyle.stroke..strokeWidth = 2.4;
    final green = Paint()..color = const Color(0xFF77C57C)..style = PaintingStyle.fill;

    canvas.drawRRect(RRect.fromRectAndRadius(Rect.fromLTWH(size.width * 0.14, size.height * 0.28, size.width * 0.72, size.height * 0.42), const Radius.circular(18)), fill);
    canvas.drawRRect(RRect.fromRectAndRadius(Rect.fromLTWH(size.width * 0.14, size.height * 0.28, size.width * 0.72, size.height * 0.42), const Radius.circular(18)), stroke);

    final path = Path();
    path.moveTo(size.width * 0.2, size.height * 0.34);
    path.lineTo(size.width * 0.5, size.height * 0.55);
    path.lineTo(size.width * 0.8, size.height * 0.34);
    canvas.drawPath(path, stroke);

    final circle = Paint()..color = const Color(0xFF7BC57D)..style = PaintingStyle.fill;
    canvas.drawCircle(Offset(size.width * 0.5, size.height * 0.53), 12, circle);
    canvas.drawCircle(Offset(size.width * 0.5, size.height * 0.53), 8, const Paint()..color = const Color(0xFFEAF8EE)..style = PaintingStyle.fill);

    final leaf = Paint()..color = const Color(0xFF90D193)..style = PaintingStyle.fill;
    canvas.drawCircle(Offset(size.width * 0.2, size.height * 0.22), 10, leaf);
    canvas.drawCircle(Offset(size.width * 0.7, size.height * 0.18), 12, leaf);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

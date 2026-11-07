import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../navigation/cabinet_shell.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final _login = TextEditingController();
  final _password = TextEditingController();
  bool _hidePassword = true;
  bool _busy = false;

  @override
  void dispose() {
    _login.dispose();
    _password.dispose();
    super.dispose();
  }

  Future<void> _signIn() async {
    if (!_formKey.currentState!.validate()) return;
    setState(() => _busy = true);
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setBool('isLoggedIn', true);
      await prefs.setString('studentLogin', _login.text.trim());
      if (!mounted) return;
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => const CabinetShell()));
    } catch (_) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Kirishda xatolik. Qayta urinib ko‘ring.')));
    } finally {
      if (mounted) setState(() => _busy = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: Center(child: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: ConstrainedBox(constraints: const BoxConstraints(maxWidth: 440), child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(height: 76, width: 76, alignment: Alignment.center,
              decoration: BoxDecoration(color: const Color(0xFFE8EEFF), borderRadius: BorderRadius.circular(24)),
              child: const Icon(Icons.school_rounded, size: 40, color: Color(0xFF3157D5))),
            const SizedBox(height: 28),
            const Text('Xush kelibsiz!', style: TextStyle(fontSize: 30, fontWeight: FontWeight.w800)),
            const SizedBox(height: 8),
            const Text('Talaba shaxsiy kabinetiga kirish uchun ma’lumotlaringizni kiriting.', style: TextStyle(color: Color(0xFF64748B), height: 1.5)),
            const SizedBox(height: 30),
            Form(key: _formKey, child: Column(children: [
              TextFormField(controller: _login, textInputAction: TextInputAction.next,
                decoration: const InputDecoration(labelText: 'Login yoki talaba ID', prefixIcon: Icon(Icons.person_outline)),
                validator: (v) => v == null || v.trim().isEmpty ? 'Loginni kiriting' : null),
              const SizedBox(height: 16),
              TextFormField(controller: _password, obscureText: _hidePassword, onFieldSubmitted: (_) => _signIn(),
                decoration: InputDecoration(labelText: 'Parol', prefixIcon: const Icon(Icons.lock_outline),
                  suffixIcon: IconButton(onPressed: () => setState(() => _hidePassword = !_hidePassword),
                    icon: Icon(_hidePassword ? Icons.visibility_outlined : Icons.visibility_off_outlined))),
                validator: (v) => v == null || v.length < 4 ? 'Parol kamida 4 ta belgidan iborat bo‘lsin' : null),
            ])),
            const SizedBox(height: 22),
            FilledButton(onPressed: _busy ? null : _signIn,
              style: FilledButton.styleFrom(minimumSize: const Size.fromHeight(54), shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14))),
              child: _busy ? const SizedBox(height: 22, width: 22, child: CircularProgressIndicator(strokeWidth: 2))
                : const Text('Kirish', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700))),
            const SizedBox(height: 16),
            const Text('Demo: istalgan login va kamida 4 belgili parol bilan kiring.', textAlign: TextAlign.center, style: TextStyle(color: Color(0xFF64748B), fontSize: 12)),
          ],
        )),
      ))),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../screens/grades_page.dart';
import '../screens/home_page.dart';
import '../screens/login_page.dart';
import '../screens/profile_page.dart';
import '../screens/subjects_page.dart';

class CabinetShell extends StatefulWidget {
  const CabinetShell({super.key});
  @override
  State<CabinetShell> createState() => _CabinetShellState();
}

class _CabinetShellState extends State<CabinetShell> {
  int selectedIndex = 0;
  String studentName = 'Talaba Ismi';
  String studentGroup = 'DI-guruh';
  final String studentId = 'ST-2026-001';
  final String faculty = 'Axborot texnologiyalari';

  Future<void> _logout() async {
    final confirmed = await showDialog<bool>(context: context, builder: (ctx) => AlertDialog(
      title: const Text('Tizimdan chiqish'),
      content: const Text('Shaxsiy kabinetdan chiqmoqchimisiz?'),
      actions: [
        TextButton(onPressed: () => Navigator.pop(ctx, false), child: const Text('Bekor qilish')),
        FilledButton(onPressed: () => Navigator.pop(ctx, true), child: const Text('Chiqish')),
      ],
    ));
    if (confirmed != true) return;
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isLoggedIn', false);
    if (!mounted) return;
    Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (_) => const LoginPage()), (route) => false);
  }

  void _updateProfile(String name, String group) {
    setState(() {
      studentName = name;
      studentGroup = group;
    });
  }

  @override
  Widget build(BuildContext context) {
    final pages = [
      HomePage(studentName: studentName, group: studentGroup,
        onOpenSubjects: () => setState(() => selectedIndex = 1),
        onOpenGrades: () => setState(() => selectedIndex = 2)),
      const SubjectsPage(),
      const GradesPage(),
      ProfilePage(name: studentName, studentId: studentId, group: studentGroup, faculty: faculty, onSave: _updateProfile, onLogout: _logout),
    ];
    const titles = ['Bosh sahifa', 'Fanlar', 'Baholar', 'Profil'];

    return Scaffold(
      appBar: AppBar(title: Text(titles[selectedIndex], style: const TextStyle(fontWeight: FontWeight.w800)),
        actions: [IconButton(tooltip: 'Bildirishnomalar', onPressed: () => ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Hozircha yangi bildirishnoma yo‘q.'))), icon: const Icon(Icons.notifications_none_rounded)), const SizedBox(width: 8)]),
      body: IndexedStack(index: selectedIndex, children: pages),
      bottomNavigationBar: NavigationBar(
        selectedIndex: selectedIndex,
        onDestinationSelected: (index) => setState(() => selectedIndex = index),
        destinations: const [
          NavigationDestination(icon: Icon(Icons.home_outlined), selectedIcon: Icon(Icons.home_rounded), label: 'Bosh sahifa'),
          NavigationDestination(icon: Icon(Icons.menu_book_outlined), selectedIcon: Icon(Icons.menu_book_rounded), label: 'Fanlar'),
          NavigationDestination(icon: Icon(Icons.grade_outlined), selectedIcon: Icon(Icons.grade_rounded), label: 'Baholar'),
          NavigationDestination(icon: Icon(Icons.person_outline), selectedIcon: Icon(Icons.person_rounded), label: 'Profil'),
        ],
      ),
    );
  }
}

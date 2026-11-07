import 'package:flutter/material.dart';
import '../data/app_data.dart';
import '../widgets/grade_tile.dart';
import '../widgets/stat_card.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key, required this.studentName, required this.group, required this.onOpenSubjects, required this.onOpenGrades});
  final String studentName;
  final String group;
  final VoidCallback onOpenSubjects;
  final VoidCallback onOpenGrades;

  @override
  Widget build(BuildContext context) {
    final average = demoGrades.map((g) => g.score).reduce((a, b) => a + b) / demoGrades.length;
    return ListView(padding: const EdgeInsets.fromLTRB(18, 8, 18, 24), children: [
      Container(padding: const EdgeInsets.all(22),
        decoration: BoxDecoration(gradient: const LinearGradient(colors: [Color(0xFF3157D5), Color(0xFF172554)], begin: Alignment.topLeft, end: Alignment.bottomRight), borderRadius: BorderRadius.circular(24)),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          const Text('Assalomu alaykum,', style: TextStyle(color: Colors.white70)),
          const SizedBox(height: 6),
          Text(studentName, style: const TextStyle(color: Colors.white, fontSize: 23, fontWeight: FontWeight.w800)),
          const SizedBox(height: 5),
          Text(group, style: const TextStyle(color: Colors.white70)),
          const SizedBox(height: 22),
          const Row(children: [Icon(Icons.auto_awesome, color: Colors.white, size: 19), SizedBox(width: 8), Text('O‘qishda davom eting!', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600))]),
        ])),
      const SizedBox(height: 20),
      Row(children: [
        Expanded(child: StatCard(title: 'Fanlar', value: '${demoSubjects.length}', icon: Icons.menu_book_rounded, color: const Color(0xFF3157D5))),
        const SizedBox(width: 12),
        Expanded(child: StatCard(title: 'O‘rtacha baho', value: average.toStringAsFixed(1), icon: Icons.trending_up_rounded, color: const Color(0xFF0F9D78))),
      ]),
      const SizedBox(height: 24),
      const Text('Tezkor bo‘limlar', style: TextStyle(fontSize: 17, fontWeight: FontWeight.w800)),
      const SizedBox(height: 12),
      _ActionTile(icon: Icons.menu_book_rounded, title: 'Fanlar ro‘yxati', subtitle: 'O‘quv fanlari va o‘qituvchilar', onTap: onOpenSubjects),
      const SizedBox(height: 10),
      _ActionTile(icon: Icons.assessment_rounded, title: 'Baholarim', subtitle: 'Nazorat ishlari natijalari', onTap: onOpenGrades),
      const SizedBox(height: 24),
      const Text('So‘nggi baholar', style: TextStyle(fontSize: 17, fontWeight: FontWeight.w800)),
      const SizedBox(height: 12),
      ...demoGrades.take(3).map((g) => GradeTile(grade: g)),
    ]);
  }
}

class _ActionTile extends StatelessWidget {
  const _ActionTile({required this.icon, required this.title, required this.subtitle, required this.onTap});
  final IconData icon;
  final String title;
  final String subtitle;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Material(color: Colors.white, borderRadius: BorderRadius.circular(18),
      child: InkWell(onTap: onTap, borderRadius: BorderRadius.circular(18),
        child: Container(padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(18), border: Border.all(color: const Color(0xFFE8EDF5))),
          child: Row(children: [
            Container(height: 46, width: 46, alignment: Alignment.center, decoration: BoxDecoration(color: const Color(0xFFEAF0FF), borderRadius: BorderRadius.circular(14)), child: Icon(icon, color: const Color(0xFF3157D5))),
            const SizedBox(width: 14),
            Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(title, style: const TextStyle(fontWeight: FontWeight.w700)),
              const SizedBox(height: 4),
              Text(subtitle, style: const TextStyle(color: Color(0xFF64748B), fontSize: 12)),
            ])),
            const Icon(Icons.arrow_forward_ios_rounded, size: 15, color: Color(0xFF94A3B8)),
          ]),
        ),
      ),
    );
  }
}

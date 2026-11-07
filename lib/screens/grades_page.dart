import 'package:flutter/material.dart';
import '../data/app_data.dart';
import '../widgets/grade_tile.dart';

class GradesPage extends StatelessWidget {
  const GradesPage({super.key});

  @override
  Widget build(BuildContext context) {
    final average = demoGrades.map((g) => g.score).reduce((a, b) => a + b) / demoGrades.length;
    return ListView(padding: const EdgeInsets.fromLTRB(18, 8, 18, 24), children: [
      Container(padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(18), border: Border.all(color: const Color(0xFFE8EDF5))),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          const Text('Umumiy o‘zlashtirish', style: TextStyle(color: Color(0xFF64748B))),
          const SizedBox(height: 8),
          Row(crossAxisAlignment: CrossAxisAlignment.end, children: [
            Text(average.toStringAsFixed(1), style: const TextStyle(fontSize: 36, fontWeight: FontWeight.w800)),
            const Padding(padding: EdgeInsets.only(bottom: 7, left: 5), child: Text('/ 100', style: TextStyle(color: Color(0xFF64748B)))),
          ]),
          const SizedBox(height: 12),
          ClipRRect(borderRadius: BorderRadius.circular(20), child: LinearProgressIndicator(value: average / 100, minHeight: 9, backgroundColor: const Color(0xFFE8EDF6))),
          const SizedBox(height: 8),
          Text('${demoGrades.length} ta baholangan ish', style: const TextStyle(color: Color(0xFF64748B), fontSize: 12)),
        ])),
      const SizedBox(height: 22),
      const Text('Baholar tarixi', style: TextStyle(fontSize: 17, fontWeight: FontWeight.w800)),
      const SizedBox(height: 12),
      ...demoGrades.map((g) => GradeTile(grade: g)),
      const SizedBox(height: 12),
      const Text('Eslatma: bu namunaviy ma’lumotlar. Haqiqiy baholar universitet tizimiga ulangandan keyin ko‘rsatiladi.', style: TextStyle(color: Color(0xFF64748B), fontSize: 12, height: 1.5)),
    ]);
  }
}

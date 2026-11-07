import 'package:flutter/material.dart';
import '../models/grade.dart';

class GradeTile extends StatelessWidget {
  const GradeTile({super.key, required this.grade});
  final Grade grade;

  @override
  Widget build(BuildContext context) {
    final color = grade.score >= 90 ? const Color(0xFF0F9D78) : grade.score >= 70 ? const Color(0xFF3157D5) : const Color(0xFFDC8B18);
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(18), border: Border.all(color: const Color(0xFFE8EDF5))),
      child: Row(children: [
        Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(grade.subject, style: const TextStyle(fontWeight: FontWeight.w700)),
          const SizedBox(height: 5),
          Text('${grade.kind} • ${grade.date}', style: const TextStyle(color: Color(0xFF64748B), fontSize: 12)),
        ])),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          decoration: BoxDecoration(color: color.withValues(alpha: .10), borderRadius: BorderRadius.circular(12)),
          child: Text('${grade.score}', style: TextStyle(color: color, fontWeight: FontWeight.w800, fontSize: 16)),
        ),
      ]),
    );
  }
}

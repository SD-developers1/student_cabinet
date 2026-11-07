import 'package:flutter/material.dart';
import '../data/app_data.dart';

class SubjectsPage extends StatefulWidget {
  const SubjectsPage({super.key});
  @override
  State<SubjectsPage> createState() => _SubjectsPageState();
}

class _SubjectsPageState extends State<SubjectsPage> {
  String query = '';

  @override
  Widget build(BuildContext context) {
    final filtered = demoSubjects.where((s) => s.name.toLowerCase().contains(query.toLowerCase()) || s.teacher.toLowerCase().contains(query.toLowerCase())).toList();
    return Column(children: [
      Padding(padding: const EdgeInsets.fromLTRB(18, 4, 18, 14),
        child: TextField(onChanged: (v) => setState(() => query = v),
          decoration: const InputDecoration(hintText: 'Fan yoki o‘qituvchini qidirish', prefixIcon: Icon(Icons.search)))),
      Expanded(child: filtered.isEmpty ? const Center(child: Text('Mos fan topilmadi.')) :
        ListView.separated(padding: const EdgeInsets.fromLTRB(18, 0, 18, 24), itemCount: filtered.length,
          separatorBuilder: (_, __) => const SizedBox(height: 10),
          itemBuilder: (context, i) {
            final s = filtered[i];
            return Container(padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(18), border: Border.all(color: const Color(0xFFE8EDF5))),
              child: Row(children: [
                Container(height: 46, width: 46, alignment: Alignment.center, decoration: BoxDecoration(color: const Color(0xFFEAF0FF), borderRadius: BorderRadius.circular(14)), child: Icon(s.icon, color: const Color(0xFF3157D5))),
                const SizedBox(width: 14),
                Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  Text(s.name, style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 15)),
                  const SizedBox(height: 5),
                  Text(s.teacher, style: const TextStyle(color: Color(0xFF64748B), fontSize: 13)),
                  const SizedBox(height: 5),
                  Text('${s.credits} kredit • ${s.room}', style: const TextStyle(color: Color(0xFF64748B), fontSize: 12)),
                ])),
              ]),
            );
          })),
    ]);
  }
}

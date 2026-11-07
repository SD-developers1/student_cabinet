import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key, required this.name, required this.studentId, required this.group, required this.faculty, required this.onSave, required this.onLogout});
  final String name;
  final String studentId;
  final String group;
  final String faculty;
  final void Function(String, String) onSave;
  final VoidCallback onLogout;

  Future<void> _edit(BuildContext context) async {
    final nameController = TextEditingController(text: name);
    final groupController = TextEditingController(text: group);
    final result = await showDialog<List<String>>(context: context, builder: (ctx) => AlertDialog(
      title: const Text('Profilni tahrirlash'),
      content: Column(mainAxisSize: MainAxisSize.min, children: [
        TextField(controller: nameController, decoration: const InputDecoration(labelText: 'Ism-familiya')),
        const SizedBox(height: 12),
        TextField(controller: groupController, decoration: const InputDecoration(labelText: 'Guruh')),
      ]),
      actions: [
        TextButton(onPressed: () => Navigator.pop(ctx), child: const Text('Bekor qilish')),
        FilledButton(onPressed: () {
          final n = nameController.text.trim();
          final g = groupController.text.trim();
          if (n.isNotEmpty && g.isNotEmpty) Navigator.pop(ctx, [n, g]);
        }, child: const Text('Saqlash')),
      ],
    ));
    nameController.dispose();
    groupController.dispose();
    if (result != null) onSave(result[0], result[1]);
  }

  @override
  Widget build(BuildContext context) {
    return ListView(padding: const EdgeInsets.fromLTRB(18, 8, 18, 24), children: [
      Container(padding: const EdgeInsets.all(22),
        decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(18), border: Border.all(color: const Color(0xFFE8EDF5))),
        child: Column(children: [
          const CircleAvatar(radius: 42, backgroundColor: Color(0xFFE8EEFF), child: Icon(Icons.person_rounded, size: 44, color: Color(0xFF3157D5))),
          const SizedBox(height: 14),
          Text(name, textAlign: TextAlign.center, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w800)),
          const SizedBox(height: 5),
          Text(studentId, style: const TextStyle(color: Color(0xFF64748B))),
          const SizedBox(height: 18),
          OutlinedButton.icon(onPressed: () => _edit(context), icon: const Icon(Icons.edit_outlined, size: 18), label: const Text('Profilni tahrirlash')),
        ])),
      const SizedBox(height: 18),
      const Text('Talaba ma’lumotlari', style: TextStyle(fontSize: 17, fontWeight: FontWeight.w800)),
      const SizedBox(height: 10),
      _InfoTile(icon: Icons.groups_outlined, label: 'Guruh', value: group),
      _InfoTile(icon: Icons.account_balance_outlined, label: 'Fakultet', value: faculty),
      const _InfoTile(icon: Icons.school_outlined, label: 'Ta’lim shakli', value: 'Kunduzgi'),
      const _InfoTile(icon: Icons.calendar_month_outlined, label: 'O‘quv yili', value: '2026–2027'),
      const SizedBox(height: 18),
      OutlinedButton.icon(onPressed: onLogout,
        style: OutlinedButton.styleFrom(foregroundColor: const Color(0xFFDC2626), minimumSize: const Size.fromHeight(52), side: const BorderSide(color: Color(0xFFFECACA))),
        icon: const Icon(Icons.logout_rounded), label: const Text('Tizimdan chiqish')),
    ]);
  }
}

class _InfoTile extends StatelessWidget {
  const _InfoTile({required this.icon, required this.label, required this.value});
  final IconData icon;
  final String label;
  final String value;

  @override
  Widget build(BuildContext context) => Container(
    margin: const EdgeInsets.only(bottom: 9), padding: const EdgeInsets.all(15),
    decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(18), border: Border.all(color: const Color(0xFFE8EDF5))),
    child: Row(children: [
      Icon(icon, color: const Color(0xFF3157D5)),
      const SizedBox(width: 13),
      Expanded(child: Text(label, style: const TextStyle(color: Color(0xFF64748B)))),
      Flexible(child: Text(value, textAlign: TextAlign.end, style: const TextStyle(fontWeight: FontWeight.w700))),
    ]),
  );
}

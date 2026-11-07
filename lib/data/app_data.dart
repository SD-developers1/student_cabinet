import 'package:flutter/material.dart';
import '../models/grade.dart';
import '../models/subject.dart';

const demoSubjects = <Subject>[
  Subject(name: 'Dasturlash asoslari', teacher: 'A. Karimov', credits: 6, room: '301-xona', icon: Icons.code),
  Subject(name: 'Ma’lumotlar bazasi', teacher: 'D. Ismoilova', credits: 5, room: '204-xona', icon: Icons.storage),
  Subject(name: 'Matematika', teacher: 'S. Rahimov', credits: 5, room: '105-xona', icon: Icons.functions),
  Subject(name: 'Ingliz tili', teacher: 'M. Aliyeva', credits: 4, room: '402-xona', icon: Icons.language),
  Subject(name: 'Kompyuter tarmoqlari', teacher: 'J. Sobirov', credits: 5, room: '310-xona', icon: Icons.router),
  Subject(name: 'Falsafa', teacher: 'N. Xasanova', credits: 3, room: '201-xona', icon: Icons.psychology),
];

const demoGrades = <Grade>[
  Grade(subject: 'Dasturlash asoslari', score: 95, kind: 'Amaliy ish', date: '05.11.2026'),
  Grade(subject: 'Ma’lumotlar bazasi', score: 88, kind: 'Mustaqil ish', date: '04.11.2026'),
  Grade(subject: 'Matematika', score: 76, kind: 'Oraliq nazorat', date: '03.11.2026'),
  Grade(subject: 'Ingliz tili', score: 92, kind: 'Test', date: '01.11.2026'),
  Grade(subject: 'Kompyuter tarmoqlari', score: 84, kind: 'Laboratoriya', date: '30.10.2026'),
  Grade(subject: 'Falsafa', score: 90, kind: 'Seminar', date: '28.10.2026'),
];

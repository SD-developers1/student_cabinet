import 'package:flutter/material.dart';

class Subject {
  const Subject({required this.name, required this.teacher, required this.credits, required this.room, required this.icon});
  final String name;
  final String teacher;
  final int credits;
  final String room;
  final IconData icon;
}

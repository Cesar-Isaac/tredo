
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class TagChip extends StatelessWidget {
  final String label;
  const TagChip(this.label, {super.key});

  @override
  Widget build(BuildContext context) {
    return Chip(
      label: Text(label),
      backgroundColor: Colors.grey.shade200,
      labelStyle: const TextStyle(color: Colors.black87),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:tredo/core/style/repo.dart';

class ContactButton extends StatelessWidget {
  final IconData icon;
  final String label;
  const ContactButton({super.key, required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return OutlinedButton.icon(
      onPressed: () {},
      icon: Icon(icon, color: StyleRepo.orange),
      label: Text(label, style: TextStyle(color: StyleRepo.orange)),
      style: OutlinedButton.styleFrom(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
        side: const BorderSide(color: StyleRepo.orange),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
    );
  }
}

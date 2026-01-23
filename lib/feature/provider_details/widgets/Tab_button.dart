import 'package:flutter/material.dart';
import 'package:tredo/core/style/repo.dart';

class TabButton extends StatelessWidget {
  final String label;
  final bool selected;
  final VoidCallback onTap;

  const TabButton({
    super.key,
    required this.label,
    required this.selected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        decoration: BoxDecoration(
          color: selected ? StyleRepo.orange : StyleRepo.lightGrey,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Text(
          label,
          style: TextStyle(
            color: selected ? StyleRepo.white : StyleRepo.black,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}

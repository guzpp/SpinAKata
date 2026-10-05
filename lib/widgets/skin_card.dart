
import 'package:flutter/material.dart';
import '../models/skin.dart';

class SkinCard extends StatelessWidget {
  final Skin skin;

  const SkinCard({super.key, required this.skin});

  @override
  Widget build(BuildContext context) {
    final color = skin.rarity.color;

    return Container(
      width: 220,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: color, width: 3),
        boxShadow: [
          BoxShadow(
            color: color.withOpacity(0.5),
            blurRadius: 20,
            spreadRadius: 2,
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
    skin.rarity.label,
    style: TextStyle(
      color: color,
      fontWeight: FontWeight.bold,
      letterSpacing: 2,
    ),
  ),
  const SizedBox(height: 12),
  Image.asset(skin.imagePath, height: 140),   // <- this line
  const SizedBox(height: 12),
  Text(
    skin.name,
    style: Theme.of(context).textTheme.titleMedium,
  ),
],
      ),
    );
  }
}


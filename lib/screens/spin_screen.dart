import 'package:flutter/material.dart';
import '../models/skin.dart';
import '../logic/spin_logic.dart';
import '../widgets/skin_card.dart';

class SpinScreen extends StatefulWidget{
  const SpinScreen({super.key});

  @override
  State<SpinScreen>createState() => _SpinScreenState();
}

class _SpinScreenState extends State<SpinScreen>{
  Skin? _currentSkin;
  final List<Skin>_inventory = [];
  bool _isSpinning = false;

  // --- what happens when you press SPIN ---
  Future<void> _spin() async {
     if (_isSpinning) return;
  setState(() => _isSpinning = true);

  try {
    await Future.delayed(const Duration(seconds: 1));
    final skin = rollSkin();
    setState(() {
      _currentSkin = skin;
      _inventory.add(skin);
    });
  } finally {
    setState(() => _isSpinning = false);
  }
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Spin A Kata')),
      body: Column(
        children: [
          const SizedBox(height: 24),

          // the reveal area
          AnimatedSwitcher(
            duration: const Duration(milliseconds: 500),
            transitionBuilder: (child, animation) =>
                ScaleTransition(scale: animation, child: child),
            child: _isSpinning
                ? const CircularProgressIndicator(key: ValueKey('spinning'))
                : (_currentSkin == null
                    ? const Text('Press SPIN!', key: ValueKey('empty'))
                    : SkinCard(
                        key: ValueKey(_currentSkin),
                        skin: _currentSkin!,
                      )),
          ),

          const SizedBox(height: 24),

          // the button
          FilledButton(
            onPressed: _isSpinning ? null : _spin,
            child: const Padding(
              padding: EdgeInsets.symmetric(horizontal: 32, vertical: 12),
              child: Text('SPIN', style: TextStyle(fontSize: 20)),
            ),
          ),

          const SizedBox(height: 16),
          Text('Skins owned: ${_inventory.length}'),
          const SizedBox(height: 16),

          // the inventory grid
          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.all(12),
              gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 180,   // each card is at most 180 wide
                childAspectRatio: 0.8,     // width / height, higher = shorter card
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
              ),
              itemCount: _inventory.length,
              itemBuilder: (context, i) => SkinCard(skin: _inventory[i]),
            ),
          ),
        ],
      ),
    );
  }
}
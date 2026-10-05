import 'dart:math';
import '../models/skin.dart';

const rarityChances = {
  Rarity.common:50,
  Rarity.uncommon:30,
  Rarity.rare:10,
  Rarity.epic:7,
  Rarity.legendary:3
};

final _random = Random();

Skin rollSkin()
{
  final roll=_random.nextInt(100);
  int running = 0;
  Rarity chosen = Rarity.common;

  for (final entry in rarityChances.entries) {
    running += entry.value;
    if (roll < running) {
      chosen = entry.key;
      break;
    }
  } 

  final pool = allSkins.where((s) => s.rarity == chosen).toList();
if (pool.isEmpty) {
  // no skins for this rarity yet, so pick any skin
  return allSkins[_random.nextInt(allSkins.length)];
}
return pool[_random.nextInt(pool.length)];
}
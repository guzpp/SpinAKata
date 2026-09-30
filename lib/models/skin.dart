import 'package:flutter/material.dart';

enum Rarity {
  common,
  uncommon,
  rare,
  epic,
  legendary,
}

class Skin {
  final String name;
  final Rarity rarity;
  final String imagePath;

  const Skin({
    required this.name,
    required this.rarity,
    required this.imagePath,
  });
}

extension RarityInfo on Rarity {
  Color get color{
    switch(this){
      case Rarity.common:
        return const Color.fromARGB(255, 117, 169, 223);
      case Rarity.uncommon:
        return const Color.fromARGB(255, 40, 61, 180);
      case Rarity.rare:
        return const Color.fromARGB(255, 28, 205, 28);
      case Rarity.epic:
        return Colors.purple;
      case Rarity.legendary:
        return const Color.fromARGB(255, 255, 165, 0);
    }
  }
  String get label => name.toUpperCase(); // vrushta enum value s glavni bukvi
}

const allSkins = [
  Skin(name: 'Original Katarina', rarity: Rarity.common, imagePath: 'assets/original-kata.jpeg'),
  Skin(name: 'Sandstorm Katarina', rarity: Rarity.common, imagePath: 'assets/sandstorm-kata.jpeg'),
  Skin(name: 'Red Card Katarina', rarity: Rarity.common, imagePath: 'assets/redcard-kata.jpeg'),
  Skin(name: 'Bilgewater Katarina', rarity: Rarity.common, imagePath: 'assets/bilgewater-kata.jpeg'),
  Skin(name: 'Mercenary Katarina', rarity: Rarity.common, imagePath: 'assets/mercenary-kata.jpeg'),
  Skin(name: 'High Command Katarina', rarity: Rarity.common, imagePath: 'assets/highcommand-kata.jpeg'),
  Skin(name: 'Kitty Cat Katarina', rarity: Rarity.common, imagePath: 'assets/kitty-kata.jpeg'),

  Skin(name: 'PROJECT Katarina', rarity: Rarity.uncommon, imagePath: 'assets/project-kata.jpeg'),
  Skin(name: 'Death Sworn Katarina', rarity: Rarity.uncommon, imagePath: 'assets/deathsworn-kata.jpeg'),
  Skin(name: 'Christmas Katarina', rarity: Rarity.uncommon, imagePath: 'assets/christmas-kata.jpeg'),
  Skin(name: 'Warring Kingdoms Katarina', rarity: Rarity.uncommon, imagePath: 'assets/warringkingdoms-kata.jpeg'),

  Skin(name: 'High Noon Katarina', rarity: Rarity.rare, imagePath: 'assets/highnoon.jpeg'),
  Skin(name: 'Blood Moon Katarina', rarity: Rarity.rare, imagePath: 'assets/bloodmoon-kata.jpeg'),
  Skin(name: 'Petals of Spring Katarina', rarity: Rarity.rare, imagePath: 'assets/petalsofspring-kata.jpeg'),

  Skin(name: 'Battle Academia Katarina', rarity: Rarity.epic, imagePath: 'assets/battleacademia-kata.jpg'),
  Skin(name: 'Chosen of the Wolf Katarina', rarity: Rarity.epic, imagePath: 'assets/chosenofthewolf-kata.jpeg'),
  Skin(name: 'Faerie Court Katarina', rarity: Rarity.epic, imagePath: 'assets/faeriecourt-kata.jpeg'),


  Skin(name: 'Battle Queen Katarina',rarity:Rarity.legendary, imagePath: 'assets/battlequeen-kata.jpeg'),
  Skin(name: 'Prestige Faerie Court Katarina',rarity:Rarity.legendary, imagePath: 'assets/prestigefaeriecourt-kata.jpeg'),
  Skin(name: 'Prestige Chosen of the Wolf Katarina',rarity:Rarity.legendary, imagePath: 'assets/presigewolf-kata.jpeg')


];
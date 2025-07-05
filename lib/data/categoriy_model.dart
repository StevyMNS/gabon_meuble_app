import 'package:flutter/widgets.dart';

class Categorie {
  final int id;
  final String nom;
  final IconData icone;

  Categorie({required this.id, required this.nom, required this.icone});

  Map<String, dynamic> toMap() => {'id': id, 'nom': nom, 'icone': icone};

  factory Categorie.fromMap(Map<String, dynamic> map) =>
      Categorie(id: map['id'], nom: map['nom'], icone: map['icone']);
}

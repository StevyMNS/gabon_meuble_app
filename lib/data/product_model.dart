class Produit {
  final int id;
  final String titre;
  final double prix;
  final String image;
  final String categorie;
  final String? artisanNom;
  final String description;
  final int artisanId;

  Produit({
    required this.id,
    this.artisanNom,
    required this.titre,
    required this.prix,
    required this.image,
    required this.categorie,
    required this.description,
    required this.artisanId,
  });

  Map<String, dynamic> toMap() => {
    'id': id,
    'artisanNom': artisanNom,
    'titre': titre,
    'prix': prix,
    'image': image,
    'categorie': categorie,
    'description': description,
    'artisanId': artisanId,
  };

  factory Produit.fromMap(Map<String, dynamic> map) => Produit(
    id: map['id'],
    artisanNom: map['artisanNom'],
    titre: map['titre'],
    prix: map['prix'],
    image: map['image'],
    categorie: map['categorie'],
    description: map['description'],
    artisanId: map['artisanId'],
  );
}

class Artisan {
  final int id;
  final String nom;
  final String specialite;
  final String ville;
  final String image;

  Artisan({
    required this.id,
    required this.nom,
    required this.specialite,
    required this.ville,
    required this.image,
  });

  Map<String, dynamic> toMap() => {
    'id': id,
    'nom': nom,
    'specialite': specialite,
    'ville': ville,
    'image': image,
  };

  factory Artisan.fromMap(Map<String, dynamic> map) => Artisan(
    id: map['id'],
    nom: map['nom'],
    specialite: map['specialite'],
    ville: map['ville'],
    image: map['image'],
  );
}

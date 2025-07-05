class Commande {
  final int id;
  final int produitId;
  final String statut;
  final String date;

  Commande({
    required this.id,
    required this.produitId,
    required this.statut,
    required this.date,
  });

  Map<String, dynamic> toMap() => {
    'id': id,
    'produitId': produitId,
    'statut': statut,
    'date': date,
  };

  factory Commande.fromMap(Map<String, dynamic> map) => Commande(
    id: map['id'],
    produitId: map['produitId'],
    statut: map['statut'],
    date: map['date'],
  );
}

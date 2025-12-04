class Message {
  final int id;
  final int artisanId;
  final String utilisateur;
  final String contenu;
  final String date;

  Message({
    required this.id,
    required this.artisanId,
    required this.utilisateur,
    required this.contenu,
    required this.date,
  });

  Map<String, dynamic> toMap() => {
    'id': id,
    'artisanId': artisanId,
    'utilisateur': utilisateur,
    'contenu': contenu,
    'date': date,
  };

  factory Message.fromMap(Map<String, dynamic> map) => Message(
    id: map['id'],
    artisanId: map['artisanId'],
    utilisateur: map['utilisateur'],
    contenu: map['contenu'],
    date: map['date'],
  );
}

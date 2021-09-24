

class GenresModel {
  final int id;
  final String name;
  GenresModel({
    required this.id,
    required this.name,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
    };
  }

  factory GenresModel.fromMap(Map<String, dynamic> map) {
    return GenresModel(
      id: map['id'] ?? 0,
      name: map['name'] ?? '',
    );
  }


}

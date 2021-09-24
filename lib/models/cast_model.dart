
class CastModel {
 final String name;
 final String image;
 final String character; 
  CastModel({
    required this.name,
    required this.image,
    required this.character,
  });


  factory CastModel.fromMap(Map<String, dynamic> map) {
    return CastModel(
      name: map['original_name'] ?? '',
      image: 'https://image.tmdb.org/t/p/w500${map['profile_path'] ?? ''}',
      character: map['character'] ?? '',
    );
  }
}

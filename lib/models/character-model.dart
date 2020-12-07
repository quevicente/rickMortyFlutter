class CharacterModel {
  String name, status, species, type, image;

  CharacterModel(this.name, this.status, this.species, this.type, this.image);

  factory CharacterModel.fromJSON(Map<String, dynamic> json) {
    return CharacterModel(json['name'], json['status'], json['species'],
        json['type'], json['image']);
  }
}

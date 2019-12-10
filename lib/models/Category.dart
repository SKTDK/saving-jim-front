class Category {
  int _id;
  String _name;
  String _description;
  String _image;

  Category(this._id, this._name, this._description, this._image);

  Category.fromJson(Map<String, dynamic> json)
      : this._id = json['id'],
        this._name = json['name'],
        this._description = json['description'],
        this._image = json['image'];

  Map<String, dynamic> toJson() => {
        'id': this._id,
        'name': this._name,
        'description': this._description,
        'image': this._image,
      };

  int get id {
    return this._id;
  }

  String get name {
    return this._name;
  }

  String get description {
    return this._description;
  }

  String get image {
    return this._image;
  }
}

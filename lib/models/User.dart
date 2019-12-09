class User {
  // Official Doc for models
  // https://flutter.dev/docs/development/data-and-backend/json
  int _id;
  int _accountType;
  String _firstname;
  String _lastname;
  String _username;
  bool _active;
  String _modifiedOn;
  String _modifiedBy;
  int _version;

  User(
      this._id,
      this._accountType,
      this._firstname,
      this._lastname,
      this._username,
      this._active,
      this._modifiedOn,
      this._modifiedBy,
      this._version);

  User.fromJson(Map<String, dynamic> json)
      : this._id = json['id'],
        this._accountType = json['account_type'],
        this._firstname = json['first_name'],
        this._lastname = json['last_name'],
        this._username = json['username'],
        this._active = json['active'],
        this._modifiedOn = json['modified_on'],
        this._modifiedBy = json['modified_by'],
        this._version = json['version'];

  Map<String, dynamic> toJson() => {
        'id': this._id,
        'account_type': this._accountType,
        'first_name': this._firstname,
        'last_name': this._lastname,
        'username': this._username,
        'active': this._active,
        'modified_on': this._modifiedOn,
        'modified_by': this._modifiedBy,
        'version': this._version,
      };

  int get id {
    return this._id;
  }

  int get accountType {
    return this._accountType;
  }

  String get firstname {
    return this._firstname;
  }

  set firstname(String val) {
    this._firstname = val;
  }

  String get lastname {
    return this._lastname;
  }

  set lastname(String val) {
    this._lastname = val;
  }

  String get username {
    return this._username;
  }

  bool get active {
    return this._active;
  }

  set active(bool val) {
    this._active = val;
  }

  String get modifiedOn {
    return this._modifiedOn;
  }

  String get modifiedBy {
    return this._modifiedBy;
  }

  int get version {
    return this._version;
  }
}

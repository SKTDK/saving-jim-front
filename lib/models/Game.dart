class Game {
  // Official Doc for models
  // https://flutter.dev/docs/development/data-and-backend/json
  int _id;
  int _workerId;
  int _childId;

  Game(
    this._id,
    this._workerId,
    this._childId,
  );

  Game.fromJson(Map<String, dynamic> json)
      : this._id = json['id'],
        this._workerId = json['worker_id'],
        this._childId = json['child_id'];

  Map<String, dynamic> toJson() => {
        'id': this._id,
        'worker_id': this._workerId,
        'child_id': this._childId,
      };

  int get id {
    return this._id;
  }

  int get workerId {
    return this._workerId;
  }

  int get childId {
    return this._childId;
  }
}

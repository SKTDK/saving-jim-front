class Statistic {
  // TODO
  int _accountType;
  int _count;

  Statistic(this._accountType, this._count);

  Statistic.fromJson(Map<String, dynamic> json)
      : this._accountType = json['account_type'],
        this._count = int.parse(json['count']);

  Map<String, dynamic> toJson() => {
        'account_type': this._accountType,
        'count': this._count,
      };

  int get accountType {
    return this._accountType;
  }

  int get count {
    return this._count;
  }
}

class Habit {
  final String id;
  final String categoryId;
  final String name;
  final String description;
  final String image;
  int state;
  bool likedOrNot;
  bool needHelpOrNot;
  bool satisfiedOrNot;

  Habit(
      {this.id,
      this.categoryId,
      this.name,
      this.description,
      this.image,
      this.likedOrNot,
      this.needHelpOrNot,
      this.satisfiedOrNot,
      this.state});
}

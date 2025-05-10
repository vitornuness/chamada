abstract class Model<T> {
  final int? id;

  Model({this.id});

  T copyWith();
  Map<String, dynamic> toMap();
}
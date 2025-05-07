abstract class Model<T> {
  final int id;

  Model({required this.id});

  T copyWith();
  Map<String, dynamic> toMap();
}
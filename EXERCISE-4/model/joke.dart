import 'package:uuid/uuid.dart';

const uuid = Uuid();

class Joke {
  final String id;
  final String title;
  final String description;

  Joke({
    String? id,
    required this.title,
    required this.description
  }) : id = id ?? uuid.v4();
}
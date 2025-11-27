import 'package:flutter/material.dart';
import 'package:myapp/W9-Flutter-Lab/EXERCISE-4/data/joke.data.dart';
import 'package:myapp/W9-Flutter-Lab/EXERCISE-4/model/joke.dart';
import 'package:myapp/W9-Flutter-Lab/EXERCISE-4/ui/joke.ui.dart';

Color appColor = Colors.green[300] as Color;

void main() => runApp(MaterialApp(
  home: JokeApp(jokes: jokes),
));

class JokeApp extends StatefulWidget {
  final List<Joke> jokes;

  const JokeApp({
    super.key,
    required this.jokes
  });

  @override
  State<JokeApp> createState() => _JokeAppState();
}

class _JokeAppState extends State<JokeApp> {
  String? currentFavJokeId;

  void saveAsFavorite(String jokeId) {
    setState(() {
      currentFavJokeId = currentFavJokeId == null ? jokeId : currentFavJokeId == jokeId ? null : jokeId;
    });
  }

  List<JokeCard> getJokeCards() {
    return widget.jokes.map((joke) => JokeCard(
      id: joke.id, 
      title: joke.title, 
      description: joke.description, 
      callback: saveAsFavorite, 
      isFavorite: currentFavJokeId == joke.id,
    )).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: appColor,
        title: const Text("Favorite Jokes"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ...getJokeCards()
          ],
        ),
      ),
    );
  }
}

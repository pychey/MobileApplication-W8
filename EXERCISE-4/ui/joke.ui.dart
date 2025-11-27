import 'package:flutter/material.dart';
import '../main.dart';

class JokeCard extends StatelessWidget {
  final String id;
  final String title;
  final String description;
  final Function(String) callback;
  final bool isFavorite;

  const JokeCard({
    super.key,
    required this.id,
    required this.title,
    required this.description,
    required this.callback,
    required this.isFavorite
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(width: .5, color: Colors.grey),
        ),
      ),
      padding: const EdgeInsets.fromLTRB(10, 20, 10, 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
           Expanded(
            flex: 7,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                      color: appColor, fontWeight: FontWeight.w800),
                ),
                const SizedBox(height: 10.0),
                Text(description)
              ],
            ),
          ),
          IconButton(
              onPressed: () => callback(id),
              icon: Icon(
                isFavorite ? Icons.favorite : Icons.favorite_border,
                color: isFavorite ? Colors.red : Colors.grey,
              ))
        ],
      ),
    );
  }
}
import 'package:flutter_task/models/game.dart';

class GameSection {
  String sectionTitle;
  int totalItems;
  List<Game> gamesAvailable;

  GameSection({
    required this.sectionTitle,
    required this.totalItems,
    required this.gamesAvailable,
  });
}

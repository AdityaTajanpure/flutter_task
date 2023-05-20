import 'package:flutter_task/models/game_section.dart';

class MockData {
  static List<String> names = [
    'Rohit',
    'Pratik',
    'Shruti',
    'Ishank',
    'Ishana',
    'Hem',
    'Navya',
    'Dasya',
    'Krishna',
    'Aaisha',
    'Dhruv',
    'Aish',
    'Kabir',
    'Rebecca',
    'Larisa',
    'Anaisha'
  ];

  static List<GameSection> gameSections = [
    GameSection(sectionTitle: 'Most Popular', totalItems: 15, gamesAvailable: []),
    GameSection(sectionTitle: 'Playtech Live', totalItems: 103, gamesAvailable: []),
    GameSection(sectionTitle: 'Live Roulette', totalItems: 45, gamesAvailable: []),
    GameSection(sectionTitle: 'Live Blackjack', totalItems: 133, gamesAvailable: []),
    GameSection(sectionTitle: 'Live Baccarat', totalItems: 74, gamesAvailable: []),
    GameSection(sectionTitle: 'Live Dealer', totalItems: 33, gamesAvailable: []),
    GameSection(sectionTitle: 'Live Lobby', totalItems: 20, gamesAvailable: []),
    GameSection(sectionTitle: 'Play\'n Go', totalItems: 269, gamesAvailable: []),
  ];
}

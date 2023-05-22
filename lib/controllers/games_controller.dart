import 'package:flutter_task/mock_data.dart';
import 'package:flutter_task/models/game.dart';
import 'package:flutter_task/models/game_section.dart';
import 'package:get/state_manager.dart';

class GamesController extends GetxController {
  var activeSection = [].obs;
  var sections = <GameSection>[].obs;

  @override
  void onInit() {
    sections.addAll(MockData.gameSections);
    sections.forEach((element) {
      element.gamesAvailable.addAll(
        List.generate(
            4, (index) => Game(logo: 'assets/images/card.webp', minWin: '100', maxWin: '100k')),
      );
    });
    super.onInit();
  }

  setActiveSection(String title) {
    if (activeSection.contains(title)) {
      var section = sections.firstWhere((e) => e.sectionTitle == title);
      section.gamesAvailable.removeRange(4, section.gamesAvailable.length);
      activeSection.remove(title);
      return;
    }
    activeSection.add(title);
    var section = sections.firstWhere((e) => e.sectionTitle == title);
    section.gamesAvailable.addAll(
      List.generate(
        section.totalItems - 4,
        (index) => Game(logo: 'assets/images/card.webp', minWin: '100', maxWin: '100k'),
      ),
    );
  }
}

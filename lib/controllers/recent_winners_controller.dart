import 'dart:async';
import 'dart:math';

import 'package:flutter_task/mock_data/mock_data.dart';
import 'package:flutter_task/models/user.dart';
import 'package:get/state_manager.dart';

class RecentWinnersController extends GetxController {
  var displayUsers = <User>[].obs;
  var totalPointsEarnedTillNow = 8888888.obs;
  late Timer _t;

  @override
  void onInit() {
    super.onInit();
    getRecentWinners();
    _t = Timer.periodic(const Duration(seconds: 1), (timer) {
      totalPointsEarnedTillNow.value++;
    });
  }

  @override
  void onClose() {
    _t.cancel();
    super.onClose();
  }

  getRecentWinners() {
    displayUsers.clear();
    Random random = Random();
    MockData.names.shuffle();
    var users = MockData.names.take(4);
    for (var userName in users) {
      int amount = random.nextInt(10000) + 1000;
      int time = random.nextInt(10);
      displayUsers.add(User(name: userName, amountWon: amount, timeAgo: time));
    }
  }
}

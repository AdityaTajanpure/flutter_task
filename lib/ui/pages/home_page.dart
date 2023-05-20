import 'package:flutter/material.dart';
import 'package:flutter_task/controllers/games_controller.dart';
import 'package:flutter_task/controllers/recent_winners_controller.dart';
import 'package:flutter_task/styles/colors.dart';
import 'package:flutter_task/ui/widgets/bottom_nav_bar.dart';
import 'package:flutter_task/ui/widgets/common_app_bar.dart';
import 'package:flutter_task/ui/widgets/custom_carousel.dart';
import 'package:flutter_task/ui/widgets/bottom_section.dart';
import 'package:flutter_task/ui/widgets/jackpot_counter.dart';
import 'package:flutter_task/ui/widgets/language_picker.dart';
import 'package:flutter_task/ui/widgets/promotion_video_widget.dart';
import 'package:flutter_task/ui/widgets/recent_winners.dart';
import 'package:get/get.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    Get.put(RecentWinnersController());
    Get.put(GamesController());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.accentColor,
      appBar: CommonAppBar(),
      bottomNavigationBar: BottomNavBar(),
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) => [
          SliverList(
            delegate: SliverChildListDelegate(
              [
                CustomCarousel(),
                const SizedBox(height: 20),
                LanguagePicker(),
                const SizedBox(height: 40),
                JackpotCounter(),
                RecentWinners(),
                PromotionVideoWidget(),
                const SizedBox(height: 40),
              ],
            ),
          ),
        ],
        body: BottomSection(),
      ),
    );
  }
}

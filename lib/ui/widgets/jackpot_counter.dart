import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_task/controllers/recent_winners_controller.dart';
import 'package:flutter_task/styles/colors.dart';
import 'package:flutter_task/utils/extensions.dart';
import 'package:get/instance_manager.dart';
import 'package:get/state_manager.dart';

class JackpotCounter extends StatefulWidget {
  const JackpotCounter({Key? key}) : super(key: key);

  @override
  State<JackpotCounter> createState() => _JackpotCounterState();
}

class _JackpotCounterState extends State<JackpotCounter> {
  RecentWinnersController _recentWinnersController = Get.find();
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Stack(
        children: [
          SizedBox(
            height: 30.h,
            width: 100.w,
          ),
          Image.asset('assets/images/jackpot_counter.png'),
          Positioned(
            top: 9.2.h,
            left: 20.2.w,
            child: Obx(
              () => Text(
                _recentWinnersController.totalPointsEarnedTillNow
                    .toString()
                    .splitMapJoin('', onMatch: ((p0) => "  "))
                    .trim(),
                style: const TextStyle(
                  color: Color(0xFFbe1e2d),
                  fontSize: 34,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 30,
            left: 0,
            right: 0,
            child: Center(
              child: ShaderMask(
                shaderCallback: (bounds) {
                  const gradient = LinearGradient(
                    colors: [
                      AppColors.accentColor3,
                      Colors.white,
                    ],
                    stops: [0.4, 1.0],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  );

                  return gradient.createShader(bounds);
                },
                child: const Text(
                  'Live Withdrawals',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 2.5.h,
            left: 20.w,
            right: 20.w,
            child: Container(
              width: 30.w,
              height: .5.h,
              color: AppColors.accentColor2,
            ),
          ),
        ],
      ),
    );
  }
}

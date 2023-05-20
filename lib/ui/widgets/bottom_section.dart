import 'package:flutter/material.dart';
import 'package:flutter_task/styles/colors.dart';
import 'package:flutter_task/ui/widgets/games_section.dart';
import 'package:flutter_task/utils/extensions.dart';

class BottomSection extends StatefulWidget {
  const BottomSection({Key? key}) : super(key: key);

  @override
  State<BottomSection> createState() => _BottomSectionState();
}

class _BottomSectionState extends State<BottomSection> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          ShaderMask(
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
              'Games',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
          const SizedBox(height: 10),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.w),
            child: Container(
              width: 40.w,
              height: .5.h,
              color: AppColors.accentColor2,
            ),
          ),
          const SizedBox(height: 20),
          GamesSection(),
        ],
      ),
    );
  }
}

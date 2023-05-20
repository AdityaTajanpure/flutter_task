import 'package:flutter/material.dart';
import 'package:flutter_task/controllers/games_controller.dart';
import 'package:flutter_task/styles/colors.dart';
import 'package:flutter_task/utils/extensions.dart';
import 'package:get/instance_manager.dart';
import 'package:get/state_manager.dart';

class GamesSection extends StatefulWidget {
  const GamesSection({Key? key}) : super(key: key);

  @override
  State<GamesSection> createState() => _GamesSectionState();
}

class _GamesSectionState extends State<GamesSection> {
  final GamesController _gamesController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Obx(
        () => ListView.builder(
            scrollDirection: Axis.vertical,
            itemCount: _gamesController.sections.length,
            itemBuilder: (context, sectionIdx) {
              return Column(
                children: [
                  const SizedBox(height: 15),
                  Row(
                    children: [
                      Container(
                        width: 1.w,
                        height: 5.h,
                        color: AppColors.accentColor3,
                      ),
                      const SizedBox(width: 15),
                      Text(
                        _gamesController.sections[sectionIdx].sectionTitle,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                        ),
                      ),
                      const SizedBox(width: 5),
                      Text(
                        '(${_gamesController.sections[sectionIdx].totalItems})',
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                        ),
                      ),
                      const Spacer(),
                      InkWell(
                        onTap: () {
                          _gamesController
                              .setActiveSection(_gamesController.sections[sectionIdx].sectionTitle);
                          setState(() {});
                        },
                        child: Container(
                          height: 5.h,
                          width: 25.w,
                          decoration: BoxDecoration(
                            gradient: const LinearGradient(
                              colors: [
                                AppColors.accentColor2,
                                AppColors.accentColor3,
                                AppColors.accentColor3,
                              ],
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                            ),
                            borderRadius: BorderRadius.circular(6),
                          ),
                          alignment: Alignment.center,
                          child: Text(
                            _gamesController.activeSection
                                    .contains(_gamesController.sections[sectionIdx].sectionTitle)
                                ? 'Show Less'
                                : 'Show More',
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  GridView.builder(
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: _gamesController.sections[sectionIdx].gamesAvailable.length,
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2, // Number of columns
                      crossAxisSpacing: 10.0, // Spacing between columns
                      mainAxisSpacing: 10.0, // Spacing between rows
                      childAspectRatio: 16 / 13,
                    ),
                    itemBuilder: (context, gameIdx) {
                      var game = _gamesController.sections[sectionIdx].gamesAvailable[gameIdx];
                      return Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: AppColors.accentColor2,
                          ),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(2),
                          child: Column(
                            children: [
                              SizedBox(
                                child: Image.asset(
                                  game.logo,
                                ),
                              ),
                              Container(
                                width: 45.w,
                                height: 5.w,
                                color: const Color(0xFF5a0069),
                                child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                                  RichText(
                                    text: TextSpan(
                                      children: [
                                        const TextSpan(
                                          text: 'Min.',
                                          style: TextStyle(
                                            fontSize: 12,
                                          ),
                                        ),
                                        const TextSpan(
                                          text: '₹',
                                          style: TextStyle(
                                            color: AppColors.accentColor2,
                                            fontSize: 11,
                                          ),
                                        ),
                                        TextSpan(
                                          text: game.minWin,
                                          style: const TextStyle(
                                            fontSize: 12,
                                          ),
                                        )
                                      ],
                                    ),
                                    overflow: TextOverflow.fade,
                                  ),
                                  const VerticalDivider(
                                    color: AppColors.accentColor2,
                                  ),
                                  RichText(
                                    text: TextSpan(
                                      children: [
                                        const TextSpan(
                                          text: 'Max.',
                                          style: TextStyle(
                                            fontSize: 12,
                                          ),
                                        ),
                                        const TextSpan(
                                          text: '₹',
                                          style: TextStyle(
                                            color: AppColors.accentColor2,
                                            fontSize: 11,
                                          ),
                                        ),
                                        TextSpan(
                                          text: game.maxWin,
                                          style: const TextStyle(
                                            fontSize: 12,
                                          ),
                                        )
                                      ],
                                    ),
                                    overflow: TextOverflow.fade,
                                  ),
                                ]),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ],
              );
            }),
      ),
    );
  }
}

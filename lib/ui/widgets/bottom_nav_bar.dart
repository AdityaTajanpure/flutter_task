import 'package:flutter/material.dart';
import 'package:flutter_task/styles/colors.dart';
import 'package:flutter_task/ui/clippers/rect_clipper.dart';
import 'package:flutter_task/utils/extensions.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({Key? key}) : super(key: key);

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  final List<String> items = ['Sports', 'Live Casino', 'Table Games', 'Poker'];
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 12.h,
      color: Colors.transparent,
      child: Stack(
        children: [
          SizedBox(height: 12.h),
          Positioned(
            bottom: 0,
            child: Container(
              color: AppColors.accentColor,
              height: 9.h,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ClipPath(
                    clipper: RectClipper(left: true),
                    child: Container(
                      width: 25.w,
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            AppColors.accentColor2,
                            AppColors.accentColor3,
                            AppColors.accentColor3,
                          ],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                        ),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Icon(
                            Icons.support_agent,
                            color: Colors.white,
                          ),
                          Text(
                            'Support',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 50.w,
                    child: ListView.builder(
                      itemCount: items.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) => Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              index.isEven
                                  ? Icons.control_point_duplicate_sharp
                                  : Icons.rotate_90_degrees_cw_outlined,
                              color: Colors.white,
                            ),
                            Text(
                              items[index],
                              style: const TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  ClipPath(
                    clipper: RectClipper(right: true),
                    child: Container(
                      width: 25.w,
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            AppColors.accentColor2,
                            AppColors.accentColor3,
                            AppColors.accentColor3,
                          ],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                        ),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Icon(
                            Icons.app_registration_rounded,
                            color: Colors.white,
                          ),
                          Text(
                            'Register',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.topCenter,
            child: Container(
              width: 8.w,
              height: 8.w,
              decoration: BoxDecoration(
                color: AppColors.accentColor3,
                borderRadius: BorderRadius.circular(4.w),
              ),
              child: const Icon(
                Icons.add,
                color: Colors.black,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

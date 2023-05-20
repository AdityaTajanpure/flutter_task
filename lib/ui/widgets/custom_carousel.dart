import 'dart:async';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_task/styles/colors.dart';
import 'package:flutter_task/utils/extensions.dart';

class CustomCarousel extends StatefulWidget {
  const CustomCarousel({Key? key}) : super(key: key);

  @override
  State<CustomCarousel> createState() => _CustomCarouselState();
}

class _CustomCarouselState extends State<CustomCarousel> {
  final PageController _pageController = PageController();
  final int _totalItems = 3;
  int _currentPageIndex = 0;
  late Timer t;

  @override
  void initState() {
    super.initState();
    t = Timer.periodic(const Duration(seconds: 5), (timer) {
      if (_currentPageIndex == _totalItems - 1) {
        _pageController.jumpToPage(
          0,
        );
      } else {
        _pageController.nextPage(
          duration: const Duration(milliseconds: 500),
          curve: Curves.easeIn,
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 35.h,
          width: 95.w,
          child: PageView.builder(
            controller: _pageController,
            onPageChanged: (index) {
              setState(() {
                _currentPageIndex = index;
              });
            },
            itemCount: _totalItems,
            itemBuilder: (_, index) {
              return Image.asset('assets/images/banner_${index + 1}.jpg');
            },
          ),
        ),
        DotsIndicator(
          dotsCount: _totalItems,
          position: _currentPageIndex,
          decorator: DotsDecorator(
            size: const Size(16.0, 2.0),
            activeSize: const Size(16.0, 2.0),
            color: AppColors.inactiveGrey.withOpacity(0.5),
            shape: const RoundedRectangleBorder(),
            activeColor: AppColors.accentColor3,
            spacing: const EdgeInsets.all(4.0),
            activeShape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(2.0),
            ),
          ),
        ),
      ],
    );
  }

  @override
  void dispose() {
    t.cancel();
    super.dispose();
  }
}

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_task/controllers/recent_winners_controller.dart';
import 'package:flutter_task/models/user.dart';
import 'package:flutter_task/styles/colors.dart';
import 'package:flutter_task/utils/extensions.dart';
import 'package:get/get.dart';

class RecentWinners extends StatefulWidget {
  const RecentWinners({Key? key}) : super(key: key);

  @override
  State<RecentWinners> createState() => _RecentWinnersState();
}

class _RecentWinnersState extends State<RecentWinners> {
  final RecentWinnersController _recentWinnersController = Get.find();
  late Timer t;

  @override
  void initState() {
    super.initState();
    t = Timer.periodic(const Duration(seconds: 2), (timer) {
      _recentWinnersController.getRecentWinners();
    });
  }

  @override
  void dispose() {
    t.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 25.h,
      child: Obx(
        () => Stack(
          children: [
            Image.asset(
              'assets/images/withdrawal_board.png',
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 15.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  _WithdrawRow(
                    users: _recentWinnersController.displayUsers.take(2).toList(),
                  ),
                  const SizedBox(height: 10),
                  _WithdrawRow(
                      users: _recentWinnersController.displayUsers.skip(2).take(2).toList()),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _WithdrawRow extends StatelessWidget {
  final List<User> users;
  const _WithdrawRow({
    Key? key,
    required this.users,
  })  : assert(users.length == 2),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _WithdrawItem(user: users.first),
        _WithdrawItem(user: users.last),
      ],
    );
  }
}

class _WithdrawItem extends StatelessWidget {
  const _WithdrawItem({
    Key? key,
    required this.user,
  }) : super(key: key);

  final User user;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Row(
        children: [
          Container(
            width: 11.w,
            height: 11.w,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(6.w),
              border: Border.all(
                color: const Color(0xFFd57f23),
                width: 3,
              ),
            ),
            alignment: Alignment.center,
            child: const Icon(
              Icons.account_circle_outlined,
              color: Colors.white,
            ),
          ),
          const SizedBox(width: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: '${user.name} ',
                      style: const TextStyle(
                        fontSize: 13,
                      ),
                    ),
                    const TextSpan(
                      text: '₹ ',
                      style: TextStyle(
                        color: AppColors.accentColor2,
                      ),
                    ),
                    TextSpan(
                      text: '${user.amountWon}',
                      style: const TextStyle(
                        fontSize: 13,
                      ),
                    )
                  ],
                ),
                overflow: TextOverflow.fade,
              ),
              Text(
                '${user.timeAgo} seconds ago',
                style: TextStyle(
                  color: Colors.white.withOpacity(0.5),
                  fontSize: 12,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

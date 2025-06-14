import 'package:flutter/material.dart';

class CustomTapBar extends StatelessWidget {
  const CustomTapBar({super.key, required this.numOfFriendReq});

  final int numOfFriendReq;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primary,
        borderRadius: BorderRadius.circular(25),
      ),
      child: TabBar(
        indicatorSize: TabBarIndicatorSize.tab,
        dividerColor: Colors.transparent,
        indicator: BoxDecoration(
          color: Theme.of(context).colorScheme.secondary,
          borderRadius: BorderRadius.circular(12),
        ),
        tabs: [
          Tab(icon: Icon(Icons.message)),
          Tab(icon: Icon(Icons.person_add_alt_1_rounded)),
          Tab(
            icon: Badge(
              label:
                  numOfFriendReq > 0 ? Text(numOfFriendReq.toString()) : null,
              backgroundColor: Colors.red,
              child: Icon(Icons.group),
            ),
          ),
        ],
      ),
    );
  }
}

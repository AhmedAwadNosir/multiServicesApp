import 'dart:async';

import 'package:flutter/material.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';
import 'package:multiservices_app/core/utils/widgets/test_language_and_thiming_widget.dart';
import 'package:multiservices_app/features/home/books/presentation/wedgits/books_view_body.dart';
import 'package:multiservices_app/features/home/notes/presentation/views/notes_view.dart';
import 'package:multiservices_app/features/home/presentation/widgets/chat_view_body.dart';
import 'package:multiservices_app/features/home/news/presentation/views/news_view_body.dart';
import 'package:multiservices_app/features/home/presentation/widgets/no_internet_conection_widget.dart';
import 'package:multiservices_app/features/home/presentation/widgets/user_data_app_barr.dart';
import 'package:multiservices_app/generated/l10n.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});
  static const id = "homeView";

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  bool isConectedToTheInternet = true;
  StreamSubscription? _internetConectionStreamSubscribtion;

  List<Widget> pages = [
    BooksViewBody(),
    NewsViewBody(),
    ChatViewBody(),
    NotesView(),
  ];
  int selectedIndex = 0;
  @override
  void initState() {
    _internetConectionStreamSubscribtion = InternetConnection().onStatusChange
        .listen((event) {
          switch (event) {
            case InternetStatus.connected:
              setState(() {
                isConectedToTheInternet = true;
              });
              break;
            case InternetStatus.disconnected:
              setState(() {
                isConectedToTheInternet = false;
              });
              break;
          }
        });
    super.initState();
  }

  @override
  void dispose() {
    _internetConectionStreamSubscribtion?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenHight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: Column(
          children: [
            TestLnaguageAndThimingWidget(),
            // SizedBox(height: screenHight * 0.05),
            UserDataAppBarr(),
            selectedIndex != 3
                ? isConectedToTheInternet
                    ? SizedBox(
                      height: screenHight * 0.775,
                      child: pages[selectedIndex],
                    )
                    : SizedBox(
                      height: screenHight * 0.775,
                      child: NoInternetConectionWidget(),
                    )
                : SizedBox(
                  height: screenHight * 0.775,
                  child: pages[selectedIndex],
                ),
          ],
        ),
      ),
      bottomNavigationBar: ConvexAppBar(
        activeColor: Theme.of(context).colorScheme.primary,
        backgroundColor: Theme.of(context).colorScheme.surface,
        color: Theme.of(context).colorScheme.primary,
        curve: Curves.easeInBack,
        shadowColor: Colors.transparent,
        style: TabStyle.reactCircle,
        initialActiveIndex: selectedIndex,
        onTap: (index) {
          selectedIndex = index;
          setState(() {});
        },
        items: [
          TabItem(icon: Icons.book_outlined, title: S.of(context).books),
          TabItem(icon: Icons.newspaper_outlined, title: S.of(context).news),
          TabItem(icon: Icons.chat_outlined, title: S.of(context).chat),
          TabItem(icon: Icons.note_alt_outlined, title: S.of(context).notes),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:multiservices_app/features/home/presentation/widgets/custom_book_card.dart';

class TopBooksListViewBuilder extends StatelessWidget {
  const TopBooksListViewBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.25,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 10,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(left: 8, right: 8, top: 15),
            child: CustomBookCard(),
          );
        },
      ),
    );
  }
}

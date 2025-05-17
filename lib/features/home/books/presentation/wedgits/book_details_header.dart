import 'package:flutter/material.dart';

import '../views/book_details_view.dart';

class BookDetailsHeader extends StatelessWidget {
  const BookDetailsHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 30, right: 30, top: 32, bottom: 28),
      child: Row(
        children: [
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(
              Icons.close,
              size: 30,
              color: Theme.of(context).colorScheme.secondary,
            ),
          ),
          const Spacer(),
          Icon(
            Icons.shopping_cart_outlined,
            color: Theme.of(context).colorScheme.secondary,
            size: 30,
          ),
        ],
      ),
    );
  }
}

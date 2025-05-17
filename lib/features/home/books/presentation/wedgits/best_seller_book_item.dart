import 'dart:developer';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:multiservices_app/features/home/books/data/models/BookModel.dart';
import 'package:multiservices_app/features/home/books/presentation/views/book_details_view.dart';
import 'package:multiservices_app/l10n/localization_provider.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class BestSellerBookItem extends StatelessWidget {
  const BestSellerBookItem({super.key, required this.book});
  final BookModel book;

  @override
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => BookDetailsView(book: book)),
        );
      },
      child: Row(
        children: [
          Padding(
            padding: EdgeInsets.only(
              right:
                  Provider.of<LocalizationProvider>(context).locale ==
                          Locale('ar')
                      ? 0
                      : 32,
              left:
                  Provider.of<LocalizationProvider>(context).locale ==
                          Locale('ar')
                      ? 32
                      : 0,
              bottom: 4,
            ),
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(
                  width: 2,
                  color: Theme.of(context).colorScheme.primary,
                ),
                borderRadius: BorderRadius.circular(20),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),

                child: SizedBox(
                  height: 135,
                  child: AspectRatio(
                    aspectRatio: 112.5 / 168,
                    child: CachedNetworkImage(
                      fit: BoxFit.fill,
                      errorWidget: (context, _, __) {
                        return const Icon(Icons.error, color: Colors.white);
                      },
                      imageUrl: "${book.image}",
                    ),
                  ),
                ),
              ),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: 230,
                height: 60,
                child: Text(
                  book.headline ?? " ",

                  overflow: TextOverflow.clip,
                  style: const TextStyle(fontSize: 22),
                ),
              ),
              SizedBox(
                width: 230,
                child: Text(
                  book.author ?? " ",
                  overflow: TextOverflow.ellipsis,
                  softWrap: false,
                  style: const TextStyle(fontSize: 14, color: Colors.grey),
                ),
              ),
              Row(
                children: [
                  Text("${book.price}\$", style: const TextStyle(fontSize: 22)),
                  const SizedBox(width: 15),
                  const Icon(Icons.star, color: Colors.yellow),
                  Text("${book.rating}", style: const TextStyle(fontSize: 22)),
                  Text(
                    "(${book.ratingCount})",
                    style: TextStyle(
                      fontSize: 14,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}

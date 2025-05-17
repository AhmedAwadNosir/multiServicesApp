import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:multiservices_app/features/home/books/data/models/BookModel.dart';
import 'package:multiservices_app/l10n/localization_provider.dart';
import 'package:provider/provider.dart';

class BottomRelatedBooksItem extends StatelessWidget {
  const BottomRelatedBooksItem({super.key, required this.book});
  final BookModel book;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: 10,
        left:
            Provider.of<LocalizationProvider>(context).locale == Locale('en')
                ? 12
                : 0,
        right:
            Provider.of<LocalizationProvider>(context).locale == Locale('ar')
                ? 12
                : 0,
      ),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(
            color: Theme.of(context).colorScheme.primary,
            width: 2,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: SizedBox(
            width: 110,
            child: AspectRatio(
              aspectRatio: 85 / 150,
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
    );
  }
}

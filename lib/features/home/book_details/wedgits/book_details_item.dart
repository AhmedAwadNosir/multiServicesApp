import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:multiservices_app/features/home/data/models/BookModel.dart';
import 'package:multiservices_app/generated/l10n.dart';
import 'package:multiservices_app/l10n/localization_provider.dart';
import 'package:provider/provider.dart';

class BookDetailsItem extends StatefulWidget {
  const BookDetailsItem({super.key, required this.bookDetails});
  final BookModel bookDetails;

  @override
  State<BookDetailsItem> createState() => _BookDetailsItemState();
}

class _BookDetailsItemState extends State<BookDetailsItem> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: width * 0.25),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: SizedBox(
              child: AspectRatio(
                aspectRatio: 168 / 243,
                child: CachedNetworkImage(
                  fit: BoxFit.fill,
                  errorWidget: (context, _, __) {
                    return const Icon(Icons.error);
                  },
                  imageUrl: "${widget.bookDetails.image}",
                ),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 30, bottom: 8),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: width * 0.05),
            child: Text(
              "${widget.bookDetails.headline}",
              textAlign: TextAlign.center,
              softWrap: true,
              style: TextStyle(
                fontSize: 30,
                color: Theme.of(context).colorScheme.secondary,
              ),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(bottom: 10),
          child: Text(
            "${widget.bookDetails.author}",
            style: TextStyle(
              fontSize: 24,
              color: Theme.of(context).colorScheme.primary,
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.star, color: Colors.yellow),
            const SizedBox(width: 3),
            Text(
              "${widget.bookDetails.rating}  (${widget.bookDetails.ratingCount})",
              style: TextStyle(
                color: Theme.of(context).colorScheme.secondary,
                fontSize: 16,
              ),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(top: 37),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Provider.of<LocalizationProvider>(context).locale == Locale('en')
                  ? Container(
                    height: 50,
                    width: 150,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(18),
                        bottomLeft: Radius.circular(18),
                      ),
                      color: Theme.of(context).colorScheme.primary,
                    ),
                    child: Center(
                      child: Text(
                        "${widget.bookDetails.price}\$",
                        style: TextStyle(
                          fontSize: 18,
                          color: Theme.of(context).colorScheme.secondary,
                        ),
                      ),
                    ),
                  )
                  : SizedBox(),
              Container(
                height: 50,
                width: 150,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(18),
                    bottomRight: Radius.circular(18),
                  ),
                  color: Theme.of(context).colorScheme.tertiary,
                ),
                child: Center(
                  child: Text(
                    S.of(context).FreePreview,
                    style: TextStyle(
                      fontSize: 18,
                      color: Theme.of(context).colorScheme.surface,
                    ),
                  ),
                ),
              ),
              Provider.of<LocalizationProvider>(context).locale == Locale('ar')
                  ? Container(
                    height: 50,
                    width: 150,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(18),
                        bottomLeft: Radius.circular(18),
                      ),
                      color: Theme.of(context).colorScheme.primary,
                    ),
                    child: Center(
                      child: Text(
                        "${widget.bookDetails.price}\$",
                        style: TextStyle(
                          fontSize: 18,
                          color: Theme.of(context).colorScheme.secondary,
                        ),
                      ),
                    ),
                  )
                  : SizedBox(),
            ],
          ),
        ),
      ],
    );
  }
}

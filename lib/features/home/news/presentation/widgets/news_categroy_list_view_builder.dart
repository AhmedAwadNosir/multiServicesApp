import 'package:flutter/material.dart';
import 'package:multiservices_app/core/utils/app_images.dart';
import 'package:multiservices_app/features/home/news/data/models/news_category_modal.dart';
import 'package:multiservices_app/features/home/news/presentation/widgets/news_category_card.dart';
import 'package:multiservices_app/generated/l10n.dart';

class NewsCategorysListViewBuilder extends StatelessWidget {
  const NewsCategorysListViewBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    List<NewsCategoryModal> categories = [
      NewsCategoryModal(
        categoryCoverImage: AppImages.buniss,
        categoryTitle: S.of(context).Business,
      ),
      NewsCategoryModal(
        categoryCoverImage: AppImages.entertainment,
        categoryTitle: S.of(context).Entertainment,
      ),
      NewsCategoryModal(
        categoryCoverImage: AppImages.health,
        categoryTitle: S.of(context).Health,
      ),
      NewsCategoryModal(
        categoryCoverImage: AppImages.science,
        categoryTitle: S.of(context).Science,
      ),
      NewsCategoryModal(
        categoryCoverImage: AppImages.sports,
        categoryTitle: S.of(context).Sports,
      ),
    ];
    return SizedBox(
      height: 110,
      child: ListView.builder(
        itemCount: categories.length,
        scrollDirection: Axis.horizontal,
        itemBuilder:
            (context, index) => Padding(
              padding: const EdgeInsets.only(right: 18),
              child: NewsCategoryCard(categoryModal: categories[index]),
            ),
      ),
    );
  }
}

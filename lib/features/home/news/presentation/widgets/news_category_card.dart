import 'package:flutter/material.dart';
import 'package:multiservices_app/features/home/news/data/models/news_category_modal.dart';
import 'package:multiservices_app/features/home/news/presentation/views/category_view.dart';

class NewsCategoryCard extends StatelessWidget {
  const NewsCategoryCard({super.key, required this.categoryModal});
  final NewsCategoryModal categoryModal;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder:
                (context) =>
                    CategoryView(category: categoryModal.categoryTitle),
          ),
        );
      },
      child: Container(
        alignment: Alignment.center,
        height: 110,
        width: 160,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          image: DecorationImage(
            fit: BoxFit.fill,
            image: AssetImage(categoryModal.categoryCoverImage),
          ),
        ),
        child: Text(
          categoryModal.categoryTitle,
          style: TextStyle(
            fontSize: 22,
            color: Colors.cyanAccent,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
    );
  }
}

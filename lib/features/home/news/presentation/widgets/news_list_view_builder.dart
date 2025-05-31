import 'package:flutter/material.dart';
import 'package:multiservices_app/features/home/news/data/Models/news_modal.dart';
import 'package:multiservices_app/features/home/news/presentation/widgets/news_card.dart';

class NewsListViewBuilder extends StatelessWidget {
  const NewsListViewBuilder({
    super.key,
    required this.news,
    required this.physics,
  });
  final ScrollPhysics physics;
  final List<NewsModal> news;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: news.length,
      physics: physics,
      shrinkWrap: true,
      itemBuilder:
          (context, index) => Padding(
            padding: const EdgeInsets.only(bottom: 18),
            child: NewsCard(newsModal: news[index]),
          ),
    );
  }
}

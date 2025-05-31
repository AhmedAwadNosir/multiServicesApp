import 'dart:developer';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:multiservices_app/core/utils/app_images.dart';
import 'package:multiservices_app/features/home/news/data/Models/news_modal.dart';
import 'package:multiservices_app/features/home/news/functions/url_luncher.dart';

class NewsCard extends StatelessWidget {
  const NewsCard({super.key, required this.newsModal});
  final NewsModal newsModal;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        log(newsModal.url);
        await urlLuncher(newsModal.url);
      },
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(4),
            child: CachedNetworkImage(
              imageUrl: newsModal.urlToImage,
              height: 200,
              width: double.infinity,
              fit: BoxFit.fill,
              errorWidget: (context, url, error) {
                return Image.asset(
                  AppImages.noImageAvailable,
                  height: 200,
                  width: double.infinity,
                  fit: BoxFit.fill,
                );
              },
            ),
          ),
          const SizedBox(height: 12),
          Text(
            newsModal.title,
            softWrap: true,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
          ),
          const SizedBox(height: 8),
          Text(
            newsModal.description,
            softWrap: true,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(fontSize: 14, color: Colors.grey),
          ),
        ],
      ),
    );
  }
}

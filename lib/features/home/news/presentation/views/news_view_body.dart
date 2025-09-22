import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:multiservices_app/features/home/news/data/models/news_filter_options_modal.dart';
import 'package:multiservices_app/features/home/news/functions/open_news_filter_dialog.dart';
import 'package:multiservices_app/features/home/news/presentation/widgets/news_categroy_list_view_builder.dart';
import 'package:multiservices_app/features/home/news/presentation/widgets/news_list_view_bloc_builder.dart';
import 'package:multiservices_app/features/home/news/presentation/widgets/news_logo.dart';
import 'package:multiservices_app/features/home/news/states_manager/get_news/get_news_cubit.dart';
import 'package:multiservices_app/generated/l10n.dart';

class NewsViewBody extends StatefulWidget {
  const NewsViewBody({super.key});

  @override
  State<NewsViewBody> createState() => _NewsViewBodyState();
}

class _NewsViewBodyState extends State<NewsViewBody> {
  @override
  void initState() {
    BlocProvider.of<GetNewsCubit>(context).getNews();
    super.initState();
  }

  NewsFilterOptionsModal _curentFilter = NewsFilterOptionsModal(
    category: "general",
    lang: "en",
    sortBy: "publishedAt",
  );
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 18),
            child: Row(
              children: [
                SizedBox(width: 18),
                NewsLogo(),
                Spacer(),
                SizedBox(
                  height: 30,
                  width: 130,
                  child: Center(
                    child: ElevatedButton(
                      onPressed: () {
                        openNewsFilterDialog(context, (filter) {
                          setState(() {
                            _curentFilter = filter;
                            // apply filter to your data source
                          });
                        }, _curentFilter);
                      },
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            S.of(context).Filter,
                            style: TextStyle(fontSize: 18),
                          ),
                          Icon(Icons.filter_alt_outlined, size: 22),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.only(top: 6, bottom: 28),
            child: NewsCategorysListViewBuilder(),
          ),
        ),

        SliverToBoxAdapter(
          child: NewsListViewBlocBuilder(
            physics: NeverScrollableScrollPhysics(),
          ),
        ),
      ],
    );
  }
}

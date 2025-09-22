import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:multiservices_app/features/home/news/presentation/widgets/news_list_view_bloc_builder.dart';
import 'package:multiservices_app/features/home/news/states_manager/get_news/get_news_cubit.dart';
import 'package:multiservices_app/l10n/localization_provider.dart';
import 'package:provider/provider.dart';

class CategoryViewBody extends StatefulWidget {
  const CategoryViewBody({super.key, required this.category});
  final String category;
  @override
  State<CategoryViewBody> createState() => _CategoryViewBodyState();
}

class _CategoryViewBodyState extends State<CategoryViewBody> {
  Map<String, String> onArabicCategory = {
    "الأعمال": "Business",
    "الترفيه": "Entertainment",
    "الصحة": "Health",
    "العلوم": "Science",
    "الرياضة": "Sports",
  };
  @override
  void initState() {
    Locale currentLocal =
        Provider.of<LocalizationProvider>(context, listen: false).locale;
    if (currentLocal == Locale('ar')) {
      BlocProvider.of<GetNewsCubit>(
        context,
      ).getNews(category: onArabicCategory[widget.category]);
    } else {
      BlocProvider.of<GetNewsCubit>(context).getNews(category: widget.category);
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16, top: 24),
      child: NewsListViewBlocBuilder(physics: ScrollPhysics()),
    );
  }
}

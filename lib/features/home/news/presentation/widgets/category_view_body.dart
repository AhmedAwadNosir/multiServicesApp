import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:multiservices_app/features/home/news/presentation/widgets/news_list_view_bloc_builder.dart';
import 'package:multiservices_app/features/home/news/states_manager/get_news/get_news_cubit.dart';

class CategoryViewBody extends StatefulWidget {
  const CategoryViewBody({super.key, required this.category});
  final String category;
  @override
  State<CategoryViewBody> createState() => _CategoryViewBodyState();
}

class _CategoryViewBodyState extends State<CategoryViewBody> {
  @override
  void initState() {
    BlocProvider.of<GetNewsCubit>(context).getNews(category: widget.category);
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

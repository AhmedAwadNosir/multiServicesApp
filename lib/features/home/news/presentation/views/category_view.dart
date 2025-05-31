import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:multiservices_app/features/home/news/data/repos/news_repo_impl.dart';
import 'package:multiservices_app/features/home/news/presentation/widgets/category_view_body.dart';
import 'package:multiservices_app/features/home/news/states_manager/get_news/get_news_cubit.dart';

class CategoryView extends StatelessWidget {
  const CategoryView({super.key, required this.category});
  final String category;
  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => GetNewsCubit(NewsRepoImpl()),
        child: CategoryViewBody(category: category),
      ),
    );
  }
}

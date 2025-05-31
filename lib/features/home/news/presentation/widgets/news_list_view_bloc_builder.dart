import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:multiservices_app/features/auth/functions/show_error_dialog.dart';
import 'package:multiservices_app/features/home/news/presentation/widgets/news_list_view_builder.dart';
import 'package:multiservices_app/features/home/news/states_manager/get_news/get_news_cubit.dart';

class NewsListViewBlocBuilder extends StatelessWidget {
  const NewsListViewBlocBuilder({super.key, required this.physics});
  final ScrollPhysics physics;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetNewsCubit, GetNewsState>(
      builder: (context, state) {
        if (state is GetNewsFailure) {
          showErrorDialog(context: context, errorMessage: state.errorMessage);
          return SizedBox();
        } else if (state is GetNewsSuccess) {
          return NewsListViewBuilder(news: state.news, physics: physics);
        } else {
          return Column(
            children: [SizedBox(height: 200), CircularProgressIndicator()],
          );
        }
      },
    );
  }
}

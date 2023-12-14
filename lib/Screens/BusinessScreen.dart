import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app2/shared/components.dart';
import 'package:news_app2/shared/cubit/news_cubit.dart';

class BusinessScreen extends StatelessWidget {
  const BusinessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsState>(
      listener: (context, state) {},
      builder: (context, state) {
        var list = NewsCubit.get(context).business;
        return ConditionalBuilder(
          condition: state is! NewsGetBusinessLoadingState,
          builder: (context) => ListView.separated(
              physics: const BouncingScrollPhysics(),
              itemBuilder: (context, index) {
                return buildArticleItem(list[index]);
              },
              separatorBuilder: (context, index) {
                return const VerticalDivider(
                  color: Colors.black,
                  thickness: 2,
                  endIndent: 20,
                  indent: 20,
                );
              },
              itemCount: list.length),
          fallback: (context) =>
              const Center(child: CircularProgressIndicator()),
        );
      },
    );
  }
}

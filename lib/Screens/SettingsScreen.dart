import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app2/shared/cubit/news_cubit.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsState>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = NewsCubit.get(context)..isDarkMode;

        return Center(
            child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.settings,
              size: 90,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                    onPressed: () {
                      if (cubit.isDarkMode) {
                        // BlocProvider.of<NewsCubit>(context).switchMode();
                        cubit.isDarkMode = false;
                        cubit.switchMode();
                      }
                    },
                    child: const Text(
                      'Light Mode',
                      style: TextStyle(fontSize: 24),
                    )),
                TextButton(
                    onPressed: () {
                      // cubit.switchMode();
                      if (cubit.isDarkMode == false) {
                        cubit.switchMode();
                      }
                    },
                    child: const Text(
                      'Night Mode',
                      style: TextStyle(fontSize: 24),
                    ))
              ],
            )
          ],
        ));
      },
    );
  }
}

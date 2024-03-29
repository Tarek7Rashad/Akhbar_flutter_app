import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:news_app2/layout/NewsLayout.dart';
import 'package:news_app2/shared/cubit/news_cubit.dart';
import 'package:news_app2/shared/network/local/cachedHelper.dart';
import 'package:news_app2/shared/network/remote/dioHelper.dart';

void main() async {
  DioHelper.init();
  await CacheHelper.init();
  bool isDark = CacheHelper.getData(key: 'isDark');

  runApp(NewsApp(
    isDark: isDark,
  ));
}

class NewsApp extends StatelessWidget {
  const NewsApp({super.key, required this.isDark});
  final bool isDark;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NewsCubit(),
      child: BlocConsumer<NewsCubit, NewsState>(
        listener: (context, state) {},
        builder: (context, state) {
          // var cubit = NewsCubit.get(context)..isDarkMode;

          return MaterialApp(
            debugShowCheckedModeBanner: false,
            themeMode: NewsCubit.get(context).isDark
                ? ThemeMode.light
                : ThemeMode.dark,
            darkTheme: ThemeData(
              brightness: Brightness.dark,
              bottomNavigationBarTheme: BottomNavigationBarThemeData(
                type: BottomNavigationBarType.fixed,
                selectedItemColor: Colors.white,
                unselectedItemColor: Colors.grey,
                backgroundColor: HexColor('333333'),
              ),
              appBarTheme: const AppBarTheme(
                backgroundColor: Colors.grey,
                elevation: 0,
                titleTextStyle: TextStyle(
                    fontSize: 24,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
              textTheme: const TextTheme(
                bodyLarge: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
            ),
            theme: ThemeData(
              brightness: Brightness.light,
              appBarTheme: const AppBarTheme(
                backgroundColor: Colors.amber,
                systemOverlayStyle: SystemUiOverlayStyle(
                  statusBarColor: Colors.black,
                  statusBarIconBrightness: Brightness.dark,
                ),
                elevation: 0,
                titleTextStyle: TextStyle(
                    fontSize: 24,
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
              ),
              bottomNavigationBarTheme: BottomNavigationBarThemeData(
                type: BottomNavigationBarType.fixed,
                selectedItemColor: Colors.white,
                unselectedItemColor: Colors.grey,
                backgroundColor: HexColor('333333'),
              ),
              textTheme: const TextTheme(
                bodyLarge: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
            ),
            home: const NewsLayout(),
          );
        },
      ),
    );
  }
}

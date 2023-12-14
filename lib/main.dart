import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app2/layout/NewsLayout.dart';
import 'package:news_app2/shared/cubit/news_cubit.dart';
import 'package:news_app2/shared/network/remote/dioHelper.dart';

void main() {
  DioHelper.init();

  runApp(const NewsApp());
}

class NewsApp extends StatelessWidget {
  const NewsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NewsCubit(),
      child: BlocConsumer<NewsCubit, NewsState>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = NewsCubit.get(context)..isDarkMode;

          return MaterialApp(
              debugShowCheckedModeBanner: false,
              themeMode: cubit.isDarkMode ? ThemeMode.light : ThemeMode.dark,
              darkTheme: ThemeData(
                brightness: Brightness.dark,
                textTheme: TextTheme(bodyText1: TextStyle(color: Colors.amber)),
                bottomNavigationBarTheme: const BottomNavigationBarThemeData(
                    selectedItemColor: Colors.red,
                    backgroundColor: Colors.grey,
                    selectedIconTheme: IconThemeData(color: Colors.amber)),
                appBarTheme: const AppBarTheme(
                  backgroundColor: Colors.grey,
                  elevation: 0,
                  titleTextStyle: TextStyle(
                      fontSize: 24,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
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
              ),
              home:
                  //  const Directionality(
                  //   textDirection: TextDirection.rtl,
                  //   child:
                  Stack(
                children: [
                  const NewsLayout(),
                  Positioned(
                    right: 10,
                    child: Container(
                      height: 100,
                      child: Material(
                        color: Colors.transparent,
                        child: IconButton(
                            onPressed: () {
                              cubit.switchMode();
                              if (cubit.isDarkMode) {
                                cubit.isDarkMode = false;
                              } else {
                                cubit.isDarkMode = true;
                              }
                            },
                            icon: const Icon(
                              Icons.mode_night_outlined,
                            )),
                      ),
                    ),
                  ),
                ],
              )
              // ),
              );
        },
      ),
    );
  }
}

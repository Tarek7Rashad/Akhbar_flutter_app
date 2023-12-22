import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app2/shared/cubit/news_cubit.dart';

class NewsLayout extends StatefulWidget {
  const NewsLayout({super.key});

  @override
  State<NewsLayout> createState() => _NewsLayoutState();
}

class _NewsLayoutState extends State<NewsLayout> {
  TextEditingController searchTextEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsState>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = NewsCubit.get(context);

        return Scaffold(
          appBar: AppBar(
            actions: [
              IconButton(
                  onPressed: () {
                    // cubit.changeMode();
                    // cubit.getBusiness();
                    // cubit.getScience();
                    // cubit.getSports();
                  },
                  icon: Icon(Icons.brightness_4_outlined))
            ],
            title: Row(
              children: [
                const Text("News"),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.7,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 16, right: 50),
                    child: SizedBox(
                        child: TextFormField(
                      controller: searchTextEditingController,
                      onChanged: (value) {
                        switch (value) {
                          case "egypt":
                            value = 'eg';

                          case "united states":
                            value = 'us';

                          default:
                        }
                        cubit.country = value;
                        cubit.getBusiness();
                        cubit.getScience();
                        cubit.getSports();
                      },
                      cursorColor: Colors.white,
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.all(10),
                        constraints: const BoxConstraints(maxHeight: 40),
                        hintText: 'Search Briefly By Country Name',
                        prefixIcon: const Icon(Icons.search),
                        prefixIconColor: Colors.white,
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16),
                          borderSide: const BorderSide(width: .4),
                        ),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16),
                            borderSide: const BorderSide(width: 1)),
                      ),
                    )),
                  ),
                ),
              ],
            ),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              cubit.getBusiness();
            },
            child: const Icon(Icons.add),
          ),
          bottomNavigationBar: BottomNavigationBar(
            showSelectedLabels: true,
            showUnselectedLabels: true,
            items: cubit.bottomItem,
            currentIndex: cubit.currentIndex,
            onTap: (value) {
              cubit.changeScreen(value);
            },
          ),
          body: cubit.screens[cubit.currentIndex],
        );
      },
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app2/Screens/BusinessScreen.dart';
import 'package:news_app2/Screens/ScienseScreen.dart';
import 'package:news_app2/Screens/SettingsScreen.dart';
import 'package:news_app2/Screens/SportScreen.dart';
import 'package:news_app2/shared/network/local/cachedHelper.dart';
import 'package:news_app2/shared/network/remote/dioHelper.dart';

part 'news_state.dart';

class NewsCubit extends Cubit<NewsState> {
  NewsCubit() : super(NewsInitial());
  static NewsCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;
  bool isDarkMode = true;
  String country = 'us';
  List<BottomNavigationBarItem> bottomItem = [
    const BottomNavigationBarItem(
        icon: Icon(Icons.business), label: 'Business'),
    const BottomNavigationBarItem(icon: Icon(Icons.science), label: 'Science'),
    const BottomNavigationBarItem(icon: Icon(Icons.sports), label: 'Sports'),
    const BottomNavigationBarItem(
        icon: Icon(Icons.settings), label: 'Settings'),
  ];
  List<Widget> screens = const [
    BusinessScreen(),
    ScienceScreen(),
    SportScreen(),
    SettingsScreen()
  ];
  List<Icon> icons = const [
    Icon(Icons.business),
    Icon(Icons.science),
    Icon(Icons.sports),
    Icon(Icons.settings),
  ];
  List<Color> colors = const [
    Colors.red,
    Colors.green,
    Colors.blue,
    Colors.black,
  ];

  void switchMode() {
    if (isDarkMode) {
      emit(DarkMoodState());
    } else {
      emit(LightMoodState());
    }
  }

  bool isDark = false;
  void changeMode() {
    isDark = !isDark;
    CacheHelper.setData(key: 'isDark', value: isDark).then((value) {
      emit(AppMoodState());
    });
  }

  void changeScreen(int index) {
    ThemeData.dark();
    currentIndex = index;
    if (index == 1) {
      getScience();
    }
    if (index == 2) {
      getSports();
    }

    emit(NewsNavigationBar());
  }

  Icon changeIcon(int index) {
    Icon icon = const Icon(Icons.search);
    currentIndex = index;
    if (index == 1) {
      icon = icons[1];
    }
    if (index == 2) {
      icon = icons[2];
    }
    if (index == 3) {
      icon = icons[3];
    }

    emit(NewsIconsState());
    return icon;
  }

  List<dynamic> business = [];
  void getBusiness() async {
    // if (business.isEmpty) {
    emit(NewsGetBusinessLoadingState());
    await DioHelper.getData(url: '/v2/top-headlines', query: {
      'country': '$country',
      'category': 'business',
      // 'apiKey': 'd7d4593aa2924d448301cdce6b97c579',
      'apiKey': '49353fed127543af8f569076942438f0',
    }).then((value) {
      business = value.data['articles'];

      emit(NewsGetBusinessSuccessState());
      debugPrint(value.data.toString());
    }).catchError((onError) {
      emit(NewsGetBusinessErrorState(onError.toString()));
      debugPrint(onError.toString());
    });
    // } else {
    //   emit(NewsGetBusinessSuccessState());
    // }
  }

  List<dynamic> sport = [];

  void getSports() async {
    emit(NewsGetSportLoadingState());
    // if (sport.isEmpty) {
    await DioHelper.getData(url: '/v2/top-headlines', query: {
      'country': '$country',
      'category': 'sports',
      // 'apiKey': 'd7d4593aa2924d448301cdce6b97c579',
      'apiKey': '49353fed127543af8f569076942438f0',
    }).then((value) {
      sport = value.data['articles'];
      emit(NewsGetSportSuccessState());
      debugPrint(value.data.toString());
    }).catchError((onError) {
      emit(NewsGetSportErrorState(onError.toString()));
      debugPrint(onError.toString());
    });
    // } else {
    //   emit(NewsGetSportSuccessState());
    // }
  }

  List<dynamic> science = [];

  void getScience() async {
    emit(NewsGetScienceLoadingState());

    // if (science.isEmpty) {
    await DioHelper.getData(url: '/v2/top-headlines', query: {
      'country': '$country',
      'category': 'science',
      // 'apiKey': 'd7d4593aa2924d448301cdce6b97c579',
      'apiKey': '49353fed127543af8f569076942438f0',
    }).then((value) {
      science = value.data['articles'];
      emit(NewsGetScienceSuccessState());
      debugPrint(value.data.toString());
    }).catchError((onError) {
      emit(NewsGetScienceErrorState(onError.toString()));
      debugPrint(onError.toString());
    });
    // } else {
    //   emit(NewsGetScienceSuccessState());
    // }
  }
}

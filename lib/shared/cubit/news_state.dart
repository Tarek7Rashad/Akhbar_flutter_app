part of 'news_cubit.dart';

@immutable
sealed class NewsState {}

final class NewsInitial extends NewsState {}

final class NewsNavigationBar extends NewsState {}

final class NewsIconsState extends NewsState {}

final class NewsGetBusinessLoadingState extends NewsState {}

final class NewsGetBusinessSuccessState extends NewsState {}

final class NewsGetBusinessErrorState extends NewsState {
  final String errorMessage;

  NewsGetBusinessErrorState(this.errorMessage);
}

final class NewsGetSportLoadingState extends NewsState {}

final class NewsGetSportSuccessState extends NewsState {}

final class NewsGetSportErrorState extends NewsState {
  final String errorMessage;

  NewsGetSportErrorState(this.errorMessage);
}

final class NewsGetScienceLoadingState extends NewsState {}

final class NewsGetScienceSuccessState extends NewsState {}

final class NewsGetScienceErrorState extends NewsState {
  final String errorMessage;

  NewsGetScienceErrorState(this.errorMessage);
}

final class LightMoodState extends NewsState {}

final class DarkMoodState extends NewsState {}

final class AppMoodState extends NewsState {}

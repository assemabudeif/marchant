part of 'home_cubit.dart';

@immutable
abstract class HomeState {}

class HomeInitial extends HomeState {}

class HomeChangeIndicatorIndexState extends HomeState {}

class HomeChangePageIndexState extends HomeState {}

class HomeGetTokensLoadingState extends HomeState {}

class HomeGetTokensSuccessState extends HomeState {}

class HomeGetTokensErrorState extends HomeState {}

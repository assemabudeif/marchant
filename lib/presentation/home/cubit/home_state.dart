part of 'home_cubit.dart';

@immutable
abstract class HomeState {}

class HomeInitial extends HomeState {}

class ChangeIndicatorIndexState extends HomeState {}

class ChangePageIndexState extends HomeState {}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marchant/presentation/search/cubit/search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit() : super(SearchInitial());

  static SearchCubit get(BuildContext context) => BlocProvider.of(context);

  var searchController = TextEditingController();
  var formKey = GlobalKey<FormState>();

  bool isFilter = false;
  bool isSorting = true;

  void changeButton(String type) {
    if (type == 'filter') {
      isFilter = true;
      isSorting = false;
    }
    if (type == 'sorting') {
      isFilter = false;
      isSorting = true;
    }

    emit(ChangeButtonStata());
  }

  RangeValues priceValues = const RangeValues(500, 800);

  void changePriceIndicator(value) {
    priceValues = value;
    emit(ChangePriceIndicatorState());
  }

  bool isHigherRating = false;
  bool isFasterDelivery = false;
  bool isNearestLocation = false;
  bool isHaveDelivery = false;

  void changeCheckButtonState(String type) {
    if (type == 'rate') {
      isHigherRating = !isHigherRating;
    }
    if (type == 'faster') {
      isFasterDelivery = !isFasterDelivery;
    }
    if (type == 'location') {
      isNearestLocation = !isNearestLocation;
    }
    if (type == 'delivery') {
      isHaveDelivery = !isHaveDelivery;
    }
    emit(ChangeCheckButtonState());
  }

}

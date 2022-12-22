import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marchant/presentation/search/cubit/search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit() : super(SearchInitial());

  static SearchCubit get(BuildContext context) => BlocProvider.of(context);

  var searchController = TextEditingController();
  var formKey = GlobalKey<FormState>();

  bool isFilter= false;
  bool isSorting = true;

  void changeButton(String type){
    if(type == 'filter'){
      isFilter = true;
      isSorting = false;
    }
    if(type == 'sorting'){
      isFilter = false;
      isSorting = true;
    }

    emit(ChangeButtonStata());
  }
}

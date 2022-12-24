import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marchant/presentation/product/cubit/product_state.dart';

class ProductCubit extends Cubit<ProductState> {
  ProductCubit() : super(ProductInitial());

  static ProductCubit get(BuildContext context) => BlocProvider.of(context);

  bool isFavorite = false;
  bool isInCart = false;

  void changeFavoriteButton() {
    isFavorite = !isFavorite;
    emit(ChangeFavoriteState());
  }

  void changeCartButton() {
    isInCart = !isInCart;
    emit(AddToCartState());
  }
}

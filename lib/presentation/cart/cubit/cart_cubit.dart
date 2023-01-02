import 'package:carousel_slider/carousel_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marchant/presentation/cart/cubit/cart_state.dart';
import 'package:marchant/presentation/resources/assets_manager.dart';

enum Addresses { home1, home2, home3, home4, home5, home6, home7 }

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(CartInitial());

  static CartCubit get(BuildContext context) => BlocProvider.of(context);

  Addresses? address = Addresses.home1;

  List<String> images = [
    for (int i = 0; i < 5; i++) ImageAssets.muskMarket,
  ];
  List<String> names = [
    for (int i = 0; i < 5; i++) 'Medhat Market',
  ];

  int activeIndex = 0;

  void changeCarouselIndex(int index) {
    activeIndex = index;
    emit(ChangeCarouselIndexState());
  }

  var controller = CarouselController();

  bool showCartOrders = true;

  void changeProductsShowIcon() {
    showCartOrders = !showCartOrders;
    emit(ChangeShowCartProductsIconState());
  }

  void changeRadioBottom(Addresses value) {
    address = value;
    emit(ChangeRadioBottomState());
  }
}

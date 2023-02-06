import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:marchant/app.dart';
import 'package:marchant/utilis/bloc_observer.dart';
import 'package:marchant/utilis/consetant.dart';

import 'data/local/shared_prefrences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  await SharedPref.init();
  LocationPermission permission = await Geolocator.requestPermission();
  token = await SharedPref.getData(key: tokenKey) ?? '';
  refreshToken = await SharedPref.getData(key: refreshTokenKey) ?? '';
  log(token);
  runApp(const MyApp());
}

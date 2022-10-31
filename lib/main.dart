import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:marchant/app.dart';
import 'package:marchant/utilis/bloc_observer.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  LocationPermission permission = await Geolocator.requestPermission();
  runApp(const MyApp());
}

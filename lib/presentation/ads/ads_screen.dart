import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:marchant/presentation/resources/colors_manager.dart';
import 'package:marchant/presentation/resources/routes_manager.dart';
import 'package:marchant/presentation/resources/values_manager.dart';

class AdsScreen extends StatefulWidget {
  const AdsScreen({Key? key}) : super(key: key);

  @override
  State<AdsScreen> createState() => _AdsScreenState();
}

class _AdsScreenState extends State<AdsScreen> {
  Timer? _timer;
  bool _isSkip = false;
  Duration? _duration;
  void _startTimer() {
    Timer.periodic(const Duration(seconds: 1), (timer) {
      _setCountDown();
    });
  }

  void _setCountDown() {
    setState(() {
      int seconds = _duration!.inSeconds - 1;
      if (seconds < 0) {
        _isSkip = true;
        _timer!.cancel();
      } else {
        _duration = Duration(seconds: seconds);
      }
    });
  }

  void _closeOnPressed() {
    Navigator.pushNamedAndRemoveUntil(context, Routes.home, (route) => false);
  }

  @override
  void initState() {
    // TODO: implement initState
    _timer = Timer.periodic(const Duration(seconds: 5), (timer) {
      setState(() {
        _isSkip = true;
        timer.cancel();
      });
    });
    _duration = const Duration(seconds: 5);
    _startTimer();
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _timer!.cancel();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(AppPadding.p20),
          child: Column(
            children: [
              Align(
                alignment: Alignment.topRight,
                child: _isSkip
                    ? IconButton(
                        onPressed: () {
                          _closeOnPressed();
                        },
                        icon: const Icon(
                          Icons.close,
                          color: ColorManager.primary,
                          size: AppSize.s32,
                        ),
                      )
                    : CircleAvatar(
                        backgroundColor: ColorManager.primary,
                        radius: AppSize.s16,
                        child: Text(
                          _duration!.inSeconds.toString(),
                          style: const TextStyle(color: ColorManager.white),
                        ),
                      ),
              ),
              const SizedBox(
                height: AppSize.s20,
              ),
              Expanded(
                child: Center(
                  child: Text(
                    'Advertising Area',
                    style: Theme.of(context).textTheme.titleLarge!.copyWith(
                          color: ColorManager.primary,
                          fontSize: 40,
                        ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

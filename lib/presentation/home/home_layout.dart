import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:marchant/presentation/cart/cubit/cart_cubit.dart';
import 'package:marchant/presentation/categories/cubit/categories_cubit.dart';
import 'package:marchant/presentation/home/cubit/home_cubit.dart';
import 'package:marchant/presentation/resources/colors_manager.dart';
import 'package:marchant/presentation/resources/values_manager.dart';

class HomeLayout extends StatelessWidget {
  const HomeLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (BuildContext context) => HomeCubit()..getTokens()),
        BlocProvider(create: (BuildContext context) => CategoriesCubit()),
        BlocProvider(create: (BuildContext context) => CartCubit()),
      ],
      child: BlocConsumer<HomeCubit, HomeState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          var cubit = HomeCubit.get(context);
          return Scaffold(
            bottomNavigationBar: Container(
              height: MediaQuery.of(context).size.height * 0.12,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(AppSize.s40),
                  topRight: Radius.circular(AppSize.s40),
                ),
                border: Border.all(
                  color: ColorManager.primary,
                  width: AppSize.s1_5,
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: cubit.navItems
                    .map(
                      (e) => InkWell(
                        onTap: () {
                          cubit.changePageIndex(e.index!, context);
                          e.onPressed!();
                        },
                        child: Column(
                          children: [
                            Expanded(
                              child: SvgPicture.asset(
                                e.icon!,
                                width: MediaQuery.of(context).size.width * 0.11,
                                color: cubit.currentIndex == e.index
                                    ? ColorManager.primary
                                    : ColorManager.grey3,
                              ),
                            ),
                            Text(
                              e.text.toString(),
                              style: Theme.of(context)
                                  .textTheme
                                  .titleSmall!
                                  .copyWith(
                                    color: cubit.currentIndex == e.index
                                        ? ColorManager.primary
                                        : ColorManager.grey3,
                                  ),
                            ),
                          ],
                        ),
                      ),
                    )
                    .toList(),
              ),
            ),
            body: cubit.pages(context, cubit.currentIndex),
          );
        },
      ),
    );
  }
}

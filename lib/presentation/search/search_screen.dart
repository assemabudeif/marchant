import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:marchant/presentation/resources/assets_manager.dart';
import 'package:marchant/presentation/resources/colors_manager.dart';
import 'package:marchant/presentation/resources/font_manager.dart';
import 'package:marchant/presentation/resources/strings_manager.dart';
import 'package:marchant/presentation/resources/values_manager.dart';
import 'package:marchant/presentation/search/cubit/search_cubit.dart';
import 'package:marchant/presentation/search/cubit/search_state.dart';
import 'package:marchant/presentation/widgets/search_market_widget.dart';

class SearchScreen extends StatelessWidget {
  SearchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SearchCubit(),
      child: BlocConsumer<SearchCubit, SearchState>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = SearchCubit.get(context);
          return Scaffold(
            body: SafeArea(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        decoration: BoxDecoration(
                          color: ColorManager.primaryMoreLight,
                          border: Border.all(
                            color: ColorManager.primaryMoreLight,
                            width: 1.0,
                          ),
                          borderRadius: BorderRadius.circular(
                            AppSize.s15,
                          ),
                        ),
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        child: Form(
                          key: cubit.formKey,
                          child: TextFormField(
                            minLines: 1,
                            maxLines: 4,
                            style: const TextStyle(color: ColorManager.primary),
                            controller: cubit.searchController,
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: StringsManager.search,
                                hintStyle: const TextStyle(
                                  color: ColorManager.grey4,
                                  fontSize: AppSize.s21,
                                  fontWeight: FontWeightManager.medium,
                                  fontFamily: FontConstants.fontFamily,
                                ),
                                // filled: true, fillColor: ColorManager.primaryMoreLight,
                                prefixIcon: IconButton(
                                  icon: const Icon(
                                    Icons.arrow_back,
                                    color: ColorManager.accent,
                                  ),
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                ),
                                suffixIcon: IconButton(
                                  icon: SvgPicture.asset(
                                    ImageAssets.categories,
                                    color: ColorManager.grey3,
                                    width: AppSize.s28,
                                    height: AppSize.s28,
                                    fit: BoxFit.fill,
                                  ),
                                  onPressed: () {},
                                )),
                          ),
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: InkWell(
                            onTap: () {
                              cubit.changeButton('sorting');
                            },
                            child: Column(
                              children: [
                                Center(
                                  child: Text(
                                    StringsManager.sorting,
                                    style: TextStyle(
                                      color: cubit.isSorting
                                          ? ColorManager.primary
                                          : ColorManager.grey4,
                                      fontSize: AppSize.s16,
                                      fontWeight: FontWeightManager.bold,
                                      fontFamily: FontConstants.fontFamily,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height * 0.02,
                                ),
                                Container(
                                  width: double.infinity,
                                  height: AppSize.s3,
                                  color: cubit.isSorting
                                      ? ColorManager.primary
                                      : ColorManager.grey2,
                                ),
                              ],
                            ),
                          ),
                        ),
                        Container(
                          width: 1.0,
                          height: AppSize.s34,
                          color: ColorManager.grey2,
                        ),
                        Expanded(
                          child: InkWell(
                            onTap: () {
                              cubit.changeButton('filter');
                            },
                            child: Column(
                              children: [
                                Center(
                                  child: Text(
                                    StringsManager.filter,
                                    style: TextStyle(
                                      color: cubit.isFilter
                                          ? ColorManager.primary
                                          : ColorManager.grey4,
                                      fontSize: AppSize.s16,
                                      fontWeight: FontWeightManager.bold,
                                      fontFamily: FontConstants.fontFamily,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height * 0.02,
                                ),
                                Container(
                                  width: double.infinity,
                                  height: AppSize.s3,
                                  color: cubit.isFilter
                                      ? ColorManager.primary
                                      : ColorManager.grey2,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.02,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: AppPadding.p30),
                      child: GridView.count(
                        crossAxisCount: 2,
                        shrinkWrap: true,
                        crossAxisSpacing: AppSize.s6,
                        mainAxisSpacing: AppSize.s3,
                        childAspectRatio: 1 / 1.65,
                        physics: const NeverScrollableScrollPhysics(),
                        children: List.generate(
                          10,
                          (index) => SearchMarketWidget(
                            name: 'Musk Market',
                            image: ImageAssets.muskMarket,
                            distance: '15 KM',
                            rate: 4,
                            onTap: () {},
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:marchant/presentation/resources/strings_manager.dart';
import 'package:marchant/presentation/resources/values_manager.dart';
import 'package:marchant/presentation/widgets/home_list_item_widget.dart';
import 'package:marchant/presentation/widgets/shop_search_bar_widget.dart';
import 'package:marchant/presentation/widgets/white_app_bar_widget.dart';

class BranchesScreen extends StatelessWidget {
  const BranchesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: whiteAppBarWidget(
        title: StringsManager.branches,
        context: context,
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: AppPadding.p17,
            vertical: AppPadding.p8,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              //search
              ShopSearchBarWidget(
                onTap: () {},
              ),
              const SizedBox(
                height: AppPadding.p31,
              ),

              //branches
              GridView.count(
                crossAxisCount: 2,
                shrinkWrap: true,
                crossAxisSpacing: AppSize.s23,
                mainAxisSpacing: AppSize.s32,
                physics: const NeverScrollableScrollPhysics(),
                children: List.generate(
                  4,
                  (index) => const HomeListItemWidget(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:restaurant_mobile/core/constant/colors.dart';
import 'package:restaurant_mobile/core/constant/constants.dart';
import 'package:restaurant_mobile/view/widgets/authentication/custom_text_formfield_auth.dart';
import 'package:restaurant_mobile/view/widgets/shared/custom_product.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(SearchController());
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppDimensions.mainPadding)
          .copyWith(top: AppDimensions.mainPadding),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: CustomTextFormFieldAuth(
                  hintText: "Search",
                  labelText: "Search",
                  suffixIcon: IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.search,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.filter_alt_outlined,
                  color: AppColors.whiteColor,
                  size: 30,
                ),
              )
            ],
          ),
          const SizedBox(height: 20),
          Expanded(
              child: ListView.separated(
            physics: const BouncingScrollPhysics(),
            itemCount: 7,
            separatorBuilder: (c, i) => const Divider(height: 20),
            itemBuilder: (c, i) => const CustomProductCategory(),
          ))
        ],
      ),
    );
  }
}

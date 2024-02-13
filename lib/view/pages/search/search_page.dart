import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:restaurant_mobile/core/constant/colors.dart';
import 'package:restaurant_mobile/core/constant/constants.dart';
import 'package:restaurant_mobile/view/widgets/shared/custom_product.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(SearchController());
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppDimensions.mainPadding)
          .copyWith(top: AppDimensions.mainPadding)
          .r,
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: SearchBar(
                  hintText: 'Search',
                  trailing: [
                    IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.search_outlined,
                        color: AppColors.primaryColor,
                        size: 30.r,
                      ),
                    )
                  ],
                  side: const MaterialStatePropertyAll(
                      BorderSide(color: AppColors.secondColor)),
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.filter_alt_outlined,
                  color: AppColors.whiteColor,
                  size: 30.r,
                ),
              )
            ],
          ),
          SizedBox(height: 20.h),
          Expanded(
              child: ListView.separated(
            physics: const BouncingScrollPhysics(),
            itemCount: 7,
            separatorBuilder: (c, i) => Divider(height: 20.h),
            itemBuilder: (c, i) => const CustomProductCategory(),
          ))
        ],
      ),
    );
  }
}

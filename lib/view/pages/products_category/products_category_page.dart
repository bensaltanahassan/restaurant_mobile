import 'package:flutter/material.dart';
import 'package:restaurant_mobile/core/constant/colors.dart';
import 'package:restaurant_mobile/core/constant/imageassets.dart';
import 'package:restaurant_mobile/view/widgets/authentication/custom_text_formfield_auth.dart';
import 'package:restaurant_mobile/view/widgets/shared/custom_product.dart';

class ProductsCategoryPage extends StatelessWidget {
  const ProductsCategoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        physics: const BouncingScrollPhysics(),
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              expandedHeight: 150.0,
              floating: true,
              flexibleSpace: FlexibleSpaceBar(
                title: const Text('Pizza'),
                background: Image.asset(AppImageAsset.pizza, fit: BoxFit.cover),
              ),
            ),
            const SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.only(left: 10, right: 10, top: 10),
                child: CustomTextFormFieldAuth(
                  hintText: 'Search',
                  labelText: 'Search',
                  prefixIcon: Icons.search,
                ),
              ),
            ),
          ];
        },
        body: MediaQuery.removePadding(
          context: context,
          removeTop: true,
          child: ListView.separated(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            itemBuilder: (c, i) => const CustomProductCategory(),
            separatorBuilder: (c, i) =>
                const Divider(color: AppColors.greyColor, height: 10),
            itemCount: 10,
          ),
        ),
      ),
    );
  }
}

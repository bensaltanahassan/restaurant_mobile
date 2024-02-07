import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:restaurant_mobile/core/constant/colors.dart';

class BottomNavBarHome extends StatelessWidget {
  const BottomNavBarHome({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ConvexAppBar(
      height: 60,
      style: TabStyle.react,
      backgroundColor: AppColors.primaryColorGradient,
      activeColor: AppColors.secondColor,
      color: AppColors.greyColor,
      items: const [
        TabItem(icon: Icons.home_outlined, title: 'Home'),
        TabItem(icon: Icons.shopping_basket_outlined, title: 'Orders'),
        TabItem(icon: Icons.search, title: 'Search'),
        TabItem(icon: Icons.favorite_outline, title: 'Favoris'),
        TabItem(icon: Icons.person, title: 'Profile'),
      ],
      onTap: (int i) => print('click index=$i'),
    );
  }
}

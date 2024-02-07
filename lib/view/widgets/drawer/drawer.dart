import 'package:flutter/material.dart';
import 'package:restaurant_mobile/core/constant/colors.dart';
import 'package:restaurant_mobile/core/constant/imageassets.dart';
import 'package:restaurant_mobile/view/widgets/buttons/custom_button.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          DrawerHeader(
            decoration: const BoxDecoration(
                border:
                    Border(bottom: BorderSide(color: AppColors.secondColor))),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 100,
                  width: 100,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      image: const DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage(AppImageAsset.pizza))),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "BENSALTANA HASSAN",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      TextButton(
                          style: const ButtonStyle(
                              padding:
                                  MaterialStatePropertyAll(EdgeInsets.zero)),
                          onPressed: () {},
                          child: const Text(
                            "View Profile",
                            style: TextStyle(color: AppColors.secondColor),
                          ))
                    ],
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomDrawetItem(
                  title: "Home",
                  icon: Icons.home_outlined,
                  onPressed: () {},
                  isSelected: true,
                ),
                const SizedBox(height: 10),
                CustomDrawetItem(
                  title: "Orders",
                  icon: Icons.shopping_basket_outlined,
                  onPressed: () {},
                ),
                const SizedBox(height: 10),
                CustomDrawetItem(
                  title: "Search",
                  icon: Icons.search_outlined,
                  onPressed: () {},
                ),
                const SizedBox(height: 10),
                CustomDrawetItem(
                  title: "Favoris",
                  icon: Icons.favorite_outline,
                  onPressed: () {},
                ),
                const SizedBox(height: 10),
                CustomDrawetItem(
                  title: "Contact Us",
                  icon: Icons.phone_outlined,
                  onPressed: () {},
                ),
              ],
            ),
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: CustomButton(
              radius: 30,
              buttonColor: AppColors.secondColor,
              title: "Log Out",
              titleColor: AppColors.whiteColor,
              onPressed: () {},
            ),
          ),
          const SizedBox(height: 20)
        ],
      ),
    );
  }
}

class CustomDrawetItem extends StatelessWidget {
  const CustomDrawetItem({
    super.key,
    required this.title,
    required this.icon,
    this.onPressed,
    this.isSelected = false,
  });

  final String title;
  final IconData icon;
  final bool isSelected;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: onPressed,
      icon: Icon(
        icon,
        color: isSelected ? AppColors.primaryColor : AppColors.whiteColor,
      ),
      label: Text(
        title,
        style: TextStyle(
            color: isSelected ? AppColors.primaryColor : AppColors.whiteColor),
      ),
      style: ButtonStyle(
          backgroundColor: MaterialStatePropertyAll(isSelected
              ? AppColors.secondColor
              : AppColors.primaryColor.withBlue(40)),
          minimumSize:
              const MaterialStatePropertyAll(Size(double.maxFinite, 1)),
          alignment: Alignment.centerLeft,
          padding: const MaterialStatePropertyAll(
              EdgeInsets.symmetric(horizontal: 20, vertical: 15))),
    );
  }
}

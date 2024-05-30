import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sirozhiddin_project/src/common/style/app_colors.dart';

class HomeCategoryBar extends StatefulWidget {
  const HomeCategoryBar({super.key});

  @override
  State<HomeCategoryBar> createState() => _HomeCategoryBarState();
}

class _HomeCategoryBarState extends State<HomeCategoryBar> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20).r,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Categories',
                style: TextStyle(
                  color: AppColors.black,
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.chevron_right,
                  size: 28.w,
                  color: AppColors.black10,
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 62.h,
          child: ListView(
            padding: EdgeInsets.only(left: 20).r,
            scrollDirection: Axis.horizontal,
            children: [
              CategoryItem(
                color: AppColors.vegetablesBackground,
                image: "assets/images/category1.png",
              ),
              10.horizontalSpace,
              CategoryItem(
                color: AppColors.fruitsBackground,
                image: "assets/images/category2.png",
              ),
              10.horizontalSpace,
              CategoryItem(
                color: AppColors.beveragesBackground,
                image: "assets/images/category3.png",
              ),
              10.horizontalSpace,
              CategoryItem(
                color: AppColors.groceryBackground,
                image: "assets/images/category4.png",
              ),
              10.horizontalSpace,
              CategoryItem(
                color: AppColors.edibleBackground,
                image: "assets/images/category5.png",
              ),
              10.horizontalSpace,
              CategoryItem(
                color: AppColors.householdBackground,
                image: "assets/images/category6.png",
              ),
              20.horizontalSpace,
            ],
          ),
        ),
      ],
    );
  }
}

class CategoryItem extends StatelessWidget {
  Color color;
  String image;
  CategoryItem({
    super.key,
    required this.color,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 62.w,
      height: 62.h,
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.all(
            Radius.circular(100),
          ).w,
        ),
        child: Center(
          child: SizedBox(
            width: 35.w,
            height: 35.h,
            child: Image(
              image: AssetImage(image),
            ),
          ),
        ),
      ),
    );
  }
}

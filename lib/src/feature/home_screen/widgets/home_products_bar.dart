import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../common/style/app_colors.dart';

class HomeProductBar extends StatefulWidget {
  const HomeProductBar({super.key});

  @override
  State<HomeProductBar> createState() => _HomeProductBarState();
}

class _HomeProductBarState extends State<HomeProductBar> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Featured products',
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
          Row(
            children: [
              ProductItem(
                image: "assets/images/product1.png",
                isLiked: false,
                title: "Fresh Peach",
              ),
              10.horizontalSpace,
              ProductItem(
                image: "assets/images/product2.png",
                isLiked: true,
                title: "Fresh Peach",
              ),
            ],
          ),
          10.verticalSpace,
          Row(
            children: [
              ProductItem(
                image: "assets/images/product2.png",
                isLiked: false,
                title: "Avacoda",
              ),
              10.horizontalSpace,
              ProductItem(
                image: "assets/images/product1.png",
                isLiked: false,
                title: "Black Grapes",
              ),
            ],
          ),
          10.verticalSpace,
          Row(
            children: [
              ProductItem(
                isLiked: true,
                title: "Black Grapes",
                image: "assets/images/product2.png",
              ),
              10.horizontalSpace,
              ProductItem(
                isLiked: false,
                image: "assets/images/product1.png",
                title: "Black Grapes",
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class ProductItem extends StatefulWidget {
  final String image;
  final String title;
  bool isLiked;

  ProductItem({
    super.key,
    required this.image,
    required this.title,
    required this.isLiked,
  });

  @override
  State<ProductItem> createState() => _ProductItemState();
}

class _ProductItemState extends State<ProductItem> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 180.w,
      height: 238.h,
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: AppColors.white60,
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
        ),
        child: Stack(
          children: [
            Positioned(
              right: 5,
              top: 5,
              child: IconButton(
                onPressed: () {},
                icon: Icon(
                  widget.isLiked
                      ? Icons.favorite
                      : Icons.favorite_border_outlined,
                  size: 28.w,
                  color: AppColors.red,
                ),
              ),
            ),
            SizedBox(
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  30.verticalSpace,
                  SizedBox(
                    width: 97.w,
                    height: 97.h,
                    child: Image(
                      fit: BoxFit.cover,
                      image: AssetImage(widget.image),
                    ),
                  ),
                  Text(
                    "\$8.00",
                    style: TextStyle(
                      color: AppColors.orange,
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Text(
                    widget.title,
                    style: TextStyle(
                      color: AppColors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  10.verticalSpace,
                  Divider(
                    color: AppColors.dividerColor,
                  ),
                  3.verticalSpace,
                  GestureDetector(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.shopping_bag_outlined,
                          color: AppColors.orange,
                        ),
                        5.horizontalSpace,
                        Text(
                          "Add to cart",
                          style: TextStyle(
                            color: AppColors.black,
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

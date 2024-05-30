import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sirozhiddin_project/src/common/style/app_colors.dart';

import '../profile_sqreen/profile_sqreen.dart';
import 'widgets/home_app_bar.dart';
import 'widgets/home_category_bar.dart';
import 'widgets/home_poster_bar.dart';
import 'widgets/home_products_bar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Widget> pages = [
    SingleChildScrollView(
      child: Column(
        children: [
          20.verticalSpace,
          HomeAppBar(),
          10.verticalSpace,
          HomePoterBar(),
          20.verticalSpace,
          HomeCategoryBar(),
          20.verticalSpace,
          HomeProductBar(),
        ],
      ),
    ),
    ProfileSqreen(),
    ProfileSqreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // floatingActionButton: FloatingActionButton(
        //   backgroundColor: AppColors.orange,
        //   child: Icon(
        //     Icons.shopping_bag_outlined,
        //     color: AppColors.white,
        //     size: 27,
        //   ),
        //   shape: RoundedRectangleBorder(
        //     borderRadius: BorderRadius.all(
        //       Radius.circular(
        //         50,
        //       ),
        //     ),
        //   ),
        //   onPressed: () {},
        //   //params
        // ),
        // floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
        // bottomNavigationBar: AnimatedBottomNavigationBar(
        //     activeColor: AppColors.black,
        //     inactiveColor: AppColors.black10,
        //     iconSize: 27,
        //     icons: [
        //       Icons.home_outlined,
        //       Icons.person_2_outlined,
        //       Icons.favorite_outline,
        //     ],
        //     activeIndex: 0,
        //     gapLocation: GapLocation.end,
        //     notchSmoothness: NotchSmoothness.softEdge,
        //     onTap: (index) {
        //       // controller.animateToPage(index,
        //       //     duration: Duration(milliseconds: 500),
        //       //     curve: Curves.decelerate);
        //     }
        //     //other params
        //     ),
        // backgroundColor: AppColors.white,
        // body: SafeArea(
        //   child: SizedBox(
        //     width: double.infinity,
        //     child: PageView(
        //       onPageChanged: (value) {},
        //       // controller: controller,
        //       allowImplicitScrolling: true,
        //       children: pages,
        //     ),
        //   ),
        // ),
        );
  }
}

class AllHome extends StatefulWidget {
  const AllHome({super.key});

  @override
  State<AllHome> createState() => _AllHomeState();
}

class _AllHomeState extends State<AllHome> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          20.verticalSpace,
          HomeAppBar(),
          10.verticalSpace,
          HomePoterBar(),
          20.verticalSpace,
          HomeCategoryBar(),
          20.verticalSpace,
          HomeProductBar(),
        ],
      ),
    );
  }
}

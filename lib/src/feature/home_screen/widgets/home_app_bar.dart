import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sirozhiddin_project/src/common/style/app_colors.dart';

class HomeAppBar extends StatefulWidget {
  const HomeAppBar({super.key});

  @override
  State<HomeAppBar> createState() => _HomeAppBarState();
}

class _HomeAppBarState extends State<HomeAppBar> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20).r,
      child: SizedBox(
        height: 50.h,
        child: DecoratedBox(
          decoration: BoxDecoration(
            color: AppColors.white70,
            borderRadius: BorderRadius.all(
              Radius.circular(10),
            ).w,
          ),
          child: SearchBar(
            backgroundColor: MaterialStateProperty.all(AppColors.white),
            shape: MaterialStateProperty.all(
              ContinuousRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                ).w,
              ),
            ),
            leading: Icon(
              Icons.search_outlined,
              color: AppColors.black10,
              size: 28.sp,
            ),
            trailing: [
              IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.tune,
                  color: AppColors.black10,
                  size: 28.sp,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

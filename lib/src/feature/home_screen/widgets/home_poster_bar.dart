import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../common/style/app_colors.dart';

class HomePoterBar extends StatefulWidget {
  const HomePoterBar({super.key});

  @override
  State<HomePoterBar> createState() => _HomePoterBarState();
}

class _HomePoterBarState extends State<HomePoterBar> {
  late PageController controller;
  @override
  void initState() {
    controller = PageController();
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20).r,
      child: Stack(
        children: [
          SizedBox(
            height: 280.h,
            child: DecoratedBox(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                ).w,
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                ),
                child: PageView(
                  controller: controller,
                  children: [
                    Image(
                      fit: BoxFit.cover,
                      image: AssetImage("assets/images/backgroundPoster.png"),
                    ),
                    Image(
                      fit: BoxFit.cover,
                      image: AssetImage("assets/images/welcome2.png"),
                    ),
                    Image(
                      fit: BoxFit.cover,
                      image: AssetImage("assets/images/welcome3.png"),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 20,
            left: 20,
            child: SmoothPageIndicator(
              controller: controller,
              count: 3,
              effect: WormEffect(
                activeDotColor: AppColors.orange,
                dotColor: AppColors.white,
                dotHeight: 10.h,
                dotWidth: 10.w,
                type: WormType.normal,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

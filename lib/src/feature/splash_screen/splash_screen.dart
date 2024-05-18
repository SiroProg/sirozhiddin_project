import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sirozhiddin_project/src/common/provider/app_provider.dart';
import 'package:sirozhiddin_project/src/common/style/app_colors.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../register_screen/register_screen.dart';

class CustomSplashScreen extends ConsumerStatefulWidget {
  const CustomSplashScreen({super.key});

  @override
  ConsumerState<CustomSplashScreen> createState() => _CustomSplashScreenState();
}

class _CustomSplashScreenState extends ConsumerState<CustomSplashScreen> {
  void initState() {
    super.initState();
    ref.read(appProvider).pageController = PageController();
  }

  @override
  void deactivate() {
    super.deactivate();
    ref.read(appProvider).pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            PageView(
              onPageChanged: (value) {
                ref.read(appProvider).initialSplashPage.value = value;
              },
              controller: ref.watch(appProvider).pageController,
              children: const [
                SplashScreenWidget(
                  image: "assets/images/Splash2-1.png",
                  title: "Premium Food\nAt Your Doorstep",
                  description:
                      "Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy",
                ),
                SplashScreenWidget(
                  image: "assets/images/Splash2-2.png",
                  title: "Premium Food\nAt Your Doorstep",
                  description:
                      "Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy",
                ),
                SplashScreenWidget(
                  image: "assets/images/Splash2-3.png",
                  title: "Get Discounts\nOn All Products",
                  description:
                      "Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy",
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width.w,
                  height: (MediaQuery.of(context).size.height / 1.2).h,
                ),
                SmoothPageIndicator(
                  controller: ref.watch(appProvider).pageController,
                  count: 3,
                  effect: WormEffect(
                    activeDotColor: AppColors.green,
                    dotHeight: 10.h,
                    dotWidth: 10.w,
                    type: WormType.thin,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20).w,
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width.w,
                    height: 50.h,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.green,
                        shape: ContinuousRectangleBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(20),
                          ).w,
                        ),
                      ),
                      onPressed: () {
                        if (ref.watch(appProvider).initialSplashPage.value ==
                            2) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => RegisterScreen(),
                            ),
                          );
                        } else {
                          ref.read(appProvider).pageController.nextPage(
                              duration: Duration(milliseconds: 500),
                              curve: Curves.easeIn);
                        }
                      },
                      child: ValueListenableBuilder(
                        valueListenable:
                            ref.watch(appProvider).initialSplashPage,
                        builder: (ctx, value, child) {
                          return Text(
                            value == 2 ? "Get started" : "Next",
                            style: TextStyle(color: AppColors.white),
                          );
                        },
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class SplashScreenWidget extends StatelessWidget {
  final String image;
  final String title;
  final String description;

  const SplashScreenWidget({
    super.key,
    required this.image,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image(
          width: MediaQuery.of(context).size.width.w,
          height: MediaQuery.of(context).size.height.h,
          image: AssetImage(image),
          fit: BoxFit.cover,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width.w,
              height: (MediaQuery.of(context).size.height / 1.7).h,
            ),
            Text(
              title,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: AppColors.black,
                fontSize: 30.sp,
                fontWeight: FontWeight.w900,
                fontFamily: "Poppins",
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 40, vertical: 10).w,
              child: Text(
                description,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: AppColors.black,
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w300,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

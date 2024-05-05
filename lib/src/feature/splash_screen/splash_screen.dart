import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
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
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height / 1.2,
                ),
                SmoothPageIndicator(
                  controller: ref.watch(appProvider).pageController,
                  count: 3,
                  effect: WormEffect(
                    activeDotColor: AppColors.green,
                    dotHeight: 10,
                    dotWidth: 10,
                    type: WormType.thin,
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: 50,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.green,
                        shape: const ContinuousRectangleBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(20),
                          ),
                        ),
                      ),
                      onPressed: () {
                        if (ref.watch(appProvider).initialSplashPage.value %
                                3 ==
                            0) {
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
                          ref.read(appProvider).initialSplashPage.value++;
                        }
                      },
                      child: ValueListenableBuilder(
                        valueListenable:
                            ref.watch(appProvider).initialSplashPage,
                        builder: (ctx, value, child) {
                          return Text(
                            value % 3 == 0 ? "Get started" : "Next",
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
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          image: AssetImage(image),
          fit: BoxFit.cover,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / 1.7,
            ),
            Text(
              title,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: AppColors.black,
                fontSize: 30,
                fontWeight: FontWeight.w900,
                fontFamily: "Poppins",
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
              child: Text(
                description,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: AppColors.black,
                  fontSize: 18,
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

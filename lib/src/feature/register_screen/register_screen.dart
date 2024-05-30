import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sirozhiddin_project/src/common/style/app_colors.dart';
import 'package:sirozhiddin_project/src/feature/register_screen/sign_up_screen.dart';

import 'sign_in_sqreen.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image(
            width: double.infinity,
            fit: BoxFit.cover,
            image: const AssetImage(
              "assets/images/welcom1.png",
            ),
          ),
          SizedBox(
            width: double.infinity,
            height: 600.h,
            child: DecoratedBox(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  transform: const GradientRotation(1.6),
                  colors: [
                    AppColors.black.withOpacity(0.4),
                    AppColors.white.withOpacity(0),
                    AppColors.white.withOpacity(0),
                  ],
                ),
              ),
            ),
          ),
          SafeArea(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    BackButton(
                      color: AppColors.white,
                    ),
                    Text(
                      'Welcome',
                      style: TextStyle(color: AppColors.white, fontSize: 18),
                    ),
                    50.horizontalSpace,
                  ],
                ),
                const Spacer(),
                SizedBox(
                  width: double.infinity,
                  height: 300.h,
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      color: AppColors.white,
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20),
                      ).w,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 30)
                          .r,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Welcome",
                            style: TextStyle(
                              color: AppColors.black,
                              fontSize: 25.sp,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 30).r,
                            child: Text(
                              "Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy",
                              style: TextStyle(
                                color: AppColors.black10,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                              top: 20,
                            ).r,
                            child: SizedBox(
                              width: double.infinity,
                              height: 60.h,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: AppColors.white,
                                  shadowColor: AppColors.white,
                                  shape: ContinuousRectangleBorder(
                                    borderRadius: const BorderRadius.all(
                                      Radius.circular(10),
                                    ).w,
                                  ),
                                ),
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => const SignIn(),
                                    ),
                                  );
                                },
                                child: Center(
                                  child: Text(
                                    "Sign in",
                                    style: TextStyle(
                                      color: AppColors.black,
                                      fontSize: 15.sp,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 10).r,
                            child: SizedBox(
                              width: double.infinity,
                              height: 60.h,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: AppColors.orange,
                                  shadowColor: AppColors.white,
                                  shape: ContinuousRectangleBorder(
                                    borderRadius: const BorderRadius.all(
                                      Radius.circular(10),
                                    ).w,
                                  ),
                                ),
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => const SignUp(),
                                    ),
                                  );
                                },
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.account_circle_outlined,
                                      color: AppColors.white,
                                      size: 25.w,
                                    ),
                                    Spacer(
                                      flex: 2,
                                    ),
                                    Text(
                                      "Create an account",
                                      style: TextStyle(
                                        color: AppColors.white,
                                        fontSize: 15.sp,
                                      ),
                                    ),
                                    Spacer(
                                      flex: 2,
                                    ),
                                    SizedBox(
                                      width: 25.w,
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

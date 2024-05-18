import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sirozhiddin_project/src/common/provider/app_provider.dart';
import 'package:sirozhiddin_project/src/common/style/app_colors.dart';

class SignUp extends ConsumerStatefulWidget {
  const SignUp({super.key});

  @override
  ConsumerState<SignUp> createState() => _SignUpState();
}

class _SignUpState extends ConsumerState<SignUp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image(
            width: MediaQuery.of(context).size.width,
            fit: BoxFit.cover,
            image: const AssetImage(
              "assets/images/welcome3.png",
            ),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width.w,
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
                      style: TextStyle(color: AppColors.white, fontSize: 18.sp),
                    ),
                    50.horizontalSpace,
                  ],
                ),
                const Spacer(),
                SizedBox(
                  width: MediaQuery.of(context).size.width.w,
                  height: 450.h,
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      color: AppColors.white60,
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
                            "Create account",
                            style: TextStyle(
                              color: AppColors.black,
                              fontSize: 25.sp,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 30).r,
                            child: Text(
                              "Quickly create account",
                              style: TextStyle(
                                color: AppColors.black10,
                                fontSize: 15.sp,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 30).r,
                            child: SizedBox(
                              width: MediaQuery.of(context).size.width.w,
                              height: 60.h,
                              child: DecoratedBox(
                                decoration: BoxDecoration(
                                  color: AppColors.white,
                                  borderRadius: const BorderRadius.all(
                                    Radius.circular(10),
                                  ).w,
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 20,
                                  ).r,
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Icon(
                                        Icons.email_outlined,
                                        color: AppColors.black10,
                                      ),
                                      20.horizontalSpace,
                                      SizedBox(
                                        width: 240.w,
                                        child: TextField(
                                          decoration: InputDecoration(
                                            hintText: "Email Address",
                                            border: InputBorder.none,
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 10).r,
                            child: SizedBox(
                              width: MediaQuery.of(context).size.width.w,
                              height: 60.h,
                              child: DecoratedBox(
                                decoration: BoxDecoration(
                                  color: AppColors.white,
                                  borderRadius: const BorderRadius.all(
                                    Radius.circular(10),
                                  ).w,
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                    left: 20,
                                    right: 10,
                                  ).r,
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Icon(
                                        Icons.phone_outlined,
                                        color: AppColors.black10,
                                      ),
                                      20.horizontalSpace,
                                      SizedBox(
                                        width: 290.w,
                                        child: TextField(
                                          decoration: InputDecoration(
                                            hintText: "Phone number",
                                            border: InputBorder.none,
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 10).r,
                            child: SizedBox(
                              width: MediaQuery.of(context).size.width.w,
                              height: 60.h,
                              child: DecoratedBox(
                                decoration: BoxDecoration(
                                  color: AppColors.white,
                                  borderRadius: const BorderRadius.all(
                                    Radius.circular(10),
                                  ).w,
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                    left: 20,
                                    right: 10,
                                  ).r,
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Icon(
                                        Icons.lock_outline,
                                        color: AppColors.black10,
                                      ),
                                      20.horizontalSpace,
                                      SizedBox(
                                        width: 290.w,
                                        child: ValueListenableBuilder(
                                          valueListenable:
                                              ref.read(appProvider).secureText,
                                          builder: (ctx, value, child) {
                                            return TextField(
                                              obscureText: value,
                                              decoration: InputDecoration(
                                                suffixIcon: IconButton(
                                                  onPressed: () {
                                                    ref
                                                            .read(appProvider)
                                                            .secureText
                                                            .value =
                                                        !ref
                                                            .read(appProvider)
                                                            .secureText
                                                            .value;
                                                  },
                                                  icon: Icon(
                                                    !ref
                                                            .watch(appProvider)
                                                            .secureText
                                                            .value
                                                        ? Icons
                                                            .visibility_outlined
                                                        : Icons
                                                            .visibility_off_outlined,
                                                  ),
                                                ),
                                                hintText: "Password",
                                                border: InputBorder.none,
                                              ),
                                            );
                                          },
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                          10.verticalSpace,
                          SizedBox(
                            width: MediaQuery.of(context).size.width.w,
                            height: 60.h,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: AppColors.green,
                                shadowColor: AppColors.white,
                                shape: ContinuousRectangleBorder(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(10),
                                  ).w,
                                ),
                              ),
                              onPressed: () {},
                              child: Center(
                                child: Text(
                                  "Signup",
                                  style: TextStyle(
                                    color: AppColors.white,
                                    fontSize: 15,
                                    fontWeight: FontWeight.w500,
                                  ),
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

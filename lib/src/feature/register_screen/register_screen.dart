import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:sirozhiddin_project/src/common/style/app_colors.dart';

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
            width: MediaQuery.of(context).size.width,
            fit: BoxFit.cover,
            image: AssetImage(
              "assets/images/welcom1.png",
            ),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: 600,
            child: DecoratedBox(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  transform: GradientRotation(1.6),
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
                    SizedBox(
                      width: 50,
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

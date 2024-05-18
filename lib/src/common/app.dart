import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../feature/splash_screen/splash_screen.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      minTextAdapt: true,
      splitScreenMode: true,
      designSize: const Size(412, 845),
      builder: (_, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: "Projeeeect Siro",
          home: child,
        );
      },
      child: CustomSplashScreen(),
    );
  }
}

// class App extends StatelessWidget {
//   const App({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         body: SizedBox(
//           width: 412,
//           height: 845,
//           child: ColoredBox(
//             color: Colors.red,
//           ),
//         ),
//       ),
//     );
//   }
// }

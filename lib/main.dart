import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task/core/di/injection.dart';
import 'package:task/features/Login_screen/login_screen.dart';
import 'package:task/providers.dart';

final GlobalKey<NavigatorState> navigator = GlobalKey<NavigatorState>();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await init();
  runApp(const GenerateMultiProvider(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Task',
        theme: ThemeData(),
        navigatorKey: navigator,
        home: const LoginScreen(),
      ),
    );
  }
}

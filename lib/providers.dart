import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task/core/di/injection.dart';
import 'package:task/data/providers/cat_provider.dart';
import 'package:task/data/providers/login_provider.dart';

class GenerateMultiProvider extends StatelessWidget {
  final Widget child;

  const GenerateMultiProvider({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => getIt<LoginProvider>()),
        ChangeNotifierProvider(create: (_) => getIt<CategoryProvider>()),
      ],
      child: child,
    );
  }
}

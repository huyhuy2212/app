import 'package:appcuoiki/apps/router/router.dart';
import 'package:appcuoiki/provider/like_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => LikeProvider(),
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        routerConfig: RouterCustom.router,
      ),
    );
  }
}

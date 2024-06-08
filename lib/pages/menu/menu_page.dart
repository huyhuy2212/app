import 'package:appcuoiki/apps/router/router_name.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class MenuPage extends StatelessWidget {
  const MenuPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ListTile(
              onTap: () {
                context.goNamed(RouterName.home);
              },
              leading: const Icon(
                CupertinoIcons.home,
                color: Colors.white,
              ),
              title: const Text(
                'Trang Chủ',
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
            ),
            ListTile(
              leading: const Icon(
                CupertinoIcons.heart,
                color: Colors.white,
              ),
              onTap: () {
                context.goNamed(RouterName.like);
              },
              title: const Text(
                'Yêu Thích',
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
            ),
            ListTile(
              onTap: () {
                context.goNamed(RouterName.category);
              },
              leading: const Icon(
                CupertinoIcons.calendar_today,
                color: Colors.white,
              ),
              title: const Text(
                'Danh Mục',
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
            ),
            const ListTile(
              leading: Icon(
                CupertinoIcons.settings,
                color: Colors.white,
              ),
              title: Text(
                'Cài Đặt',
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

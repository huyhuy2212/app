import 'package:appcuoiki/apps/router/router_name.dart';
import 'package:appcuoiki/mockup/item_mockup.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:transparent_image/transparent_image.dart';

class CategoryPage extends StatelessWidget {
  const CategoryPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView.separated(
          separatorBuilder: (context, index) => const SizedBox(height: 20),
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          itemCount: dataImage.length,
          itemBuilder: (BuildContext context, int index) {
            return InkWell(
              onTap: () {
                context.goNamed(RouterName.categoryProduct);
              },
              child: AspectRatio(
                aspectRatio: 5 / 2,
                child: Container(
                  clipBehavior: Clip.hardEdge,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: FadeInImage.memoryNetwork(
                      fit: BoxFit.cover,
                      placeholder: kTransparentImage,
                      image: dataImage[index]),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

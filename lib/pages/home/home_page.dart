import 'package:appcuoiki/pages/home/widgets/home_header.dart';
import 'package:appcuoiki/pages/home/widgets/home_list_category.dart';
import 'package:appcuoiki/pages/home/widgets/home_search.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';


class HomePage extends StatelessWidget {
  const HomePage({super.key});
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsetsDirectional.symmetric(horizontal: 20.0),
          child: Column(
            children: [
              HomeHeader(),
              SizedBox(height: 20),
              HomeSearch(),
              SizedBox(height: 20),
              Expanded(child: HomeListCategory())
            ],
          ),
        ),
      ),
    );
  }
}

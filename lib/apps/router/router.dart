import 'package:appcuoiki/apps/router/router_name.dart';
import 'package:appcuoiki/models/article.dart';
import 'package:appcuoiki/pages/category/category_page.dart';
import 'package:appcuoiki/pages/home/home_page.dart';
import 'package:appcuoiki/pages/like/like_page.dart';
import 'package:appcuoiki/pages/product/product_page.dart';
import 'package:appcuoiki/pages/root_page.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class RouterCustom {
  static final GoRouter router = GoRouter(
    initialLocation: '/',
    routes: <RouteBase>[
      ShellRoute(
        builder: (context, state, child) {
          return RootPage(
            child: child,
          );
        },
        routes: [
          GoRoute(
            path: '/',
            name: RouterName.home,
            builder: (BuildContext context, GoRouterState state) {
              return const HomePage();
            },
            routes: <RouteBase>[
              GoRoute(
                name: RouterName.product,
                path: 'product',
                builder: (BuildContext context, GoRouterState state) {
                  Article item = state.extra as Article;
                  return ProductPage(
                    item: item, //truyen ite<m>
                  );
                },
              ),
            ],
          ),
          GoRoute(
            name: RouterName.category,
            path: '/category',
            builder: (BuildContext context, GoRouterState state) {
              return const CategoryPage();
            },
            routes: [
              GoRoute(
                name: RouterName.categoryProduct,
                path: 'product',
                builder: (BuildContext context, GoRouterState state) {
                  Article item = state.extra as Article;
                  return ProductPage(
                    item: item,
                  );
                },
              ),
            ],
          ),
          GoRoute(
            name: RouterName.like,
            path: '/like',
            builder: (BuildContext context, GoRouterState state) {
              return const LikePage();
            },
            routes: [
              GoRoute(
                name: RouterName.likeProduct,
                path: 'product',
                builder: (BuildContext context, GoRouterState state) {
                  Article item = state.extra as Article;
                  return ProductPage(
                    item: item,
                  );
                },
              ),
            ],
          ),
        ],
      ),
    ],
  );
}

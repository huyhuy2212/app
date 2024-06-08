import 'package:appcuoiki/apps/router/router_name.dart';
import 'package:appcuoiki/mockup/item_mockup.dart';
import 'package:appcuoiki/models/article.dart';
import 'package:appcuoiki/provider/like_provider.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:transparent_image/transparent_image.dart';

class LikePage extends StatelessWidget {
  const LikePage({super.key});
  @override
  Widget build(BuildContext context) {
    List<int> idListLike = context.watch<LikeProvider>().listLike;
    List<Article> data =
        dataMockup.where((element) => idListLike.contains(element.id)).toList();

    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              context.read<LikeProvider>().deleteAll();
            },
            icon: const Icon(Icons.remove_circle),
          ),
        ],
      ),
      body: SafeArea(
        child: data.isNotEmpty
            ? ListView.separated(
                separatorBuilder: (context, index) =>
                    const SizedBox(height: 20),
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                itemCount: data.length,
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
                            image: data[index].image),
                      ),
                    ),
                  );
                },
              )
            : const Center(child: Text('KHONG CO SAN PHAM DUOC YEU THICH')),
      ),
    );
  }
}

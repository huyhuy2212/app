import 'package:appcuoiki/models/article.dart';
import 'package:appcuoiki/provider/like_provider.dart';
import 'package:flutter/material.dart';
import 'package:like_button/like_button.dart';
import 'package:provider/provider.dart';
import 'package:transparent_image/transparent_image.dart';

// ignore: must_be_immutable
class ProductPage extends StatelessWidget {
  Article item;
  ProductPage({super.key, required this.item});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: InkWell(
              onTap: () {
                Navigator.pop(context); // click anh chuyen ve
              },
              child: SizedBox(
                width: double.infinity,
                child: Stack(
                  children: [
                    Positioned.fill(
                      child: Hero(
                        tag: 'tag-${item.id}', // hieu ung transitions
                        child: FadeInImage.memoryNetwork(
                          placeholder: kTransparentImage,
                          fit: BoxFit.cover,
                          image: item.image,
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 10,
                      right: 10,
                      child: Consumer<LikeProvider>(
                        builder: (context, value, child) => LikeButton(
                          isLiked: value.listLike.contains(item.id),
                          onTap: (isLiked) {
                            context.read<LikeProvider>().onLike(item.id);
                            return Future.value(!isLiked);
                          },
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item.title,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(item.description),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

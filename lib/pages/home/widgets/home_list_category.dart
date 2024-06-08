import 'package:appcuoiki/apps/router/router_name.dart';
import 'package:appcuoiki/mockup/item_mockup.dart';
import 'package:appcuoiki/provider/like_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:like_button/like_button.dart';
import 'package:provider/provider.dart';
import 'package:transparent_image/transparent_image.dart';

class HomeListCategory extends StatelessWidget {
  const HomeListCategory({super.key});
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: dataMockup.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2, //chia cot
        mainAxisSpacing: 15, // tach tren duoi
        crossAxisSpacing: 15, // tach trai phai
        childAspectRatio: 1, // chia deu
      ),
      itemBuilder: (BuildContext context, int index) {
        return InkWell(
          onTap: () {
            context.goNamed(RouterName.product, extra: dataMockup[index]);
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start, //dat tat ca len dau
            children: [
              Expanded(
                child: Container(
                  clipBehavior: Clip.hardEdge, // cat anh
                  width: double.infinity, // full anh
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        offset: const Offset(1, 1),
                        color: Colors.grey.shade200,
                        blurRadius: 2,
                        spreadRadius: 2,
                      )
                    ],
                    borderRadius: BorderRadius.circular(
                      10.0, //bo vien
                    ),
                  ),
                  child: Stack(
                    children: [
                      Positioned.fill(
                        child: Hero(
                          tag: 'tag-${dataMockup[index].id}', //dat key
                          child: FadeInImage.memoryNetwork(
                            placeholder: kTransparentImage,
                            fit: BoxFit.cover, // fit anh
                            image: dataMockup[index].image,
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 0,
                        right: 0,
                        child: Consumer<LikeProvider>(
                          builder: (context, value, child) => LikeButton(
                            isLiked:
                                value.listLike.contains(dataMockup[index].id),
                            // Lay danh sach id khi thao tac like
                            onTap: (like) {
                              // luc nay value la likeprovider
                              value.onLike(dataMockup[index].id);
                              return Future.value(!like);
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                dataMockup[index].title,
                maxLines: 1,
                overflow: TextOverflow.ellipsis, // max line trong mot dong
              )
            ],
          ),
        );
      },
    );
  }
}

import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../core/t_colors/t_colors.dart';

class ArticlesWidget extends StatelessWidget {
  const ArticlesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Material(
      color: Colors.white,
      child: InkWell(
        onTap: () {},
        child: Stack(
          children: [
            Container(
              height: 60,
              width: 60,
              color: lightIconsColor,
            ),
            Positioned(
              right: 0,
              bottom: 0,
              child: Container(
                height: 60,
                width: 60,
                color: lightIconsColor,
              ),
            ),
            Container(
              padding: const EdgeInsets.all(6),
              margin: const EdgeInsets.all(8),
              color: Colors.white,
              child: Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(6),
                    child: FancyShimmerImage(
                      errorWidget: Image.network(
                          'https://i0.wp.com/www.dobitaobyte.com.br/wp-content/uploads/2016/02/no_image.png?ssl=1'),
                      imageUrl:
                          'https://i.itworldcanada.com/wp-content/uploads/2021/03/hashtag-trending-text-middle2.png',
                      height: size.height * 0.10,
                      width: size.height * 0.10,
                      boxFit: BoxFit.fill,
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Mobile Dev | SOLID | OOP | Java | Kotlin | Dart | Android - Flutter SDK | Jetpack | Compose | Provider | Bloc | MVVM | Git | Ktlint',
                          textAlign: TextAlign.justify,
                          style: TextStyle(
                              fontWeight: FontWeight.normal,
                              overflow: TextOverflow.ellipsis),
                          maxLines: 2,
                        ),
                        const SizedBox(height: 5),
                        const Align(
                          alignment: Alignment.topRight,
                          child: Text(
                            '⌛ Reading time',
                            style: TextStyle(
                                fontWeight: FontWeight.w100, fontSize: 14),
                          ),
                        ),
                        FittedBox(
                          child: Row(
                            children: [
                              IconButton(
                                onPressed: () {},
                                icon: const Icon(
                                  CupertinoIcons.link,
                                  size: 16,
                                ),
                              ),
                              Text(
                                '2020-2020-2020',
                                style: TextStyle(
                                    fontWeight: FontWeight.w100,
                                    fontSize: 16,
                                    overflow: TextOverflow.ellipsis),
                                maxLines: 1,
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

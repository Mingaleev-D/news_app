import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../core/t_colors/t_colors.dart';

class LoadingWindget extends StatefulWidget {
  const LoadingWindget({super.key});

  @override
  State<LoadingWindget> createState() => _LoadingWindgetState();
}

class _LoadingWindgetState extends State<LoadingWindget> {
  BorderRadius borderRadius = BorderRadius.circular(8);
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Material(
      color: Colors.white,
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
            child: Shimmer.fromColors(
              baseColor: lightIconsColor,
              highlightColor: lightIconsColor.withOpacity(0.2),
              child: Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(6),
                    child: Container(
                      height: size.height * 0.10,
                      width: size.height * 0.10,
                      color: lightIconsColor,
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: size.height * 0.06,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            borderRadius: borderRadius,
                            color: lightIconsColor,
                          ),
                        ),
                        const SizedBox(height: 5),
                        Align(
                          alignment: Alignment.topRight,
                          child: Container(
                            height: size.height * 0.02,
                            width: size.width * 0.4,
                            decoration: BoxDecoration(
                              borderRadius: borderRadius,
                              color: lightIconsColor,
                            ),
                          ),
                        ),
                        FittedBox(
                          child: Row(
                            children: [
                              ClipOval(
                                child: Container(
                                  height: 25,
                                  width: 25,
                                  color: lightIconsColor,
                                ),
                              ),
                              const SizedBox(width: 5),
                              Container(
                                height: size.height * 0.02,
                                width: size.width * 0.4,
                                decoration: BoxDecoration(
                                  borderRadius: borderRadius,
                                  color: lightIconsColor,
                                ),
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
          ),
        ],
      ),
    );
  }
}

import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app/core/constants/vars.dart';
import 'package:news_app/core/t_colors/t_colors.dart';
import 'package:news_app/features/news_feature/presentation/widgets/articles_widget.dart';
import 'package:news_app/features/news_feature/presentation/widgets/drawer_widget.dart';
import 'package:news_app/features/news_feature/presentation/widgets/loading_top_trending.dart';
import 'package:news_app/features/news_feature/presentation/widgets/loading_windget.dart';
import 'package:news_app/features/news_feature/presentation/widgets/tabs_widget.dart';
import 'package:news_app/features/news_feature/presentation/widgets/top_trending_widget.dart';
import 'package:page_transition/page_transition.dart';

import '../search/search.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var newsType = NewsType.allNews;
  int currentPageIndex = 0;
  String sortBy = SortByEnum.publishedAt.name;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          title: const Text(
            'github.com/Mingaleev-D',
            style: TextStyle(
                fontSize: 22, fontWeight: FontWeight.w400, letterSpacing: 0.6),
          ),
          actions: [
            IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  PageTransition(
                      type: PageTransitionType.rightToLeft,
                      child: SearchPage(),
                      inheritTheme: true,
                      ctx: context),
                );
              },
              icon: const Icon(CupertinoIcons.search),
            )
          ],
        ),
        drawer: const DrawerWidget(),
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TabsWidget(
                    text: 'All news',
                    color: newsType == NewsType.allNews
                        ? lightBackgroundColor
                        : Colors.transparent,
                    fontSize: newsType == NewsType.allNews ? 22 : 16,
                    function: () {
                      if (newsType == NewsType.allNews) {
                        return;
                      }
                      setState(() {
                        newsType = NewsType.allNews;
                      });
                    },
                  ),
                  const SizedBox(width: 20),
                  TabsWidget(
                    text: 'Top headlines',
                    color: newsType == NewsType.topTrending
                        ? lightBackgroundColor
                        : Colors.transparent,
                    fontSize: newsType == NewsType.topTrending ? 22 : 16,
                    function: () {
                      if (newsType == NewsType.topTrending) {
                        return;
                      }
                      setState(() {
                        newsType = NewsType.topTrending;
                      });
                    },
                  ),
                ],
              ),
              const SizedBox(height: 10),
              if (newsType == NewsType.topTrending)
                const SizedBox()
              else
                SizedBox(
                  height: 32,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      paginationButtons(
                          textBtn: 'Prev',
                          function: () {
                            if (currentPageIndex == 0) {
                              return;
                            }
                            setState(() {
                              currentPageIndex -= 1;
                            });
                          }),
                      const SizedBox(width: 10),
                      Flexible(
                        flex: 2,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: 9,
                          itemBuilder: (BuildContext context, int index) {
                            return Material(
                              //elevation: 2.0,
                              borderRadius: BorderRadius.circular(6.0),
                              color: currentPageIndex == index
                                  ? lightIconsColor
                                  : Colors.transparent,
                              child: InkWell(
                                borderRadius: BorderRadius.circular(6.0),
                                onTap: () {
                                  setState(() {
                                    currentPageIndex = index;
                                  });
                                },
                                child: Center(
                                    child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text('${index + 1}'),
                                )),
                              ),
                            );
                          },
                        ),
                      ),
                      paginationButtons(
                          textBtn: 'Next',
                          function: () {
                            if (currentPageIndex == 8) {
                              return;
                            }
                            setState(() {
                              currentPageIndex++;
                            });
                          }),
                    ],
                  ),
                ),
              const SizedBox(height: 12),
              newsType == NewsType.topTrending
                  ? const SizedBox()
                  : Align(
                      alignment: Alignment.centerRight,
                      child: DropdownButton(
                        value: sortBy,
                        items: dropdownItems,
                        onChanged: (String? value) {},
                      ),
                    ),
              if (newsType == NewsType.allNews)
                Expanded(
                  child: ListView.builder(
                    shrinkWrap: true,
                    // physics: const NeverScrollableScrollPhysics(),
                    itemCount: 100,
                    itemBuilder: (BuildContext context, int index) {
                      return //const LoadingWindget();
                          const ArticlesWidget();
                    },
                  ),
                ),
              if (newsType == NewsType.topTrending)
                SizedBox(
                  height: size.height * 0.6,
                  child: Swiper(
                    viewportFraction: 0.9,
                    layout: SwiperLayout.STACK,
                    itemWidth: size.width * 0.9,
                    itemCount: 5,
                    itemBuilder: (context, index) {
                      return
                          //LoadingTopTrending();
                          const TopTrendingWidget();
                    },
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }

  Widget paginationButtons(
      {required Function function, required String textBtn}) {
    return ElevatedButton(
      onPressed: () {
        function();
      },
      style: ElevatedButton.styleFrom(backgroundColor: lightIconsColor),
      child: Text(
        textBtn,
        style: const TextStyle(
            color: Colors.white, fontWeight: FontWeight.w600, fontSize: 18),
      ),
    );
  }

  List<DropdownMenuItem<String>> get dropdownItems {
    List<DropdownMenuItem<String>> menuItems = [
      DropdownMenuItem(
        value: SortByEnum.publishedAt.name,
        child: Text(SortByEnum.publishedAt.name),
      ),
      DropdownMenuItem(
        value: SortByEnum.popularity.name,
        child: Text(SortByEnum.popularity.name),
      ),
      DropdownMenuItem(
        value: SortByEnum.relevancy.name,
        child: Text(SortByEnum.relevancy.name),
      ),
    ];
    return menuItems;
  }
}

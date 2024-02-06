import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:news_app/features/news_feature/presentation/widgets/empty_news.dart';
import 'package:page_transition/page_transition.dart';

import '../../../../../core/constants/vars.dart';
import '../../../../../core/t_colors/t_colors.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  late final TextEditingController searchTextController;
  late final FocusNode focusNode;

  @override
  void initState() {
    super.initState();
    searchTextController = TextEditingController();
    focusNode = FocusNode();
  }

  @override
  void dispose() {
    if (mounted) {
      searchTextController.dispose();
      focusNode.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(
      child: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Scaffold(
          body: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: const Icon(CupertinoIcons.arrow_up_left),
                    ),
                    Flexible(
                      child: TextField(
                        focusNode: focusNode,
                        controller: searchTextController,
                        autofocus: true,
                        textInputAction: TextInputAction.search,
                        keyboardType: TextInputType.text,
                        onEditingComplete: () {},
                        decoration: InputDecoration(
                          contentPadding:
                              const EdgeInsets.only(left: 10, top: 13),
                          hintText: 'Search ...',
                          enabledBorder: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          suffixIcon: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 8.0),
                            child: GestureDetector(
                              onTap: () {
                                searchTextController.clear();
                                focusNode.unfocus();
                                setState(() {});
                              },
                              child: const Icon(
                                CupertinoIcons.clear_circled,
                                size: 18,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: MasonryGridView.count(
                    itemCount: searchKeywords.length,
                    crossAxisCount: 4,
                    mainAxisSpacing: 4,
                    crossAxisSpacing: 4,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        child: Container(
                          margin: const EdgeInsets.all(4.0),
                          decoration: BoxDecoration(
                              border: Border.all(color: lightIconsColor),
                              borderRadius: BorderRadius.circular(8)),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Center(
                              child: Text(
                                searchKeywords[index],
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
              const EmptyNews(
                text: 'Ops! No results found',
                imagePath: 'assets/images/search.png',
              ),
            ],
          ),
        ),
      ),
    );
  }
}

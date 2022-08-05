// part of 'home.dart';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../data/models/category.dart';

class CategoriesView extends StatelessWidget {
  final List<Category<int>> categories;

  const CategoriesView({
    Key? key,
    required this.categories,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 158,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.all(24),
        itemBuilder: (context, index) => SizedBox(
          width: 80,
          height: 50,
          child: Container(
            color: Colors.transparent,
            child: Stack(
              children: [
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    width: 80,
                    height: 80,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Colors.white,
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.topCenter,
                  child: CachedNetworkImage(
                    width: 60,
                    height: 80,
                    placeholder: (_, __) => Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: Colors.grey.shade300,
                      ),
                      width: 60,
                      height: 80,
                    ),
                    fit: BoxFit.scaleDown,
                    imageUrl: categories[index].imageUrl,
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
                    child: Text(
                      categories[index].name,
                      style: const TextStyle(
                        fontSize: 10,
                      ),
                      maxLines: 1,
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
        separatorBuilder: (context, index) => const SizedBox(
          width: 16,
        ),
        itemCount: categories.length,
      ),
    );
  }
}

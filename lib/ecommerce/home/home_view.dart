import 'package:carousel_slider/carousel_slider.dart';
import 'package:e_commerce_full/models/category_model.dart';
import 'package:e_commerce_full/models/product_model.dart';
import 'package:flutter/material.dart';

import 'widgets/carousel_slider_widget.dart';
import 'widgets/product_card_widget.dart';
import 'widgets/section_title_widget.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        title: Text(
          'Toprak Commerce',
          style: Theme.of(context)
              .textTheme
              .headline2!
              .copyWith(color: Colors.black),
        ),
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        child: Column(
          children: [
            CarouselSlider(
              options: CarouselOptions(
                aspectRatio: 1.5,
                viewportFraction: 0.95,
                enlargeCenterPage: true,
                enlargeStrategy: CenterPageEnlargeStrategy.height,
              ),
              items: CategoryModel.categories
                  .map((category) => HeroCarouselCard(category: category))
                  .toList(),
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 16,
                right: 16,
                top: 10,
                bottom: 120,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  const SectionTitle(
                    title: 'Recommended',
                  ),
                  ProductCardWidget(
                    product: ProductModel.products
                        .where((element) => element.isRecommended)
                        .toList(),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  const SectionTitle(
                    title: 'Most Popular',
                  ),
                  ProductCardWidget(
                    product: ProductModel.products
                        .where((element) => element.isPopular)
                        .toList(),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

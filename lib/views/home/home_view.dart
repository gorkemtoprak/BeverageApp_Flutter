import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../blocs/category/category_bloc.dart';
import '../../blocs/product/product_bloc.dart';
import '../../shared/error_widget.dart';
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
            BlocBuilder<CategoryBloc, CategoryState>(
              builder: (context, state) {
                if (state is CategoryLoading) {
                  return const Center(
                    child: CircularProgressIndicator(
                      color: Colors.black,
                    ),
                  );
                }
                if (state is CategoryLoaded) {
                  return CarouselSlider(
                    options: CarouselOptions(
                      aspectRatio: 1.5,
                      viewportFraction: 0.95,
                      enlargeCenterPage: true,
                      enlargeStrategy: CenterPageEnlargeStrategy.height,
                    ),
                    items: state.categories
                        .map((category) => HeroCarouselCard(category: category))
                        .toList(),
                  );
                } else {
                  return const Text('error');
                }
              },
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
                  BlocBuilder<ProductBloc, ProductState>(
                    builder: (context, state) {
                      if (state is ProductLoading) {
                        return const Center(
                          child: CircularProgressIndicator(
                            color: Colors.black,
                          ),
                        );
                      }
                      if (state is ProductLoaded) {
                        return ProductCardWidget(
                          product: state.products
                              .where((element) => element.isRecommended)
                              .toList(),
                        );
                      } else {
                        return const Text('error');
                      }
                    },
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  const SectionTitle(
                    title: 'Most Popular',
                  ),
                  BlocBuilder<ProductBloc, ProductState>(
                    builder: (context, state) {
                      if (state is ProductLoading) {
                        return const Center(
                          child: CircularProgressIndicator(
                            color: Colors.black,
                          ),
                        );
                      }
                      if (state is ProductLoaded) {
                        return ProductCardWidget(
                          product: state.products
                              .where((element) => element.isPopular)
                              .toList(),
                        );
                      } else {
                        return const CustomErrorWidget();
                      }
                    },
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

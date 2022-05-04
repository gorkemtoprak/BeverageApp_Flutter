import 'package:e_commerce_full/models/category_model.dart';
import 'package:e_commerce_full/models/product_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../blocs/product/product_bloc.dart';
import '../../shared/error_widget.dart';
import '../product/product_view.dart';

class CategoryView extends StatelessWidget {
  final CategoryModel? categoryModel;
  const CategoryView({Key? key, this.categoryModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.chevron_left,
            color: Colors.black,
            size: 30,
          ),
        ),
        title: Text(
          categoryModel!.name,
          style: Theme.of(context)
              .textTheme
              .headline2!
              .copyWith(color: Colors.black),
        ),
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.only(
          left: 16,
          right: 16,
          top: 20,
          bottom: 20,
        ),
        child: BlocBuilder<ProductBloc, ProductState>(
          builder: (context, state) {
            if (state is ProductLoading) {
              return const Center(
                child: CircularProgressIndicator(color: Colors.black),
              );
            }
            if (state is ProductLoaded) {
              final List<ProductModel> categoryProducts = state.products
                  .where((product) => product.category == categoryModel!.name)
                  .toList();
              return GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 5,
                  childAspectRatio: 0.95,
                ),
                itemCount: categoryProducts.length,
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ProductView(
                              productModel: categoryProducts[index],
                            ),
                          ));
                    },
                    child: SizedBox(
                      height: 200,
                      width: MediaQuery.of(context).size.width / 2.5,
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: Stack(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(4),
                              child: Image.network(
                                categoryProducts[index].imageUrl,
                                fit: BoxFit.cover,
                                height: 150,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 5, right: 5),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        categoryProducts[index].name,
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline5!
                                            .copyWith(color: Colors.black),
                                      ),
                                      Text(
                                        '\$${categoryProducts[index].price}',
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline6!
                                            .copyWith(color: Colors.black),
                                      ),
                                    ],
                                  ),
                                  IconButton(
                                    onPressed: () {},
                                    icon: const Icon(
                                      Icons.add_circle,
                                      color: Colors.black,
                                    ),
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  );
                },
              );
            } else {
              return const CustomErrorWidget();
            }
          },
        ),
      ),
    );
  }
}

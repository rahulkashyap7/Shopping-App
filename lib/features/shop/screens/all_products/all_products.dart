import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopping_app/common/widgets/appbar/appbar.dart';
import 'package:shopping_app/common/widgets/shimmers/vertical_product_shimmer.dart';
import 'package:shopping_app/utils/constants/sizes.dart';
import 'package:shopping_app/utils/helpers/cloud_helper_function.dart';
import '../../../../common/widgets/products/sortable/sortable_products.dart';
import '../../controls/all_product_controller.dart';
import '../../models/product_model.dart';

class AllProducts extends StatelessWidget {
  const AllProducts({super.key, required this.title, this.query, this.futureMethod});

  final String title;
  final Query? query;
  final Future<List<ProductModel>>? futureMethod;

  @override
  Widget build(BuildContext context) {
    // Initialize controller for managing product fetching.
    final controller = Get.put(AllProductsController());
    return Scaffold(
      appBar: RAppBar(title: Text(title), showBackArrow: true),

      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(RSizes.defaultSpace),
          child: FutureBuilder(
            future: futureMethod ?? controller.fetchProductsByQuery(query),
            builder: (context, snapshot) {
              // Check the state of the FutureBuilder snapshot
              const loader = RVerticalProductShimmer();
              final widget = RCloudHelperFunction.checkMultiRecordState(snapshot: snapshot, loader: loader);

             // Return appropriate widget based on snapshot state
              if (widget != null) return widget;

              // Products found!
              final products = snapshot.data!;

              return RSortableProducts(products: products);
            }
          ),
        ),
      ),
    );
  }
}


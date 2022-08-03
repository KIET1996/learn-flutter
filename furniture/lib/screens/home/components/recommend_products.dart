import 'package:flutter/material.dart';
import 'package:furniture/screens/details/details_screen.dart';
import 'package:furniture/screens/home/components/product_card.dart';
import '../../../models/Product.dart';
import '../../../size_config.dart';

class RecommendProducts extends StatelessWidget {
  const RecommendProducts({
    Key? key,
    required this.products,
  }) : super(key: key);

  final List<Product> products;

  @override
  Widget build(BuildContext context) {
    double defaultSize = SizeConfig.defaultSize;
    return Padding(
      padding: EdgeInsets.all(defaultSize*2),
      child: GridView.builder(
        shrinkWrap: true,
        itemCount: products.length,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount:
          SizeConfig.orientation == Orientation.portrait ? 2 : 4,
          childAspectRatio: 0.693,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
        ),
        itemBuilder: (context, index) => ProductCard(product: products[index], press: (){
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => DetailsScreen(product: products[index],)
                )
            );
          },
        ),
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../constants.dart';
import '../../../models/Product.dart';
import '../../../size_config.dart';

class ProductInfo extends StatelessWidget {
  const ProductInfo({
    Key? key,
    required this.product,
  }) : super(key: key);

  final Product product;

  @override
  Widget build(BuildContext context) {
    double defaultSize = SizeConfig.defaultSize;
    TextStyle lightTextStyle = TextStyle(color: kTextColor.withOpacity(0.6),);
    return Container(
      padding: EdgeInsets.symmetric(horizontal: defaultSize*2),
      height: defaultSize*37.5,
      width: defaultSize*(SizeConfig.orientation==Orientation.landscape? 35 : 15),
      // color: Colors.black38,
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              product.category.toUpperCase(),
              style: lightTextStyle,
            ),
            SizedBox(height: defaultSize,),
            Text(
              product.title,
              style: TextStyle(
                  fontSize: defaultSize*2.4,
                  fontWeight: FontWeight.bold,
                  letterSpacing: -0.8,
                  height: 1.4
              ),
            ),
            SizedBox(height: defaultSize*2,),
            Text(
              "Form",
              style: lightTextStyle,
            ),
            Text(
              "\$${product.price}",
              style: TextStyle(
                  fontSize: defaultSize*1.6,
                  fontWeight: FontWeight.bold,
                  height: 1.4
              ),
            ),
            Text(
              "Available colors",
              style: lightTextStyle,
            ),
            Row(
              children: [
                buildColorBox(defaultSize, color: const Color(0xFF7BA275), isActive: true),
                buildColorBox(defaultSize, color: const Color(0xFFD7D7D7)),
                buildColorBox(defaultSize, color: kTextColor),
              ],
            )

          ],
        ),
      ),
    );
  }
}

Container buildColorBox (double defaultSize, {required Color color, bool isActive = false}) {
  return Container(
    margin: EdgeInsets.only(top: defaultSize, right: defaultSize),
    padding: const EdgeInsets.all(5),
    width: defaultSize*2.4,
    height: defaultSize*2.4,
    decoration: BoxDecoration(
      color: color,
      borderRadius: BorderRadius.circular(6),
    ),
    child: isActive ? SvgPicture.asset("assets/icons/check.svg"): const SizedBox(),
  );
}

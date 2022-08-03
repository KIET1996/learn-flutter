import 'package:flutter/material.dart';
import 'package:furniture/components/text_title.dart';
import 'package:furniture/screens/home/components/recommend_products.dart';
import 'package:furniture/services/fetch_categories.dart';
import 'package:furniture/services/fetch_products.dart';
import 'package:furniture/size_config.dart';
import 'categories.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double defaultSize = SizeConfig.defaultSize;
    return SingleChildScrollView(
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.all(defaultSize*2),
              child: const TitleText(title: "Browse by Categories")
            ),
            FutureBuilder(
              future: fetchCategories(),
              builder: (BuildContext context, AsyncSnapshot snapshot) =>
                snapshot.hasData ?
                Categories(categories: snapshot.data) :
                Center( child: Image.asset("assets/ripple.gif")),
            ),
            const Divider(height: 5.0,),
            Padding(
              padding: EdgeInsets.all(defaultSize*2),
              child: const TitleText( title: "Recommends for you",),
            ),
            FutureBuilder(
              future: fetchProducts(),
              builder: (BuildContext context, AsyncSnapshot snapshot)
                => snapshot.hasData? RecommendProducts(products: snapshot.data,) :
                  Center( child: Image.asset("assets/ripple.gif"),),
            ),

          ],
        ),
      ),
    );
  }
}








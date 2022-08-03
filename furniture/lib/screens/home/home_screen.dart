import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:furniture/constants.dart';
import 'package:furniture/screens/home/components/body.dart';
import 'package:furniture/size_config.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: buildAppBar(),
      body: const Body(),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      leading: IconButton(
        icon: SvgPicture.asset("assets/icons/menu.svg", height: SizeConfig.defaultSize*2),
        onPressed: () {  },
      ),
      actions: [IconButton(
        icon: SvgPicture.asset("assets/icons/scan.svg", height: SizeConfig.defaultSize*2.4),
        onPressed: () {  },
      ),
        const Center(
          child: Text("Scan", style: TextStyle(color: kTextColor),),
        ),
        SizedBox(width: SizeConfig.defaultSize,)
      ],
    );
  }
}

import 'package:flutter/material.dart';
import '../size_config.dart';

class TitleText extends StatelessWidget {
  final String title;

  const TitleText({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double defaultSize = SizeConfig.defaultSize;
    return Padding(
      padding: EdgeInsets.only(left: defaultSize*1.4),
      child: Text(
        title,
        style: TextStyle(
          fontSize: defaultSize * 3.2,
          fontWeight: FontWeight.w900,
        ),
      ),
    );
  }
}
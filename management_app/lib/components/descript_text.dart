import 'package:flutter/material.dart';

import '../constrants.dart';
import '../size_config.dart';

class DescriptonText extends StatelessWidget {
  const DescriptonText({
    Key? key,
    required this.title,
    required this.descript,
  }) : super(key: key);

  final String descript;
  final String title;

  @override
  Widget build(BuildContext context) {
    double defaultSize = SizeConfig.defaultSize;
    return Container(
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: Text(
              title,
              style: TextStyle(
                  fontSize: defaultSize*2.0,
                  fontWeight: FontWeight.bold,
                  color: kTextColor
              ),
            ),
          ),
          Expanded(
              flex: 1,
              child: Text(
                descript,
                style: TextStyle(
                    fontSize: defaultSize*2.2,
                    fontWeight: FontWeight.bold,
                    color: kTextColor
                ),
              )
          )
        ],
      ),
    );
  }
}
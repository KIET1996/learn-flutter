import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:management_app/models/Electric.dart';
import '../../../components/descript_text.dart';
import '../../../constrants.dart';
import '../../../size_config.dart';

class ElectricCard extends StatelessWidget {
  const ElectricCard({
    Key? key,
    required this.electric,
  }) : super(key: key);
  final Electric electric;

  @override
  Widget build(BuildContext context) {
    double defaultSize = SizeConfig.defaultSize;
    final time = DateFormat('dd-MM-yyyy').format(electric.createdTime);
    final formatCurrenccy = NumberFormat.currency(locale: 'vi_VN');

    return Row(
      children: [
        Expanded(
          child: Container(
              margin: EdgeInsets.only(top: defaultSize*2.5),
              child:
              Column(
                children: [
                  ListTile(
                    title: Row(
                      children: [
                        Expanded(
                          child: Container(
                              height: defaultSize*5,
                              alignment: Alignment.center,
                              decoration: const BoxDecoration(
                                color: kPrimaryColor,
                                borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(15),
                                  topLeft: Radius.circular(15),
                                ),
                              ),
                              child: Text("Tháng ${electric.monthYear}", style: TextStyle(
                                fontSize: defaultSize*3.2,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),)
                          ),
                        )
                      ],
                    ),
                    subtitle: Row(
                        children: [
                          Expanded(
                              child: Container(
                                padding: const EdgeInsets.all(8.0),
                                decoration:  BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: const BorderRadius.only(
                                      bottomLeft: Radius.circular(15),
                                      bottomRight: Radius.circular(15)
                                  ),
                                  border: Border.all(
                                    color: kPrimaryColor,
                                  ),
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children:[
                                    DescriptonText(title: "Chỉ số tháng: ", descript: electric.indicator.toStringAsFixed(0)),
                                    DescriptonText(title: "Sử dụng: ", descript: electric.quantity.toStringAsFixed(0)),
                                    DescriptonText(title: "Giá 1kW: ", descript: (formatCurrenccy.format(electric.price))),
                                    DescriptonText(title: "Thành tiền: ", descript: (formatCurrenccy.format(electric.quantity*electric.price))),
                                    SizedBox(height: defaultSize*2.4,),
                                    Align(
                                      alignment: Alignment.bottomRight,
                                      child: Text(
                                        time,
                                        style: TextStyle(color: kTextColor, fontSize: defaultSize*1.8),
                                      ),
                                    )
                                  ],
                                ),
                              )
                          ),
                        ]
                    ),
                  ),
                ],
              )
          ),
        )
      ],
    );
  }
}

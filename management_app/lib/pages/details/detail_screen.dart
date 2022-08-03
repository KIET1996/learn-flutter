import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:management_app/components/title_text.dart';
import 'package:management_app/constrants.dart';
import 'package:management_app/models/Electric.dart';
import 'package:management_app/pages/edit/edit_add_screen.dart';
import 'package:management_app/size_config.dart';

import '../../components/descript_text.dart';
import '../../db/electric_database.dart';

class DetailsPage extends StatefulWidget {
  final int billID;
  const DetailsPage({
    Key? key,
    required this.billID,
  }) : super(key: key);

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  bool isLoading = false;
  late Electric electric;

  @override
  void initState() {
    super.initState();
    refreshElectric();
  }

  Future refreshElectric() async {
    setState(() => isLoading = true);
    print("Cap nhat hoac xoa bill");
    electric = await ElectricDatabase.instance.readElectric(widget.billID);
    setState(() => isLoading = false);
  }

  @override
  Widget build(BuildContext context) {
    double defaultSize = SizeConfig.defaultSize;
    final formatCurrenccy = NumberFormat.currency(locale: 'vi_VN');
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          color: kPrimaryColor,
          onPressed: ()=> Navigator.of(context).pop(),
        ),
        backgroundColor: kBackgroundColor,
        actions: [editButton(), deleteButton()],
      ),
      body: isLoading ? const Center(child: CircularProgressIndicator())
        : Padding(
            padding: const EdgeInsets.all(12),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children:[
                  TitleText(title: "Tháng ${electric.monthYear}"),
                  SizedBox(height: defaultSize*2,),
                  DescriptonText(title: "Chỉ số tháng: ", descript: electric.indicator.toStringAsFixed(0)),
                  DescriptonText(title: "Đã sử dụng: ", descript: electric.quantity.toStringAsFixed(0)),
                  DescriptonText(title: "Giá: ", descript: formatCurrenccy.format(electric.price)),
                  DescriptonText(title: "Thành tiền: ", descript: (formatCurrenccy.format(electric.quantity * electric.price)).toString()),
                ]
              )
            ),
          ),
    );
  }

  Widget editButton() => IconButton(
      icon: const Icon(Icons.edit_outlined),
      color: kPrimaryColor,
      onPressed: () async {
          if (isLoading) return;
          await Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => EditAddScreen(electric: electric,),
            )
          );
          refreshElectric();
        }
      );

  Widget deleteButton() => IconButton(
    icon: const Icon(Icons.delete),
    color: kPrimaryColor,
    onPressed: () async {
      await ElectricDatabase.instance.delete(widget.billID);
      Navigator.of(context).pop();
    },
  );
}

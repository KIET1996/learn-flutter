import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../../constrants.dart';
import '../../../size_config.dart';

class FormElectric extends StatelessWidget {
  const FormElectric({
    Key? key,
    required this.monthYear,
    required this.indicator,
    required this.quantity,
    required this.price,
    required this.onChangedMonthYear,
    required this.onChangedIndicator,
    required this.onChangedQuantity,
    required this.onChangedPrice,
  }) : super(key: key);

  final String monthYear;
  final double indicator;
  final double quantity;
  final double price;
  final ValueChanged<String> onChangedMonthYear;
  final ValueChanged<String> onChangedIndicator;
  final ValueChanged<String> onChangedQuantity;
  final ValueChanged<String> onChangedPrice;
  @override
  Widget build(BuildContext context) {
    double defaultSize = SizeConfig.defaultSize;
    final formatCurrenccy = NumberFormat.currency(locale: 'vi_VN');
    final isFormValid = monthYear.isEmpty;
    return SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Tháng:", style: TextStyle(color: kTextColor, fontSize: defaultSize*2.4,),),
            Container(
              color: Colors.white,
              child:
              TextFormField(
                initialValue: monthYear,
                decoration: InputDecoration(
                  hintText: "Tháng",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: kPrimaryColor, width: 2.0),
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
                validator: (monthYear) =>
                monthYear != null && monthYear.isEmpty ? 'The title cannot be empty' : null,
                onChanged: onChangedMonthYear,
                keyboardType: TextInputType.number,
              ),
            ),
            Text("Chỉ số tháng:", style: TextStyle(color: kTextColor, fontSize: defaultSize*2.4,),),
            Container(
              color: Colors.white,
              child: TextFormField(
                initialValue: isFormValid ? '' : indicator.toString(),
                decoration: InputDecoration(
                  hintText: "Chỉ số tháng",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: kPrimaryColor, width: 2.0),
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
                keyboardType: TextInputType.number,
                onChanged: onChangedIndicator,
              ),
            ),
            Text("Đã sử dụng:", style: TextStyle(color: kTextColor, fontSize: defaultSize*2.4,),),
            Container(
              color: Colors.white,
              child: TextFormField(
                initialValue: isFormValid ? '' : quantity.toString(),
                decoration: InputDecoration(
                  hintText: "Đã sử dụng",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: kPrimaryColor, width: 2.0),
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
                keyboardType: TextInputType.number,
                onChanged: onChangedQuantity,
              ),
            ),
            Text("Giá:", style: TextStyle(color: kTextColor, fontSize: defaultSize*2.4,),),
            Container(
              color: Colors.white,
              child: TextFormField(
                initialValue: isFormValid ? '' : price.toString(),
                decoration: InputDecoration(
                  hintText: "Giá điện",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: kPrimaryColor, width: 2.0),
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
                keyboardType: TextInputType.number,
                onChanged: onChangedPrice,
              ),
            ),
            Text(""
                "Thành tiền: ${formatCurrenccy.format(quantity*price)}",
              style: TextStyle(color: kPrimaryColor, fontSize: defaultSize*2.8, fontWeight: FontWeight.w900),
            )
          ],
        ),
      ),
    );
  }
}


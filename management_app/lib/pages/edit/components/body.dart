import 'package:flutter/material.dart';
import 'package:management_app/constrants.dart';
import 'package:management_app/models/Electric.dart';
import 'package:management_app/size_config.dart';
import '../../../db/electric_database.dart';
import 'electric_form.dart';

class Body extends StatefulWidget {
  final Electric? electric;
  const Body({Key? key, this.electric}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  double defaultSize = SizeConfig.defaultSize;
  final _formKey = GlobalKey<FormState>();
  late String monthYear;
  late double indicator;
  late double quantity;
  late double price;

  @override
  void initState() {
    super.initState();
    monthYear = widget.electric?.monthYear ?? '';
    indicator = widget.electric?.indicator ?? 0;
    quantity = widget.electric?.quantity ?? 0;
    price = widget.electric?.price ?? 0;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kBackgroundColor,
        leading: IconButton(
          color: kPrimaryColor,
          icon: const Icon(Icons.arrow_back),
          onPressed: (){Navigator.of(context).pop();},
        ),
        actions: [
          buildSave(),
        ],
      ),
      body: SafeArea(
        child: Form(
          key: _formKey,
          child: FormElectric(
            monthYear: monthYear,
            indicator: indicator,
            quantity: quantity,
            price: price,
            onChangedMonthYear: (monthYear) =>setState(() {this.monthYear = monthYear; }),
            onChangedIndicator: (indicator) => setState(() {this.indicator = double.tryParse(indicator) ?? 0;}),
            onChangedQuantity: (quantity) => setState(() {this.quantity = double.tryParse(quantity) ?? 0;}),
            onChangedPrice: (price) => setState(() {this.price = double.tryParse(price) ?? 0;}),
          ),
        ),
      ),
    );
  }

  Padding buildSave() {
    final isFormValid = monthYear.isNotEmpty;
    return Padding(
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              onPrimary: Colors.white,
              primary: isFormValid ? kPrimaryColor : Colors.grey,
            ),
            onPressed: (){ addOrUpdateBill();},
            child: const Text('Save', style: TextStyle(fontWeight: FontWeight.w900),),
          ),
        );
  }

  void addOrUpdateBill() async {
    final isValid = _formKey.currentState!.validate();
    if (isValid) {
      final isUpdating = widget.electric != null;
      if (isUpdating) {
        await updateBill();
      } else {
        await addBill();
      }
      Navigator.of(context).pop();
    }
  }

  Future updateBill() async{
    final note = widget.electric!.copy(
      monthYear: monthYear,
      indicator: indicator,
      quantity: quantity,
      price: price,
    );

    await ElectricDatabase.instance.update(note);
  }

  Future addBill() async{
    final electric = Electric(
      monthYear: monthYear,
      indicator: indicator,
      quantity: quantity,
      price: price,
      createdTime: DateTime.now(),
    );

    await ElectricDatabase.instance.create(electric);
  }
  
  

}


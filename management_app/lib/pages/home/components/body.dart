import 'package:flutter/material.dart';
import 'package:management_app/constrants.dart';
import 'package:management_app/models/Electric.dart';
import 'package:management_app/pages/edit/edit_add_screen.dart';
import '../../../db/electric_database.dart';
import '../../../size_config.dart';
import 'list_electric_bill.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);
  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  late List<Electric> electric;
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    refreshElectric();
  }

  @override
  void dispose() {
    ElectricDatabase.instance.close();
    super.dispose();
  }

  Future refreshElectric() async {
    setState(() => isLoading = true);
    electric = await ElectricDatabase.instance.readAllElectrics();
    setState(() => isLoading = false);
  }

  @override
  Widget build(BuildContext context) {
    double defaultSize = SizeConfig.defaultSize;
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: isLoading
              ? const CircularProgressIndicator()
              : electric.isEmpty
              ? Text(
              'No Electric bill',
              style: TextStyle(color: kTextColor, fontSize: defaultSize*2.4),
              )
              : ListBill(electric: electric)
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: kSecondaryColor,
        child: const Icon(Icons.add),
        onPressed: () {
          Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => const EditAddScreen()),
          );
          refreshElectric();
        },
      ),
    );
  }
}







import 'package:flutter/material.dart';
import 'package:management_app/constrants.dart';
import 'package:management_app/models/Electric.dart';
import 'package:management_app/pages/edit/edit_add_screen.dart';
import '../../../db/electric_database.dart';
import '../../../size_config.dart';
import '../../details/detail_screen.dart';
import 'electric_card.dart';
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
    print("Cap nhat du lieu moi tu csdl");
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
              : buildBill()
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: kSecondaryColor,
        child: const Icon(Icons.add),
        onPressed: () async {
          await Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => const EditAddScreen()),
          );
          refreshElectric();
        },
      ),
    );
  }

  Widget buildBill() {
    return Container(
        color: kBackgroundColor,
        child: Row(
            children: [
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Expanded(
                      child: RefreshIndicator(
                        onRefresh: refreshElectric,
                        child: ListView.builder(
                            itemCount: electric.length,
                            itemBuilder: (context, index) {
                              int pos = electric.length - 1 - index;
                              final elec = electric[pos];
                              return GestureDetector(
                                onTap: () async {
                                  await Navigator.of(context).push(
                                      MaterialPageRoute(
                                          builder: (context)=> DetailsPage(billID: elec.id!,)
                                      )
                                  );
                                  refreshElectric();
                                },
                                child: ElectricCard(electric: elec),
                              );
                            }
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ]
        )
    );
  }
}







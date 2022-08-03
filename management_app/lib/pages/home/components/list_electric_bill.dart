import 'package:flutter/material.dart';
import '../../../constrants.dart';
import '../../../models/Electric.dart';
import '../../details/detail_screen.dart';
import 'electric_card.dart';

class ListBill extends StatelessWidget {
  const ListBill({
    Key? key,
    required this.electric,
  }) : super(key: key);

  final List<Electric> electric;

  @override
  Container build(BuildContext context) {
    return Container(
        color: kBackgroundColor,
        child: Row(
            children: [
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Expanded(
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
                              },
                              child: ElectricCard(electric: elec),
                            );
                          }
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

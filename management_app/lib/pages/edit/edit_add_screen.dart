import 'package:flutter/material.dart';
import 'package:management_app/models/Electric.dart';
import 'package:management_app/pages/edit/components/body.dart';

class EditAddScreen extends StatefulWidget {
  final Electric? electric;
  const EditAddScreen({Key? key, this.electric}) : super(key: key);
  @override
  State<EditAddScreen> createState() => _EditAddScreenState();
}

class _EditAddScreenState extends State<EditAddScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(electric: widget.electric,),
    );
  }
}

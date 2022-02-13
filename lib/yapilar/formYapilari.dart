import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class AtikTextFormField extends StatelessWidget {
  String? formFieldIsmi;
  String? atiginKontrolTuru;
  AtikTextFormField({this.formFieldIsmi, this.atiginKontrolTuru});
  TextEditingController controller = TextEditingController(text: '0');
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: TextFormField(
        controller: controller,
        style: TextStyle(color: Colors.blueAccent),
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          labelText: formFieldIsmi,
          hintText: atiginKontrolTuru,
          prefixIcon: Icon(MdiIcons.recycle),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(10),
            ),
          ),
        ),
      ),
    );
  }

  double icindekiDegeriDondur() {
    return double.parse(controller.text);
  }
}

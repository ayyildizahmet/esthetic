import 'package:flutter/material.dart';
import 'package:esthetic/utilities/constants.dart';
import 'package:esthetic/utilities/local_storage.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:flutter/material.dart';

class AddOperationScreen extends StatefulWidget {
  const AddOperationScreen({Key? key}) : super(key: key);

  @override
  _AddOperationScreen createState() => _AddOperationScreen();
}

class _AddOperationScreen extends State<AddOperationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.grey[100],
          elevation: 0,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('Add Operation Record', style: TextStyle(color: Colors.black)),
            ],
          ),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'Clinic',
              style: kLabelStyle,
            ),
            const SizedBox(height: 10.0),
            Container(
              alignment: Alignment.centerLeft,
              decoration: kBoxDecorationStyle,
              height: 60.0,
              child: DropdownButtonFormField(
                //validator: emailValidator,
                //onChanged: (input) => _email = input, //input,
                //keyboardType: TextInputType.emailAddress,
                items: [
                  DropdownMenuItem(
                    child: Text("First Item"),
                    value: 1,
                  ),
                  DropdownMenuItem(
                    child: Text("Second Item"),
                    value: 2,
                  ),
                  DropdownMenuItem(child: Text("Third Item"), value: 3),
                  DropdownMenuItem(child: Text("Fourth Item"), value: 4)
                ],
                onChanged: (value) {
                  print(value.toString());
                },
                style: const TextStyle(
                  color: Colors.white,
                  fontFamily: 'OpenSans',
                ),
                decoration: InputDecoration(
                  border: InputBorder.none,
                  contentPadding: const EdgeInsets.only(top: 14.0),
                  prefixIcon: Icon(
                    Icons.home,
                    color: Colors.white,
                  ),
                  errorStyle: const TextStyle(color: Colors.white, fontFamily: 'OpenSans', decorationColor: Colors.white),
                  hintText: 'Select Clinic',
                  hintStyle: kHintTextStyle,
                ),
              ),
            ),
          ],
        ));
  }
}

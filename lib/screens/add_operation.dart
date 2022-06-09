import 'package:esthetic/data/api.dart';
import 'package:esthetic/data/model/clinic_get_list_response_model.dart';
import 'package:esthetic/data/model/operation_type_response_model.dart';
import 'package:flutter/material.dart';
import 'package:esthetic/utilities/constants.dart';

class AddOperationScreen extends StatefulWidget {
  const AddOperationScreen({Key? key}) : super(key: key);

  @override
  _AddOperationScreen createState() => _AddOperationScreen();
}

class _AddOperationScreen extends State<AddOperationScreen> {
  ApiService api = ApiService();
  List<ClinicResponseModel> clinics = <ClinicResponseModel>[];
  List<OperationTypeResponseModel> operationTypes = <OperationTypeResponseModel>[];

  _getClinics() {
    return api.getClinicList().then((response) {
      setState(() {
        clinics = response;
      });
    });
  }

  _getOperationTypes() {
    return api.getOperationTypeList().then((response) {
      setState(() {
        operationTypes = response;
      });
    });
  }

  @override
  initState() {
    _getClinics();
    _getOperationTypes();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.grey[100],
          elevation: 0,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('Operasyon Kaydı Ekle', style: TextStyle(color: Colors.black)),
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
                items: clinics
                    .map(
                      (e) => DropdownMenuItem(
                        child: Text(e.name ?? "",
                            style: const TextStyle(
                              color: Colors.black,
                              fontFamily: 'OpenSans',
                            )),
                        value: e.id,
                      ),
                    )
                    .toList(),
                onChanged: (value) {
                  //print(value.toString());
                },
                style: const TextStyle(
                  color: Colors.blue,
                  fontFamily: 'OpenSans',
                ),
                decoration: InputDecoration(
                  border: InputBorder.none,
                  contentPadding: const EdgeInsets.only(top: 14.0),
                  prefixIcon: const Icon(
                    Icons.home,
                    color: Colors.white,
                  ),
                  errorStyle: const TextStyle(color: Colors.white, fontFamily: 'OpenSans', decorationColor: Colors.white),
                  hintText: 'Select Clinic',
                  hintStyle: kHintTextStyle,
                ),
              ),
            ),
            const SizedBox(height: 10.0),
            Container(
              alignment: Alignment.centerLeft,
              decoration: kBoxDecorationStyle,
              height: 60.0,
              child: DropdownButtonFormField(
                items: operationTypes
                    .map(
                      (e) => DropdownMenuItem(
                        child: Text(e.name ?? "",
                            style: const TextStyle(
                              color: Colors.black,
                              fontFamily: 'OpenSans',
                            )),
                        value: e.id,
                      ),
                    )
                    .toList(),
                onChanged: (value) {
                  //print(value.toString());
                },
                style: const TextStyle(
                  color: Colors.blue,
                  fontFamily: 'OpenSans',
                ),
                decoration: InputDecoration(
                  border: InputBorder.none,
                  contentPadding: const EdgeInsets.only(top: 14.0),
                  prefixIcon: const Icon(
                    Icons.settings,
                    color: Colors.white,
                  ),
                  errorStyle: const TextStyle(color: Colors.white, fontFamily: 'OpenSans', decorationColor: Colors.white),
                  hintText: 'Select Operation Type',
                  hintStyle: kHintTextStyle,
                ),
              ),
            ),
          ],
        ));
  }
}

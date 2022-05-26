import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:esthetic/data/api.dart';
import 'package:esthetic/utilities/constants.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:esthetic/data/model/user_forgot_password_request_model.dart';
import 'package:esthetic/data/model/user_forgot_password_response_model.dart';

class ForgotPasswordScreen extends StatefulWidget {
  @override
  _ForgotPasswordScreen createState() => _ForgotPasswordScreen();
}

class _ForgotPasswordScreen extends State<ForgotPasswordScreen> {
  GlobalKey<FormState> globalFormKey = GlobalKey<FormState>();
  String _email = "";
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    EasyLoading.addStatusCallback((status) {
      print('EasyLoading Status $status');
      if (status == EasyLoadingStatus.dismiss) {
        _timer?.cancel();
      }
    });
  }

  final emailValidator = MultiValidator([
    RequiredValidator(errorText: ' * email is required'),
    MinLengthValidator(6, errorText: ' * password must be at least 6 digits long'),
    //PatternValidator(r'(?=.*?[#?!@$%^&*-])', errorText: ' * passwords must have at least one special character')
  ]);

  Widget _buildPasswordTF() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Email',
          style: kLabelStyle,
        ),
        const SizedBox(height: 10.0),
        Container(
          alignment: Alignment.centerLeft,
          decoration: kBoxDecorationStyle,
          height: 60.0,
          child: TextFormField(
            validator: emailValidator,
            onChanged: (input) => _email = input, //input,
            keyboardType: TextInputType.emailAddress,
            style: const TextStyle(
              color: Colors.white,
              fontFamily: 'OpenSans',
            ),
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: const EdgeInsets.only(top: 14.0),
              prefixIcon: Icon(
                Icons.email,
                color: Colors.white,
              ),
              errorStyle: const TextStyle(color: Colors.white, fontFamily: 'OpenSans', decorationColor: Colors.white),
              hintText: 'Enter your Email',
              hintStyle: kHintTextStyle,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildPasswordTF2() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Email',
          style: kLabelStyle,
        ),
        const SizedBox(height: 10.0),
        Container(
          alignment: Alignment.centerLeft,
          decoration: kBoxDecorationStyle,
          height: 60.0,
          child: TextFormField(
            validator: emailValidator,
            onChanged: (input) => _email = input, //input,
            keyboardType: TextInputType.emailAddress,
            style: const TextStyle(
              color: Colors.white,
              fontFamily: 'OpenSans',
            ),
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: const EdgeInsets.only(top: 14.0),
              prefixIcon: Icon(
                Icons.email,
                color: Colors.white,
              ),
              errorStyle: const TextStyle(color: Colors.white, fontFamily: 'OpenSans', decorationColor: Colors.white),
              hintText: 'Enter your Password',
              hintStyle: kHintTextStyle,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildForgotPasswordBtn() {
    ForgotPasswordRequestModel forgotPasswordRequestModel;
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 25.0),
      width: double.infinity,
      child: RaisedButton(
        elevation: 5.0,
        onPressed: () async {
          try {
            if (validateAndSave()) {
              _timer?.cancel();
              await EasyLoading.show(
                status: '',
                maskType: EasyLoadingMaskType.black,
              );

              forgotPasswordRequestModel = ForgotPasswordRequestModel(email: _email);

              ApiService api = ApiService();

              await api.forgotPassword(forgotPasswordRequestModel).then((result) {
                // ignore: unnecessary_null_comparison
                if (result != null) {
                  if (result.success) {
                    EasyLoading.showSuccess('Password Reset Successfull');
                  } else {
                    EasyLoading.showError(result.message ?? "");
                  }
                } else {
                  EasyLoading.showError("Password Reset api error.");
                }
              });
            }
          } catch (e) {
            EasyLoading.showError("Password Reset api error = " + e.toString());
          } finally {
            _timer?.cancel();
            await EasyLoading.dismiss();
          }
        },
        padding: const EdgeInsets.all(15.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
        color: Colors.white,
        child: const Text(
          'RESET PASSWORD',
          style: TextStyle(
            color: Color(0xFF527DAA),
            letterSpacing: 1.5,
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
            fontFamily: 'OpenSans',
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Stack(
            children: <Widget>[
              Container(
                height: double.infinity,
                width: double.infinity,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      const Color(0xFF73AEF5),
                      const Color(0xFF61A4F1),
                      const Color(0xFF478DE0),
                      const Color(0xFF398AE5),
                    ],
                    stops: [
                      0.1,
                      0.4,
                      0.7,
                      0.9
                    ],
                  ),
                ),
              ),
              Container(
                height: double.infinity,
                child: SingleChildScrollView(
                  physics: const AlwaysScrollableScrollPhysics(),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 40.0,
                    vertical: 120.0,
                  ),
                  child: Form(
                      key: globalFormKey,
                      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
                        Text(
                          'Reset Password',
                          style: const TextStyle(
                            color: Colors.white,
                            fontFamily: 'OpenSans',
                            fontSize: 30.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 30.0),
                        _buildPasswordTF(),
                        _buildPasswordTF2(),
                        const SizedBox(
                          height: 30.0,
                        ),
                        _buildForgotPasswordBtn(),
                      ])),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  bool validateAndSave() {
    final form = globalFormKey.currentState;
    if (form!.validate()) {
      form.save();
      return true;
    }
    return false;
  }
}
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:esthetic/data/api.dart';
import 'package:esthetic/utilities/constants.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:esthetic/data/model/user_signup_request_model.dart';
import 'package:esthetic/data/model/user_signup_response_model.dart';
import 'package:intl/intl.dart';

class SignupScreen extends StatefulWidget {
  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  GlobalKey<FormState> globalFormKey = GlobalKey<FormState>();
  TextEditingController dateinput = TextEditingController();
  String _email = "";
  String _firstname = "";
  String _lastname = "";
  String _phone = "";
  String _password = "";

  bool? _rememberMe = false;
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
  ]);

  Widget _buildEmailTF() {
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
              prefixIcon: const Icon(
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

  final firstnameValidator = MultiValidator([
    RequiredValidator(errorText: ' * firstname is required'),
    MinLengthValidator(2, errorText: ' * password must be at least 2 digits long'),
    //PatternValidator(r'(?=.*?[#?!@$%^&*-])', errorText: ' * passwords must have at least one special character')
  ]);

  Widget _buildFirstnameTF() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Firstname',
          style: kLabelStyle,
        ),
        const SizedBox(height: 10.0),
        Container(
          alignment: Alignment.centerLeft,
          decoration: kBoxDecorationStyle,
          height: 60.0,
          child: TextFormField(
            inputFormatters: [
              FilteringTextInputFormatter.allow(RegExp('[a-zA-Z]')),
            ],
            keyboardType: TextInputType.text,
            validator: firstnameValidator,
            onChanged: (input) => _firstname = input, //input,
            style: const TextStyle(
              color: Colors.white,
              fontFamily: 'OpenSans',
            ),
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: const EdgeInsets.only(top: 14.0),
              prefixIcon: Icon(
                Icons.assignment_ind_sharp,
                color: Colors.white,
              ),
              errorStyle: const TextStyle(color: Colors.white, fontFamily: 'OpenSans', decorationColor: Colors.white),
              hintText: 'Enter your Firstname',
              hintStyle: kHintTextStyle,
            ),
          ),
        ),
      ],
    );
  }

  final lastnameValidator = MultiValidator([
    RequiredValidator(errorText: ' * lastname is required'),
    MinLengthValidator(2, errorText: ' * password must be at least 2 digits long'),
    //PatternValidator(r'(?=.*?[#?!@$%^&*-])', errorText: ' * passwords must have at least one special character')
  ]);

  Widget _buildLastnameTF() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Lastname',
          style: kLabelStyle,
        ),
        const SizedBox(height: 10.0),
        Container(
          alignment: Alignment.centerLeft,
          decoration: kBoxDecorationStyle,
          height: 60.0,
          child: TextFormField(
            inputFormatters: [
              FilteringTextInputFormatter.allow(RegExp('[a-zA-Z]')),
            ],
            keyboardType: TextInputType.text,
            validator: lastnameValidator,
            onChanged: (input) => _lastname = input, //input,
            style: const TextStyle(
              color: Colors.white,
              fontFamily: 'OpenSans',
            ),
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: const EdgeInsets.only(top: 14.0),
              prefixIcon: const Icon(
                Icons.assignment_ind_sharp,
                color: Colors.white,
              ),
              errorStyle: const TextStyle(color: Colors.white, fontFamily: 'OpenSans', decorationColor: Colors.white),
              hintText: 'Enter your Lastname',
              hintStyle: kHintTextStyle,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildPhoneTF() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Mobile Phone',
          style: kLabelStyle,
        ),
        const SizedBox(height: 10.0),
        Container(
            alignment: Alignment.centerLeft,
            decoration: kBoxDecorationStyle,
            height: 60.0,
            child: IntlPhoneField(
              style: kLabelStyle,
              flagsButtonMargin: const EdgeInsets.only(top: 20.0),
              // decoration: const InputDecoration(
              //   labelText: 'Phone Number',
              //   border: OutlineInputBorder(
              //     borderSide: BorderSide(),
              //   ),
              // ),
              decoration: InputDecoration(
                border: InputBorder.none,
                contentPadding: const EdgeInsets.only(top: 28.0),
                counterStyle: kLabelStyle,
                errorStyle: const TextStyle(color: Colors.white, fontFamily: 'OpenSans', decorationColor: Colors.white),
                hintText: 'Enter your phone',
                //labelText: 'Phone Number',
                hintStyle: kHintTextStyle,
              ),
              initialCountryCode: 'TR',
              invalidNumberMessage: " * Invalid Phone Number",
              onChanged: (input) {
                _phone = input.toString();
              },
              onCountryChanged: (country) {
                print('Country changed to: ' + country.name);
              },
            )),
      ],
    );
  }

  final passwordValidator = MultiValidator([
    RequiredValidator(errorText: ' * password is required'),
    MinLengthValidator(6, errorText: ' * password must be at least 6 digits long'),
    //PatternValidator(r'(?=.*?[#?!@$%^&*-])', errorText: ' * passwords must have at least one special character')
  ]);

  Widget _buildPasswordTF() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Password',
          style: kLabelStyle,
        ),
        const SizedBox(height: 10.0),
        Container(
          alignment: Alignment.centerLeft,
          decoration: kBoxDecorationStyle,
          height: 60.0,
          child: TextFormField(
            onChanged: (input) => _password = input, //input,
            validator: passwordValidator,
            obscureText: true,
            style: const TextStyle(
              color: Colors.white,
              fontFamily: 'OpenSans',
            ),
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: const EdgeInsets.only(top: 14.0),
              prefixIcon: const Icon(
                Icons.lock,
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

//  Widget _buildBirthDateTF() {
//    return Column(
//      crossAxisAlignment: CrossAxisAlignment.start,
//      child: TextField(
//                controller: dateinput, //editing controller of this TextField
//               decoration: InputDecoration(
//                   icon: Icon(Icons.calendar_today), //icon of text field
//                   labelText: "Enter Date" //label text of field
//               ),
//  );
// }

  Widget _buildSignUpBtn() {
    //ApiService api = ApiService();
    UserSignupRequestModel userRequestModel;
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 25.0),
      width: double.infinity,
      child: RaisedButton(
        elevation: 5.0,
        onPressed: () async {
          if (validateAndSave()) {
            _timer?.cancel();
            await EasyLoading.show(
              status: '',
              maskType: EasyLoadingMaskType.black,
            );
            //print('EasyLoading show');

            userRequestModel = UserSignupRequestModel(email: _email, firstname: _firstname, lastname: _lastname, phone: _phone, password: _password);
            //var result = await api.login(userRequestModel);
            ApiService api = ApiService();

            api.signup(userRequestModel).then((result) {
              // ignore: unnecessary_null_comparison
              if (result != null && result.isSuccess == true) {
                EasyLoading.showSuccess('Sign Up Successfull');
              } else {
                EasyLoading.showError("Sign Up is not successful");
              }
            });

            _timer?.cancel();
            await EasyLoading.dismiss();
            print('EasyLoading dismiss');
          }
        },
        padding: const EdgeInsets.all(15.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
        color: Colors.white,
        child: const Text(
          'REGISTER',
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
                          'Sign Up',
                          style: const TextStyle(
                            color: Colors.white,
                            fontFamily: 'OpenSans',
                            fontSize: 30.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 30.0),
                        _buildEmailTF(),
                        const SizedBox(
                          height: 30.0,
                        ),
                        _buildFirstnameTF(),
                        const SizedBox(
                          height: 30.0,
                        ),
                        _buildLastnameTF(),
                        const SizedBox(
                          height: 30.0,
                        ),
                        _buildPhoneTF(),
                        const SizedBox(
                          height: 30.0,
                        ),
                        _buildPasswordTF(),
                        const SizedBox(
                          height: 30.0,
                        ),
                        _buildSignUpBtn(),
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

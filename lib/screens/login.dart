import 'dart:async';
import 'package:esthetic/screens/home.dart';
import 'package:esthetic/screens/sign_up.dart';
import 'package:esthetic/screens/forgot_password.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:esthetic/data/api.dart';
import 'package:esthetic/utilities/constants.dart';
import 'package:esthetic/utilities/local_storage.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:esthetic/data/model/user_login_request_model.dart';
//import 'package:esthetic/data/model/user_login_response_model.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  GlobalKey<FormState> globalFormKey = GlobalKey<FormState>();
  LocalStorage localStorage = LocalStorage();
  String _email = "";
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
    MaxLengthValidator(100, errorText: ' * password must be maximum of 100 digits long'),
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

  Widget _buildForgotPasswordBtn() {
    return Container(
      alignment: Alignment.centerRight,
      child: FlatButton(
        onPressed: () => {
          print('Forgot Password Button Pressed'),
          Navigator.push(context, MaterialPageRoute(builder: (signUpContext) => ForgotPasswordScreen()))
        },
        padding: const EdgeInsets.only(right: 0.0),
        child: Text(
          'Forgot Password?',
          style: kLabelStyle,
        ),
      ),
    );
  }

  Widget _buildRememberMeCheckbox() {
    return Container(
      height: 20.0,
      child: Row(
        children: <Widget>[
          Theme(
            data: ThemeData(unselectedWidgetColor: Colors.white),
            child: Checkbox(
              value: _rememberMe,
              checkColor: Colors.green,
              activeColor: Colors.white,
              onChanged: (value) {
                setState(() {
                  _rememberMe = value;
                });
              },
            ),
          ),
          Text(
            'Remember me',
            style: kLabelStyle,
          ),
        ],
      ),
    );
  }

  Widget _buildLoginBtn() {
    //ApiService api = ApiService();
    UserLoginRequestModel userRequestModel;
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

              userRequestModel = UserLoginRequestModel(password: _password, email: _email);

              ApiService api = ApiService();

              await api.login(userRequestModel).then((result) {
                // ignore: unnecessary_null_comparison
                if (result != null) {
                  if (result.success) {
                    localStorage.setString("token", result.token ?? "");
                    EasyLoading.showSuccess('Login Successfull');
                    Navigator.push(context, MaterialPageRoute(builder: (signUpContext) => const HomeScreen()));
                  } else {
                    EasyLoading.showError(result.message ?? "");
                  }
                } else {
                  EasyLoading.showError("Login api error.");
                }
              });
            }
          } catch (e) {
            EasyLoading.showError("Login api error = " + e.toString());
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
          'LOGIN',
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

  Widget _buildSignInWithText() {
    return Column(
      children: <Widget>[
        Text(
          '- OR -',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w400,
          ),
        ),
        SizedBox(height: 20.0),
      ],
    );
  }

  Widget _buildSignupBtn() {
    return GestureDetector(
      onTap: () => {
        print('Sign Up Button Pressed'),
        Navigator.push(context, MaterialPageRoute(builder: (signUpContext) => SignupScreen()))
      },
      child: RichText(
        text: TextSpan(
          children: [
            TextSpan(
              text: 'Don\'t have an Account? ',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18.0,
                fontWeight: FontWeight.w400,
              ),
            ),
            TextSpan(
              text: 'Sign Up',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
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
                          'Sign In',
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
                        _buildPasswordTF(),
                        _buildForgotPasswordBtn(),
                        _buildRememberMeCheckbox(),
                        _buildLoginBtn(),
                        _buildSignInWithText(),
                        _buildSignupBtn(),
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

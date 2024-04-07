import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:user_details/constants/phone%20authentication.dart';
import 'package:user_details/screens/otpscreen.dart';

class Login extends StatefulWidget {
  const Login({Key? key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formKey = GlobalKey<FormState>();
  final controller = Get.put(SignUpController());
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SignUpController());
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return SafeArea(
      child: Scaffold(
        body: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.only(
              top: 50,
              left: 15,
              right: 15,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  "images/Group.png",
                  height: screenHeight * 0.2,
                ),
                SizedBox(
                  height: screenHeight * 0.05,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Row(
                    children: [
                      Text(
                        "Enter Phone Number",
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.w800),
                      ),
                      Text(
                        "*",
                        style: TextStyle(color: Colors.red),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: screenHeight * 0.015,
                ),
                TextFormField(
                  controller: controller.PhoneNo,
                  // keyboardType: TextInputType.number,
                  // inputFormatters: <TextInputFormatter>[
                  //   FilteringTextInputFormatter.digitsOnly,
                  // ],
                  decoration: InputDecoration(
                      hintText: 'Enter Phone number',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10))),
                ),
                SizedBox(
                  height: screenHeight * 0.015,
                ),
                RichText(
                  text: TextSpan(
                    children: <TextSpan>[
                      TextSpan(
                          text: 'By continuing I agree to the Totalx ',
                          style: TextStyle(
                              color: Colors.grey,
                              fontSize: screenHeight * 0.017)),
                      TextSpan(
                        text: 'Terms and conditions',
                        style: TextStyle(
                          fontSize: screenHeight * 0.017,
                          color: Colors.blue, // Change the color for this part
                        ),
                      ),
                      TextSpan(
                          text: ' &',
                          style: TextStyle(
                              color: Colors.grey,
                              fontSize: screenHeight * 0.017)),
                      TextSpan(
                          text: ' Privacy Policy',
                          style: TextStyle(
                              color: Colors.blue,
                              fontSize: screenHeight * 0.017))
                    ],
                  ),
                ),
                SizedBox(
                  height: screenHeight * 0.015,
                ),
                Container(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          SignUpController.instance.phoneAuthentication(
                              controller.PhoneNo.text.trim());
                          Get.to(() => OTPScreen());
                        }
                      },
                      child: Text(
                        "Get OTP",
                        style: TextStyle(color: Colors.white),
                      ),
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.black),
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class SignUpController extends GetxController {
  static SignUpController get instance => Get.find();
  final PhoneNo = TextEditingController();
  void phoneAuthentication(String PhoneNo) {
    AuthenticationRespository.instance.phoneAuthentication(PhoneNo);
  }
}

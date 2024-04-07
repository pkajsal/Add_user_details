import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:user_details/constants/otpcontoller.dart';


class OTPScreen extends StatefulWidget {
  @override
  _OTPScreenState createState() => _OTPScreenState();
}

class _OTPScreenState extends State<OTPScreen> {
  final TextEditingController _otpController1 = TextEditingController();
  final TextEditingController _otpController2 = TextEditingController();
  final TextEditingController _otpController3 = TextEditingController();
  final TextEditingController _otpController4 = TextEditingController();
  final TextEditingController _otpController5 = TextEditingController();
  final TextEditingController _otpController6 = TextEditingController();

  FocusNode _otpFocusNode1 = FocusNode();
  FocusNode _otpFocusNode2 = FocusNode();
  FocusNode _otpFocusNode3 = FocusNode();
  FocusNode _otpFocusNode4 = FocusNode();
  FocusNode _otpFocusNode5 = FocusNode();
  FocusNode _otpFocusNode6 = FocusNode();

  @override
  void initState() {
    super.initState();
    _otpFocusNode1.addListener(() {
      if (_otpFocusNode1.hasFocus && _otpController1.text.length == 1) {
        _otpFocusNode2.requestFocus();
      }
    });

    _otpFocusNode2.addListener(() {
      if (_otpFocusNode2.hasFocus && _otpController2.text.length == 1) {
        _otpFocusNode3.requestFocus();
      }
    });

    _otpFocusNode3.addListener(() {
      if (_otpFocusNode3.hasFocus && _otpController3.text.length == 1) {
        _otpFocusNode4.requestFocus();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    var otp;
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        
        body: Padding(
          padding: const EdgeInsets.only(
            top: 50,
            left: 15,
            right: 15,
          ),
          child: SingleChildScrollView(
            child: Column(
            
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Image.asset(
                  "images/Group.png",
                  height: screenHeight * 0.2,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text("OTP verification", style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.w800),
                ),
                ),
                SizedBox(
                  height: screenHeight * 0.015,
                ),
                Text("Enter the verification code we just sent to your number +91********21",style: TextStyle(color: Colors.grey[700],fontSize: 15),),
                SizedBox(
                  height: screenHeight * 0.015,
                ),
                  
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    buildOTPTextField(_otpController1, _otpFocusNode1),
                    buildOTPTextField(_otpController2, _otpFocusNode2),
                    buildOTPTextField(_otpController3, _otpFocusNode3),
                    buildOTPTextField(_otpController4, _otpFocusNode4),
                    buildOTPTextField(_otpController5, _otpFocusNode5),
                    buildOTPTextField(_otpController6, _otpFocusNode6),
                  ],
                ),
                SizedBox(height: 20.0),

                Text("59 sec",style: TextStyle(color: Colors.red,fontWeight: FontWeight.w600),),
                SizedBox(height: 10.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Don"t Get OTP?' ),
                    TextButton(onPressed: (){}, child: Text("Resend ",style: TextStyle(color: Colors.blue,fontSize: 16),))
                  ],
                ),
                SizedBox(
                  height: screenHeight * 0.015,
                ),
                Container(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        OTPController.instance.verifyOTP(otp);
                      },
                      child: Text(
                        "Verify",
                        style: TextStyle(color: Colors.white),
                      ),
                      style:
                      ElevatedButton.styleFrom(backgroundColor: Colors.black),
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildOTPTextField(TextEditingController controller, FocusNode focusNode) {
    var otp;
    return SizedBox(
      width: 50.0,
      child: TextFormField(
        onFieldSubmitted: (code){
          otp = code;
          OTPController.instance.verifyOTP(otp);
        },
        controller: controller,
        keyboardType: TextInputType.number,
        textAlign: TextAlign.center,
        maxLength: 1,
        focusNode: focusNode,
        onChanged: (value) {
          if (value.length == 1) {
            focusNode.unfocus();
          }
        },
        decoration: InputDecoration(
          counterText: '',
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
        ),
      ),
    );
  }
}

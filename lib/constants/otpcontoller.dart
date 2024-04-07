import 'package:get/get.dart';
import 'package:user_details/phone%20authentication.dart';
import 'package:user_details/userspage.dart';

class OTPController extends GetxController {
  static OTPController get instance => Get.find();

  void verifyOTP(String otp)async{
    var isVerified= await AuthenticationRespository.instance.verifyOTP(otp);
    isVerified ? Get.offAll(const UserList()) : Get.back();

  }

}
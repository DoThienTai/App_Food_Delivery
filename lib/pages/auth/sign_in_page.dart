import 'package:app_food_delivery/pages/auth/sign_up_page.dart';
import 'package:app_food_delivery/routes/route_helper.dart';
import 'package:app_food_delivery/utils/colors.dart';
import 'package:app_food_delivery/utils/dimensions.dart';
import 'package:app_food_delivery/widget/app_text_field.dart';
import 'package:app_food_delivery/widget/big_text.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../base/custom_loader.dart';
import '../../base/show_custom_snackbar.dart';
import '../../controllers/auth_controller.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({super.key});

  @override
  Widget build(BuildContext context) {
    var phoneController = TextEditingController();
    var passwordController = TextEditingController();
    void _login (AuthController authController){
      String phone = phoneController.text.trim();
      String password = passwordController.text.trim();
      if(phone.isEmpty){
        showCustomSnackBar("Enter your phone number",title: "Email address");
      }else if(phone.length<6){
        showCustomSnackBar("Phone can not be less than six characters",title: "Valid email address");
      }else if(password.isEmpty){
        showCustomSnackBar("Type in your password",title: "password");
      }else if(password.length<6){
        showCustomSnackBar("Password can not be less than six characters",title: "password");
      }else{
        authController.login(phone, password).then((status){
          if(status.isSuccess){
            Get.toNamed(RouteHelper.getInitial());
          }else{
            showCustomSnackBar(status.message);
            print(status.message.toString());
          }
        });
      }
    }
    return Scaffold(
        body: GetBuilder<AuthController>(builder: (authController){
          return !authController.isloading?SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(
              children: [
                SizedBox(
                  height: Dimensions.screenHeight * 0.05,
                ),
                Container(
                  height: Dimensions.screenHeight * 0.25,
                  child: Center(
                    child: CircleAvatar(
                      backgroundColor: Colors.white,
                      radius: 80,
                      backgroundImage: AssetImage("assets/image/logo part 1.png"),
                    ),
                  ),
                ),
                //welcome
                Container(
                  margin: EdgeInsets.only(left: Dimensions.width20),
                  width: double.maxFinite,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Hello",
                        style: TextStyle(
                          fontSize: Dimensions.font20 * 3 + Dimensions.font20 / 2,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "Sign into your account",
                        style: TextStyle(
                          fontSize: Dimensions.font20,
                          color: Colors.grey[500],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: Dimensions.height20,
                ),
                //email
                AppTextField(
                    textController: phoneController,
                    hintText: "Phone",
                    icon: Icons.phone),
                SizedBox(
                  height: Dimensions.height20,
                ),
                //password
                AppTextField(
                    isObscure: true,
                    textController: passwordController,
                    hintText: "Password",
                    icon: Icons.password),
                SizedBox(
                  height: Dimensions.height20,
                ),
                //tag line
                Row(
                  children: [
                    Expanded(child: Container()),
                    RichText(
                      text: TextSpan(
                        text: "Sign into your account",
                        style: TextStyle(
                          color: Colors.grey[500],
                          fontSize: Dimensions.font20,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: Dimensions.width20,
                    ),
                  ],
                ),
                SizedBox(
                  height: Dimensions.screenHeight * 0.05,
                ),
                //sign up button
                GestureDetector(
                  onTap: () {
                    _login(authController);
                  },
                  child: Container(
                    width: Dimensions.screenWidth / 2,
                    height: Dimensions.screenHeight / 13,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(Dimensions.radius30),
                      color: AppColors.mainColor,
                    ),
                    child: Center(
                      child: BigText(
                        text: "Sign In",
                        size: Dimensions.font20 + Dimensions.font20 / 2,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: Dimensions.screenHeight * 0.05,
                ),
                //sign up options
                RichText(
                  text: TextSpan(
                    text: "Don\'t an account?",
                    style: TextStyle(
                      color: Colors.grey[500],
                      fontSize: Dimensions.font20,
                    ),
                    children: [
                      TextSpan(
                        recognizer: TapGestureRecognizer()..onTap=()=>Get.to(()=> SignUpPage(), transition: Transition.fade,),
                        text: "Create",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: AppColors.mainBlackColor,
                          fontSize: Dimensions.font20,
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ):CustomLoader();
        })
    );
  }
}

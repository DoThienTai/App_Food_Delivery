import 'package:app_food_delivery/data/api/api_client.dart';
import 'package:app_food_delivery/models/signup_model.dart';
import 'package:app_food_delivery/utils/app_constants.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthRepo{
  final ApiClient apiClient;
  final SharedPreferences sharedPreferences;
  AuthRepo({ required this.apiClient, required this.sharedPreferences});


  Future<Response> registration( SignupModel signupModel)async{
    return await apiClient.postData(AppConstants.REGISTRATION_URI, signupModel.toJson());
  }

  saveUserToken(String token)async{
    apiClient.token = token;
    apiClient.updateHeader(token);
    return await sharedPreferences.setString(AppConstants.TOKEN, token);
  }
}
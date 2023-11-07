import 'package:goroga/core/app_export.dart';
import 'package:goroga/presentation/splash_screen/models/splash_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashController extends GetxController {
  Rx<SplashModel> splashModelObj = SplashModel().obs;

  @override
  void onReady() async {
    super.onReady();
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    // sharedPreferences.setBool('isLogin', false);
   var isLoggedIn = sharedPreferences.getBool('isLogin')??false;

    // print(sharedPreferences.getString("isLogin"));

    Future.delayed(const Duration(milliseconds: 3000), () {
      //Get.toNamed(AppRoutes.homeContainerScreen);
      if (isLoggedIn) {
        Get.offNamed(AppRoutes.homeContainerScreen);
        // AppRoutes.homeContainerScreen;
      } else {
        Get.offNamed(
          AppRoutes.signInScreen,
          // AppRoutes.homeContainerScreen,
        );
      }
    });
  }

  @override
  void onClose() {
    super.onClose();
  }
}

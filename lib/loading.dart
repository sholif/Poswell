import 'package:flutter/material.dart';
import 'package:poswell_app/constants/app_constants.dart';
import 'package:poswell_app/features/welcome_screen/welcome_screen.dart';
import 'package:poswell_app/helpers/di.dart';
import 'package:poswell_app/helpers/helper_methods.dart';
import 'package:poswell_app/navigation_screen.dart';
import 'package:poswell_app/networks/api_acess.dart';
import 'package:poswell_app/networks/dio/dio.dart';
import 'package:poswell_app/splash_screen.dart';

// import 'helpers/helper_methods.dart';
// import 'constants/app_constants.dart';
// import 'helpers/app_version_updater.dart';
// import 'helpers/di.dart';

final class Loading extends StatefulWidget {
  const Loading({super.key});

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  bool _isLoading = true;

  @override
  void initState() {
    loadInitialData();
    super.initState();
  }

  loadInitialData() async {
    await setInitValue();
    bool data = appData.read(kKeyIsLoggedIn) ?? false;

    if (data) {
      String token = appData.read(kKeyAccessToken);
      DioSingleton.instance.update(token);
      getCourseTypeRxObj.getCourseType();
      getRecomendedCourseRxObj.getCourse();
    
    }
    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoading) {
      return const SplashScreen();
    } else {
      bool login = appData.read(kKeyIsLoggedIn) ?? false;

      return login ? const NavigationScreen() : const WelcomeScreen();
    }
  }
}

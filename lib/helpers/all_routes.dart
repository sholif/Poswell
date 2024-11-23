import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:poswell_app/features/add_reminder/presentation/add_reminder_screen.dart';
import 'package:poswell_app/features/add_reminder/presentation/journal_details_screen.dart';
import 'package:poswell_app/features/add_reminder/presentation/reminder_sucess_screen.dart';
import 'package:poswell_app/features/artical_details/presentation/artical_details_screen.dart';
import 'package:poswell_app/features/authentication/presenter/auth_screen.dart';
import 'package:poswell_app/features/authentication/presenter/forgot_password/forgot_password_screen.dart';
import 'package:poswell_app/features/authentication/presenter/forgot_password/new_password_screen.dart';
import 'package:poswell_app/features/authentication/presenter/forgot_password/password_reset_sucess_screen.dart';
import 'package:poswell_app/features/authentication/presenter/otp/otp_screen.dart';
import 'package:poswell_app/features/authentication/presenter/sign_up/signup_screen.dart';
import 'package:poswell_app/features/chat/presentation/conversation_screen.dart';
import 'package:poswell_app/features/chose_course/presentation/chose_course_screen.dart';
import 'package:poswell_app/features/course_details/presentation/course_details_screen.dart';
import 'package:poswell_app/features/daily_affermation/presentation/daily_affermation.dart';
import 'package:poswell_app/features/goal_details/presentation/goal_details_screen.dart';
import 'package:poswell_app/features/journal/presentation/add_journal_screen.dart';
import 'package:poswell_app/features/module_details/presentation/modules_details_screen.dart';
import 'package:poswell_app/features/notification/presentations/notification_screen.dart';
import 'package:poswell_app/features/notification/presentations/notification_timer_screen.dart';
import 'package:poswell_app/features/notification/presentations/notification_toggle_screen.dart';
import 'package:poswell_app/features/profile/presentation/change_password_screen.dart';
import 'package:poswell_app/features/profile/presentation/edit_profile_screen.dart';
import 'package:poswell_app/features/profile/presentation/profile_screen.dart';
import 'package:poswell_app/features/question/presenter/question_screen.dart';
import 'package:poswell_app/features/question/presenter/score_screen.dart';
import 'package:poswell_app/features/recommended_plan/presentation/recommended_plan_screen.dart';
import 'package:poswell_app/features/reminder_alert/reminder_alert_screen.dart';
import 'package:poswell_app/features/subscription/presentation/subscription_screen.dart';
import 'package:poswell_app/features/task/congratulation_screen.dart';
import 'package:poswell_app/features/task/presentation/tast_screen.dart';
import 'package:poswell_app/features/welcome_screen/welcome_screen.dart';
import 'package:poswell_app/navigation_screen.dart';
import '../loading.dart';

final class Routes {
  static final Routes _routes = Routes._internal();
  Routes._internal();
  static Routes get instance => _routes;

 
  static const String loadingScreen = '/Loading';
  static const String welcomeScreen = '/welcome_screen';
  static const String authScreen = '/auth_screen';
  static const String signUpScreen = '/sign_up';
  static const String signUpOtpScreen = '/sign_up_otp';
  static const String forgotPasswordScreen = '/forgot_password';
  static const String otpScreen = '/otp_password';
  static const String newPasswordScreen = '/new_password';
  static const String passwordSucessScreen = '/password_sucess';
  static const String subscriptionScreen = '/subscription';
  static const String choseCourseScreen = '/chose_course';
  static const String questionScreen = '/question_screen';
  static const String scoreScreen = '/score_screen';
  static const String recommendedPlanScreen = '/recommended_plan';
  static const String courseDetailsScreen = '/course_details';
  static const String articalDetailsScreen = '/artical_details';
  static const String taskScreen = '/task';
  static const String congratulationScreen = '/congratulation';
  static const String addReminderScreen = '/add_reminder';
  static const String reminderSucessScreen = '/reminder_sucess';
  static const String reminderScreen = '/reminder';
  static const String addJournalScreen = '/add_journal';
  static const String journalDetailsScreen = '/journal_details';
  static const String profileScreen = '/profile';
  static const String editProfileScreen = '/edit_profile';
  static const String changePasswordScreen = '/change_password';
  static const String notificationToggleScreen = '/notification_toggle';
  static const String notificationTimerScreen = '/notification_timer';
  static const String dailyAffermationScreen = '/daily_affermation';
  static const String notificationScreen = '/notification';
  static const String conversationScreen = '/conversation';


  static const String navigationScreen = '/navigation_screen';
  static const String adviceScreen = '/advice_screen';
  static const String addItemScreen = '/add_item_screen';
  static const String clothDescriptionScreen = '/cloth_description_screen';
  static const String aboutUsScreen = '/about_us_screen';
  static const String allBabyProfileScreen = '/all_baby_profile_screen';
  static const String addBabyProfileScreen = '/add_baby_profile_screen';
  static const String updateBabyProfileScreen = '/update_baby_profile_screen';
  static const String userProfileScreen = '/user_profile';
  static const String updatePasswordScreen = '/update_password';
  static const String moduleDetailsScreen = '/module_details';
  static const String goalDetailsScreen = '/goal_details';



}

final class RouteGenerator {
  static final RouteGenerator _routeGenerator = RouteGenerator._internal();
  RouteGenerator._internal();
  static RouteGenerator get instance => _routeGenerator;

  static Route<dynamic>? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.loadingScreen:
        return Platform.isAndroid
            ? _FadedTransitionRoute(widget: const Loading(), settings: settings)
            : CupertinoPageRoute(builder: (context) => const Loading());
      case Routes.authScreen:
        return Platform.isAndroid
            ? _FadedTransitionRoute(widget: const AuthScreen(), settings: settings)
            : CupertinoPageRoute(builder: (context) => const AuthScreen());
      case Routes.forgotPasswordScreen:
        return Platform.isAndroid
            ? _FadedTransitionRoute(widget: const ForgotPasswordScreen(), settings: settings)
            : CupertinoPageRoute(builder: (context) => const ForgotPasswordScreen());
      case Routes.otpScreen:
        return Platform.isAndroid
            ? _FadedTransitionRoute(widget: const OtpScreen(), settings: settings)
            : CupertinoPageRoute(builder: (context) => const OtpScreen());
      case Routes.newPasswordScreen:
        return Platform.isAndroid
            ? _FadedTransitionRoute(widget: const NewPasswordScreen(), settings: settings)
            : CupertinoPageRoute(builder: (context) => const NewPasswordScreen());
      case Routes.passwordSucessScreen:
        return Platform.isAndroid
            ? _FadedTransitionRoute(widget: const PasswordResetSucessScreen(), settings: settings)
            : CupertinoPageRoute(builder: (context) => const PasswordResetSucessScreen());
      case Routes.subscriptionScreen:
      final args = settings.arguments as Map;
        return Platform.isAndroid
            ? _FadedTransitionRoute(widget:  SubscriptionScreen(isFromCourses: args['data'],), settings: settings)
            : CupertinoPageRoute(builder: (context) =>  SubscriptionScreen(isFromCourses: args['data'],));
      case Routes.choseCourseScreen:
        return Platform.isAndroid
            ? _FadedTransitionRoute(widget: const ChoseCoursesScreen(), settings: settings)
            : CupertinoPageRoute(builder: (context) => const ChoseCoursesScreen());
      case Routes.questionScreen:
      final args = settings.arguments as Map;
        return Platform.isAndroid
            ? _FadedTransitionRoute(widget:  QuestionScreen(id: args['id'],), settings: settings)
            : CupertinoPageRoute(builder: (context) =>  QuestionScreen(id: args['id'],));
      case Routes.scoreScreen:
      final args= settings.arguments as Map;
        return Platform.isAndroid
            ? _FadedTransitionRoute(widget:  ScoreScreen(id: args['id'],), settings: settings)
            : CupertinoPageRoute(builder: (context) =>  ScoreScreen(id: args['id'],));
      case Routes.recommendedPlanScreen:
        return Platform.isAndroid
            ? _FadedTransitionRoute(widget: const RecommendedPlanScreen(), settings: settings)
            : CupertinoPageRoute(builder: (context) => const RecommendedPlanScreen());
      case Routes.courseDetailsScreen:
      final args = settings.arguments as Map;
        return Platform.isAndroid
            ? _FadedTransitionRoute(widget:  CourseDetailsScreen(cId: args['id'],title: args['title'],), settings: settings)
            : CupertinoPageRoute(builder: (context) =>  CourseDetailsScreen(cId: args['id'], title: args['title'],));
      case Routes.articalDetailsScreen:
      final args= settings.arguments as Map;
        return Platform.isAndroid
            ? _FadedTransitionRoute(widget:  ArticalDetailsScreen(id: args['id'],), settings: settings)
            : CupertinoPageRoute(builder: (context) =>  ArticalDetailsScreen(id: args['id'],));
      case Routes.moduleDetailsScreen:
      final args = settings.arguments as Map;
        return Platform.isAndroid
            ? _FadedTransitionRoute(widget:  ModulesDetailsScreen(moduleData: args['data'],), settings: settings)
            : CupertinoPageRoute(builder: (context) =>  ModulesDetailsScreen(moduleData: args['data'],));
      case Routes.taskScreen:
        return Platform.isAndroid
            ? _FadedTransitionRoute(widget: const TaskScren(), settings: settings)
            : CupertinoPageRoute(builder: (context) => const TaskScren());
      case Routes.congratulationScreen:
        return Platform.isAndroid
            ? _FadedTransitionRoute(widget: const CongratulationScreen(), settings: settings)
            : CupertinoPageRoute(builder: (context) => const CongratulationScreen());
      case Routes.addReminderScreen:
        return Platform.isAndroid
            ? _FadedTransitionRoute(widget: const AddReminderScreen(), settings: settings)
            : CupertinoPageRoute(builder: (context) => const AddReminderScreen());
      case Routes.reminderSucessScreen:
        return Platform.isAndroid
            ? _FadedTransitionRoute(widget: const ReminderSucessScreen(), settings: settings)
            : CupertinoPageRoute(builder: (context) => const ReminderSucessScreen());
      case Routes.reminderScreen:
        return Platform.isAndroid
            ? _FadedTransitionRoute(widget: const ReminderAlertScreen(), settings: settings)
            : CupertinoPageRoute(builder: (context) => const ReminderAlertScreen());
      case Routes.addJournalScreen:
        return Platform.isAndroid
            ? _FadedTransitionRoute(widget: const AddJournalScreen(), settings: settings)
            : CupertinoPageRoute(builder: (context) => const AddJournalScreen());
      case Routes.journalDetailsScreen:
        return Platform.isAndroid
            ? _FadedTransitionRoute(widget: const JournalDetailsScreen(), settings: settings)
            : CupertinoPageRoute(builder: (context) => const JournalDetailsScreen());
      case Routes.profileScreen:
        return Platform.isAndroid
            ? _FadedTransitionRoute(widget: const ProfileScreen(), settings: settings)
            : CupertinoPageRoute(builder: (context) => const ProfileScreen());
      case Routes.editProfileScreen:
        return Platform.isAndroid
            ? _FadedTransitionRoute(widget: const EditProfileScreen(), settings: settings)
            : CupertinoPageRoute(builder: (context) => const EditProfileScreen());
      case Routes.changePasswordScreen:
        return Platform.isAndroid
            ? _FadedTransitionRoute(widget: const ChangePasswordScreen(), settings: settings)
            : CupertinoPageRoute(builder: (context) => const ChangePasswordScreen());
      case Routes.notificationToggleScreen:
        return Platform.isAndroid
            ? _FadedTransitionRoute(widget: const NotificationToggleScreen(), settings: settings)
            : CupertinoPageRoute(builder: (context) => const NotificationToggleScreen());
      case Routes.notificationTimerScreen:
        return Platform.isAndroid
            ? _FadedTransitionRoute(widget: const NotificationTimerScreen(), settings: settings)
            : CupertinoPageRoute(builder: (context) => const NotificationTimerScreen());
      case Routes.dailyAffermationScreen:
        return Platform.isAndroid
            ? _FadedTransitionRoute(widget: const DailyAffermation(), settings: settings)
            : CupertinoPageRoute(builder: (context) => const DailyAffermation());
      case Routes.notificationScreen:
        return Platform.isAndroid
            ? _FadedTransitionRoute(widget: const NotificationScreen(), settings: settings)
            : CupertinoPageRoute(builder: (context) => const NotificationScreen());
      case Routes.conversationScreen:
        return Platform.isAndroid
            ? _FadedTransitionRoute(widget: const ConversationScreen(), settings: settings)
            : CupertinoPageRoute(builder: (context) => const ConversationScreen());


      // Old
      case Routes.welcomeScreen:
        return Platform.isAndroid
            ? _FadedTransitionRoute(widget: const WelcomeScreen(), settings: settings)
            : CupertinoPageRoute(builder: (context) => const WelcomeScreen());
      case Routes.signUpScreen:
        return Platform.isAndroid
            ? _FadedTransitionRoute(widget: const SignUpScreen(), settings: settings)
            : CupertinoPageRoute(builder: (context) => const SignUpScreen());

      case Routes.navigationScreen:
        return Platform.isAndroid
            ? _FadedTransitionRoute(widget:  const NavigationScreen(), settings: settings)
            : CupertinoPageRoute(builder: (context) =>  const NavigationScreen());
      case Routes.goalDetailsScreen:
        return Platform.isAndroid
            ? _FadedTransitionRoute(widget: const GoalDetailsScreen(), settings: settings)
            : CupertinoPageRoute(builder: (context) => const GoalDetailsScreen());
      default:
        return null;
    }
  }
}

//  weenAnimationBuilder(
//   child: Widget,
//   tween: Tween<double>(begin: 0, end: 1),
//   duration: Duration(milliseconds: 1000),
//   curve: Curves.bounceIn,
//   builder: (BuildContext context, double _val, Widget child) {
//     return Opacity(
//       opacity: _val,
//       child: Padding(
//         padding: EdgeInsets.only(top: _val * 50),
//         child: child
//       ),
//     );
//   },
// );

class _FadedTransitionRoute extends PageRouteBuilder {
  final Widget widget;
  @override
  final RouteSettings settings;

  _FadedTransitionRoute({required this.widget, required this.settings})
      : super(
          settings: settings,
          reverseTransitionDuration: const Duration(milliseconds: 1),
          pageBuilder: (BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation) {
            return widget;
          },
          transitionDuration: const Duration(milliseconds: 1),
          transitionsBuilder:
              (BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation, Widget child) {
            return FadeTransition(
              opacity: CurvedAnimation(
                parent: animation,
                curve: Curves.ease,
              ),
              child: child,
            );
          },
        );
}

class ScreenTitle extends StatelessWidget {
  final Widget widget;

  const ScreenTitle({super.key, required this.widget});

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder(
      tween: Tween<double>(begin: .5, end: 1),
      duration: const Duration(milliseconds: 500),
      curve: Curves.bounceIn,
      builder: (context, value, child) {
        return Opacity(
          opacity: value,
          child: child,
        );
      },
      child: widget,
    );
  }
}

import 'package:poswell_app/features/artical_details/data/rx_single_article/rx.dart';
import 'package:poswell_app/features/artical_details/model/single_article_model.dart';
import 'package:poswell_app/features/authentication/model/login_response_model.dart';
import 'package:poswell_app/features/authentication/model/signup_response_model.dart';
import 'package:poswell_app/features/chose_course/data/rx_get_course/rx.dart';
import 'package:poswell_app/features/chose_course/model/course_type_model.dart';
import 'package:poswell_app/features/course_details/data/rx_get_articles/rx.dart';
import 'package:poswell_app/features/course_details/data/rx_get_daily_read_articles/rx.dart';
import 'package:poswell_app/features/course_details/model/course_article_response_model.dart';
import 'package:poswell_app/features/course_details/model/daily_read_article_response_model.dart';
import 'package:poswell_app/features/question/data/rx_bookmark/rx.dart';
import 'package:poswell_app/features/course_details/data/rx_get_modules/rx.dart';
import 'package:poswell_app/features/course_details/model/course_module_response_model.dart';
import 'package:poswell_app/features/home/data/rx_get_all_courses/rx.dart';
import 'package:poswell_app/features/home/data/rx_get_recommended_courses/rx.dart';
import 'package:poswell_app/features/home/model/all_couses_response_model.dart';
import 'package:poswell_app/features/home/model/recommended_courses_response_model.dart';
import 'package:poswell_app/features/profile/data/rx_get_profiles/rx.dart';
import 'package:poswell_app/features/profile/model/profile_response_model.dart';
import 'package:poswell_app/features/question/data/rx_survey/rx.dart';
import 'package:poswell_app/features/question/data/rx_survey_mark/rx.dart';
import 'package:poswell_app/features/question/model/survey_mark_model.dart';
import 'package:poswell_app/features/question/model/survey_model.dart';
import 'package:poswell_app/features/recommended_plan/data/rx_recomended_course/rx.dart';
import 'package:poswell_app/features/recommended_plan/model/recomended_course.dart';
import 'package:poswell_app/features/saved_artical/data/rx_get_bookmark/rx.dart';
import 'package:poswell_app/features/saved_artical/model/bookmark_model.dart';
import 'package:rxdart/subjects.dart';
import '../features/authentication/data/rx_login/rx.dart';
import '../features/authentication/data/rx_logout/rx.dart';
import '../features/authentication/data/rx_signup/rx.dart';

GetSignupResponseRX getSignupResponseRXObj = GetSignupResponseRX(
    empty: SignUpResponseModel(),
    dataFetcher: BehaviorSubject<SignUpResponseModel>());

GetLoginResponseRX getLoginResponseRXObj = GetLoginResponseRX(
    empty: LoginResponseModel(),
    dataFetcher: BehaviorSubject<LoginResponseModel>());

GetLogOutRX logOutRXObj = GetLogOutRX(
    empty: {},
    dataFetcher: BehaviorSubject<Map>());


GetCourseTypeRx getCourseTypeRxObj = GetCourseTypeRx(empty: GetCourseType(), dataFetcher: BehaviorSubject<GetCourseType>());

GetSurveyRx getSurveyRxObj= GetSurveyRx(empty: SurveyModel(), dataFetcher: BehaviorSubject<SurveyModel>());
GetProfileRX getProfileRXOBJ= GetProfileRX(empty: ProfileResponseModel(), dataFetcher: BehaviorSubject<ProfileResponseModel>());
GetAllCoursesRX getAllCoursesRXOBJ= GetAllCoursesRX(empty: AllCoursesResponseModel(), dataFetcher: BehaviorSubject<AllCoursesResponseModel>());
GetRecommendedCoursesRX getRecommendedCoursesRXOBJ= GetRecommendedCoursesRX(empty: RecommendedResponseModel(), dataFetcher: BehaviorSubject<RecommendedResponseModel>());
GetCourseModuleRX getCourseModuleRXOBJ = GetCourseModuleRX(empty: CoursesModuleResponseModel(), dataFetcher: BehaviorSubject<CoursesModuleResponseModel>());

PostSurveyResponseRX postSurveyRXobj= PostSurveyResponseRX(empty: {}, dataFetcher: BehaviorSubject<Map>());

GetSurveyMarkRx getSurveyMarkRxObj= GetSurveyMarkRx(empty: SurveyMarkModel(),dataFetcher: BehaviorSubject<SurveyMarkModel>());

GetRecomendedCourseRx getRecomendedCourseRxObj= GetRecomendedCourseRx(empty: Recomendedcourse(), dataFetcher: BehaviorSubject<Recomendedcourse>());

GetBookMarkResponseRx getBookMarkResponseRx= GetBookMarkResponseRx(empty: BookmarkModel(), dataFetcher: BehaviorSubject<BookmarkModel>());

GetSingleArticleRx getSingleArticleRx= GetSingleArticleRx(empty: SingleArticleModel(), dataFetcher: BehaviorSubject<SingleArticleModel>());

GetCourseArticleRX getCourseArticleRXOBJ= GetCourseArticleRX(empty: CoursesArticleResponseModel(), dataFetcher: BehaviorSubject<CoursesArticleResponseModel>());
GetDailyReadArticleRX getDailyReadArticleRXOBJ= GetDailyReadArticleRX(empty: DailyReadArticleResponseModel(), dataFetcher: BehaviorSubject<DailyReadArticleResponseModel>());
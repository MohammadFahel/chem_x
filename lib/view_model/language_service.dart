// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import '../main.dart';

class MyLanguages extends ChangeNotifier {
  String _lang = myLanguages;

  getMyLanguages() {
    return _lang;
  }

  setMyLanguages(String lang) {
    _lang = lang;
    notifyListeners();
  }

  // for Drawer
  String drawerEditProfile() {
    if (getMyLanguages() == 'AR') {
      return '< تعديل الملف الشخصي';
    } else if (getMyLanguages() == 'EN') {
      return 'Edit Profile >';
    }
    return '';
  }

  String drawerChangeTheme() {
    if (getMyLanguages() == 'AR') {
      return 'تغيير المظهر';
    } else if (getMyLanguages() == 'EN') {
      return 'Change Theme';
    }
    return '';
  }

  String drawerFeedback() {
    if (getMyLanguages() == 'AR') {
      return 'إرسال ملاحظات';
    } else if (getMyLanguages() == 'EN') {
      return 'Send Feedback';
    }
    return '';
  }

  String drawerChangeLanguage() {
    if (getMyLanguages() == 'AR') {
      return 'تغيير اللغة';
    } else if (getMyLanguages() == 'EN') {
      return 'Change Language';
    }
    return '';
  }

  String drawerLogout() {
    if (getMyLanguages() == 'AR') {
      return 'تسجيل الخروج';
    } else if (getMyLanguages() == 'EN') {
      return 'Log out';
    }
    return '';
  }

  // for Sign in
  String SignWelcomeBack() {
    if (getMyLanguages() == 'AR') {
      return '!مرحبًا بعودتك';
    } else if (getMyLanguages() == 'EN') {
      return 'Welcome Back!';
    }
    return '';
  }

  String SignSignin() {
    if (getMyLanguages() == 'AR') {
      return 'تسجيل الدخول';
    } else if (getMyLanguages() == 'EN') {
      return 'Sign In';
    }
    return '';
  }

  String SigninWithGoogle() {
    if (getMyLanguages() == 'AR') {
      return 'تسجيل الدخول باستخدام قوقل';
    } else if (getMyLanguages() == 'EN') {
      return 'Sign In With Google';
    }
    return '';
  }

  String SigninWithFacebook() {
    if (getMyLanguages() == 'AR') {
      return 'تسجيل الدخول باستخدام فيسبوك';
    } else if (getMyLanguages() == 'EN') {
      return 'Sign In With Facebook';
    }
    return '';
  }

  String SignOring() {
    if (getMyLanguages() == 'AR') {
      return 'أو';
    } else if (getMyLanguages() == 'EN') {
      return 'OR';
    }
    return '';
  }

  String SigninWithEmail() {
    if (getMyLanguages() == 'AR') {
      return 'تسجيل الدخول باستخدام البريد';
    } else if (getMyLanguages() == 'EN') {
      return 'Sign In With Email';
    }
    return '';
  }

  String SignWithNoAccount() {
    if (getMyLanguages() == 'AR') {
      return 'لا يوجد لديك حساب؟';
    } else if (getMyLanguages() == 'EN') {
      return "Don't have an account yet?";
    }
    return '';
  }

  String SignWithSignup() {
    if (getMyLanguages() == 'AR') {
      return 'اشترك الآن';
    } else if (getMyLanguages() == 'EN') {
      return "Sign Up";
    }
    return '';
  }

  String SignWithSignin() {
    if (getMyLanguages() == 'AR') {
      return 'تسجيل الدخول';
    } else if (getMyLanguages() == 'EN') {
      return "Sign In";
    }
    return '';
  }

  // for sign up
  String SignGladToMeetYou() {
    if (getMyLanguages() == 'AR') {
      return '!سعداء بحضورك';
    } else if (getMyLanguages() == 'EN') {
      return 'Glad To Meet You!';
    }
    return '';
  }

  String SignSignup() {
    if (getMyLanguages() == 'AR') {
      return 'اشترك الآن';
    } else if (getMyLanguages() == 'EN') {
      return 'Sign Up';
    }
    return '';
  }

  String SignupWithGoogle() {
    if (getMyLanguages() == 'AR') {
      return 'اشترك الآن باستخدام قوقل';
    } else if (getMyLanguages() == 'EN') {
      return 'Sign Up With Google';
    }
    return '';
  }

  String SignupWithFacebook() {
    if (getMyLanguages() == 'AR') {
      return 'اشترك الآن باستخدام فيسبوك';
    } else if (getMyLanguages() == 'EN') {
      return 'Sign Up With Facebook';
    }
    return '';
  }

  String SignupWithEmail() {
    if (getMyLanguages() == 'AR') {
      return 'اشترك الآن باستخدام البريد';
    } else if (getMyLanguages() == 'EN') {
      return 'Sign Up With Email';
    }
    return '';
  }

  String SignWithAccount() {
    if (getMyLanguages() == 'AR') {
      return 'يوجد لديك حساب؟';
    } else if (getMyLanguages() == 'EN') {
      return "Already have an account?";
    }
    return '';
  }

  // dialog sign in
  String dialogSigninWithEmail() {
    if (getMyLanguages() == 'AR') {
      return '  تسجيل الدخول باستخدام البريد  ';
    } else if (getMyLanguages() == 'EN') {
      return 'Sign In With Email';
    }
    return '';
  }

  String dialogForgotPassword() {
    if (getMyLanguages() == 'AR') {
      return 'نسيت كلمة المرور؟';
    } else if (getMyLanguages() == 'EN') {
      return 'Forgot Password?';
    }
    return '';
  }

  String dialogSignin() {
    if (getMyLanguages() == 'AR') {
      return 'تسجيل الدخول';
    } else if (getMyLanguages() == 'EN') {
      return 'Sign In';
    }
    return '';
  }

  String dialogSigninCancel() {
    if (getMyLanguages() == 'AR') {
      return 'إلغاء';
    } else if (getMyLanguages() == 'EN') {
      return 'Cancel';
    }
    return '';
  }

  String dialogSigninEmailHint() {
    late String newStatement;
    if (getMyLanguages() == 'AR') {
      newStatement = 'البريد الالكتروني';
    } else if (getMyLanguages() == 'EN') {
      newStatement = 'Email';
    }
    return newStatement;
  }

  String dialogSigninPasswordHint() {
    late String newStatement;
    if (getMyLanguages() == 'AR') {
      newStatement = 'كلمة المرور';
    } else if (getMyLanguages() == 'EN') {
      newStatement = 'Password';
    }
    return newStatement;
  }

  // dialog sign up
  String dialogSignupWithEmail() {
    late String newStatement;
    if (getMyLanguages() == 'AR') {
      newStatement = '  التسجيل باستخدام البريد  ';
    } else if (getMyLanguages() == 'EN') {
      newStatement = 'Sign Up With Email';
    }
    return newStatement;
  }

  String dialogSignup() {
    if (getMyLanguages() == 'AR') {
      return 'التسجيل';
    } else if (getMyLanguages() == 'EN') {
      return 'Sign Up';
    }
    return '';
  }

  String dialogSignupCancel() {
    if (getMyLanguages() == 'AR') {
      return 'إلغاء';
    } else if (getMyLanguages() == 'EN') {
      return 'Cancel';
    }
    return '';
  }

  String dialogSignupUserHint() {
    late String newStatement;
    if (getMyLanguages() == 'AR') {
      newStatement = 'اسم المستخدم';
    } else if (getMyLanguages() == 'EN') {
      newStatement = 'Username';
    }
    return newStatement;
  }

  String dialogSignupEmailHint() {
    late String newStatement;
    if (getMyLanguages() == 'AR') {
      newStatement = 'البريد الالكتروني';
    } else if (getMyLanguages() == 'EN') {
      newStatement = 'ِEmail';
    }
    return newStatement;
  }

  String dialogSignuPasswordHint() {
    late String newStatement;
    if (getMyLanguages() == 'AR') {
      newStatement = 'كلمو المرور';
    } else if (getMyLanguages() == 'EN') {
      newStatement = 'Password';
    }
    return newStatement;
  }

  // edit profile
  String profileEditTitle() {
    if (getMyLanguages() == 'AR') {
      return 'تعديل الملف الشخصي';
    } else if (getMyLanguages() == 'EN') {
      return 'Edit Profile';
    }
    return '';
  }

  String profileChangePhoto() {
    if (getMyLanguages() == 'AR') {
      return 'تغيير الصورة';
    } else if (getMyLanguages() == 'EN') {
      return 'Change Photo';
    }
    return '';
  }

  String profileSaveChanges() {
    if (getMyLanguages() == 'AR') {
      return 'حفظ التغييرات';
    } else if (getMyLanguages() == 'EN') {
      return 'Save Changes';
    }
    return '';
  }

  String profileCancelChanges() {
    if (getMyLanguages() == 'AR') {
      return 'إلغاء';
    } else if (getMyLanguages() == 'EN') {
      return 'Cancel';
    }
    return '';
  }

  String profileCurrentPassword() {
    if (getMyLanguages() == 'AR') {
      return 'ادخل كلمة المرور الحالية';
    } else if (getMyLanguages() == 'EN') {
      return 'Enter Current Password';
    }
    return '';
  }

  String profileNewPassword() {
    if (getMyLanguages() == 'AR') {
      return 'ادخل كلمة المرور الجديدة';
    } else if (getMyLanguages() == 'EN') {
      return 'Enter New Password';
    }
    return '';
  }

  String profileReNewPassword() {
    if (getMyLanguages() == 'AR') {
      return 'ادخل كلمة المرور الجديدة مرة أخرى';
    } else if (getMyLanguages() == 'EN') {
      return 'Enter New Password, Again';
    }
    return '';
  }

  // send feedback
  String feedbackEditTitle() {
    if (getMyLanguages() == 'AR') {
      return '  إرسال ملاحظات  ';
    } else if (getMyLanguages() == 'EN') {
      return 'Send Feedback';
    }
    return '';
  }

  String feedbackHintMessage() {
    if (getMyLanguages() == 'AR') {
      return 'اكتب رسالتك هنا';
    } else if (getMyLanguages() == 'EN') {
      return 'Enter Your Message Here';
    }
    return '';
  }

  String feedbackSubmit() {
    if (getMyLanguages() == 'AR') {
      return 'إرسال';
    } else if (getMyLanguages() == 'EN') {
      return 'Submit';
    }
    return '';
  }

  String feedbackCancel() {
    if (getMyLanguages() == 'AR') {
      return 'إلغاء';
    } else if (getMyLanguages() == 'EN') {
      return 'Cancel';
    }
    return '';
  }

  // forgot password
  String forgotPasswordTitle() {
    if (getMyLanguages() == 'AR') {
      return '  إعادة تعيين كلمة السر  ';
    } else if (getMyLanguages() == 'EN') {
      return 'Reset Your Password';
    }
    return '';
  }

  String forgotPasswordConfirm() {
    if (getMyLanguages() == 'AR') {
      return 'تأكيد';
    } else if (getMyLanguages() == 'EN') {
      return 'Confirm';
    }
    return '';
  }

  String forgotPasswordCancel() {
    if (getMyLanguages() == 'AR') {
      return 'إلغاء';
    } else if (getMyLanguages() == 'EN') {
      return 'Cancel';
    }
    return '';
  }

  String homePageTitle() {
    if (getMyLanguages() == 'AR') {
      return 'الجدول الدوري';
    } else if (getMyLanguages() == 'EN') {
      return 'Periodic Table';
    }
    return '';
  }

  String searchTitle() {
    if (getMyLanguages() == 'AR') {
      return 'البحث عن عنصر معين';
    } else if (getMyLanguages() == 'EN') {
      return 'Search for specific element';
    }
    return '';
  }

  String searchHint() {
    if (getMyLanguages() == 'AR') {
      return 'البحث...';
    } else if (getMyLanguages() == 'EN') {
      return 'Search...';
    }
    return '';
  }


  // quizzes:
  String quizzesHomePageTitle() {
    if (getMyLanguages() == 'AR') {
      return 'صفحة الاختبارات الرئيسية';
    } else if (getMyLanguages() == 'EN') {
      return 'Home Page Quizzes';
    }
    return '';
  }

  String quizzes() {
    if (getMyLanguages() == 'AR') {
      return 'الاختبارات';
    } else if (getMyLanguages() == 'EN') {
      return 'Quizzes';
    }
    return '';
  }

  String quizzesScore() {
    if (getMyLanguages() == 'AR') {
      return 'نتيجتك هي ';
    } else if (getMyLanguages() == 'EN') {
      return 'Your score is ';
    }
    return '';
  }

  String quizzesStartAgain() {
    if (getMyLanguages() == 'AR') {
      return 'إعادة المحاولة';
    } else if (getMyLanguages() == 'EN') {
      return 'Start Again';
    }
    return '';
  }

  String quizzesViewResult() {
    if (getMyLanguages() == 'AR') {
      return 'عرض الإجابات';
    } else if (getMyLanguages() == 'EN') {
      return 'View Results';
    }
    return '';
  }

  String quizzesQuickQuizzes() {
    if (getMyLanguages() == 'AR') {
      return 'الاختبارات السريعة';
    } else if (getMyLanguages() == 'EN') {
      return 'Try Quick Quizzes';
    }
    return '';
  }

  String quizzesQuickQuizzesTitle() {
    if (getMyLanguages() == 'AR') {
      return 'بنك الأسئلة';
    } else if (getMyLanguages() == 'EN') {
      return 'Question Bank';
    }
    return '';
  }


}

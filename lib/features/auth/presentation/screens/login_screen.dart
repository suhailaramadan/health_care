import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduation_project/core/resources/color_manager.dart';
import 'package:graduation_project/core/resources/font_manager.dart';
import 'package:graduation_project/core/resources/styles_manager.dart';
import 'package:graduation_project/core/resources/value_manager.dart';
import 'package:graduation_project/core/routes/routes.dart';
import 'package:graduation_project/core/utils/validator.dart';
import 'package:graduation_project/core/widgets/custom_botton.dart';
import 'package:graduation_project/core/widgets/custom_text_field.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});
  static const login = "/login";
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: ColorManager.greyDar,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(Insets.s20.sp),
          child: SingleChildScrollView(
            child: Directionality(
              textDirection: TextDirection.rtl,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: Sizes.s135.h,
                  ),
                  // Center(child: SvgPicture.asset(SvgAssets.route)),
                  // SizedBox(
                  //   height: Sizes.s40.h,
                  // ),
                  // Row(
                  //   children: [
                  //     Text(
                  //       "مرحباً\ بعودتك مرة أخرى",
                  //       style: getBoldStyle(color: ColorManager.white)
                  //           .copyWith(fontSize: FontSize.s24),
                  //     ),
                  //     Icon(
                  //       Icons.waving_hand_outlined,
                  //       color: Colors.amber,
                  //     )
                  //   ],
                  // ),

                  // Text(
                  //   'Please sign in with your mail',
                  //   style: getLightStyle(color: ColorManager.white)
                  //       .copyWith(fontSize: FontSize.s16),
                  // ),
                  SizedBox(
                    height: Sizes.s50.h,
                  ),
                  CustomTextField(
                    backgroundColor: ColorManager.white,
                    hint: 'أدخل بريدك الإلكتروني',
                    label: 'البريد الإلكتروني',
                    textInputType: TextInputType.emailAddress,
                    validation: Validator.validateEmail,
                    controller: _emailController,
                  ),
                  SizedBox(
                    height: Sizes.s28.h,
                  ),
                  CustomTextField(
                    hint: 'أدخل كلمة المرور',
                    backgroundColor: ColorManager.white,
                    label: 'كلمة المرور',
                    validation: Validator.vaildatePassword,
                    isObscured: true,
                    textInputType: TextInputType.text,
                    controller: _passwordController,
                  ),
                  SizedBox(
                    height: Sizes.s8.h,
                  ),
                  Row(
                    children: [
                      const Spacer(),
                      GestureDetector(
                        onTap: () {},
                        child: Text(
                          'نسيت كلمة المرور؟',
                          style: getMediumStyle(
                                  color: Color.fromARGB(223, 26, 114, 141))
                              .copyWith(fontSize: FontSize.s18),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: Sizes.s60.h,
                  ),
                  Center(
                    child: SizedBox(
                      child: CustomButton(
                        label: 'تسجيل دخول',
                        backgroundColor: Color.fromARGB(223, 26, 114, 141),
                        isStadiumBorder: false,
                        textStyle: getBoldStyle(
                          color: ColorManager.white,
                          fontSize: FontSize.s18,
                        ),
                        onTap: () {
                          Navigator.of(context)
                              .pushReplacementNamed(Routes.home);
                        },
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 30.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'ليس لديك أي حساب؟',
                        style: getSemiBoldStyle(
                                color: Color.fromARGB(223, 26, 114, 141))
                            .copyWith(fontSize: FontSize.s16),
                      ),
                      SizedBox(
                        width: Sizes.s8.w,
                      ),
                      GestureDetector(
                        onTap: () => Navigator.of(context)
                            .pushReplacementNamed(Routes.register),
                        child: Text(
                          'إنشاء حساب',
                          style: getBoldStyle(
                                  color: Color.fromARGB(224, 17, 85, 105))
                              .copyWith(fontSize: FontSize.s14),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
}

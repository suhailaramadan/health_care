import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduation_project/core/resources/color_manager.dart';
import 'package:graduation_project/core/resources/font_manager.dart';
import 'package:graduation_project/core/resources/image_manager.dart';
import 'package:graduation_project/core/resources/styles_manager.dart';
import 'package:graduation_project/core/resources/value_manager.dart';
import 'package:graduation_project/core/routes/routes.dart';
import 'package:graduation_project/core/utils/validator.dart';
import 'package:graduation_project/core/widgets/custom_botton.dart';
import 'package:graduation_project/core/widgets/custom_dropdown.dart';
import 'package:graduation_project/core/widgets/custom_text_field.dart';
import 'package:image_picker/image_picker.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});
  static const register = "/register";
  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _nameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _phoneController = TextEditingController();
  List<String>? collageList = [
    "كلية  الزراعة",
    "كلية الهندسة",
    "كلية تربية",
    "كلية الطب",
    "كلية الآداب",
    "كلية التربية الرياضية",
    "كلية التربية النوعية",
    "كلية التجارة",
    "كلية الصيدلة",
    "كلية الحقوق",
    "كلية طب الأسنان",
    "كلية التمريض",
    "كلية الحاسبات والمعلومات",
    "كلية الفنون التطبيقية",
    "المعهد الفنى الصحى",

    // ItemList(
    //     "اختر الكلية",
    //     Icon(
    //       Icons.circle_rounded,
    //       color: Colors.amber,
    //     )),
    // ItemList("كلية الزراعة", Icon(Icons.circle_rounded, color: Colors.amber)),
    // ItemList("كلية الهندسة", Icon(Icons.circle_rounded)),
    // ItemList("كلية التربية", Icon(Icons.circle_rounded)),
    // ItemList("كلية الطب", Icon(Icons.circle_rounded)),
    // ItemList("كلية الآداب", Icon(Icons.circle_rounded)),
    // ItemList("كليةالتربية الرياضية", Icon(Icons.circle_rounded)),
    // ItemList("كلية التربية النوعية", Icon(Icons.circle_rounded)),
    // ItemList("كلية التجارة", Icon(Icons.circle_rounded)),
    // ItemList("كلية العلوم", Icon(Icons.circle_rounded)),
    // ItemList("كلية الصيدلة", Icon(Icons.circle_rounded)),
    // ItemList("كلية الحقوق", Icon(Icons.circle_rounded)),
    // ItemList("كلية طب الأسنان", Icon(Icons.circle_rounded)),
    // ItemList("كلية التمريض", Icon(Icons.circle_rounded)),
    // ItemList("كلية الحاسبات والمعلومات", Icon(Icons.circle_rounded)),
    // ItemList("كلية الفون التطبيقية", Icon(Icons.circle_rounded)),
    // ItemList("المعهد الفني الصحى", Icon(Icons.circle_rounded)),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Color.fromARGB(238, 16, 104, 200),
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
                    height: Sizes.s10.h,
                  ),
                  Center(
                      child: Text(
                    "إنشاء حساب",
                    style: getBoldStyle(
                        color: Color.fromARGB(223, 23, 124, 155),
                        fontSize: FontSize.s22),
                  )),
                  SizedBox(
                    height: Sizes.s40.h,
                  ),
                  CustomTextField(
                    backgroundColor: ColorManager.white,
                    hint: 'أدخل الاسم بالكامل',
                    label: 'الاسم بالكامل',
                    textInputType: TextInputType.name,
                    validation: Validator.validateFullName,
                    controller: _nameController,
                  ),
                  SizedBox(
                    height: Sizes.s18.h,
                  ),
                  CustomTextField(
                    hint: 'أدخل رقم هاتفك',
                    backgroundColor: ColorManager.white,
                    label: 'رقم الهاتف',
                    validation: Validator.validatePhoneNumber,
                    textInputType: TextInputType.phone,
                    controller: _phoneController,
                  ),
                  SizedBox(
                    height: Sizes.s18.h,
                  ),
                  CustomTextField(
                    hint: 'أدخل البريد الإلكتروني',
                    backgroundColor: ColorManager.white,
                    label: 'البريد الإلكتروني',
                    validation: Validator.validateEmail,
                    textInputType: TextInputType.emailAddress,
                    controller: _emailController,
                  ),
                  SizedBox(
                    height: Sizes.s18.h,
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
                    height: Sizes.s18.h,
                  ),
                  CustomDropDown(
                    collageList: collageList,
                  ),
                  SizedBox(
                    height: Sizes.s50.h,
                  ),
                  Center(
                    child: SizedBox(
                      // height: Sizes.s60.h,
                      // width: MediaQuery.sizeOf(context).width * .9,
                      child: CustomButton(
                        label: 'إنشاء حساب',
                        backgroundColor: Color.fromARGB(223, 26, 114, 141),

                        onTap: () {
                          Navigator.of(context)
                              .pushReplacementNamed(Routes.home);
                        },
                        // /label: 'إنشاء حساب',
                        // backgroundColor: ColorManager.white,
                        // isStadiumBorder: false,
                        // textStyle: getBoldStyle(
                        //   color: ColorManager.primary,
                        //   fontSize: FontSize.s20,
                        // ),
                        // onTap: () {
                        //   Navigator.of(context)
                        //       .pushReplacementNamed(Routes.home);
                        // }, label: 'إنشاء حساب',
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
                        'لديك حساب بالفعل؟',
                        style: getSemiBoldStyle(
                                color: Color.fromARGB(223, 26, 114, 141))
                            .copyWith(fontSize: FontSize.s16),
                      ),
                      SizedBox(
                        width: Sizes.s8.w,
                      ),
                      GestureDetector(
                        onTap: () => Navigator.of(context)
                            .pushReplacementNamed(Routes.login),
                        child: Text(
                          'تسجيل دخول',
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
}

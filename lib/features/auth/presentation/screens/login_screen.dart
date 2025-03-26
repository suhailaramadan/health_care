import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduation_project/core/resources/color_manager.dart';
import 'package:graduation_project/core/resources/font_manager.dart';
import 'package:graduation_project/core/resources/styles_manager.dart';
import 'package:graduation_project/core/resources/value_manager.dart';
import 'package:graduation_project/core/routes/routes.dart';
import 'package:graduation_project/core/utils/ui_utils.dart';
import 'package:graduation_project/core/utils/validator.dart';
import 'package:graduation_project/core/widgets/custom_botton.dart';
import 'package:graduation_project/core/widgets/custom_text_field.dart';
import 'package:graduation_project/core/widgets/wave_clipper.dart';
import 'package:graduation_project/features/auth/data/models/login/login_request.dart';
import 'package:graduation_project/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:graduation_project/features/auth/presentation/cubit/auth_states.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key, required this.userType});
  static const login = "/login";
  final String userType;
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  String userType = 'User';
  @override
  void initState() {
    super.initState();
    userType = widget.userType;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: ColorManager.white,
        // image: DecorationImage(
        //     image: AssetImage(
        //       "assets/images/background.png",
        //     ),
        //     fit: BoxFit.fill),
      ),
      child: Scaffold(
        backgroundColor: ColorManager.transparent,
        body: Form(
          key: _formKey,
          // child:
          // Padding(
          //   padding: EdgeInsets.all(Insets.s20.sp),
          child: Stack(children: [
            // Positioned(
            //     top: 0,
            //     left: 0,
            //     right: 0,
            //     child:
            ClipPath(
                clipper: WaveClipper(),
                child: Container(
                  height: 210,
                  decoration: const BoxDecoration(
                      gradient: LinearGradient(colors: [
                    Color.fromARGB(255, 4, 105, 206),
                    ColorManager.primary,
                    ColorManager.primaryColor,
                    ColorManager.blue,
                  ], begin: Alignment.topLeft, end: Alignment.topRight)),
                  // ),
                )),
            const SizedBox(
              height: 70,
            ),
            // Image.asset(
            //   "assets/images/Login-pana.png",
            //   height: MediaQuery.sizeOf(context).height * .4.w,
            // ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 170,
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 20),
                  child: Text(
                    "تسجيل الدخول",
                    style: getBoldStyle(
                        fontSize: FontSize.s22, color: ColorManager.white),
                  ),
                ),
              ],
            ),

            const SizedBox(
              height: 70,
            ),
            Center(
              child: Directionality(
                textDirection: TextDirection.rtl,
                child:
                    //  Column(
                    // mainAxisAlignment: MainAxisAlignment.center,
                    // children: [
                    //   const SizedBox(
                    //     height: 100,
                    //   ),
                    Center(
                  child: Padding(
                    padding: EdgeInsets.all(Insets.s20.sp),
                    child: Column(
                      // crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        userType == "User"
                            ? Row(
                                children: [
                                  Text(
                                    "أهلاً بك مرة أخرى",
                                    style: getBoldStyle(
                                        color: ColorManager.primary,
                                        fontSize: FontSize.s22),
                                  ),
                                ],
                              )
                            : const SizedBox(height: 80),
                        CustomTextField(
                          prefixIcon: const Icon(
                            Icons.email,
                            color: ColorManager.primary,
                          ),
                          backgroundColor: ColorManager.white,
                          // hint: 'أدخل بريدك الإلكتروني',
                          hint: 'البريد الإلكتروني',
                          textInputType: TextInputType.emailAddress,
                          validation: Validator.validateEmail,
                          controller: _emailController,
                        ),
                        SizedBox(
                          height: Sizes.s20.h,
                        ),
                        CustomTextField(
                          prefixIcon: const Icon(
                            Icons.lock,
                            color: ColorManager.primary,
                          ),
                          // hint: 'أدخل كلمة المرور',
                          backgroundColor: ColorManager.white,
                          hint: 'كلمة المرور',
                          validation: Validator.validatePassword,
                          isObscured: true,
                          controller: _passwordController,
                        ),
                        SizedBox(
                          height: Sizes.s12.h,
                        ),
                        Row(
                          children: [
                            const Spacer(),
                            GestureDetector(
                              onTap: () {},
                              child: Text(
                                'نسيت كلمة المرور؟',
                                style:
                                    getMediumStyle(color: ColorManager.primary)
                                        .copyWith(fontSize: FontSize.s13),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: Sizes.s50.h,
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * .82,
                          child: BlocListener<AuthCubit, AuthStates>(
                            listener: (context, state) {
                              if (state is LoginLoading) {
                                UIUtils.showLoading(context);
                              } else if (state is LoginSuccess) {
                                UIUtils.hideLoading(context);
                                final String roleFromApi = state.role;
                                if ((userType == "User" &&
                                    roleFromApi != "User")) {
                                  UIUtils.showMessage(
                                      "غير مصرح لك بتسجيل الدخول ك طالب");
                                  _emailController.clear();
                                  _passwordController.clear();
                                  return;
                                }
                                if ((userType == "Doctor" &&
                                    roleFromApi != "Doctor")) {
                                  UIUtils.showMessage(
                                      "غير مصرح لك بتسجيل الدخول كـ دكتور");
                                  _emailController.clear();
                                  _passwordController.clear();
                                  return;
                                }
                                Navigator.of(context).pushReplacementNamed(
                                  userType == "User"
                                      ? Routes.patientHome
                                      : Routes.doctorHome,
                                );
                              } else if (state is LoginError) {
                                UIUtils.hideLoading(context);
                                UIUtils.showMessage(state.message);
                              }
                            },
                            child: CustomButton(
                              label: 'تسجيل الدخول',
                              backgroundColor: ColorManager.primary,
                              isStadiumBorder: false,
                              textStyle: getBoldStyle(
                                color: ColorManager.white,
                                fontSize: FontSize.s18,
                              ),
                              onTap: () {
                                if (_formKey.currentState!.validate()) {
                                  BlocProvider.of<AuthCubit>(context).login(
                                      LoginRequest(
                                          email: _emailController.text,
                                          password: _passwordController.text));
                                }
                              },
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 30.h,
                        ),
                        if (userType == "User")
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('ليس لديك أي حساب؟',
                                  style: getSemiBoldStyle(
                                          color: ColorManager.primary)
                                      .copyWith(fontSize: FontSize.s16)),
                              SizedBox(width: Sizes.s8.w),
                              InkWell(
                                splashColor: ColorManager.blue,
                                onTap: () => Navigator.of(context)
                                    .pushReplacementNamed(Routes.register),
                                child: Text('إنشاء حساب',
                                    style: getBoldStyle(
                                            color: ColorManager.textColor)
                                        .copyWith(fontSize: FontSize.s14)),
                              ),
                            ],
                          ),
                      ],
                    ),
                  ),
                ),
                // ],
                // ),
              ),
            ),
          ]),
        ),
        // ),
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

// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:graduation_project/core/di/service_locator.dart';
// import 'package:graduation_project/features/auth/presentation/cubit/forget_password_cubit.dart';
// import 'package:graduation_project/features/auth/presentation/cubit/forget_password_states.dart';

// class ForgetPasswordScreen extends StatelessWidget {
//   static const forgetPassword = '/forget';
//   ForgetPasswordScreen({super.key});
//   final TextEditingController emailController = TextEditingController();
//   @override
//   Widget build(BuildContext context) {
//     return Directionality(
//       textDirection: TextDirection.rtl,
//       child: BlocProvider(
//           create: (_) => serviceLocator.get<ForgetPasswordCubit>()
//             ..forgetEmail(emailController.text),
//           child: Scaffold(
//               appBar: AppBar(
//                 title: const Text("إعادة تعين كلمة المرور"),
//               ),
//               body: BlocListener<ForgetPasswordCubit, ForgetPasswordStates>(
//                 listener: (context, state) {
//                   if (state is ForgetPasswordSuccess) {
//                     ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
//                         content: Text("تم إرسال رابط إعادة التعين")));
//                   } else if (state is ForgetPasswordError) {
//                     ScaffoldMessenger.of(context).showSnackBar(
//                         SnackBar(content: Text("${state.message}")));
//                   }
//                 },
//                 child: Padding(
//                   padding: const EdgeInsets.all(15),
//                   child: Column(
//                     children: [
//                       TextField(
//                         controller: emailController,
//                         decoration: const InputDecoration(
//                             labelText: "البريد الإلكتروني"),
//                       ),
//                       ElevatedButton(
//                           onPressed: () {
//                             context
//                                 .read<ForgetPasswordCubit>()
//                                 .forgetEmail(emailController.text);
//                           },
//                           child: const Text("إرسال"))
//                     ],
//                   ),
//                 ),
//               ))),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduation_project/core/resources/color_manager.dart';
import 'package:graduation_project/core/resources/font_manager.dart';
import 'package:graduation_project/core/resources/styles_manager.dart';
import 'package:graduation_project/core/routes/routes.dart';
import 'package:graduation_project/core/widgets/custom_text_field.dart';
import 'package:graduation_project/core/widgets/wave_clipper.dart';
import 'package:graduation_project/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:graduation_project/features/auth/presentation/cubit/forget_password_cubit.dart';
import 'package:graduation_project/features/auth/presentation/cubit/password_states.dart';

class ForgetPasswordScreen extends StatefulWidget {
  static const forgetPassword = "/forgetPassword";
  const ForgetPasswordScreen({super.key});

  @override
  State<ForgetPasswordScreen> createState() => _ForgetPasswordScreenState();
}

class _ForgetPasswordScreenState extends State<ForgetPasswordScreen> {
  final TextEditingController _emailController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ForgetPasswordCubit, PasswordStates>(
      listener: (context, state) {
        if (state is PasswordSuccess) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text("تم إرسال الكود إلى بريدك الإلكتروني"),
              backgroundColor: ColorManager.green,
            ),
          );
          Navigator.of(context).pushReplacementNamed(Routes.verifycode,
              arguments: {'email': _emailController.text.trim()});
        } else if (state is PasswordError) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.message),
              backgroundColor: ColorManager.red,
            ),
          );
        }
      },
      builder: (context, state) {
        return Directionality(
          textDirection: TextDirection.rtl,
          child: Container(
            color: ColorManager.white,
            child:
                // Stack(
                //   children: [
                //     ClipPath(
                //         clipper: WaveClipper(),
                //         child: Container(
                //           height: 210,
                //           decoration: const BoxDecoration(
                //               gradient: LinearGradient(colors: [
                //             Color.fromARGB(255, 4, 105, 206),
                //             ColorManager.primary,
                //             ColorManager.primaryColor,
                //             ColorManager.blue,
                //           ], begin: Alignment.topLeft, end: Alignment.topRight)),
                //           // ),
                //         )),
                Scaffold(
              backgroundColor: ColorManager.transparent,
              appBar: AppBar(
                backgroundColor: ColorManager.white,
                // title: Text("نسيت كلمة المرور",
                // style: getSemiBoldStyle(color: ColorManager.primary)),
                foregroundColor: ColorManager.primary,
                toolbarHeight: 80,
              ),
              body: Form(
                key: _formKey,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Image.asset(
                          "assets/images/Forgot password-cuate.png",
                          height: 320,
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(18.0),
                          child: Align(
                            alignment: Alignment.topRight,
                            child: Text(
                              "أدخل بريدك الإلكتروني لإستعادة كلمة المرور",
                              style: getMediumStyle(
                                  color: ColorManager.primary, fontSize: 15),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * .89,
                          child: CustomTextField(
                            controller: _emailController,
                            // decoration: InputDecoration(
                            hint: "البريد الإلكتروني",

                            textInputType: TextInputType.emailAddress,

                            prefixIcon: const Icon(
                              Icons.email,
                              color: ColorManager.grey,
                            ),
                            // constraints: BoxConstraints(
                            //     maxWidth:
                            //         MediaQuery.of(context).size.width * .6)),
                          ),
                        ),
                        const SizedBox(height: 30),
                        state is PasswordLoading
                            ? const CircularProgressIndicator(
                                color: ColorManager.primary,
                              )
                            : SizedBox(
                                width: MediaQuery.of(context).size.width * .85,
                                height: 40,
                                child: ElevatedButton(
                                  style: ButtonStyle(
                                      backgroundColor:
                                          const MaterialStatePropertyAll(
                                              ColorManager.primary),
                                      shape: MaterialStatePropertyAll(
                                          RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(8)))),
                                  onPressed: () {
                                    if (_emailController.text.isNotEmpty) {
                                      context
                                          .read<ForgetPasswordCubit>()
                                          .forgetPassword(
                                              _emailController.text.trim());
                                      // Navigator.of(context)
                                      //     .pushReplacementNamed(
                                      //         Routes.verifycode,
                                      //         arguments:
                                      //             _emailController.text);
                                    }
                                  },
                                  child: Text(
                                    "إرسال الكود",
                                    style: getSemiBoldStyle(
                                        fontSize: FontSize.s18,
                                        color: ColorManager.white),
                                  ),
                                ),
                              ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            // ],
          ),
          // ),
        );
      },
    );
  }

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }
}

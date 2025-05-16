// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:graduation_project/core/constants.dart';
// import 'package:graduation_project/core/resources/color_manager.dart';
// import 'package:graduation_project/core/routes/routes.dart';
// import 'package:graduation_project/core/widgets/custom_text_field.dart';
// import 'package:graduation_project/features/auth/data/models/password/verify_code_request.dart';
// import 'package:graduation_project/features/auth/presentation/cubit/password_states.dart';
// import 'package:graduation_project/features/auth/presentation/cubit/verify_code_cubit.dart';

// class VerifyCodeScreen extends StatefulWidget {
//   static const verifyCodeScreen = '/verifyCode';
//   final String email;
//   const VerifyCodeScreen({super.key, required this.email});

//   @override
//   State<VerifyCodeScreen> createState() => _VerifyCodeScreenState();
// }

// class _VerifyCodeScreenState extends State<VerifyCodeScreen> {
//   final TextEditingController _codeController = TextEditingController();
//   final _formKey = GlobalKey<FormState>();
//   bool _isResending = false;
//   void submiteCode() {
//     if (_formKey.currentState?.validate() ?? false) {
//       final code = _codeController.text.trim();
//       context
//           .read<VerifyCodeCubit>()
//           .verifyCode(VerifyCodeRequest(code: code, email: widget.email));
//     }
//   }

//   void _resendCode() async {
//     setState(() {
//       _isResending = true;
//     });
//     await Future.delayed(const Duration(seconds: 2));
//     setState(() {
//       _isResending = false;
//     });
//     ScaffoldMessenger.of(context).showSnackBar(
//         const SnackBar(content: Text("تم إرسال الكود مرة أخرى إلى بريدك")));
//   }

//   @override
//   Widget build(BuildContext context) {
//     return BlocConsumer<VerifyCodeCubit, PasswordStates>(
//       listener: (context, state) {
//         if (state is VerifyCodeSuccess) {
//           Navigator.of(context).pushNamed(Routes.resetPassword, arguments: {
//             'email': widget.email,
//             'code': _codeController.text.trim()
//           });
//         } else if (state is PasswordError) {
//           ScaffoldMessenger.of(context)
//               .showSnackBar(SnackBar(content: Text(state.message)));
//         }
//       },
//       builder: (context, state) {
//         return Directionality(
//           textDirection: TextDirection.rtl,
//           child: Scaffold(
//               appBar: AppBar(
//                 title: const Text("التحقق من الكود"),
//                 centerTitle: true,
//               ),
//               body: Padding(
//                   padding: const EdgeInsets.all(8),
//                   child: Column(
//                     children: [
//                       const Text(
//                           "أدخل الكود المكون من 6 أرقام الذى تم إرساله إلى بريدك الإلكتروني"),
//                       const SizedBox(
//                         height: 30,
//                       ),
//                       Form(
//                           key: _formKey,
//                           child: CustomTextField(
//                               controller: _codeController,
//                               hint: "أدخل الكود",
//                               textInputType: TextInputType.number,
//                               maxLength: 6,
//                               validation: (value) {
//                                 if (value == null ||
//                                     value.isEmpty ||
//                                     value.length != 6) {
//                                   return "برجاء إدخال الكود بشكل صحيح";
//                                 }
//                                 return null;
//                               })),
//                       const SizedBox(
//                         height: 30,
//                       ),
//                       SizedBox(
//                         width: MediaQuery.of(context).size.width * .4,
//                         child: ElevatedButton(
//                             onPressed: () {
//                               if (_formKey.currentState!.validate()) {
//                                 context.read<VerifyCodeCubit>().verifyCode(
//                                     VerifyCodeRequest(
//                                         code: _codeController.text.trim(),
//                                         email: widget.email));
//                               }
//                               final code = _codeController.text.trim();
//                               context.read<VerifyCodeCubit>().verifyCode(
//                                   VerifyCodeRequest(
//                                       code: code, email: widget.email));
//                             },
//                             child: const Text("تأكيد")),
//                       ),
//                       TextButton(
//                           onPressed: _isResending ? null : _resendCode,
//                           // // context
//                           // .read<VerifyCodeCubit>()
//                           // .verifyCode(VerifyCodeRequest(
//                           //     // email: widget.email,
//                           //     code: _codeController.text));

//                           child: _isResending
//                               ? const CircularProgressIndicator(
//                                   color: ColorManager.primary,
//                                 )
//                               : const Text("لم يصلك الكود؟ أعادة إرسال"))
//                     ],
//                   ))),
//         );
//       },
//     );
//   }

//   Widget content() {
//     return Column(
//       children: [
//         Container(
//           margin: const EdgeInsets.symmetric(
//           horizontal: 24),
//           // child: ,
//         )
//       ],
//     );
//   }
// }
// ////////////////////////////////////////////////////////////
// // import 'package:flutter/material.dart';
// // import 'package:flutter_bloc/flutter_bloc.dart';
// // import 'package:graduation_project/core/constants.dart';
// // import 'package:graduation_project/core/resources/color_manager.dart';
// // import 'package:graduation_project/core/routes/routes.dart';
// // import 'package:graduation_project/core/widgets/custom_text_field.dart';
// // import 'package:graduation_project/features/auth/data/models/password/verify_code_request.dart';
// // import 'package:graduation_project/features/auth/presentation/cubit/forget_password_cubit.dart';
// // import 'package:graduation_project/features/auth/presentation/cubit/password_states.dart';
// // import 'package:graduation_project/features/auth/presentation/cubit/verify_code_cubit.dart';

// // class VerifyCodeScreen extends StatefulWidget {
// //   static const verifyCodeScreen = '/verifyCode';
// //   final String email;

// //   const VerifyCodeScreen({super.key, required this.email});

// //   @override
// //   State<VerifyCodeScreen> createState() => _VerifyCodeScreenState();
// // }

// // class _VerifyCodeScreenState extends State<VerifyCodeScreen> {
// //   final TextEditingController _codeController = TextEditingController();
// //   final _formKey = GlobalKey<FormState>();
// //   bool _isResending = false;

// //   // دالة لإرسال الكود للتحقق
// //   void _submitCode() {
// //     if (_formKey.currentState?.validate() ?? false) {
// //       final code = _codeController.text.trim();
// //       context
// //           .read<VerifyCodeCubit>()
// //           .verifyCode(VerifyCodeRequest(code: code, email: widget.email));
// //     }
// //   }

// //   void _resendCode() async {
// //     setState(() {
// //       _isResending = true;
// //     });

// //     await Future.delayed(const Duration(seconds: 2));

// //     setState(() {
// //       _isResending = false;
// //     });

// //     ScaffoldMessenger.of(context).showSnackBar(
// //       const SnackBar(content: Text("تم إرسال الكود مرة أخرى إلى بريدك")),
// //     );
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     return BlocConsumer<VerifyCodeCubit, PasswordStates>(
// //       listener: (context, state) {
// //         if (state is VerifyCodeSuccess) {
// //           Navigator.of(context).pushNamed(Routes.resetPassword, arguments: {
// //             'email': widget.email,
// //             'code': _codeController.text.trim()
// //           });
// //         } else if (state is PasswordError) {
// //           ScaffoldMessenger.of(context)
// //               .showSnackBar(SnackBar(content: Text(state.message)));
// //         }
// //       },
// //       builder: (context, state) {
// //         return Directionality(
// //           textDirection: TextDirection.rtl,
// //           child: Scaffold(
// //             appBar: AppBar(
// //               title: const Text("التحقق من الكود"),
// //               centerTitle: true,
// //             ),
// //             body: Padding(
// //               padding: const EdgeInsets.all(8),
// //               child: Column(
// //                 children: [
// //                   const Text(
// //                     "أدخل الكود المكون من 6 أرقام الذى تم إرساله إلى بريدك الإلكتروني",
// //                     style: TextStyle(fontSize: 16),
// //                   ),
// //                   const SizedBox(height: 30),
// //                   Form(
// //                     key: _formKey,
// //                     child: CustomTextField(
// //                       controller: _codeController,
// //                       hint: "أدخل الكود",
// //                       textInputType: TextInputType.number,
// //                       maxLength: 6,
// //                       validation: (value) {
// //                         if (value == null ||
// //                             value.isEmpty ||
// //                             value.length != 6) {
// //                           return "برجاء إدخال الكود بشكل صحيح";
// //                         }
// //                         return null;
// //                       },
// //                     ),
// //                   ),
// //                   const SizedBox(height: 30),
// //                   SizedBox(
// //                     width: MediaQuery.of(context).size.width * 0.6,
// //                     child: ElevatedButton(
// //                       onPressed: state is PasswordLoading ? null : _submitCode,
// //                       child: state is PasswordLoading
// //                           ? const CircularProgressIndicator(color: Colors.white)
// //                           : const Text("تأكيد"),
// //                     ),
// //                   ),
// //                   const SizedBox(height: 20),
// //                   TextButton(
// //                     onPressed: _isResending ? null : _resendCode,
// //                     child: _isResending
// //                         ? const CircularProgressIndicator(
// //                             color: ColorManager.primary,
// //                           )
// //                         : const Text("لم يصلك الكود؟ إعادة الإرسال"),
// //                   ),
// //                 ],
// //               ),
// //             ),
// //           ),
// //         );
// //       },
// //     );
// //   }
// // }

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/core/resources/color_manager.dart';
import 'package:graduation_project/core/resources/styles_manager.dart';
import 'package:graduation_project/core/routes/routes.dart';
import 'package:graduation_project/features/auth/data/models/password/verify_code_request.dart';
import 'package:graduation_project/features/auth/presentation/cubit/forget_password_cubit.dart';
import 'package:graduation_project/features/auth/presentation/cubit/password_states.dart';
import 'package:graduation_project/features/auth/presentation/cubit/verify_code_cubit.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class VerifyCodeScreen extends StatefulWidget {
  static const verifyCodeScreen = '/verifyCode';
  final String email;

  const VerifyCodeScreen({super.key, required this.email});

  @override
  State<VerifyCodeScreen> createState() => _VerifyCodeScreenState();
}

class _VerifyCodeScreenState extends State<VerifyCodeScreen> {
  final _formKey = GlobalKey<FormState>();
  String code = '';
  bool _isResending = false;

  void submitCode() {
    if (code.length == 6) {
      context
          .read<VerifyCodeCubit>()
          .verifyCode(VerifyCodeRequest(code: code, email: widget.email));
    }
  }

  void _resendCode() async {
    setState(() => _isResending = true);
    context.read<ForgetPasswordCubit>().forgetPassword(widget.email);
    await Future.delayed(const Duration(seconds: 2));
    setState(() => _isResending = false);
    // ignore: use_build_context_synchronously
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
      content: Text("تم إرسال الكود مرة أخرى إلى بريدك"),
      backgroundColor: ColorManager.green,
    ));
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<VerifyCodeCubit, PasswordStates>(
      listener: (context, state) {
        if (state is VerifyCodeSuccess) {
          Navigator.of(context).pushNamed(Routes.resetPassword, arguments: {
            'email': widget.email,
            'code': code,
          });
        } else if (state is PasswordError) {
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text(state.message)));
        }
      },
      builder: (context, state) {
        return Directionality(
          textDirection: TextDirection.rtl,
          child: Scaffold(
            appBar: AppBar(
              // title: const Text("التحقق من الكود"),
              centerTitle: true,
              foregroundColor: ColorManager.primary,
            ),
            body: Padding(
              padding: const EdgeInsets.all(16.0),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    Image.asset(
                      'assets/images/Enter OTP (1).gif',
                      height: 300,
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    const Text(
                      "أدخل الكود المكون من 6 أرقام الذى تم إرساله إلى بريدك الإلكتروني",
                      style: TextStyle(fontSize: 16),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 30),
                    Form(
                      key: _formKey,
                      child: Directionality(
                        textDirection: TextDirection.ltr,
                        child: PinCodeTextField(
                          appContext: context,
                          length: 6,
                          keyboardType: TextInputType.number,
                          animationType: AnimationType.fade,
                          pinTheme: PinTheme(
                            shape: PinCodeFieldShape.box,
                            borderRadius: BorderRadius.circular(10),
                            fieldHeight: 60,
                            fieldWidth: 50,
                            activeColor: ColorManager.primary,
                            selectedColor: Colors.grey,
                            inactiveColor: Colors.grey.shade300,
                          ),
                          autoDismissKeyboard: false,
                          animationDuration: const Duration(milliseconds: 300),
                          onChanged: (value) => setState(() => code = value),
                          onCompleted: (value) => code = value,
                        ),
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
                              onPressed: code.length == 6 ? submitCode : null,
                              child: Text(
                                "تأكيد",
                                style:
                                    getMediumStyle(color: ColorManager.white),
                              ),
                            ),
                          ),
                    const SizedBox(height: 16),
                    TextButton(
                      onPressed: _isResending ? null : _resendCode,
                      child: _isResending
                          ? const CircularProgressIndicator(
                              color: ColorManager.primary,
                            )
                          : Text(
                              "لم يصلك الكود؟ إعادة إرسال",
                              style:
                                  getMediumStyle(color: ColorManager.primary),
                            ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

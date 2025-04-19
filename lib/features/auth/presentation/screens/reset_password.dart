import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/core/resources/color_manager.dart';
import 'package:graduation_project/core/resources/styles_manager.dart';
import 'package:graduation_project/core/routes/routes.dart';
import 'package:graduation_project/core/utils/validator.dart';
import 'package:graduation_project/core/widgets/custom_text_field.dart';
import 'package:graduation_project/core/widgets/wave_clipper.dart';
import 'package:graduation_project/features/auth/data/models/password/reset_password_request.dart';
import 'package:graduation_project/features/auth/presentation/cubit/password_states.dart';
import 'package:graduation_project/features/auth/presentation/cubit/reset_password_cubit.dart';

class ResetPassword extends StatefulWidget {
  static const resetPassword = '/reset';
  final String email;
  final String code;
  const ResetPassword({
    super.key,
    required this.email,
    required this.code,
  });

  @override
  State<ResetPassword> createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _newPasswordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  void submitResetPassword() {
    if (_formKey.currentState?.validate() ?? false) {
      final newPassword = _newPasswordController.text.trim();
      final confirmPassword = _confirmPasswordController.text.trim();
      if (confirmPassword != newPassword) {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text("كلمة المرور غير متطابقة"),
          backgroundColor: ColorManager.red,
        ));
        return;
      }
      context.read<ResetPasswordCubit>().resetPassword(ResetPasswordRequest(
          widget.email, widget.code,
          newPassword: newPassword, confirmPassword: confirmPassword));
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ResetPasswordCubit, PasswordStates>(
      listener: (context, state) {
        if (state is ResetPasswordSuccess) {
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text("تم إعادة تعيين كلمة المرور بنجاح"),
            backgroundColor: ColorManager.green,
          ));
          Navigator.of(context).pushReplacementNamed(Routes.login);
        } else if (state is PasswordError) {
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text(state.message)));
        }
      },
      builder: (context, state) {
        return Directionality(
            textDirection: TextDirection.rtl,
            child: Container(
              color: ColorManager.white,
              child: Stack(children: [
                ClipPath(
                    clipper: WaveClipper(),
                    child: Container(
                      height: 230,
                      decoration: const BoxDecoration(
                          gradient: LinearGradient(colors: [
                        Color.fromARGB(255, 4, 105, 206),
                        ColorManager.primary,
                        ColorManager.primaryColor,
                        ColorManager.blue,
                      ], begin: Alignment.topLeft, end: Alignment.topRight)),
                      // ),
                    )),
                Scaffold(
                  backgroundColor: ColorManager.transparent,
                  appBar: AppBar(
                    toolbarHeight: 120,
                    backgroundColor: ColorManager.transparent,
                    title: Text(
                      "إعادة تعيين كلمة المرور",
                      style: getSemiBoldStyle(color: ColorManager.white),
                    ),
                    centerTitle: true,
                    foregroundColor: ColorManager.primary,
                  ),
                  body: Form(
                    key: _formKey,
                    child: Padding(
                      padding: const EdgeInsets.all(8),
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            const SizedBox(
                              height: 150,
                            ),
                            CustomTextField(
                              controller: _newPasswordController,
                              hint: 'كلمة المرور',
                              isObscured: true,
                              validation: Validator.validatePassword,
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            CustomTextField(
                              controller: _confirmPasswordController,
                              hint: "تأكيد كلمة المرور",
                              isObscured: true,
                              validation: (value) {
                                if (value == null || value.trim().length < 10) {
                                  return 'يرجى تأكيد كلمة المرور';
                                } else if (value !=
                                    _confirmPasswordController.text) {
                                  return 'كلمة المرور غير متطابقة';
                                }
                                return null;
                              },
                            ),
                            const SizedBox(
                              height: 30,
                            ),
                            state is PasswordLoading
                                ? const CircularProgressIndicator(
                                    color: ColorManager.primary,
                                  )
                                : SizedBox(
                                    width:
                                        MediaQuery.of(context).size.width * .85,
                                    height: 40,
                                    child: ElevatedButton(
                                        style: ButtonStyle(
                                            backgroundColor:
                                                const MaterialStatePropertyAll(
                                                    ColorManager.primary),
                                            shape: MaterialStatePropertyAll(
                                                RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8)))),
                                        onPressed: submitResetPassword,
                                        child: Text(
                                          "تعيين كلمة المرور",
                                          style: getMediumStyle(
                                              color: ColorManager.white),
                                        )),
                                  )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ]),
            ));
      },
    );
  }

  @override
  void dispose() {
    _newPasswordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }
}

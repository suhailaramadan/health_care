import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduation_project/core/constants.dart';
import 'package:graduation_project/core/resources/color_manager.dart';
import 'package:graduation_project/core/resources/styles_manager.dart';
import 'package:graduation_project/core/routes/routes.dart';
import 'package:graduation_project/core/utils/ui_utils.dart';
import 'package:graduation_project/core/utils/validator.dart';
import 'package:graduation_project/core/widgets/custom_botton.dart';
import 'package:graduation_project/core/widgets/custom_text_field.dart';
import 'package:graduation_project/features/auth/data/models/password/change_password_request.dart';
import 'package:graduation_project/features/auth/presentation/cubit/change_password_cubit.dart';
import 'package:graduation_project/features/auth/presentation/cubit/password_states.dart';

class ChangePasswordScreen extends StatefulWidget {
  static const changePassword = '/changePassword';
  const ChangePasswordScreen({super.key});

  @override
  State<ChangePasswordScreen> createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  final TextEditingController _oldPasswordController = TextEditingController();
  final TextEditingController _newPasswordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  final _formKey = GlobalKey<FormState>();
  void submitChangePassword() {
    if (_formKey.currentState!.validate()) {
      final oldPassword = _oldPasswordController.text.trim();
      final newPassword = _newPasswordController.text.trim();
      final confirmPassword = _confirmPasswordController.text.trim();
      if (newPassword == confirmPassword) {
        showDialog(
          context: context,
          builder: (context) {
            return Directionality(
              textDirection: TextDirection.rtl,
              child: AlertDialog(
                surfaceTintColor: ColorManager.white,
                backgroundColor: ColorManager.white,
                title: const Icon(
                  Icons.warning_amber,
                  color: ColorManager.red,
                  size: 35,
                ),
                content: Text(
                  "هل أنت متأكد من تغيير كلمة المرور",
                  style:
                      getBoldStyle(fontSize: 18, color: ColorManager.textColor),
                ),
                actions: [
                  TextButton(
                      onPressed: () {
                        context
                            .read<ChangePasswordCubit>()
                            .changePassword(ChangePasswordRequest(
                              oldPassword: oldPassword,
                              newPassword: newPassword,
                              confirmPassword: confirmPassword,
                            ));
                      },
                      style: ButtonStyle(
                          padding: const MaterialStatePropertyAll(
                              EdgeInsets.all(12)),
                          backgroundColor:
                              const MaterialStatePropertyAll(ColorManager.red),
                          shape: MaterialStatePropertyAll(
                              RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5),
                                  side: const BorderSide(width: .3)))),
                      child: Text(
                        "تأكيد",
                        style: getRegularStyle(color: ColorManager.white),
                      )),
                  SizedBox(
                    width: 50.w,
                  ),
                  TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      style: ButtonStyle(
                          padding: const MaterialStatePropertyAll(
                              EdgeInsets.all(15)),
                          backgroundColor: const MaterialStatePropertyAll(
                              ColorManager.transparent),
                          shape: MaterialStatePropertyAll(
                              RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5),
                                  side: const BorderSide(width: .3)))),
                      child: Text(
                        "لا أريد ذلك",
                        style: getRegularStyle(color: ColorManager.textColor),
                      )),
                  //     onTap: () {
                  //       Navigator.of(context).pop();

                  //       cubit.deleteAppointment(
                  //           appointment.id ?? 0);
                  //     }),
                  // CustomButton(
                  //     label: "لا أريد ذلك",
                  //     backgroundColor:
                  //         ColorManager.transparent,
                  //     onTap: () {
                  //       Navigator.of(context).pop();
                  //     }),
                ],
              ),
            );
          },
        );
      } else {
        UIUtils.showMessage(
            context, "كلمات المرور غير متطابقة", ColorManager.red);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ChangePasswordCubit, PasswordStates>(
      listener: (context, state) {
        if (state is ChangePasswordSuccess) {
          UIUtils.showMessage(
              context, "تم تغيير كلمة المرور بنجاح", ColorManager.green);

          Navigator.of(context).pushNamed(Routes.login);
        } else if (state is PasswordError) {
          UIUtils.showMessage(context, state.message, ColorManager.red);
        }
      },
      builder: (context, state) {
        return Scaffold(
          backgroundColor: ColorManager.white,
          appBar: AppBar(
            backgroundColor: ColorManager.white,
            title: Text(
              "تغيير كلمة المرور",
              style: getSemiBoldStyle(color: ColorManager.textColor),
            ),
            centerTitle: true,
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: Column(
                children: [
                  const SizedBox(
                    height: 50,
                  ),
                  // Text(
                  //   "أدخل كلمات المرور القديمة والجديدة",
                  //   style: getMediumStyle(color: ColorManager.primary),
                  // ),
                  const SizedBox(height: 30),
                  Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        // Align(
                        //     alignment: Alignment.centerRight,
                        //     child: Text(
                        //       "كلمة المرور",
                        //       style: getMediumStyle(color: ColorManager.primary),
                        //     )),
                        const SizedBox(
                          height: 10,
                        ),
                        Image.asset(
                          "assets/images/lock-removebg-preview.png",
                          height: 180,
                          width: double.infinity,
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        CustomTextField(
                          controller: _oldPasswordController,
                          hint: "كلمة المرور",
                          labelTextStyle: const TextStyle(color: Colors.black),
                          isObscured: true,
                          validation: (value) {
                            if (value == null || value.isEmpty) {
                              return "برجاء إدخال كلمة المرور القديمة";
                            } else if (value ==
                                Validator.validatePassword(value)) {
                              return "كلمة المرور غير صحيحة";
                            }
                            return null;
                          },
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        // Align(
                        //     alignment: Alignment.centerRight,
                        //     child: Text(
                        //       "كلمة المرور الجديدة",
                        //       style: getMediumStyle(color: ColorManager.primary),
                        //     )),
                        const SizedBox(
                          height: 10,
                        ),
                        CustomTextField(
                          controller: _newPasswordController,
                          hint: "كلمة المرور الجديدة",
                          isObscured: true,
                          validation: (value) {
                            if (value == null || value.length < 6) {
                              return "برجاء إدخال كلمة مرور جديدة لا تقل عن 6 أحرف";
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 20),
                        // Align(
                        //     alignment: Alignment.centerRight,
                        //     child: Text(
                        //       "تأكيد كلمة المرور",
                        //       style: getMediumStyle(color: ColorManager.primary),
                        //     )),
                        const SizedBox(
                          height: 10,
                        ),
                        CustomTextField(
                          controller: _confirmPasswordController,
                          hint: "تأكيد كلمة المرور",
                          isObscured: true,
                          validation: (value) {
                            if (value == null || value.isEmpty) {
                              return "برجاء تأكيد كلمة المرور";
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 30),
                        state is PasswordLoading
                            ? const CircularProgressIndicator(
                                color: ColorManager.primary,
                              )
                            : SizedBox(
                                width: MediaQuery.of(context).size.width * .7,
                                child: CustomButton(
                                  backgroundColor: ColorManager.primary,
                                  onTap: submitChangePassword,
                                  label: "تغيير كلمة المرور",
                                ),
                              ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

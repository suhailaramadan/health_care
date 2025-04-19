import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/core/resources/color_manager.dart';
import 'package:graduation_project/core/routes/routes.dart';
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
        context.read<ChangePasswordCubit>().changePassword(
            ChangePasswordRequest(
                oldPassword: oldPassword,
                newPassword: newPassword,
                confirmPassword: confirmPassword,
                email: ''));
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text("كلمات المرور غير متطابقة")));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ChangePasswordCubit, PasswordStates>(
      listener: (context, state) {
        if (state is ChangePasswordSuccess) {
          ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text("تم تغيير كلمة المرور بنجاح")));
          Navigator.of(context).pushNamed(Routes.login);
        } else if (state is PasswordError) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text(
            state.message,
          )));
        }
      },
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: const Text("تغيير كلمة المرور"),
            centerTitle: true,
          ),
          body: Padding(
            padding: const EdgeInsets.all(8),
            child: Column(
              children: [
                const Text("أدخل كلمة المرور القديمة والجديدة"),
                const SizedBox(height: 30),
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      CustomTextField(
                        controller: _oldPasswordController,
                        hint: "كلمة المرور القديمة",
                        isObscured: true,
                        validation: (value) {
                          if (value == null || value.isEmpty) {
                            return "برجاء إدخال كلمة المرور القديمة";
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 20),
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
                          : ElevatedButton(
                              onPressed: submitChangePassword,
                              child: const Text("تغيير كلمة المرور"),
                            ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

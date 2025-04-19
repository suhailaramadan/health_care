import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduation_project/core/resources/color_manager.dart';
import 'package:graduation_project/core/resources/font_manager.dart';
import 'package:graduation_project/core/resources/image_manager.dart';
import 'package:graduation_project/core/resources/styles_manager.dart';
import 'package:graduation_project/core/resources/value_manager.dart';
import 'package:graduation_project/core/routes/routes.dart';
import 'package:graduation_project/core/utils/ui_utils.dart';
import 'package:graduation_project/core/utils/validator.dart';
import 'package:graduation_project/core/widgets/custom_botton.dart';
import 'package:graduation_project/core/widgets/custom_dropdown.dart';
import 'package:graduation_project/core/widgets/custom_text_field.dart';
import 'package:graduation_project/core/widgets/wave_clipper.dart';
import 'package:graduation_project/features/auth/data/models/register/register_request.dart';
import 'package:graduation_project/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:graduation_project/features/auth/presentation/cubit/auth_states.dart';
import 'package:graduation_project/features/auth/presentation/screens/login_screen.dart';
import 'package:image_picker/image_picker.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});
  static const register = "/register";
  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _nationalIdController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  List<String> collageList = [
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
  File? _profileImage;
  String? _selectedCollege;
  Future<void> _pickImage() async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _profileImage = File(pickedFile.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.sizeOf(context);
    final bool isLargeTablet =
        screenSize.width > 600 && screenSize.width < screenSize.height;

    final bool isLandscape =
        screenSize.width > screenSize.height || isLargeTablet;

    return Container(
        color: ColorManager.white,
        child: Scaffold(
            backgroundColor: ColorManager.transparent,
            body: Form(
              key: _formKey,
              child: SingleChildScrollView(
                child: Stack(
                  children: [
                    ClipPath(
                        clipper: WaveClipper(),
                        child: Container(
                          height: isLargeTablet
                              ? screenSize.height * .35
                              : isLandscape
                                  ? screenSize.width * 0.23
                                  : screenSize.height * 0.27,
                          // height: screenSize.height * .27,
                          // height: 200,

                          decoration: const BoxDecoration(
                              gradient: LinearGradient(
                                  colors: [
                                Color.fromARGB(255, 4, 87, 169),
                                ColorManager.primary,
                                ColorManager.primaryColor,
                                ColorManager.blue
                              ],
                                  begin: Alignment.topLeft,
                                  end: Alignment.topRight)),
                        )),
                    Directionality(
                        textDirection: TextDirection.rtl,
                        child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 15),
                            child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SizedBox(
                                    // height: 40,
                                    height: isLargeTablet
                                        ? screenSize.height * .04
                                        : isLandscape
                                            ? screenSize.height * .04
                                            : screenSize.height * .05,
                                  ),
                                  Text(
                                    "إنشاء حساب",
                                    style: getBoldStyle(
                                        color: ColorManager.white,
                                        fontSize: isLandscape
                                            ? screenSize.height * .06
                                            : 20
                                        //  isLandscape:
                                        // ? 20.sp
                                        // : FontSize.s24.sp
                                        ),
                                  ),
                                  SizedBox(
                                    // height: 32,
                                    height: isLargeTablet
                                        ? screenSize.height * .05
                                        : isLandscape
                                            ? screenSize.width * .019
                                            : screenSize.height * .04,
                                  ),
                                  GestureDetector(
                                    onTap: _pickImage,
                                    child: CircleAvatar(
                                      backgroundColor: ColorManager.white,
                                      radius: isLargeTablet
                                          ? screenSize.height * .08
                                          : isLandscape
                                              ? screenSize.width * .07
                                              : screenSize.height * .073,
                                      // radius: 60,
                                      backgroundImage: _profileImage != null
                                          ? FileImage(_profileImage!)
                                          : const AssetImage(
                                                  ImageManager.profile)
                                              as ImageProvider,
                                      child: _profileImage == null
                                          ? Icon(Icons.camera_alt_outlined,
                                              size: screenSize.height * .035,
                                              color: ColorManager.white)
                                          : null,
                                    ),
                                  ),
                                  SizedBox(
                                    height: screenSize.height * .023,
                                  ),
                                  SizedBox(
                                    child: CustomTextField(
                                      prefixIcon: const Icon(
                                        Icons.person,
                                        color: ColorManager.primary,
                                      ),
                                      backgroundColor: ColorManager.white,
                                      hint: "الاسم الأول*",
                                      textInputType: TextInputType.name,
                                      validation: Validator.validateFullName,
                                      controller: _firstNameController,
                                    ),
                                  ),
                                  SizedBox(
                                    child: CustomTextField(
                                      prefixIcon: const Icon(
                                        Icons.person,
                                        color: ColorManager.primary,
                                      ),
                                      backgroundColor: ColorManager.white,
                                      hint: "الاسم الأخير*",
                                      textInputType: TextInputType.name,
                                      validation: Validator.validateFullName,
                                      controller: _lastNameController,
                                    ),
                                  ),
                                  CustomTextField(
                                    prefixIcon: const Icon(
                                      Icons.credit_card,
                                      color: ColorManager.primary,
                                    ),
                                    backgroundColor: ColorManager.white,
                                    hint: "الرقم القومي*",
                                    validation: Validator.validateNationalId,
                                    controller: _nationalIdController,
                                  ),
                                  CustomTextField(
                                    prefixIcon: const Icon(
                                      Icons.phone,
                                      color: ColorManager.primary,
                                    ),
                                    backgroundColor: ColorManager.white,
                                    hint: "رقم الهاتف*",
                                    validation: Validator.validatePhoneNumber,
                                    textInputType: TextInputType.phone,
                                    controller: _phoneController,
                                  ),
                                  CustomTextField(
                                    prefixIcon: const Icon(
                                      Icons.email,
                                      color: ColorManager.primary,
                                    ),
                                    backgroundColor: ColorManager.white,
                                    hint: "البريد الإلكتروني*",
                                    validation: Validator.validateEmail,
                                    textInputType: TextInputType.emailAddress,
                                    controller: _emailController,
                                  ),
                                  CustomTextField(
                                    prefixIcon: const Icon(
                                      Icons.lock,
                                      color: ColorManager.primary,
                                    ),
                                    backgroundColor: ColorManager.white,
                                    hint: "كلمة المرور*",
                                    validation: Validator.validatePassword,
                                    isObscured: true,
                                    controller: _passwordController,
                                  ),
                                  CustomTextField(
                                    prefixIcon: const Icon(
                                      Icons.lock,
                                      color: ColorManager.primary,
                                    ),
                                    backgroundColor: ColorManager.white,
                                    hint: "تأكيد كلمة المرور*",
                                    validation: (value) {
                                      if (value == null ||
                                          value.trim().length < 10) {
                                        return 'يرجى تأكيد كلمة المرور';
                                      } else if (value !=
                                          _passwordController.text) {
                                        return 'كلمة المرور غير متطابقة';
                                      }
                                      return null;
                                    },
                                    isObscured: true,
                                    controller: _confirmPasswordController,
                                  ),
                                  SizedBox(
                                    height: Sizes.s10.h,
                                  ),
                                  CustomDropDown(
                                    collageList: collageList,
                                    onChange: (value) {
                                      setState(() {
                                        _selectedCollege = value;
                                      });
                                    },
                                  ),
                                  SizedBox(
                                    height: Sizes.s12.h,
                                  ),
                                  Center(
                                    child: SizedBox(
                                      width: MediaQuery.sizeOf(context).width *
                                          .82,
                                      child:
                                          BlocListener<AuthCubit, AuthStates>(
                                        listener: (context, state) {
                                          if (state is RegisterLoading) {
                                            return UIUtils.showLoading(context);
                                          } else if (state is RegisterSuccess) {
                                            UIUtils.hideLoading(context);
                                            Navigator.of(context)
                                                .pushReplacementNamed(
                                                    Routes.login);
                                            UIUtils.showMessage(
                                                context,
                                                "تم إنشاء حساب بنجاح",
                                                ColorManager.green);
                                          } else if (state is RegisterError) {
                                            UIUtils.hideLoading(context);
                                            UIUtils.showMessage(
                                                context,
                                                state.message,
                                                ColorManager.red);
                                          }
                                        },
                                        child: CustomButton(
                                          label: 'إنشاء حساب',
                                          backgroundColor: ColorManager.primary,
                                          onTap: () {
                                            if (_formKey.currentState!
                                                .validate()) {
                                              BlocProvider.of<AuthCubit>(
                                                      context)
                                                  .register(RegisterRequest(
                                                collage: _selectedCollege!,
                                                firstName:
                                                    _firstNameController.text,
                                                lastName:
                                                    _lastNameController.text,
                                                nationalId: int.parse(
                                                    _nationalIdController.text),
                                                email: _emailController.text,
                                                imageUrl: _profileImage != null
                                                    ? _profileImage!.path
                                                    : ImageManager.profile,
                                                password:
                                                    _passwordController.text,
                                                confirmPassword:
                                                    _passwordController.text,
                                                phoneNumber: int.parse(
                                                    _phoneController.text),
                                              ));
                                            }
                                          },
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 8,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        'لديك حساب بالفعل؟',
                                        style: getSemiBoldStyle(
                                                color: ColorManager.primary)
                                            .copyWith(fontSize: FontSize.s16),
                                      ),
                                      SizedBox(
                                        width: Sizes.s8.w,
                                      ),
                                      InkWell(
                                        splashColor: ColorManager.blue,
                                        onTap: () {
                                          Navigator.of(context)
                                              .pushReplacementNamed(
                                            Routes.login,
                                          );
                                        },
                                        child: Text(
                                          'تسجيل دخول',
                                          style: getBoldStyle(
                                              color: ColorManager.textColor,
                                              fontSize: FontSize.s15),
                                          // Color.fromARGB(224, 17, 85, 105))
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 8,
                                  ),
                                ])))
                  ],
                ),
              ),
            )));
  }

  @override
  void dispose() {
    _firstNameController.dispose();
    _lastNameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _nationalIdController.dispose();
    _phoneController.dispose();
    super.dispose();
  }
}

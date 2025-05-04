// import 'dart:io';

// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:dio/dio.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:graduation_project/core/constants.dart';
// import 'package:graduation_project/core/resources/color_manager.dart';
// import 'package:graduation_project/core/utils/ui_utils.dart';
// import 'package:graduation_project/core/utils/validator.dart';
// import 'package:graduation_project/core/widgets/custom_dropdown.dart';
// import 'package:graduation_project/core/widgets/custom_text_field.dart';
// import 'package:graduation_project/features/profile/data/model/profile_response/Update_request.dart';
// import 'package:graduation_project/features/profile/presentation/cubit/profile_cubit.dart';
// import 'package:graduation_project/features/profile/presentation/cubit/profile_states.dart';
// import 'package:image_picker/image_picker.dart';

// class UpdateProfileScreen extends StatefulWidget {
//   static const update = '/update';
//   const UpdateProfileScreen({super.key});

//   @override
//   State<UpdateProfileScreen> createState() => _UpdateProfileScreenState();
// }

// class _UpdateProfileScreenState extends State<UpdateProfileScreen> {
//   final _formKey = GlobalKey<FormState>();
//   final firstNameController = TextEditingController();
//   final lastNameController = TextEditingController();
//   final emailController = TextEditingController();
//   final phoneController = TextEditingController();
//   final collegeController = TextEditingController();
//   final nationalIdController = TextEditingController();
//   XFile? pickedImage;

//   @override
//   void initState() {
//     super.initState();
//     final profile = context.read<ProfileCubit>().state;
//     if (profile is GetProfilesSuccess) {
//       final data = profile.profileEntity;
//       firstNameController.text = data.firstName ?? '';
//       lastNameController.text = data.lastName ?? '';
//       emailController.text = data.email ?? '';
//       phoneController.text = data.phoneNumber.toString();
//       collegeController.text = data.college ?? '';
//       nationalIdController.text = data.nationalId.toString();
//     }
//   }

//   List<String> collageList = [
//     "كلية  الزراعة",
//     "كلية الهندسة",
//     "كلية تربية",
//     "كلية الطب",
//     "كلية الآداب",
//     "كلية التربية الرياضية",
//     "كلية التربية النوعية",
//     "كلية التجارة",
//     "كلية الصيدلة",
//     "كلية الحقوق",
//     "كلية طب الأسنان",
//     "كلية التمريض",
//     "كلية الحاسبات والمعلومات",
//     "كلية الفنون التطبيقية",
//     "المعهد الفنى الصحى",
//   ];
//   String? _selectedCollege;
//   Future<void> _pickImage() async {
//     final picker = ImagePicker();
//     final picked = await picker.pickImage(source: ImageSource.gallery);
//     if (picked != null) {
//       setState(() => pickedImage = picked);
//     }
//   }

//   void _submitUpdate() {
//     if (!_formKey.currentState!.validate()) return;

//     final request = UpdateRequest(
//       firstName: firstNameController.text,
//       lastName: lastNameController.text,
//       collage: collegeController.text,
//       nationalId: int.parse(nationalIdController.text),
//       email: emailController.text,
//       phoneNumber: int.parse(phoneController.text),
//       imageUrl: pickedImage?.path ?? '',
//     );

//     context.read<ProfileCubit>().updatePatientProfile(request);
//   }

//   @override
//   Widget build(BuildContext context) {
//     final Size screenSize = MediaQuery.sizeOf(context);
//     final bool isLargeTablet =
//         screenSize.width > 600 && screenSize.width < screenSize.height;

//     final bool isLandscape =
//         screenSize.width > screenSize.height || isLargeTablet;

//     return Directionality(
//       textDirection: TextDirection.rtl,
//       child: Scaffold(
//         appBar: AppBar(title: const Text('تحديث البيانات')),
//         body: BlocConsumer<ProfileCubit, ProfileStates>(
//           listener: (context, state) {
//             if (state is GetUpdateProfilesSuccess) {
//               ScaffoldMessenger.of(context).showSnackBar(
//                 const SnackBar(content: Text('تم التحديث بنجاح')),
//               );
//               Navigator.pop(context);
//             } else if (state is GetUpdateProfilesError) {
//               print("state message ${state.message}");
//               ScaffoldMessenger.of(context).showSnackBar(
//                 SnackBar(content: Text(state.message)),
//               );
//             }
//           },
//           builder: (context, state) {
//             String? imageUrl;
//             if (state is GetProfilesSuccess) {
//               imageUrl = state.profileEntity.imageUrl;
//             }

//             return Padding(
//               padding: const EdgeInsets.all(16),
//               child: Form(
//                 key: _formKey,
//                 child: ListView(
//                   children: [
//                     // Center(
//                     //   child: GestureDetector(
//                     //     onTap: _pickImage,
//                     //     child: CircleAvatar(
//                     //       backgroundColor: ColorManager.white,
//                     //       radius: isLargeTablet
//                     //           ? screenSize.height * .08
//                     //           : isLandscape
//                     //               ? screenSize.width * .07
//                     //               : screenSize.height * .073,
//                     //       backgroundImage: pickedImage != null
//                     //           ? FileImage(File(pickedImage!.path))
//                     //           : (imageUrl != null && imageUrl.isNotEmpty
//                     //                   ? CachedNetworkImageProvider(
//                     //                       "${ApiConstants.imageBaseUrl}$imageUrl")
//                     //                   : const AssetImage(
//                     //                       "assets/images/profile.avif"))
//                     //               as ImageProvider,
//                     //       child: pickedImage == null &&
//                     //               (imageUrl == null || imageUrl.isEmpty)
//                     //           ? const Icon(Icons.camera_alt, size: 40)
//                     //           : null,
//                     //     ),
//                     //   ),
//                     // ),
//                     const SizedBox(height: 16),
//                     CustomTextField(
//                         controller: firstNameController,
//                         label: 'الاسم الأول',
//                         validation: Validator.validateFullName),
//                     CustomTextField(
//                       controller: lastNameController,
//                       label: 'الاسم الأخير',
//                       validation: Validator.validateFullName,
//                     ),
//                     CustomTextField(
//                       controller: emailController,
//                       label: 'الإيميل',
//                       validation: Validator.validateEmail,
//                     ),
//                     CustomTextField(
//                       controller: phoneController,
//                       label: 'رقم الهاتف',
//                       validation: Validator.validatePhoneNumber,
//                     ),
//                     CustomTextField(
//                       controller: nationalIdController,
//                       label: 'الرقم القومي',
//                       validation: Validator.validateNationalId,
//                     ),
//                     // CustomTextField(
//                     // controller: collegeController,
//                     // label: 'الكلية',
//                     //       validation: V,
//                     //     ),
//                     const SizedBox(height: 16),
//                     CustomDropDown(
//                       collageList: collageList,
//                       onChange: (value) {
//                         setState(() {
//                           _selectedCollege = value;
//                         });
//                       },
//                     ),
//                     const SizedBox(height: 16),
//                     ElevatedButton(
//                       onPressed: state is GetUpdateProfilesLoading
//                           ? null
//                           : _submitUpdate,
//                       child: state is GetUpdateProfilesLoading
//                           ? const CircularProgressIndicator()
//                           : const Text('تحديث'),
//                     ),
//                   ],
//                 ),
//               ),
//             );
//           },
//         ),
//       ),
//     );
//   }
// }

import 'dart:io';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/core/constants.dart';
import 'package:graduation_project/core/resources/color_manager.dart';
import 'package:graduation_project/core/resources/styles_manager.dart';
import 'package:graduation_project/core/utils/ui_utils.dart';
import 'package:graduation_project/core/utils/validator.dart';
import 'package:graduation_project/core/widgets/custom_botton.dart';
import 'package:graduation_project/core/widgets/custom_dropdown.dart';
import 'package:graduation_project/core/widgets/custom_text_field.dart';
import 'package:graduation_project/features/auth/data/models/register/register_request.dart';
import 'package:graduation_project/features/auth/domain/entity/user_entity.dart';
import 'package:graduation_project/features/profile/data/model/profile_response/Update_request.dart';
import 'package:graduation_project/features/profile/domain/entities/profile_entity.dart';
import 'package:graduation_project/features/profile/presentation/cubit/profile_cubit.dart';
import 'package:graduation_project/features/profile/presentation/cubit/profile_states.dart';
import 'package:image_picker/image_picker.dart';

class UpdateProfileScreen extends StatefulWidget {
  static const update = '/update';
  final ProfileEntity patient;

  const UpdateProfileScreen({super.key, required this.patient});

  @override
  State<UpdateProfileScreen> createState() => _UpdateProfileScreenState();
}

class _UpdateProfileScreenState extends State<UpdateProfileScreen> {
  final _formKey = GlobalKey<FormState>();
  final _imagePicker = ImagePicker();
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController nationalIdController = TextEditingController();
  String? selectedCollege;
  String? imagePath;
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
  ];
  bool get _hasChanges {
    return firstNameController.text != widget.patient.firstName ||
        lastNameController.text != widget.patient.lastName ||
        emailController.text != widget.patient.email ||
        nationalIdController.text != widget.patient.nationalId.toString() ||
        phoneController.text != widget.patient.phoneNumber.toString() ||
        selectedCollege != widget.patient.college ||
        imagePath != null;
  }

  @override
  void initState() {
    super.initState();

    firstNameController = TextEditingController(text: widget.patient.firstName);
    lastNameController = TextEditingController(text: widget.patient.lastName);

    emailController = TextEditingController(text: widget.patient.email);
    nationalIdController =
        TextEditingController(text: widget.patient.nationalId);
    phoneController = TextEditingController(text: widget.patient.phoneNumber);
    selectedCollege = widget.patient.college ?? '';
  }

  @override
  void dispose() {
    firstNameController.dispose();
    lastNameController.dispose();
    emailController.dispose();
    nationalIdController.dispose();
    phoneController.dispose();
    super.dispose();
  }

  Future<void> _pickImage() async {
    final picked = await _imagePicker.pickImage(source: ImageSource.gallery);
    if (picked != null) {
      setState(() => imagePath = picked.path);
    }
  }

  void onUpdatePressed() {
    if (_formKey.currentState!.validate()) {
      context.read<ProfileCubit>().updatePatientProfile(UpdateProfileRequest(
            firstName: firstNameController.text,
            lastName: lastNameController.text,
            email: emailController.text,
            phoneNumber: phoneController.text,
            nationalId: nationalIdController.text,
            college: selectedCollege,
            imageUrl: imagePath,
          ));
    }
  }

  void _updateProfile() {
    if (!_hasChanges) {
      UIUtils.showMessage(
        context,
        "لم يتم تعديل أي بيانات",
        ColorManager.red,
      );

      context.read<ProfileCubit>().getPatientProfile();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'تحديث الملف الشخصي',
            style: getSemiBoldStyle(color: ColorManager.textColor),
          ),
          centerTitle: true,
        ),
        body: BlocConsumer<ProfileCubit, ProfileStates>(
          listener: (context, state) {
            if (state is GetUpdateProfilesSuccess) {
              UIUtils.showMessage(
                  context, "تم تعديل البيانات بنجاح", Colors.green);
              context.read<ProfileCubit>().getPatientProfile();
              Navigator.pop(context);
            } else if (state is GetUpdateProfilesError) {
              UIUtils.showMessage(context, state.message, ColorManager.red);
            }
          },
          builder: (context, state) {
            return SingleChildScrollView(
              // padding: const EdgeInsets.all(16),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    Stack(
                      alignment: Alignment.bottomRight,
                      children: [
                        CircleAvatar(
                          radius: 60,
                          backgroundImage: imagePath != null
                              ? FileImage(File(imagePath!))
                              : (widget.patient.imageUrl != null
                                      ? CachedNetworkImageProvider(
                                          "${ApiConstants.imageBaseUrl}${widget.patient.imageUrl!}")
                                      : const AssetImage(
                                          "assets/images/default_profile.png"))
                                  as ImageProvider,
                        ),
                        IconButton(
                          onPressed: _pickImage,
                          icon: const Icon(
                            Icons.camera_alt,
                            color: Color.fromARGB(255, 21, 21, 21),
                            size: 26,
                          ),
                        )
                      ],
                    ),
                    const SizedBox(height: 45),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: CustomTextField(
                          validation: Validator.validateFullName,
                          controller: firstNameController,
                          label: "الاسم الأول"),
                    ),
                    const SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: CustomTextField(
                          validation: Validator.validateFullName,
                          controller: lastNameController,
                          label: "الاسم الأخير"),
                    ),
                    const SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: CustomTextField(
                          controller: emailController,
                          label: "البريد الإلكتروني",
                          validation: Validator.validateEmail,
                          textInputType: TextInputType.emailAddress),
                    ),
                    const SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: CustomTextField(
                          controller: nationalIdController,
                          validation: Validator.validateNationalId,
                          label: "الرقم القومي",
                          textInputType: TextInputType.number),
                    ),
                    const SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: CustomTextField(
                          controller: phoneController,
                          validation: Validator.validatePhoneNumber,
                          label: "رقم الهاتف",
                          textInputType: TextInputType.phone),
                    ),
                    const SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 15, vertical: 8),
                      child: CustomDropDown(
                          collageList: collageList,
                          initialValue: selectedCollege,
                          onChange: (value) => setState(() {
                                selectedCollege = value;
                              })),
                    ),
                    const SizedBox(height: 20),
                    state is GetUpdateProfilesLoading
                        ? const CircularProgressIndicator(
                            color: ColorManager.primary,
                          )
                        : Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 15),
                            child: CustomButton(
                                backgroundColor: ColorManager.primary,
                                label: "حفظ التعديلات",
                                onTap: onUpdatePressed
                                // _updateProfile,
                                ),
                          ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

import 'dart:io';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/core/constants.dart';
import 'package:graduation_project/core/resources/color_manager.dart';
import 'package:graduation_project/core/resources/styles_manager.dart';
import 'package:graduation_project/core/routes/routes.dart';
import 'package:graduation_project/core/widgets/custom_botton.dart';
import 'package:graduation_project/core/widgets/error_indicator.dart';
import 'package:graduation_project/core/widgets/loading_indicator.dart';
import 'package:graduation_project/features/profile/presentation/cubit/profile_cubit.dart';
import 'package:graduation_project/features/profile/presentation/cubit/profile_states.dart';
import 'package:image_picker/image_picker.dart';

class DoctorProfileScreen extends StatefulWidget {
  const DoctorProfileScreen({super.key});
  static const doctorProfile = "/doctorProfile";
  @override
  State<DoctorProfileScreen> createState() => _DoctorProfileScreenState();
}

class _DoctorProfileScreenState extends State<DoctorProfileScreen> {
  File? _profileImage;

  @override
  void initState() {
    super.initState();
    context.read<ProfileCubit>().getDoctorProfile();
  }

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.sizeOf(context);
    final bool isLargeTablet =
        screenSize.width > 600 && screenSize.width < screenSize.height;

    final bool isLandscape =
        screenSize.width > screenSize.height || isLargeTablet;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "الملف الشخصي",
          style: getSemiBoldStyle(color: ColorManager.textColor),
        ),
        centerTitle: true,
      ),
      body: BlocBuilder<ProfileCubit, ProfileStates>(
        builder: (context, state) {
          if (state is GetProfilesLoading) {
            return const Center(child: LoadingIndicator());
          } else if (state is GetProfilesError) {
            return const ErrorIndicator();
          } else if (state is GetProfileDoctorSuccess) {
            return SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: CircleAvatar(
                          backgroundColor: ColorManager.primary,
                          radius: isLargeTablet
                              ? screenSize.height * .08
                              : isLandscape
                                  ? screenSize.width * .07
                                  : screenSize.height * .073,
                          // radius: 60,
                          backgroundImage: _profileImage != null
                              ? FileImage(_profileImage!)
                              : (state.profileDoctorEntity.imageUrl != null &&
                                      state.profileDoctorEntity.imageUrl!
                                          .isNotEmpty)
                                  ? CachedNetworkImageProvider(
                                      "${ApiConstants.imageBaseUrl}${state.profileDoctorEntity.imageUrl}")
                                  : const AssetImage(
                                          "assets/images/doctor_image.jpg")
                                      as ImageProvider),
                    ),

                    const SizedBox(
                      height: 16,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "الإسم",
                          style: getMediumStyle(color: ColorManager.black),
                        ),
                        Text(
                          "${state.profileDoctorEntity.firstName} ${state.profileDoctorEntity.lastName}",
                          style: getRegularStyle(color: ColorManager.textColor),
                        ),
                      ],
                    ),
                    // Text("${state.profileEntity.lastName}"),
                    const SizedBox(
                      height: 30,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "البريد الإلكتروني",
                          style: getMediumStyle(color: ColorManager.black),
                        ),
                        Text(
                          "${state.profileDoctorEntity.email}",
                          style: getRegularStyle(color: ColorManager.textColor),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "رقم الهاتف",
                          style: getMediumStyle(color: ColorManager.black),
                        ),
                        Text(
                          "${state.profileDoctorEntity.phoneNumber}",
                          style: getRegularStyle(color: ColorManager.textColor),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 30,
                    ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "العيادة",
                          style: getMediumStyle(color: ColorManager.black),
                        ),
                        Text(
                          "${state.profileDoctorEntity.clinicName}",
                          style: getRegularStyle(color: ColorManager.textColor),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "التخصص",
                          style: getMediumStyle(color: ColorManager.black),
                        ),
                        Text(
                          "${state.profileDoctorEntity.specialty}",
                          style: getRegularStyle(color: ColorManager.textColor),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "الكلية",
                          style: getMediumStyle(color: ColorManager.black),
                        ),
                        Text(
                          "${state.profileDoctorEntity.college}",
                          style: getRegularStyle(color: ColorManager.textColor),
                        )
                      ],
                    ),
                    // Expanded(
                    //   child: Row(
                    //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //     children: [
                    //       Text(
                    //         "معلومات إضافية",
                    //         style: getMediumStyle(color: ColorManager.black),
                    //       ),
                    //       Text(
                    //         state.profileDoctorEntity.description ?? 'غير متوفر',
                    //         style: getRegularStyle(color: ColorManager.textColor),
                    //       ),
                    //     ],
                    //   ),
                    // ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Divider(
                      thickness: 1.5,
                      color: ColorManager.greyDark,
                    ),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "تعديل الحساب",
                            style:
                                getMediumStyle(color: ColorManager.textColor),
                          ),
                          IconButton(
                            onPressed: () {
                              Navigator.of(context).pushNamed(
                                  Routes.updateDoctorProfile,
                                  arguments: state.profileDoctorEntity);
                            },
                            icon: const Icon(
                              Icons.edit,
                              color: ColorManager.primary,
                            ),
                            iconSize: 25,
                          )
                        ]),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("تغيير كلمة المرور",
                            style:
                                getMediumStyle(color: ColorManager.textColor)),
                        IconButton(
                          onPressed: () {
                            Navigator.of(context)
                                .pushNamed(Routes.changePassword);
                          },
                          icon: const Icon(Icons.password_sharp),
                          color: ColorManager.primary,
                          iconSize: 25,
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(" تسجيل الخروج",
                            style:
                                getMediumStyle(color: ColorManager.textColor)),
                        IconButton(
                          onPressed: () {
                            Navigator.of(context).pushNamed(Routes.login);
                          },
                          icon: const Icon(Icons.logout_sharp),
                          color: ColorManager.red,
                          iconSize: 25,
                        )
                      ],
                    )
                    // CustomButton(
                    //   backgroundColor: ColorManager.primary,
                    //   label: "تعديل البيانات",
                    //   onTap: () {
                    //     Navigator.of(context).pushNamed(
                    //         Routes.updateDoctorProfile,
                    //         arguments: state.profileDoctorEntity);
                    //     // context.read<ProfileCubit>().getDoctorProfile();
                    //   },
                    // ),
                    // SizedBox(
                    //   height: 15,
                    // ),
                    // Row(
                    //   mainAxisAlignment: MainAxisAlignment.center,
                    //   children: [
                    //     Text(
                    //       "هل تريد تغيير كلمة مرورك؟",
                    //       style: getRegularStyle(color: ColorManager.primary),
                    //     ),
                    //     SizedBox(
                    //       width: 5,
                    //     ),
                    //     InkWell(
                    //       onTap: () {
                    //         Navigator.of(context)
                    //             .pushNamed(Routes.changePassword);
                    //       },
                    //       splashColor: ColorManager.blue,
                    //       child: Text(
                    //         "تغيير",
                    //         style: getSemiBoldStyle(color: ColorManager.primary),
                    //       ),
                    //     )
                    //   ],
                    // )
                  ],
                ),
              ),
            );
          } else {
            return Center(
              child: Text(
                "لا توجد بيانات متاحة ",
                style: getMediumStyle(color: ColorManager.red),
              ),
            );
          }
        },
      ),
    );
  }
}

import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/core/constants.dart';
import 'package:graduation_project/core/di/service_locator.dart';
import 'package:graduation_project/core/resources/color_manager.dart';
import 'package:graduation_project/core/resources/image_manager.dart';
import 'package:graduation_project/core/resources/styles_manager.dart';
import 'package:graduation_project/core/routes/routes.dart';
import 'package:graduation_project/core/widgets/custom_botton.dart';
import 'package:graduation_project/core/widgets/custom_dropdown.dart';
import 'package:graduation_project/core/widgets/custom_text_field.dart';
import 'package:graduation_project/core/widgets/error_indicator.dart';
import 'package:graduation_project/core/widgets/loading_indicator.dart';
import 'package:graduation_project/features/profile/presentation/cubit/profile_cubit.dart';
import 'package:graduation_project/features/profile/presentation/cubit/profile_states.dart';
import 'package:image_picker/image_picker.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});
  static const profile = "/profile";

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  // final TextEditingController _emailController = TextEditingController();
  // final TextEditingController _firstNameController = TextEditingController();
  // final TextEditingController _phoneController = TextEditingController();
  // final TextEditingController _lastNameController = TextEditingController();
  // final TextEditingController _nationalIdController = TextEditingController();
  // String? _selectedCollege;
  File? _profileImage;
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

    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
          appBar: AppBar(
            title: Text(
              "الملف الشخصي",
              style: getSemiBoldStyle(color: ColorManager.textColor),
            ),
            centerTitle: true,
            // backgroundColor: ColorManager.primary,
          ),
          body: BlocBuilder<ProfileCubit, ProfileStates>(
            builder: (context, state) {
              if (state is GetProfilesLoading) {
                return const LoadingIndicator();
              } else if (state is GetProfilesError) {
                return ErrorIndicator(message: state.message);
              } else if (state is GetProfilesSuccess) {
                return Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: CircleAvatar(
                          backgroundColor: ColorManager.white,
                          radius: isLargeTablet
                              ? screenSize.height * .08
                              : isLandscape
                                  ? screenSize.width * .07
                                  : screenSize.height * .073,
                          // radius: 60,
                          backgroundImage: state.profileEntity.imageUrl == null
                              ? FileImage(_profileImage!)
                              : (state.profileEntity.imageUrl != null &&
                                      state.profileEntity.imageUrl!.isNotEmpty)
                                  ? CachedNetworkImageProvider(
                                      "${ApiConstants.imageBaseUrl}${state.profileEntity.imageUrl}")
                                  : const AssetImage(
                                          "assets/images/profile.avif")
                                      as ImageProvider,
                          // child: _profileImage == null
                          //     ? Icon(Icons.camera_alt_outlined,
                          //         size: screenSize.height * .035,
                          //         color: ColorManager.white)
                          //     : null,
                        ),
                      ),
                      // CircleAvatar(
                      //     radius: 60,
                      //     backgroundImage: state.profileEntity.imageUrl !=
                      //                 null &&
                      //             state.profileEntity.imageUrl!.isNotEmpty
                      //         ? NetworkImage(
                      //             "${ApiConstants.imageBaseUrl}${state.profileEntity.imageUrl!}")
                      //         : const AssetImage(ImageManager.profile)
                      //             as ImageProvider),
                      const SizedBox(
                        height: 16,
                      ),
                      Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "الإسم",
                              style: getMediumStyle(color: ColorManager.black),
                            ),
                            Text(
                              "${state.profileEntity.firstName} ${state.profileEntity.lastName}",
                              style: getRegularStyle(
                                  color: ColorManager.textColor),
                            ),
                          ],
                        ),
                      ),
                      // Text("${state.profileEntity.lastName}"),
                      const SizedBox(
                        height: 12,
                      ),
                      Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "البريد الإلكتروني",
                              style: getMediumStyle(color: ColorManager.black),
                            ),
                            Text(
                              state.profileEntity.email ?? 'غير متوفر',
                              style: getRegularStyle(
                                  color: ColorManager.textColor),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "رقم الهاتف",
                              style: getMediumStyle(color: ColorManager.black),
                            ),
                            Text(
                              "${state.profileEntity.phoneNumber}",
                              style: getRegularStyle(
                                  color: ColorManager.textColor),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "الرقم القومي",
                              style: getMediumStyle(color: ColorManager.black),
                            ),
                            Text(
                              state.profileEntity.nationalId ?? 'غير متوفر',
                              style: getRegularStyle(
                                  color: ColorManager.textColor),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                          child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "الكلية",
                            style: getMediumStyle(color: ColorManager.black),
                          ),
                          Text(
                            "${state.profileEntity.college}",
                            style:
                                getRegularStyle(color: ColorManager.textColor),
                          )
                        ],
                      )),

                      const SizedBox(
                        height: 15,
                      ),
                      CustomButton(
                        backgroundColor: ColorManager.primary,
                        label: "تعديل البيانات",
                        onTap: () {
                          Navigator.of(context).pushNamed(Routes.updateprofile,
                              arguments: state.profileEntity);
                        },
                      )
                    ],
                  ),
                );
              } else {
                return const Center(
                  child: Text("لا توجد بيانات متاحة "),
                );
              }
            },
          )),
    );
  }
}

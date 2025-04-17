import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/core/constants.dart';
import 'package:graduation_project/core/di/service_locator.dart';
import 'package:graduation_project/core/resources/color_manager.dart';
import 'package:graduation_project/core/resources/image_manager.dart';
import 'package:graduation_project/core/resources/styles_manager.dart';
import 'package:graduation_project/core/routes/routes.dart';
import 'package:graduation_project/core/widgets/custom_botton.dart';
import 'package:graduation_project/core/widgets/error_indicator.dart';
import 'package:graduation_project/core/widgets/loading_indicator.dart';
import 'package:graduation_project/features/profile/presentation/cubit/profile_cubit.dart';
import 'package:graduation_project/features/profile/presentation/cubit/profile_states.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});
  static const profile = "/profile";

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
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
                return Center(
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      children: [
                        CircleAvatar(
                            radius: 80,
                            backgroundImage: state.profileEntity.imageUrl !=
                                        null &&
                                    state.profileEntity.imageUrl!.isNotEmpty
                                ? NetworkImage(
                                    "${ApiConstants.imageBaseUrl}${state.profileEntity.imageUrl!}")
                                : const AssetImage(ImageManager.profile)
                                    as ImageProvider),
                        const SizedBox(
                          height: 16,
                        ),
                        Text(
                          "${state.profileEntity.firstName ?? ''} ${state.profileEntity.lastName ?? ''}",
                          style: getMediumStyle(color: ColorManager.textColor),
                        ),
                        SizedBox(
                          height: 50,
                        ),
                        Text(
                          "البريد الإلكتروني : ${state.profileEntity.email ?? 'غير متوفر'}",
                          style: getMediumStyle(color: ColorManager.textColor),
                        ),
                        Text(
                          "الكلية :  ${state.profileEntity.college ?? 'غير متوفر'}",
                          style: getMediumStyle(color: ColorManager.textColor),
                        ),
                        Text(
                          "رقم الهاتف :  ${state.profileEntity.phoneNumber}",
                          style: getMediumStyle(color: ColorManager.textColor),
                        ),
                        Text(
                          "الرقم القومي :  ${state.profileEntity.nationalId ?? 'غير متوفر'}",
                          style: getMediumStyle(color: ColorManager.textColor),
                        ),
                      ],
                    ),
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

import 'dart:io';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduation_project/core/constants.dart';
import 'package:graduation_project/core/di/service_locator.dart';
import 'package:graduation_project/core/resources/color_manager.dart';
import 'package:graduation_project/core/resources/font_manager.dart';
import 'package:graduation_project/core/resources/image_manager.dart';
import 'package:graduation_project/core/resources/styles_manager.dart';
import 'package:graduation_project/core/resources/value_manager.dart';
import 'package:graduation_project/core/widgets/loading_indicator.dart';
import 'package:graduation_project/features/auth/data/data_sources/local/auth_local_data_source.dart';
import 'package:graduation_project/features/auth/data/data_sources/local/auth_shared_pref_local_data_source.dart';
import 'package:graduation_project/features/profile/domain/entities/profile_entity.dart';
import 'package:graduation_project/features/profile/presentation/cubit/profile_cubit.dart';
import 'package:graduation_project/features/profile/presentation/cubit/profile_states.dart';

class HomeScreenAppBar extends StatefulWidget {
// implements PreferredSizeWidget {
  final bool? automaticallyImplyLeading;
  const HomeScreenAppBar({
    super.key,
    this.automaticallyImplyLeading,
  });
  @override
  State<HomeScreenAppBar> createState() => _HomeScreenAppBarState();
}

class _HomeScreenAppBarState extends State<HomeScreenAppBar> {
  Widget _buildAppBarSkeleton() {
    return SafeArea(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Row(
          children: [
            const CircleAvatar(
              backgroundImage: AssetImage("assets/images/logo_app.jpg"),
              radius: 20,
              backgroundColor: ColorManager.transparent,
            ),
            const SizedBox(width: 10),
            Text(
              "طالب",
              style: getSemiBoldStyle(
                color: const Color.fromARGB(255, 65, 111, 156),
                fontSize: FontSize.s15.sp,
              ),
            ),
            const Spacer(),
            IconButton(
              onPressed: () {},
              icon: Badge.count(
                count: 0,
                child: const Icon(
                  Icons.notifications_none,
                  size: 30,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final double avatarRadius =
        (MediaQuery.of(context).size.shortestSide * 0.1).clamp(35.0, 60.0);
    return BlocBuilder<ProfileCubit, ProfileStates>(
      builder: (context, state) {
        if (state is GetProfilesLoading) {
          // return const LoadingIndicator();
          return _buildAppBarSkeleton();
        } else if (state is GetProfilesError) {
          // return Center(child: Text('حدث خطأ: //${state.message}'));
          return _buildAppBarSkeleton();
        } else if (state is GetProfilesSuccess) {
          return SafeArea(
              child: Directionality(
            textDirection: TextDirection.rtl,
            child: Container(
                padding: const EdgeInsets.only(top: 7, right: 8, left: 8),
                child:
                    //  AppBar(
                    //     backgroundColor: ColorManager.white,
                    //     elevation: 0,
                    //     surfaceTintColor: ColorManager.transparent,
                    //     automaticallyImplyLeading:
                    //         widget.automaticallyImplyLeading ?? false,
                    Row(children: [
                  CircleAvatar(
                      radius: 30,
                      backgroundColor: ColorManager.transparent,
                      backgroundImage: state.profileEntity.imageUrl != null &&
                              state.profileEntity.imageUrl!.isNotEmpty
                          ? NetworkImage(
                              "${ApiConstants.imageBaseUrl}${state.profileEntity.imageUrl}")
                          : const AssetImage("assets/images/logo_app.jpg")
                              as ImageProvider
                      // state.profileEntity.imageUrl != null &&
                      //         state.profileEntity.imageUrl!.isNotEmpty
                      //     ? CachedNetworkImageProvider(
                      //         state.profileEntity.imageUrl!)
                      //     : const AssetImage(ImageManager.profile)
                      //         as ImageProvider,
                      // child: CachedNetworkImage(imageUrl: "${widget.image}")
                      // child:
                      //  state.profileEntity.imageUrl == null
                      //     ? Image.asset("assets/images/doctor_image.png")
                      //

                      //   CachedNetworkImage(
                      // imageUrl:
                      //     "${ApiConstants.imageBaseUrl}${state.profileEntity.imageUrl}",

                      // state.profileEntity.imageUrl != null
                      //     ? FileImage(File(
                      //         "${ApiConstants.imageBaseUrl}${state.profileEntity.imageUrl}"))
                      //     : FileImage(File("assets/images/doctor_image.png"))
                      // : Image.asset('assets/images/doctor_image.png')

                      // backgroundColor: ColorManager.transparent,
                      // backgroundImage: AssetImage(widget.image)
                      // child: Image.asset("assets/images/doctor_image.jpg",
                      // fit: BoxFit.cover
                      // )
                      ),
                  // const SizedBox(
                  //   width: 10,
                  // ),
                  // // Directionality(
                  // //     textDirection: TextDirection.rtl,
                  // //     child: Row(
                  // //       children: ['

                  const SizedBox(
                    width: Sizes.s12,
                  ),
                  Text(
                    "${state.profileEntity.firstName ?? ''} ${state.profileEntity.lastName ?? ''}",
                    style: getSemiBoldStyle(
                        color: const Color.fromARGB(255, 65, 111, 156),
                        fontSize: FontSize.s15.sp),
                  ),
                  // const Icon(
                  //   Icons.waving_hand,
                  //   color: Colors.amber,
                  // ),
                  const Spacer(),

                  IconButton(
                      onPressed: () {},
                      icon: Badge.count(
                        count: 2,
                        child: const Icon(
                          Icons.notifications_none,
                          // color: ColorManager.white,
                          size: 30,
                        ),
                      )),
                  const SizedBox(
                    width: 10,
                  )
                  // ]
                  //   ],
                  // ))
                ])),
            // ),
            // ),
          ));
        }
        return const SizedBox();
      },
    );
  }
}

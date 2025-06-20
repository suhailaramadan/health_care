import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduation_project/core/di/service_locator.dart';
import 'package:graduation_project/core/resources/color_manager.dart';
import 'package:graduation_project/core/resources/styles_manager.dart';
import 'package:graduation_project/core/widgets/error_indicator.dart';
import 'package:graduation_project/core/widgets/loading_indicator.dart';
import 'package:graduation_project/features/user/clinic/domain/entities/clinic_entity.dart';
import 'package:graduation_project/features/user/clinic/presentation/cubit/clinic_cubit.dart';
import 'package:graduation_project/features/user/clinic/presentation/cubit/clinic_states.dart';
import 'package:graduation_project/features/user/clinic/presentation/cubit/search_cubit.dart';
import 'package:graduation_project/features/user/clinic/presentation/widget/custom_clinic_componant.dart';

class ClinicScreen extends StatefulWidget {
  const ClinicScreen({super.key});
  static const clinic = "/clinic";

  @override
  State<ClinicScreen> createState() => _ClinicScreenState();
}

class _ClinicScreenState extends State<ClinicScreen> {
  late final ClinicCubit _clinicCubit;
  late final SearchCubit _searchCubit;
  TextEditingController searchController = TextEditingController();
  @override
  void initState() {
    super.initState();
    _clinicCubit = serviceLocator.get<ClinicCubit>();
    _searchCubit = serviceLocator.get<SearchCubit>();
    _clinicCubit.getClinics();
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: ColorManager.white,
        appBar: AppBar(
          backgroundColor: ColorManager.white,
          // shape: const ContinuousRectangleBorder(
          //   borderRadius: BorderRadius.only(
          //     bottomRight: Radius.circular(34),
          //     bottomLeft: Radius.circular(35),
          //   ),
          // ),
          centerTitle: true,
          title: Text(
            "العيادات",
            style: getBoldStyle(color: ColorManager.textColor),
          ),
        ),
        body:
            // MultiBlocProvider(
            //   providers: [
            //     BlocProvider.value(value: _clinicCubit),
            //     BlocProvider.value(value: _searchCubit),
            //   ],
            // child:
            Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  height: 50,
                  child: TextField(
                    controller: searchController,
                    onChanged: (value) {
                      setState(() {});
                      if (value.isEmpty) {
                        _clinicCubit.getClinics();
                      } else {
                        _searchCubit.searchClinic(value);
                      }
                    },
                    onSubmitted: (value) {
                      if (value.isNotEmpty) {
                        _searchCubit.searchClinic(value);
                      }
                    },
                    cursorColor: ColorManager.primary,
                    decoration: InputDecoration(
                      hintText: "ابحث عن العيادة...",
                      hintStyle: getMediumStyle(color: ColorManager.grey),
                      prefixIcon: const Icon(
                        Icons.search,
                        color: Color.fromARGB(255, 139, 138, 138),
                      ),
                      suffixIcon: searchController.text.isNotEmpty
                          ? IconButton(
                              icon: const Icon(Icons.close),
                              onPressed: () {
                                setState(() {});
                                searchController.clear();
                                context
                                    .read<SearchCubit>()
                                    .clearSearchRewsults();

                                context.read<ClinicCubit>().getClinics();
                              },
                            )
                          : null,
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.r),
                        borderSide: const BorderSide(
                            color: ColorManager.primary, width: 1.5),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: const BorderSide(color: ColorManager.grey),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Expanded(
                  child: searchController.text.isNotEmpty
                      ? BlocBuilder<SearchCubit, ClinicState>(
                          builder: (context, state) {
                          // if (_searchCubit.isSearching) {
                          // print("${_searchCubit.isSearching}");
                          if (state is GetSearchLoading) {
                            return const Center(child: LoadingIndicator());
                          } else if (state is GetSearchError) {
                            return ErrorIndicator(message: state.message);
                          } else if (state is GetSearchSuccess) {
                            return _buildClinicList(state.searchEntity);
                          } else if (state is GetClinicsSuccess &&
                              state.clinicEntity.isEmpty) {
                            return const Center(
                              child: Text("لا توجد نتائج متطابقة"),
                            );
                          } else {
                            return const SizedBox();
                          }
                        })
                      :
                      // return
                      BlocBuilder<ClinicCubit, ClinicState>(
                          builder: (context, state) {
                            if (state is GetClinicsLoading) {
                              return const Center(child: LoadingIndicator());
                            } else if (state is GetClinicsError) {
                              return ErrorIndicator(message: state.message);
                            } else if (state is GetClinicsSuccess &&
                                state.clinicEntity.isNotEmpty) {
                              return _buildClinicList(state.clinicEntity);
                            } else if (state is GetClinicsSuccess &&
                                state.clinicEntity.isEmpty) {
                              return Center(
                                child: Text(
                                  "لا يوجد عيادات",
                                  style: getSemiBoldStyle(
                                      color: ColorManager.kuhly),
                                ),
                              );
                            } else {
                              return const SizedBox();
                            }
                          },
                        ))
              // },
              // ),
              // ),
            ],
          ),
        ),
        // ),
      ),
    );
  }

  Widget _buildClinicList(List<ClinicEntity> clinics) {
    if (clinics.isEmpty) {
      return Center(
          child: Text(
        "لا يوجد عيادات",
        style: getMediumStyle(color: ColorManager.kuhly),
      ));
    }
    return ListView.builder(
      itemCount: clinics.length,
      itemBuilder: (context, index) {
        return CustomClinicComponant(clinicEntity: clinics[index]);
      },
    );
  }

  @override
  void dispose() {
    super.dispose();
    searchController.clear();
    _searchCubit.clearSearchRewsults();
  }
}

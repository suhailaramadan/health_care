import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/core/constants.dart';
import 'package:graduation_project/core/resources/color_manager.dart';
import 'package:graduation_project/core/resources/styles_manager.dart';
import 'package:graduation_project/core/widgets/home_screen_app_bar.dart';
import 'package:graduation_project/core/widgets/loading_indicator.dart';
import 'package:graduation_project/features/doctors/data/model/doctor_dash_board_response.dart';
import 'package:graduation_project/features/doctors/presentation/cubit/doctor_dashboard_cubit.dart';
import 'package:graduation_project/features/doctors/presentation/cubit/doctor_dashboard_states.dart';
import 'package:flutter_charts/flutter_charts.dart';
import 'package:intl/intl.dart';
import 'dart:ui' as ui;

class DoctorsTabScreen extends StatefulWidget {
  static const doctorTab = "/doctorTab";
  const DoctorsTabScreen({super.key});

  @override
  State<DoctorsTabScreen> createState() => _DoctorsTabScreenState();
}

class _DoctorsTabScreenState extends State<DoctorsTabScreen> {
  @override
  void initState() {
    super.initState();
    context.read<DoctorDashboardCubit>().getDoctorDashboard();
  }

  Widget chartToRun(double totalAppointments, double totalBookings) {
    final total = totalAppointments + totalBookings;
    if (total == 0) {
      return Center(
        child: Text(
          "لا توجد بيانات كافية لعمل الإحصائيات",
          style: getMediumStyle(color: ColorManager.kuhly),
        ),
      );
    }
    final dataRows = [totalAppointments, totalBookings];
    final xLabels = ['المواعيد', 'الحجوزات'];

    LabelLayoutStrategy? xContainerLabelLayoutStrategy;
    ChartOptions chartOptions = const ChartOptions();
    final chartData = ChartData(
        dataRows: [dataRows],
        xUserLabels: xLabels,
        dataRowsLegends: const [''],
        chartOptions: chartOptions);

    var lineChartContainer = LineChartTopContainer(
      chartData: chartData,
      xContainerLabelLayoutStrategy: xContainerLabelLayoutStrategy,
    );

    var lineChart = LineChart(
      painter: LineChartPainter(
        lineChartContainer: lineChartContainer,
      ),
    );
    return lineChart;
  }

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.sizeOf(context);
    final bool isLandscape = screenSize.width > screenSize.height;
    final double appBarHeight =
        isLandscape ? screenSize.width * .13 : screenSize.height * 0.13;
    return Directionality(
      textDirection: ui.TextDirection.rtl,
      child: BlocBuilder<DoctorDashboardCubit, DoctorDashboardStates>(
        builder: (context, state) {
          if (state is DoctorDashboardLoading) {
            return const Center(child: LoadingIndicator());
          } else if (state is DoctorDashboardError) {
            return Center(child: Text(state.message));
          } else if (state is DoctorDashboardSuccess) {
            final data = state.response;

            return Scaffold(
              backgroundColor: ColorManager.white,
              appBar: AppBar(
                backgroundColor: Color.fromARGB(255, 65, 130, 195),
                toolbarHeight: 130,
                leadingWidth: double.infinity,

                shape: RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.only(bottomLeft: Radius.circular(200))),
                leading:
                    // Container(
                    //   height: 150,
                    //   // color: const Color.fromARGB(255, 11, 84, 158),

                    //   decoration: const BoxDecoration(
                    //       color: Color.fromARGB(255, 97, 129, 184),
                    //       borderRadius: BorderRadius.only(
                    //           bottomRight: Radius.circular(10),
                    //           bottomLeft: Radius.circular(120))),
                    //   padding: const EdgeInsets.all(8),
                    //   child:
                    Row(
                  children: [
                    SizedBox(
                      width: 8,
                    ),
                    if (data.profileImage != null)
                      Center(
                        child: Container(
                          decoration: BoxDecoration(
                              border: Border.all(
                                  width: .3, color: ColorManager.white),
                              borderRadius: BorderRadius.circular(40)),
                          child: CircleAvatar(
                            backgroundColor: ColorManager.white,
                            radius: 40,
                            backgroundImage: NetworkImage(
                                "${ApiConstants.imageBaseUrl}${data.profileImage!}"),
                          ),
                        ),
                      ),
                    const SizedBox(
                      width: 5,
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              data.doctorName ?? '',
                              style: getSemiBoldStyle(
                                  fontSize: 18, color: ColorManager.white),
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            Text(
                              overflow: TextOverflow.ellipsis,
                              maxLines: 2,
                              data.greeting ?? '',
                              style: getRegularStyle(
                                  // fontSize: 22,
                                  color: ColorManager.greyDark),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                // ),
              ),
              body: SingleChildScrollView(
                // padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildNextAppointmentBanner(data.nextAppointmentTime),

                    const SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text('الإحصائيات',
                          style: getBoldStyle(
                              fontSize: 18, color: ColorManager.textColor)),
                    ),

                    const SizedBox(height: 12),
                    GridView.count(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      crossAxisCount: 2,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                      childAspectRatio: 15 / 10,
                      children: [
                        _doctorDashboardCard(context,
                            title: "إجمالي المواعيد",
                            color: ColorManager.babyPink,
                            value: data.totalAppointments.toString(),
                            icon: Icons.calendar_today),
                        _doctorDashboardCard(context,
                            title: "إجمالى الحجوزات",
                            color: ColorManager.blue,
                            value: data.totalBookings.toString(),
                            icon: Icons.book_online),
                        _doctorDashboardCard(context,
                            title: "مواعيد اليوم",
                            color: ColorManager.babyGreen,
                            value: data.todayAppointmentsCount.toString(),
                            icon: Icons.today),
                        _doctorDashboardCard(context,
                            title: "الميعاد القادم",
                            color: ColorManager.babyRed,
                            value: data.nextAppointmentTime ?? 'لا يوجد',
                            icon: Icons.access_time)
                      ],
                    ),

                    /// Statistics Cards
                    // _buildStatCard(
                    //     'عدد مواعيد اليوم', data.todayAppointmentsCount),
                    // _buildStatCard('إجمالي المواعيد', data.totalAppointments),
                    // _buildStatCard('إجمالي الحجوزات', data.totalBookings),
                    // _buildStatCard(
                    //     'أقرب موعد قادم', data.nextAppointmentTime?.toString()),

                    const SizedBox(height: 32),

                    /// Charts
                    // Text('الإحصائيات',
                    //     style: getBoldStyle(
                    //         fontSize: 18, color: ColorManager.textColor)),
                    const SizedBox(height: 16),

                    _buildPieChart(
                      data.totalAppointments?.toDouble() ?? 0,
                      data.totalBookings?.toDouble() ?? 0,
                    ),
                    // chartToRun(data)
                  ],
                ),
              ),
            );
          }
          return const SizedBox.shrink();
        },
      ),
      // ),
    );
  }

  Widget _doctorDashboardCard(BuildContext context,
      {required String title,
      required String value,
      required IconData icon,
      required Color color}) {
    return Container(
      decoration: BoxDecoration(
          color: color,
          border: Border.all(width: .2, color: ColorManager.kuhly),
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
                color: ColorManager.grey.withOpacity(.2),
                blurRadius: 10,
                offset: const Offset(0, 5))
          ]),
      padding: const EdgeInsets.all(15),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            size: 30,
            color: ColorManager.primary,
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            value,
            style: getBoldStyle(color: ColorManager.textColor, fontSize: 16),
          ),
          const SizedBox(
            height: 3,
          ),
          Text(
            title,
            textAlign: TextAlign.center,
            style: getMediumStyle(color: ColorManager.textColor),
          ),
        ],
      ),
    );
  }

  Widget _buildNextAppointmentBanner(dynamic nextAppointment) {
    //  nextAppointment = nextAppointmentTime;
    if (nextAppointment == null || nextAppointment.toString().isEmpty) {
      return const SizedBox();
    }
    DateTime? dateTime;

    // try {
    dateTime = DateTime.parse(nextAppointment.toString());
    // } catch (e) {
    //   dateTime = null;
    // }
    final formattedDate = DateFormat("EEEE,d MMM yyyy", 'ar').format(dateTime);
    final formattedTime = DateFormat("hh:mm a", 'ar').format(dateTime);
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
          color: ColorManager.primary.withOpacity(.1),
          borderRadius: BorderRadius.circular(15),
          border: Border.all(color: ColorManager.primary)),
      child: Row(
        children: [
          const Icon(
            Icons.calendar_today,
            color: ColorManager.primary,
          ),
          const SizedBox(
            width: 10,
          ),
          Column(
            children: [
              Text(
                "موعدك القادم",
                style: getSemiBoldStyle(color: ColorManager.white),
              ),
              const SizedBox(
                height: 3,
              ),
              Text("$formattedDate- $formattedTime")
            ],
          )
        ],
      ),
    );
    // } catch (e) {
    //  return ;
    // }
  }

  Widget _buildStatCard(String title, dynamic value) {
    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: ListTile(
        title: Text(title, style: getMediumStyle(color: ColorManager.primary)),
        trailing: Text(
          value?.toString() ?? '—',
          style: getBoldStyle(color: ColorManager.textColor),
        ),
      ),
    );
  }

  Widget _buildPieChart(
    double appointmentsRatio,
    double bookingsRatio,
  ) {
    // DoctorDashBoardResponse dashboard = DoctorDashBoardResponse();
    // final total = dashboard.totalAppointments??0 + dashboard.totalAppointments??0;
    // final total = appointmentsRatio + bookingsRatio;

    // if (total == 0.0) {
    //   return Center(
    //       child: Text(
    //     "لا توجد بيانات كافية لعمل الإحصائيات",
    //     style: getMediumStyle(color: ColorManager.kuhly),
    //   ));
    // }
    // total = appointmentsRatio + bookingsRatio;
    // print(total);
    // appointmentsRatio = (dashboard.totalAppointments ?? 0) / total * 100;
    // bookingsRatio = (dashboard.totalBookings ?? 0) / total * 100;
    // total = appointmentsRatio + bookingsRatio;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
          decoration: BoxDecoration(
              border: Border.all(width: .2, color: ColorManager.primary),
              borderRadius: BorderRadius.circular(12)),
          height: 200,
          width: double.infinity,
          child: chartToRun(appointmentsRatio, bookingsRatio)
          //  PieChart(
          //   PieChartData(
          //     sectionsSpace: 4,
          //     centerSpaceRadius: 40,
          //     sections: [
          //       PieChartSectionData(
          //         value: appointmentsRatio,
          //         color: Colors.blue,
          //         title: 'مواعيد\n${appointmentsRatio.toStringAsFixed(1)}%',
          //         titleStyle: getRegularStyle(color: Colors.white),
          //         radius: 50,
          //       ),
          //       PieChartSectionData(
          //         value: bookingsRatio,
          //         color: Colors.green,
          //         title: 'حجوزات\n${bookingsRatio.toStringAsFixed(1)}%',
          //         titleStyle: getRegularStyle(color: Colors.white),
          //         radius: 50,
          //       ),
          //     ],
          //   ),
          // ),
          ),
    );
    // }
    //  Scaffold(
    //     // backgroundColor: Colors.amber,
    //     appBar: AppBar(
    //   automaticallyImplyLeading: false,
    //   // backgroundColor: ColorManager.white,
    // ) //     body: BlocBuilder<DoctorDashboardCubit, DoctorDashboardStates>(
    // //       builder: (context, state) {
    //         if (state is DoctorDashboardLoading) {
    //           return const Center(
    //             child: LoadingIndicator(),
    //           );
    //         } else if (state is DoctorDashboardError) {
    //           return Center(
    //             child: Text(state.message),
    //           );
    //         } else if (state is DoctorDashboardSuccess) {
    //           final data = state.response;
    //           return SingleChildScrollView(
    //             child: RefreshIndicator(
    //               onRefresh: () async {
    //                 context.read<DoctorDashboardCubit>().getDoctorDashboard();
    //               },
    //               child: Padding(
    //                 padding: const EdgeInsets.only(right: 5, left: 5),
    //                 child: Column(
    //                   children: [
    //                     Container(
    //                       decoration: BoxDecoration(
    //                           borderRadius: BorderRadius.circular(70),
    //                           border: Border.all(
    //                               width: .5, color: ColorManager.primary)),
    //                       child: CircleAvatar(
    //                         radius: 70,
    //                         backgroundColor: ColorManager.white,
    //                         backgroundImage: NetworkImage(
    //                             "${ApiConstants.imageBaseUrl}${data.profileImage}"),
    //                       ),
    //                     ),
    //                     const SizedBox(
    //                       height: 16,
    //                     ),
    //                     Text(
    //                       data.doctorName ?? '',
    //                       style: getSemiBoldStyle(color: ColorManager.textColor),
    //                     ),
    //                     const SizedBox(
    //                       height: 10,
    //                     ),
    //                     Text(
    //                       data.greeting ?? '',
    //                       textAlign: TextAlign.center,
    //                       style: getSemiBoldStyle(color: ColorManager.textColor),
    //                     ),
    //                     const SizedBox(
    //                       height: 20,
    //                     ),
    //                     GridView.count(
    //                       padding: const EdgeInsets.all(8),
    //                       crossAxisCount: 2,
    //                       shrinkWrap: true,
    //                       physics: const NeverScrollableScrollPhysics(),
    //                       crossAxisSpacing: 16,
    //                       mainAxisSpacing: 16,
    //                       children: [
    //                         _doctorDashboardCard(context,
    //                             title: "إجمالي المواعيد",
    //                             color: ColorManager.babyGreen,
    //                             value: data.totalAppointments.toString(),
    //                             icon: Icons.calendar_today),
    //                         _doctorDashboardCard(context,
    //                             title: "إجمالى الحجوزات",
    //                             color: ColorManager.blue,
    //                             value: data.totalBookings.toString(),
    //                             icon: Icons.book_online),
    //                         _doctorDashboardCard(context,
    //                             title: "مواعيد اليوم",
    //                             color: ColorManager.babyRed,
    //                             value: data.todayAppointmentsCount.toString(),
    //                             icon: Icons.today),
    //                         _doctorDashboardCard(context,
    //                             title: "الميعاد القادم",
    //                             color: ColorManager.babyPink,
    //                             value: data.nextAppointmentTime ?? 'لا يوجد',
    //                             icon: Icons.access_time)
    //                       ],
    //                     ),
    //                     const SizedBox(
    //                       height: 30,
    //                     ),
    //                   ],
    //                 ),
    //               ),
    //             ),
    //           );
    //         }
    //         return const SizedBox();
    //       },
    //     ),
    //   );
  }

  // Widget _doctorDashboardCard(BuildContext context,
  //     {required String title,
  //     required String value,
  //     required IconData icon,
  //     required Color color}) {
  //   return Container(
  //     decoration: BoxDecoration(
  //         color: color,
  //         border: Border.all(width: .2, color: ColorManager.kuhly),
  //         borderRadius: BorderRadius.circular(16),
  //         boxShadow: [
  //           BoxShadow(
  //               color: ColorManager.grey.withOpacity(.2),
  //               blurRadius: 10,
  //               offset: const Offset(0, 5))
  //         ]),
  //     padding: const EdgeInsets.all(15),
  //     child: Column(
  //       mainAxisAlignment: MainAxisAlignment.center,
  //       children: [
  //         Icon(
  //           icon,
  //           size: 30,
  //           color: ColorManager.primary,
  //         ),
  //         const SizedBox(
  //           height: 8,
  //         ),
  //         Text(
  //           value,
  //           style: getSemiBoldStyle(color: ColorManager.textColor),
  //         ),
  //         const SizedBox(
  //           height: 8,
  //         ),
  //         Text(
  //           title,
  //           textAlign: TextAlign.center,
  //           style: getSemiBoldStyle(color: ColorManager.textColor),
  //         ),
  //       ],
  //     ),
  //   );
  // }
}

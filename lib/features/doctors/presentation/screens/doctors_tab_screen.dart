import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_charts/flutter_charts.dart';
import 'package:graduation_project/core/constants.dart';
import 'package:graduation_project/core/resources/color_manager.dart';
import 'package:graduation_project/core/resources/styles_manager.dart';
import 'package:graduation_project/core/widgets/home_screen_app_bar.dart';
import 'package:graduation_project/core/widgets/loading_indicator.dart';
import 'package:graduation_project/features/doctors/data/model/doctor_dash_board_response.dart';
import 'package:graduation_project/features/doctors/presentation/cubit/doctor_dashboard_cubit.dart';
import 'package:graduation_project/features/doctors/presentation/cubit/doctor_dashboard_states.dart';
import 'package:intl/intl.dart';
import 'dart:ui' as ui;

import 'package:syncfusion_flutter_charts/charts.dart';

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
// // return
    LabelLayoutStrategy? xContainerLabelLayoutStrategy;
    ChartOptions chartOptions = ChartOptions();
//     final chartData = ChartData(
//         dataRows: [dataRows],
//         xUserLabels: xLabels,
//         dataRowsLegends: const [''],
//         chartOptions: chartOptions,
//         dataRowsColors:
// //         );
    final chartData = ChartData(
      dataRows: [dataRows],
      xUserLabels: xLabels,
      dataRowsLegends: const [''],
      // lineColors: const [ColorManager.primary],
      chartOptions: chartOptions,
    );
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
                backgroundColor: const Color.fromARGB(255, 65, 130, 195),
                toolbarHeight: 130,
                leadingWidth: double.infinity,

                shape: const RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.only(bottomLeft: Radius.circular(120))),
                leading: Row(
                  children: [
                    const SizedBox(
                      width: 5,
                    ),
                    if (data.profileImage != null)
                      Center(
                        child: Container(
                          decoration: BoxDecoration(
                              border: Border.all(
                                  width: .3, color: ColorManager.white),
                              borderRadius: BorderRadius.circular(45)),
                          child: CircleAvatar(
                            backgroundColor: ColorManager.white,
                            radius: 45,
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
                              "د. ${data.doctorName ?? ''}",
                              overflow: TextOverflow.visible,
                              softWrap: true,
                              style: getSemiBoldStyle(
                                  fontSize: 18, color: ColorManager.white),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Expanded(
                              child: Text(
                                overflow: TextOverflow.visible,
                                softWrap: true,
                                data.greeting ?? '',
                                style: getRegularStyle(
                                    // fontSize: 22,
                                    color: ColorManager.greyDark),
                              ),
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
                      child: Row(
                        children: [
                          const Icon(Icons.stacked_line_chart_sharp),
                          Text('الإحصائيات',
                              style: getBoldStyle(
                                  fontSize: 18, color: ColorManager.textColor)),
                        ],
                      ),
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
                            color: ColorManager.white,
                            value: data.totalAppointments.toString(),
                            icon: Icons.calendar_today),
                        _doctorDashboardCard(context,
                            title: "إجمالى الحجوزات",
                            color: ColorManager.white,
                            value: data.totalBookings.toString(),
                            icon: Icons.book_online),
                        _doctorDashboardCard(context,
                            title: "مواعيد اليوم",
                            color: ColorManager.white,
                            value: data.todayAppointmentsCount.toString(),
                            icon: Icons.today),
                        _doctorDashboardCard(context,
                            title: "الميعاد القادم",
                            color: ColorManager.white,
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
    return Card(
      color: color,
      // decoration: BoxDecoration(
      //     color: color,
      //     border: Border.all(width: .2, color: ColorManager.kuhly),
      //     borderRadius: BorderRadius.circular(16),
      //     boxShadow: [
      //       BoxShadow(
      //           color: ColorManager.grey.withOpacity(.2),
      //           blurRadius: 10,
      //           offset: const Offset(0, 5))
      //     ]),
      // padding: const EdgeInsets.all(15),
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
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
          decoration: BoxDecoration(
              border: Border.all(width: .2, color: ColorManager.primary),
              borderRadius: BorderRadius.circular(12)),
          height: 200,
          width: double.infinity,
          child: chartToRun(appointmentsRatio, bookingsRatio)),
    );
  }
}

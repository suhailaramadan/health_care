import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/core/constants.dart';
import 'package:graduation_project/core/widgets/error_indicator.dart';
import 'package:graduation_project/core/widgets/loading_indicator.dart';
import 'package:graduation_project/features/user/clinic/data/data_sources/remote/clinic_api_remote_data_source.dart';
import 'package:graduation_project/features/user/clinic/presentation/cubit/clinic_cubit.dart';
import 'package:graduation_project/features/user/clinic/presentation/cubit/clinic_states.dart';
import 'package:graduation_project/features/user/clinic/presentation/cubit/search_cubit.dart';

class SearchScreen extends SearchDelegate {
  ClinicCubit clinicCubit;
  SearchScreen({required this.clinicCubit});
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
          onPressed: () {
            query = '';
            // showSearch(context: context, delegate: SearchScreen());
          },
          icon: const Icon(Icons.clear))
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () => Navigator.of(context).pop(),
        icon: const Icon(Icons.arrow_back));
  }

  @override
  Widget buildResults(BuildContext context) {
    return Container();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    if (query.isEmpty) {
      return const Center(
        child: Text("اكتب اسم العيادة"),
      );
    }
    Future.microtask(() {
      //  if(! context.read<ClinicCubit>().)
      context.read<SearchCubit>().searchClinic(query);
    });
    return BlocBuilder<SearchCubit, ClinicState>(
      builder: (context, state) {
        if (state is GetSearchLoading) {
          return const Center(child: LoadingIndicator());
        } else if (state is GetSearchError) {
          return const ErrorIndicator();
        } else if (state is GetSearchSuccess) {
          final clinics = state.searchEntity;
          if (clinics.isEmpty) {
            return const Center(
              child: Text("لا يوجد نتائج"),
            );
          }
          return ListView.builder(
            itemCount: clinics.length,
            itemBuilder: (context, index) {
              final clinic = clinics[index];
              return ListTile(
                onTap: () {
                  close(context, clinic.name);
                  context.read<ClinicCubit>().getClinics();
                },
                title: Text(clinic.name),
                leading: Image.network(
                    '${ApiConstants.imageBaseUrl}${clinic.imageUrl}'),
              );
            },
          );
        }
        return const SizedBox();
      },
    );
  }

  void close(BuildContext context, result) {
    super.close(context, result);
    context.read<ClinicCubit>().getClinics();
  }
}

// import 'package:flutter/material.dart';

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
//   final phoneNumber
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         centerTitle: true,
//         title: Text('تعديل البيانات'),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/features/profile/data/model/profile_response/Update_request.dart';
import 'package:graduation_project/features/profile/presentation/cubit/profile_cubit.dart';
import 'package:graduation_project/features/profile/presentation/cubit/profile_states.dart';
import 'package:image_picker/image_picker.dart';

class UpdateProfileScreen extends StatefulWidget {
  static const update = '/update';
  const UpdateProfileScreen({super.key});

  @override
  State<UpdateProfileScreen> createState() => _UpdateProfileScreenState();
}

class _UpdateProfileScreenState extends State<UpdateProfileScreen> {
  final _formKey = GlobalKey<FormState>();
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final collegeController = TextEditingController();
  final nationalIdController = TextEditingController();
  XFile? pickedImage;

  @override
  void initState() {
    final profile = context.read<ProfileCubit>().state;
    if (profile is GetProfilesSuccess) {
      final data = profile.profileEntity;
      firstNameController.text = data.firstName ?? '';
      lastNameController.text = data.lastName ?? '';
      emailController.text = data.email ?? '';
      phoneController.text = data.phoneNumber.toString();
      collegeController.text = data.college ?? '';
      nationalIdController.text = data.nationalId.toString();
    }
    super.initState();
  }

  Future<void> _pickImage() async {
    final picker = ImagePicker();
    final picked = await picker.pickImage(source: ImageSource.gallery);
    if (picked != null) {
      setState(() => pickedImage = picked);
    }
  }

  void _submitUpdate() {
    if (!_formKey.currentState!.validate()) return;
    if (pickedImage == null) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text('من فضلك اختر صورة شخصية'),
      ));
      return;
    }

    final request = UpdateRequest(
      firstName: firstNameController.text,
      lastName: lastNameController.text,
      collage: collegeController.text,
      nationalId: int.parse(nationalIdController.text),
      email: emailController.text,
      phoneNumber: int.parse(phoneController.text),
      imageUrl: pickedImage!.path,
    );

    context.read<ProfileCubit>().updatePatientProfile(request);
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(title: const Text('تحديث البيانات')),
        body: BlocConsumer<ProfileCubit, ProfileStates>(
          listener: (context, state) {
            if (state is GetUpdateProfilesSuccess) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('تم التحديث بنجاح')),
              );
              Navigator.pop(context);
            } else if (state is GetUpdateProfilesError) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(state.message)),
              );
            }
          },
          builder: (context, state) {
            return Padding(
              padding: const EdgeInsets.all(16),
              child: Form(
                key: _formKey,
                child: ListView(
                  children: [
                    TextFormField(
                      controller: firstNameController,
                      decoration:
                          const InputDecoration(labelText: 'الاسم الأول'),
                      validator: (value) => value!.isEmpty ? 'مطلوب' : null,
                    ),
                    TextFormField(
                      controller: lastNameController,
                      decoration:
                          const InputDecoration(labelText: 'الاسم الأخير'),
                      validator: (value) => value!.isEmpty ? 'مطلوب' : null,
                    ),
                    TextFormField(
                      controller: emailController,
                      decoration: const InputDecoration(labelText: 'الإيميل'),
                      validator: (value) => value!.isEmpty ? 'مطلوب' : null,
                    ),
                    TextFormField(
                      controller: phoneController,
                      decoration:
                          const InputDecoration(labelText: 'رقم الهاتف'),
                      validator: (value) => value!.isEmpty ? 'مطلوب' : null,
                    ),
                    TextFormField(
                      controller: collegeController,
                      decoration: const InputDecoration(labelText: 'الكلية'),
                      validator: (value) => value!.isEmpty ? 'مطلوب' : null,
                    ),
                    TextFormField(
                      controller: nationalIdController,
                      decoration:
                          const InputDecoration(labelText: 'الرقم القومي'),
                      validator: (value) => value!.isEmpty ? 'مطلوب' : null,
                    ),
                    const SizedBox(height: 16),
                    ElevatedButton(
                      onPressed: _pickImage,
                      child: const Text('اختر صورة'),
                    ),
                    const SizedBox(height: 16),
                    ElevatedButton(
                      onPressed: state is GetUpdateProfilesLoading
                          ? null
                          : _submitUpdate,
                      child: state is GetUpdateProfilesLoading
                          ? const CircularProgressIndicator()
                          : const Text('تحديث'),
                    )
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

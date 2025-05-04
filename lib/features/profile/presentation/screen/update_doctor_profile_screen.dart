import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/core/constants.dart';
import 'package:graduation_project/core/resources/color_manager.dart';
import 'package:graduation_project/core/resources/image_manager.dart';
import 'package:graduation_project/core/resources/styles_manager.dart';
import 'package:graduation_project/core/utils/ui_utils.dart';
import 'package:graduation_project/core/utils/validator.dart';
import 'package:graduation_project/core/widgets/custom_botton.dart';
import 'package:graduation_project/core/widgets/custom_dropdown.dart';
import 'package:graduation_project/core/widgets/custom_text_field.dart';
import 'package:graduation_project/core/widgets/loading_indicator.dart';
import 'package:graduation_project/features/profile/data/model/profile_doctor_response/update_doctor_profile_request.dart';
import 'package:graduation_project/features/profile/domain/entities/profile_doctor_entity.dart';
import 'package:graduation_project/features/profile/presentation/cubit/profile_cubit.dart';
import 'package:graduation_project/features/profile/presentation/cubit/profile_states.dart';
import 'package:image_picker/image_picker.dart';

class UpdateDoctorProfileScreen extends StatefulWidget {
  static const updateDoctorProfile = "/updateDoctor";
  final ProfileDoctorEntity profileDoctorEntity;
  const UpdateDoctorProfileScreen({Key? key, required this.profileDoctorEntity})
      : super(key: key);

  @override
  State<UpdateDoctorProfileScreen> createState() =>
      _UpdateDoctorProfileScreenState();
}

class _UpdateDoctorProfileScreenState extends State<UpdateDoctorProfileScreen> {
  final _formKey = GlobalKey<FormState>();

  TextEditingController _firstNameController = TextEditingController();
  TextEditingController _lastNameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _phoneController = TextEditingController();
  TextEditingController _nationalIdController = TextEditingController();
  TextEditingController _specialtyController = TextEditingController();
  TextEditingController _descriptionController = TextEditingController();
  TextEditingController _clinicNameController = TextEditingController();

  String? _selectedCollege;

  List<String> collegeName = [
    "جامعة القاهرة",
    "جامعة عين شمس",
    "جامعة الإسكندرية",
    "جامعة حلوان",
    "جامعة طنطا",
    "جامعة المنصورة",
    "جامعة الزقازيق",
    "جامعة أسيوط",
    "جامعة المنيا",
    "جامعة بنى سويف",
    "جامعة الفيوم",
    "جامعة سوهاج",
    "جامعة جنوب الوادى",
    "جامعة كفرالشيخ",
    "جامعة بنها",
    "جامعة دمنهور",
    "جامعة الوادي الجديد",
    "جامعة بورسعيد",
    "جامعة السويس",
    "جامعة قناة السويس",
    "جامعة مطروح",
    "جامعة دمياط",
    "جامعة أسوان",
    "جامعة العريش",
    "جامعة مدينة السادات",
    "جامعة الأزهر"
  ];
  @override
  void initState() {
    super.initState();

    _firstNameController =
        TextEditingController(text: widget.profileDoctorEntity.firstName);
    _lastNameController =
        TextEditingController(text: widget.profileDoctorEntity.lastName);
    _clinicNameController =
        TextEditingController(text: widget.profileDoctorEntity.clinicName);
    _emailController =
        TextEditingController(text: widget.profileDoctorEntity.email);
    _nationalIdController =
        TextEditingController(text: widget.profileDoctorEntity.nationalId);
    _phoneController =
        TextEditingController(text: widget.profileDoctorEntity.phoneNumber);
    _descriptionController =
        TextEditingController(text: widget.profileDoctorEntity.description);
    _specialtyController =
        TextEditingController(text: widget.profileDoctorEntity.specialty);
    _selectedCollege = widget.profileDoctorEntity.college ?? '';
  }

  final _imagePicker = ImagePicker();
  String? imagePath;
  Future<void> _pickImage() async {
    final picked = await _imagePicker.pickImage(source: ImageSource.gallery);
    if (picked != null) {
      setState(() => imagePath = picked.path);
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
                context.read<ProfileCubit>().getDoctorProfile();
                Navigator.pop(context);
              } else if (state is GetUpdateProfilesError) {
                UIUtils.showMessage(context, state.message, ColorManager.red);
              }
            }, builder: (context, state) {
              return Padding(
                padding: const EdgeInsets.all(16.0),
                child: Form(
                    key: _formKey,
                    child: ListView(
                      children: [
                        Center(
                          child: Stack(
                            alignment: Alignment.bottomRight,
                            children: [
                              CircleAvatar(
                                radius: 60,
                                backgroundImage: imagePath != null
                                    ? FileImage(File(imagePath!))
                                    : (widget.profileDoctorEntity.imageUrl !=
                                                null
                                            ? CachedNetworkImageProvider(
                                                "${ApiConstants.imageBaseUrl}${widget.profileDoctorEntity.imageUrl!}")
                                            : const AssetImage(
                                                "assets/images/photo_2024-12-24_06-14-01.jpg"))
                                        as ImageProvider,
                              ),
                              IconButton(
                                onPressed: _pickImage,
                                icon: const Icon(Icons.camera_alt,
                                    size: 26,
                                    color: Color.fromARGB(255, 21, 21, 21)),
                              )
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 45,
                        ),
                        CustomTextField(
                            controller: _firstNameController,
                            validation: Validator.validateFullName,
                            textInputType: TextInputType.name,
                            label: 'الاسم الأول',
                            labelTextStyle:
                                getMediumStyle(color: ColorManager.black)),
                        const SizedBox(height: 10),
                        CustomTextField(
                          controller: _lastNameController,
                          validation: Validator.validateFullName,
                          textInputType: TextInputType.name,
                          label: "الاسم الأخير",
                        ),
                        const SizedBox(height: 10),
                        CustomTextField(
                          controller: _emailController,
                          validation: Validator.validateEmail,
                          label: 'البريد الإلكتروني',
                          textInputType: TextInputType.emailAddress,
                        ),
                        const SizedBox(height: 10),
                        CustomTextField(
                          controller: _phoneController,
                          validation: Validator.validatePhoneNumber,
                          label: 'رقم الهاتف',
                          textInputType: TextInputType.phone,
                        ),
                        const SizedBox(height: 10),
                        CustomTextField(
                            controller: _nationalIdController,
                            validation: Validator.validateNationalId,
                            label: "الرقم القومي",
                            textInputType: TextInputType.number),
                        const SizedBox(height: 10),
                        CustomTextField(
                            controller: _specialtyController, label: 'التخصص'),
                        const SizedBox(height: 10),
                        CustomTextField(
                          controller: _descriptionController,
                          label: 'الوصف',
                          maxLines: 5,
                        ),
                        const SizedBox(height: 10),
                        // DropdownButtonFormField<String>(
                        //   decoration:
                        //       const InputDecoration(labelText: 'الكلية'),
                        //   value: _selectedCollege!.isNotEmpty
                        //       ? _selectedCollege
                        //       : null,
                        //   items: collegeName
                        //       .map((college) => DropdownMenuItem(
                        //             value: college,
                        //             child: Text(college),
                        //           ))
                        //       .toList(),
                        //   onChanged: (value) =>
                        //       setState(() => _selectedCollege = value),
                        // ),
                        CustomDropDown(
                            collageList: collegeName,
                            initialValue: _selectedCollege,
                            onChange: (value) => setState(() {
                                  _selectedCollege = value;
                                })),
                        const SizedBox(height: 10),
                        CustomTextField(
                            controller: _clinicNameController,
                            label: 'اسم العيادة'),

                        const SizedBox(height: 20),

                        CustomButton(
                          backgroundColor: ColorManager.primary,
                          label: "حفظ التعديلات",
                          onTap: () {
                            if (_formKey.currentState!.validate()) {
                              context.read<ProfileCubit>().updateDoctorProfile(
                                  UpdateDoctorProfileRequest(
                                      clinicId:
                                          widget.profileDoctorEntity.clinicId,
                                      clinicName: _clinicNameController.text,
                                      college: _selectedCollege,
                                      description: _descriptionController.text,
                                      email: _emailController.text,
                                      firstName: _firstNameController.text,
                                      id: widget.profileDoctorEntity.id,
                                      imageUrl: imagePath,
                                      lastName: _lastNameController.text,
                                      nationalId: _nationalIdController.text,
                                      phoneNumber: _phoneController.text,
                                      specialty: _specialtyController.text));
                            }
                          },
                        )

                        // },
                        // )
                      ],
                    )),
              );
            })));
  }
}

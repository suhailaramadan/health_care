import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/features/feedback/domain/entites/feedback_entity.dart';
import 'package:graduation_project/features/feedback/presentation/cubit/feedbach_status.dart';
import 'package:graduation_project/features/feedback/presentation/cubit/feedback_cubit.dart';

class FeedbackScreen extends StatefulWidget {
  static const feedback = '/feedback';
  const FeedbackScreen({super.key});

  @override
  State<FeedbackScreen> createState() => _FeedbackScreenState();
}

class _FeedbackScreenState extends State<FeedbackScreen> {
  final TextEditingController controller = TextEditingController();
  final List<String> ratings = ['ممتاز', 'جيد جداً'];
  final List<String> ratingOptions = ['1', '2', '3', '4', '5'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: const Text('الادارة الطبية')));
  }
  //     body: SingleChildScrollView(
  //       padding: const EdgeInsets.all(16),
  //       child: Column(
  //         crossAxisAlignment: CrossAxisAlignment.start,
  //         children: [
  //           const Center(
  //             child: Text(
  //               'الاستبيان',
  //               style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
  //             ),
  //           ),
  //           const SizedBox(height: 8),
  //           const Center(
  //             child: Text(
  //               'نحرص دائماً على تقديم أفضل خدمة ليك، وعشان كده رأيك يهمنا!',
  //               style: TextStyle(color: Colors.grey),
  //             ),
  //           ),
  //           const SizedBox(height: 16),
  //           buildRatingCard('رأيك عن خدمة الاستقبال', receptionServiceRating,
  //               (val) => setState(() => receptionServiceRating = val)),
  //           buildRatingCard(
  //               'رأيك عن الخدمة الطبية المقدمة',
  //               medicalServiceRating,
  //               (val) => setState(() => medicalServiceRating = val)),
  //           buildRatingCard(
  //               'رأيك عن الادوية المصروفة',
  //               dispensedMedicationRating,
  //               (val) => setState(() => dispensedMedicationRating = val)),
  //           buildRatingCard(
  //               'رأيك عن حركة التحويلات',
  //               internationalizationRating,
  //               (val) => setState(() => internationalizationRating = val)),
  //           buildRatingCard(
  //               'رأيك عن استقبال الشكاوى',
  //               receptionComplaintsRating,
  //               (val) => setState(() => receptionComplaintsRating = val)),
  //           buildRatingCard('تقييم نظافة البيئة والمكان', environmentRating,
  //               (val) => setState(() => environmentRating = val)),
  //           const SizedBox(height: 12),
  //           const Text('الملاحظات',
  //               style: TextStyle(fontWeight: FontWeight.bold)),
  //           TextField(
  //             controller: commentsController,
  //             maxLines: 4,
  //             decoration: const InputDecoration(
  //               hintText: 'اكتب ملاحظاتك هنا...',
  //               border: OutlineInputBorder(),
  //             ),
  //           ),
  //           const SizedBox(height: 16),
  //           BlocConsumer<FeedbackCubit, FeedbackState>(
  //             listener: (context, state) {
  //               if (state is FeedbackSuccess) {
  //                 ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
  //                     content: Text('تم إرسال الاستبيان بنجاح')));
  //               } else if (state is FeedbackFailure) {
  //                 ScaffoldMessenger.of(context)
  //                     .showSnackBar(SnackBar(content: Text(state.message)));
  //               }
  //             },
  //             builder: (context, state) {
  //               return SizedBox(
  //                 width: double.infinity,
  //                 child: ElevatedButton(
  //                   onPressed: state is FeedbackLoading
  //                       ? null
  //                       : () {
  //                           context.read<FeedbackCubit>().sendFeedback(
  //                                 receptionServiceRating:
  //                                     receptionServiceRating,
  //                                 medicalServiceRating: medicalServiceRating,
  //                                 dispensedMedicationRating:
  //                                     dispensedMedicationRating,
  //                                 internationalizationRating:
  //                                     internationalizationRating,
  //                                 receptionComplaintsRating:
  //                                     receptionComplaintsRating,
  //                                 environmentRating: environmentRating,
  //                                 comments: commentsController.text,
  //                               );
  //                         },
  //                   child: state is FeedbackLoading
  //                       ? const CircularProgressIndicator(color: Colors.white)
  //                       : const Text('إرسال'),
  //                 ),
  //               );
  //             },
  //           ),
  //         ],
  //       ),
  //     ),
  //   );
  // }

  // Widget buildRatingCard(
  //     String title, String? groupValue, void Function(String?) onChanged) {
  //   return Card(
  //     elevation: 2,
  //     margin: const EdgeInsets.symmetric(vertical: 8),
  //     child: Padding(
  //       padding: const EdgeInsets.all(12.0),
  //       child: Column(
  //         crossAxisAlignment: CrossAxisAlignment.start,
  //         children: [
  //           Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
  //           Wrap(
  //             alignment: WrapAlignment.start,
  //             spacing: 10,
  //             children: ratings
  //                 .map((rating) => Row(
  //                       mainAxisSize: MainAxisSize.min,
  //                       children: [
  //                         Radio<String>(
  //                             value: rating,
  //                             groupValue: groupValue,
  //                             onChanged: onChanged),
  //                         Text(rating),
  //                       ],
  //                     ))
  //                 .toList(),
  //           ),
  //         ],
  //       ),
  //     ),
  //   );
  // }
}

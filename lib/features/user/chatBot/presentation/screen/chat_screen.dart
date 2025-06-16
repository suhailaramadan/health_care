import 'dart:async';
import 'dart:io';
import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/core/di/service_locator.dart';
import 'package:graduation_project/core/resources/color_manager.dart';
import 'package:graduation_project/core/resources/styles_manager.dart';
import 'package:graduation_project/core/widgets/custom_botton.dart';
import 'package:graduation_project/core/widgets/custom_text_field.dart';
import 'package:graduation_project/core/widgets/loading_indicator.dart';
import 'package:graduation_project/features/user/chatBot/presentation/cubit/analysis_cubit.dart';
import 'package:graduation_project/features/user/chatBot/presentation/cubit/chat_cubit.dart';
import 'package:graduation_project/features/user/chatBot/presentation/cubit/chat_states.dart';
import 'package:image_picker/image_picker.dart';

// class ChatScreen extends StatefulWidget {
//   const ChatScreen({super.key});
//   static const chat = '/chat';

//   @override
//   State<ChatScreen> createState() => _ChatScreenState();
// }

// class _ChatScreenState extends State<ChatScreen> {
//   TextEditingController textEditingController = TextEditingController();
//   final List<Map<String, String>> messages = [];
//   File? imageFile;
//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider.value(
//       value: serviceLocator.get<ChatCubit>(),
//       child: Scaffold(
//         appBar: AppBar(
//           centerTitle: true,
//           title: Text(
//             "شات بوت",
//             style: getSemiBoldStyle(color: ColorManager.textColor),
//           ),
//         ),
//         body: Column(
//           children: [
//             Expanded(
//                 child: BlocConsumer<ChatCubit, ChatStates>(
//               listener: (context, state) {
//                 if (state is ChatSuccess) {
//                   messages.add({'sender': 'bot', 'message': state.message});
//                 }
//               },
//               builder: (context, state) {
//                 final isLoading = state is ChatLoading;
//                 return ListView.builder(
//                   padding: const EdgeInsets.all(15),
//                   itemCount: messages.length + (isLoading ? 1 : 0),
//                   itemBuilder: (context, index) {
//                     if (isLoading && index == messages.length) {
//                       return Align(
//                         alignment: Alignment.centerLeft,
//                         child: Container(
//                           margin: const EdgeInsets.symmetric(
//                               vertical: 7, horizontal: 5),
//                           padding: const EdgeInsets.all(15),
//                           decoration: BoxDecoration(
//                               color: ColorManager.greyDark,
//                               borderRadius: BorderRadius.circular(15)),
//                           child: const Text("يكتب الآن..."),
//                         ),
//                       );
//                     }
//                     final msg = messages[index];
//                     final isUser = msg['sender'] == 'user';
//                     return _buildChatMessage(msg['message'] ?? 'N/A', false);
//                     // final msg = messages[index];
//                     // final isUser = msg['sender'] == 'user';
//                     // return Align(
//                     //   alignment:
//                     //       isUser ? Alignment.centerRight : Alignment.centerLeft,
//                     //   child: Container(
//                     //     margin: const EdgeInsets.symmetric(
//                     //         vertical: 7, horizontal: 5),
//                     //     padding: const EdgeInsets.all(15),
//                     //     decoration: BoxDecoration(
//                     //         color: isUser
//                     //             ? ColorManager.blue
//                     //             : const Color.fromARGB(255, 250, 245, 245),
//                     //         borderRadius: BorderRadius.circular(12)),
//                     //     child: Text(
//                     //       msg['message'] ?? '',
//                     //       style: getMediumStyle(color: ColorManager.textColor),
//                     //     ),
//                     //   ),
//                     // );
//                   },
//                 );
//               },
//             )),
//             BlocBuilder<AnalysisCubit, ChatStates>(builder: (context, state) {
//               if (state is ChatLoading) {
//                 return const Center(
//                   child: LoadingIndicator(),
//                 );
//               } else if (state is ChatError) {
//                 return const Center(
//                     child: Text(
//                   "حدث خطأ فى التحليل",
//                 ));
//               } else if (state is AnalysisSuccess) {
//                 return Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     _buildChatMessage(
//                         "النص المستخرج : ${state.entity.textExtracted ?? 'N/A'}",
//                         false),
//                     _buildChatMessage(
//                         "التشخيص : ${state.entity.rawDiagnosis ?? 'N/A'}",
//                         false),
//                     _buildChatMessage(
//                         "ملاحظة : ${state.entity.note ?? 'N/A'}", false)
//                   ],
//                 );
//               } else {
//                 return const SizedBox.shrink();
//               }
//             }),
//             const Divider(
//               height: 1,
//             ),
//             Padding(
//               padding: const EdgeInsets.all(15),
//               child: Row(
//                 children: [
//                   Expanded(
//                       child: CustomTextField(
//                     controller: textEditingController,
//                     hint: "اكتب رسالتك",
//                   )),
//                   IconButton(
//                       onPressed: () {
//                         final message = textEditingController.text.trim();
//                         if (message.isNotEmpty) {
//                           setState(() {
//                             messages
//                                 .add({'sender': 'user', 'message': message});
//                           });
//                           context.read<ChatCubit>().sendMessage(message);
//                           textEditingController.clear();
//                         }
//                       },
//                       icon: const Icon(
//                         Icons.send,
//                         color:
//                             // textEditingController.text.trim().isEmpty
//                             //     ? ColorManager.black
//                             // :
//                             ColorManager.primary,
//                       ))
//                 ],
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//   }

//   Future<void> _pickedImage() async {
//     final picker = ImagePicker();
//     final picked = await picker.pickImage(source: ImageSource.gallery);
//     if (picked != null) {
//       imageFile = File(picked.path);
//       context.read<AnalysisCubit>().analysisImage(picked.path);
//     }
//   }

//   Widget _buildChatMessage(String text, bool isUser) {
//     return Container(
//       alignment: isUser ? Alignment.centerRight : Alignment.centerLeft,
//       margin: const EdgeInsets.symmetric(vertical: 7, horizontal: 5),
//       child: Container(
//         padding: const EdgeInsets.all(15),
//         constraints: const BoxConstraints(maxWidth: 300),
//         decoration: BoxDecoration(
//             color: isUser ? ColorManager.blue : ColorManager.greyDark,
//             borderRadius: BorderRadius.circular(15)),
//         child: Text(
//           text,
//           style: getMediumStyle(
//               color: isUser ? ColorManager.white : ColorManager.textColor),
//         ),
//       ),
//     );
//   }
// }

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});
  static const chat = '/chat';

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final TextEditingController textEditingController = TextEditingController();
  final List<Map<String, dynamic>> messages = [];
  final ScrollController _scrollController = ScrollController();
  File? imageFile;

  @override
  void initState() {
    super.initState();
    textEditingController.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider.value(value: serviceLocator.get<ChatCubit>()),
        BlocProvider.value(value: serviceLocator.get<AnalysisCubit>()),
      ],
      child: BlocListener<ChatCubit, ChatStates>(
        listener: (context, state) {
          if (state is ChatSuccess) {
            setState(() {
              messages.add({'sender': 'bot', 'message': state.message});
              _scrollToBottom();
            });
          }
        },
        child: BlocListener<AnalysisCubit, ChatStates>(
          listener: (context, state) {
            if (state is AnalysisSuccess) {
              setState(() {
                messages.add({
                  'sender': 'bot',
                  'message':
                      "تم التحليل:\n\n النص: ${state.entity.textExtracted ?? "N/A"}\n  التشخيص: ${state.entity.rawDiagnosis ?? "N/A"}\n📝 ملاحظة: ${state.entity.note ?? "N/A"}"
                });
                _scrollToBottom();
              });
            } else if (state is ChatError) {
              setState(() {
                messages.add(
                    {'sender': 'bot', 'message': "حدث خطأ أثناء تحليل الصورة"});
              });
            }
          },
          child: Scaffold(
            appBar: AppBar(
              centerTitle: true,
              title: Text(
                "شات بوت",
                style: getSemiBoldStyle(color: ColorManager.textColor),
              ),
            ),
            body: Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    controller: _scrollController,
                    padding: const EdgeInsets.all(15),
                    itemCount: messages.length,
                    itemBuilder: (context, index) {
                      final msg = messages[index];
                      final isUser = msg['sender'] == 'user';
                      final content = msg['message'];

                      // عرض صورة أو نص

                      if (content is String) {
                        return _buildChatMessage(content, isUser);
                      } else if (content is File) {
                        return _buildImageMessage(content, isUser);
                      } else {
                        return const SizedBox.shrink();
                      }
                    },
                  ),
                ),
                BlocBuilder<ChatCubit, ChatStates>(
                  builder: (context, state) {
                    if (state is ChatLoading) {
                      return _buildChatMessage("يكتب الآن...", false);
                    }
                    return const SizedBox.shrink();
                  },
                ),
                BlocBuilder<AnalysisCubit, ChatStates>(
                  builder: (context, state) {
                    if (state is ChatLoading) {
                      return _buildChatMessage("جارٍ تحليل الصورة...", false);
                    }
                    return const SizedBox.shrink();
                  },
                ),
                const Divider(height: 1),
                _buildInputArea(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildInputArea() {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: Row(
        children: [
          Expanded(
            child: CustomTextField(
              controller: textEditingController,
              hint: "اكتب رسالتك",
              onSumbit: (_) => _handleSendMessage(),
            ),
          ),
          IconButton(
            icon: Icon(
              Icons.send,
              color: textEditingController.text.trim().isEmpty
                  ? ColorManager.grey
                  : ColorManager.primary,
            ),
            onPressed: textEditingController.text.trim().isEmpty
                ? null
                : _handleSendMessage,
          ),
          IconButton(
            icon: const Icon(Icons.image, color: Colors.grey),
            onPressed: _pickImageAndAnalyze,
          ),
        ],
      ),
    );
  }

  void _handleSendMessage() {
    final message = textEditingController.text.trim();
    if (message.isEmpty) return;

    setState(() {
      messages.add({'sender': 'user', 'message': message});
      _scrollToBottom();
    });

    context.read<ChatCubit>().sendMessage(message);
    textEditingController.clear();
  }

  Future<void> _pickImageAndAnalyze() async {
    final picker = ImagePicker();
    final picked = await picker.pickImage(source: ImageSource.gallery);
    if (picked != null) {
      final file = File(picked.path);
      setState(() {
        messages.add({'sender': 'user', 'message': file});
        _scrollToBottom();
      });
      context.read<AnalysisCubit>().analysisImage(picked.path);
    }
  }

  Widget _buildChatMessage(String text, bool isUser) {
    return Align(
      alignment: isUser ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 7, horizontal: 5),
        padding: const EdgeInsets.all(12),
        constraints: BoxConstraints(
          maxWidth: MediaQuery.of(context).size.width * 0.75,
        ),
        decoration: BoxDecoration(
          color: isUser
              ? ColorManager.blue
              : const Color.fromARGB(255, 238, 237, 237),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Text(
          text,
          style: getMediumStyle(
            color: ColorManager.textColor,
          ),
        ),
      ),
    );
  }

  Widget _buildImageMessage(File image, bool isUser) {
    return Align(
      alignment: isUser ? Alignment.centerRight : Alignment.centerLeft,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: Image.file(
          image,
          width: 200,
          height: 200,
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  void _scrollToBottom() {
    Future.delayed(const Duration(milliseconds: 100), () {
      _scrollController.animateTo(
        _scrollController.position.maxScrollExtent,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeOut,
      );
    });
  }
}

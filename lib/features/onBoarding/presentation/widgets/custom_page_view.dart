import 'package:flutter/material.dart';
import 'package:graduation_project/features/onBoarding/presentation/widgets/page_view_item.dart';

class CustomPageView extends StatelessWidget {
  const CustomPageView({super.key, this.pageController});
  final PageController? pageController;
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: PageView(
        // physics:,
        controller: pageController!,
        children: [
          PageViewItem(
            image: "assets/images/Health professional team-amico.png",
            text: "أهلاً بكم في الإدارة الطبية الخاصة \nبجامعة طنطا",
          ),
          PageViewItem(
            image: "assets/images/Insurance-pana (1).png",
            text:
                "لا داعي للإنتظار بعد الآن !\n تطبيقنا يوفر لك سهولة الحجز \nوالوصول للخدمات الطبية",
          ),
          PageViewItem(
            image: "assets/images/Mobile login-bro.png",
            text:
                "سجل معنا الآن للاستفادة من خدماتنا \n الطبية مع أفضل الأطباء",
          ),
        ],
      ),
    );
  }
}

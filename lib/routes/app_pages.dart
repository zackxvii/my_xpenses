import 'package:get/get.dart';
import 'package:my_xpenses/pages/create_expenses_page.dart';
import 'package:my_xpenses/pages/dashboard.dart';
import 'package:my_xpenses/pages/detailpage.dart';
import 'package:my_xpenses/pages/flashpage.dart';
import 'package:my_xpenses/routes/app_routes.dart';

class AppPages {
  static const flashscreen = AppRoutes.flashcreen;
  static const dashboard = AppRoutes.dashboard;
  static const detail = AppRoutes.detailpage;
  static const addexpense = AppRoutes.addexpense;

  static final pageList = [
    GetPage(
      name: AppRoutes.flashcreen,
      page: () => const FlashPage(),
    ),
    GetPage(
      name: AppRoutes.dashboard,
      page: () => const DashboardPage(),
    ),
    GetPage(
      name: AppRoutes.detailpage,
      page: () => const DetailPage(),
    ),
    GetPage(
      name: AppRoutes.addexpense,
      page: () => const AddExpenseScreen(),
    ),
  ];
}

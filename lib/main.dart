import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_xpenses/routes/app_pages.dart';
import 'package:my_xpenses/shared/fontcolor_shared.dart';
import 'package:my_xpenses/shared/fontsize_shared.dart';
import 'package:my_xpenses/util/theme.dart';
import 'package:my_xpenses/util/translate.dart';
import 'package:sizer/sizer.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Sizer(builder:
        (BuildContext context, Orientation orientation, DeviceType deviceType) {
      return GetMaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          textTheme: GoogleFonts.outfitTextTheme(
            Theme.of(context).textTheme,
          ),
          fontFamily: GoogleFonts.outfit().toString(),
          appBarTheme: AppBarTheme(
            titleTextStyle: GoogleFonts.outfit(
              textStyle:
                  AppText.px15.w600.letterSpace(2.0).customColor(whiteColor),
            ),
            color: whiteColor,
            elevation: 0,
            iconTheme: const IconThemeData(
              color: whiteColor,
            ),
          ),
          primaryColor: primaryColor,
          hintColor: const Color(0xffcdd3e0),
          dividerColor: Colors.grey[100],
          scaffoldBackgroundColor: whiteColor,
          colorScheme: const ColorScheme.light(
            primary: primaryColor,
            secondary: secondaryColor,
          ),
          textButtonTheme: TextButtonThemeData(
            style: ButtonStyle(
              foregroundColor: MaterialStateProperty.all(primaryColor),
            ),
          ),
          dividerTheme: const DividerThemeData(
            color: Color(0xffEBECED),
            thickness: 1,
            space: 1,
          ),
          // home: const DashboardPage(title: 'MyXpenses'),
        ),
        //dark theme
        darkTheme: Themes.dark,
        translations: Translate(),
        locale: const Locale('en', 'de'),
        navigatorObservers: const [],
        initialRoute: AppPages.dashboard,
        getPages: AppPages.pageList,
      );
    });
  }
}

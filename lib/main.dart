import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_xpenses/routes/app_pages.dart';
import 'package:my_xpenses/shared/fontcolor_shared.dart';
import 'package:my_xpenses/shared/fontsize_shared.dart';
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
        translations: Translate(),
        locale: const Locale('en', 'de'),
        navigatorObservers: const [],
        initialRoute: AppPages.dashboard,
        getPages: AppPages.pageList,
      );
    });
  }
}

/*class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.arrow_right),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}*/

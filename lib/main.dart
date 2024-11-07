import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:travelbuddy/page/splashscreen.dart';
import 'package:travelbuddy/thame.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (kIsWeb) {
    await Firebase.initializeApp(
      options: FirebaseOptions(
        apiKey: "AIzaSyCjw__YNfLJXYmelBagfkWa-7HK4R9mRXk",
        appId: "1:487579715390:android:a6e8a85959118904118e6f",
        messagingSenderId: "487579715390",
        projectId: "travelbuddy-57739",
        // Your web Firebase config options
      ),
    );
  } else {
    await Firebase.initializeApp();
  }
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
   final PendingDynamicLinkData? initiaLink;
   MyApp({super.key, this.initiaLink});
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String? path;
  // const MyApp({super.key});

  // @override
  // void initState() {
  //   super.initState();
  //   initDynamicLinks();
  // }
  //
  // void initDynamicLinks() async {
  //   FirebaseDynamicLinks.instance.onLink.listen((dynamicLinkData) {
  //     final Uri deepLink = dynamicLinkData.link;
  //     // Handle deep link. For example, open the post related to the link
  //     print("Received dynamic link: $deepLink");
  //   }).onError((error) {
  //     print('onLink error');
  //   });
  //
  //   final PendingDynamicLinkData? initialLink = await FirebaseDynamicLinks.instance.getInitialLink();
  //   if (initialLink?.link != null) {
  //     // Handle the deep link when the app is launched via the dynamic link
  //     final Uri deepLink = initialLink!.link;
  //     print("App launched via dynamic link: $deepLink");
  //   }
  // }

  @override
  void initState() {
    if(widget.initiaLink != null){
    path =   widget.initiaLink!.link.path;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext Context) => UiProvider()..init(),
      child:
          Consumer<UiProvider>(builder: (context, UiProvider notifire, child) {
        // print(isLogIn);
        return MaterialApp(
          themeMode: notifire.isDark ? ThemeMode.dark : ThemeMode.light,
          darkTheme: notifire.isDark ? notifire.darkTheme : notifire.lightTheme,
          home: SplashScreen(),
          // SplashScreen(),
          // isLogIn ?   BottomNavBar(index: 0) : OnboardingScreens(),
          debugShowCheckedModeBanner: false,
        );
      }),
    );
  }
}

// - Add Location Functionality and show location in communication page,profile page and save post page
// - Communication page click post and show image full screen mode and zoom in and out photo
// - Solve some Error


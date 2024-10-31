import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:urchoice/Screens/delay_splash_screen.dart';
import 'package:urchoice/Screens/new_signup1.dart';
import 'package:urchoice/Screens/new_signup2.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'Screens/Utills/Utills.dart';
import 'Screens/contact_invitation_screen.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'Screens/editaccount_screen.dart';
import 'Screens/startanimation_screen.dart';
import 'Screens/terms_ofservice_screen.dart';

Future main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();


  runApp(const MyApp());
}

/*Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();


  await FirebaseAppCheck.instance.activate(
    // You can also use a `ReCaptchaEnterpriseProvider` provider instance as an
    // argument for `webProvider`
    webProvider: ReCaptchaV3Provider('recaptcha-v3-site-key'),
    // Default provider for Android is the Play Integrity provider. You can use the "AndroidProvider" enum to choose
    // your preferred provider. Choose from:
    // 1. Debug provider
    // 2. Safety Net provider
    // 3. Play Integrity provider
    androidProvider: AndroidProvider.debug,
    // Default provider for iOS/macOS is the Device Check provider. You can use the "AppleProvider" enum to choose
    // your preferred provider. Choose from:
    // 1. Debug provider
    // 2. Device Check provider
    // 3. App Attest provider
    // 4. App Attest provider with fallback to Device Check provider (App Attest provider is only available on iOS 14.0+, macOS 14.0+)
    appleProvider: AppleProvider.appAttest,
  );
  runApp(MyApp());
}*/

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {


    User? currentUser = FirebaseAuth.instance.currentUser;
    String? uid = currentUser?.uid;

    return MaterialApp(


      supportedLocales: [
        Locale("af"),
        Locale("am"),
        Locale("ar"),
        Locale("az"),
        Locale("be"),
        Locale("bg"),
        Locale("bn"),
        Locale("bs"),
        Locale("ca"),
        Locale("cs"),
        Locale("da"),
        Locale("de"),
        Locale("el"),
        Locale("en"),
        Locale("es"),
        Locale("et"),
        Locale("fa"),
        Locale("fi"),
        Locale("fr"),
        Locale("gl"),
        Locale("ha"),
        Locale("he"),
        Locale("hi"),
        Locale("hr"),
        Locale("hu"),
        Locale("hy"),
        Locale("id"),
        Locale("is"),
        Locale("it"),
        Locale("ja"),
        Locale("ka"),
        Locale("kk"),
        Locale("km"),
        Locale("ko"),
        Locale("ku"),
        Locale("ky"),
        Locale("lt"),
        Locale("lv"),
        Locale("mk"),
        Locale("ml"),
        Locale("mn"),
        Locale("ms"),
        Locale("nb"),
        Locale("nl"),
        Locale("nn"),
        Locale("no"),
        Locale("pl"),
        Locale("ps"),
        Locale("pt"),
        Locale("ro"),
        Locale("ru"),
        Locale("sd"),
        Locale("sk"),
        Locale("sl"),
        Locale("so"),
        Locale("sq"),
        Locale("sr"),
        Locale("sv"),
        Locale("ta"),
        Locale("tg"),
        Locale("th"),
        Locale("tk"),
        Locale("tr"),
        Locale("tt"),
        Locale("uk"),
        Locale("ug"),
        Locale("ur"),
        Locale("uz"),
        Locale("vi"),
        Locale("zh")
      ],
      localizationsDelegates: [
        CountryLocalizations.delegate,
      ],

      routes: {
        // When navigating to the "/" route, build the FirstScreen widget.
        '/SplashScreen': (context) => const StartAnimation_Screen(),
        // When navigating to the "/second" route, build the SecondScreen widget.
        '/home': (context) => const Contact_Invitation_Screen(),
      },

      initialRoute: uid!=null ? '/home' : '/SplashScreen',

      title: 'Flutter Demo',
      theme: ThemeData(
        canvasColor: Color(0xFF565656),

        textTheme: const TextTheme(
          bodyLarge: TextStyle(color: Colors.white),
      ),

        textSelectionTheme: TextSelectionThemeData(
          cursorColor: Colors.white,
          selectionColor: Colors.blue,
        ),
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueAccent),
        useMaterial3: true,
      ),



      //  home: Contact_Invitation_Screen(),
     // home: const Chat_Screen(),
      //home: FooPage()
    );
  }


}
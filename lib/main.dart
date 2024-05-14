import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:medic/controller/authentication_provider.dart';
import 'package:medic/controller/bottom_bar-provider.dart';
import 'package:medic/controller/carousel_controller.dart';
import 'package:medic/firebase_options.dart';
import 'package:medic/view/authenications/splash_screen.dart';
import 'package:medic/widget/bottom_bar.dart';
import 'package:provider/provider.dart';

void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => HomeCaroselController(),),
          ChangeNotifierProvider(
            create: (context) => BottomBarProvider(),
          ),
          ChangeNotifierProvider(create: (context) =>AuthenticationProvider() ,)
        ],
        child: MaterialApp(
          theme: ThemeData(
            popupMenuTheme: PopupMenuThemeData(color:  Color.fromARGB(255, 28, 113, 76),)),
          //  home: BottomNavigation(selectedIndex: 0,),.
          home: SplashScreen(),
          // home: LoginScreen(),
          debugShowCheckedModeBanner: false,
        ));
  }
}

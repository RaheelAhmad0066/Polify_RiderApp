import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:poolyfi/src/splashscreen/splash_screen.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'src/passengerview/provider/gmapplaces.dart';
import 'src/passengerview/provider/night Mode/night_mode.dart';

void main() async{
  
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ThemeChanger()),
        ChangeNotifierProvider(create: (_) => Placesvariables()),
      ],
      child: Builder(
        builder: (BuildContext context) {
          final themeChanger = Provider.of<ThemeChanger>(context);
          return Sizer(builder: (context, orientation, deviceType) {
            return MaterialApp(
              themeMode: themeChanger.themeMode,
              theme: ThemeData(
                primarySwatch: Colors.yellow,
                brightness: Brightness.light,
              ),
              darkTheme: ThemeData(
                brightness: Brightness.dark,
              ),
              debugShowCheckedModeBanner: false,
              home: SplashScreen(),
            );
          });
        },
      ),
    );
  }
}

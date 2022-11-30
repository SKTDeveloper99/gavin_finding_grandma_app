import 'package:flutter/material.dart';
import 'package:gavin_finding_grandma_app/authentication/signin.dart';
import 'package:gavin_finding_grandma_app/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter User Location',
        theme: ThemeData(
          colorSchemeSeed: Colors.green,
          textTheme: const TextTheme(
            bodyText2: TextStyle(fontSize: 35),
          ),
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
              textStyle: const TextStyle(fontSize: 32),
              minimumSize: const Size(250, 56),
            ),
          ),
        ),
        home: const LoginPage(),
      );
}

// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:gavin_finding_grandma_app/controller/requirement_state_controller.dart';
// import 'package:gavin_finding_grandma_app/view/home_page.dart';
// import 'package:get/get.dart';

// void main() {
//   runApp(MainApp());
// }

// class MainApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     Get.put(RequirementStateController());

//     final themeData = Theme.of(context);
//     final primary = Colors.blue;

//     return GetMaterialApp(
//       theme: ThemeData(
//         brightness: Brightness.light,
//         primarySwatch: primary,
//         appBarTheme: themeData.appBarTheme.copyWith(
//           brightness: Brightness.light,
//           elevation: 0.5,
//           color: Colors.white,
//           actionsIconTheme: themeData.primaryIconTheme.copyWith(
//             color: primary,
//           ),
//           iconTheme: themeData.primaryIconTheme.copyWith(
//             color: primary,
//           ),
//           textTheme: themeData.primaryTextTheme.copyWith(
//             headline6: themeData.textTheme.headline6?.copyWith(
//               color: primary,
//             ),
//           ),
//         ),
//       ),
//       darkTheme: ThemeData(
//         brightness: Brightness.dark,
//         primarySwatch: primary,
//       ),
//       home: HomePage(),
//     );
//   }
// }

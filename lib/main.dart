import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:teachers/Dashhboard/dashboard.dart';
import 'package:teachers/Theme/theme_provider.dart';


void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp, 
  ]).then((_) {
    runApp(ChangeNotifierProvider(create: (context)=>ThemeProvider(),
    child: const MyApp(),
    ));
  });
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home:mainPage(),
      theme: Provider.of<ThemeProvider>(context).themedata,
    );
  }
}
class mainPage extends StatefulWidget {
  const mainPage({super.key});

  @override
  State<mainPage> createState() => _mainPageState();
}

class _mainPageState extends State<mainPage> {
  @override
  Widget build(BuildContext context) {
    return Dashboardpage();
  }
}
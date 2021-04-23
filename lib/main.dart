import 'package:vigilante/routes.dart';
import 'package:vigilante/location/location.service.dart';
import 'package:vigilante/location/session.service.dart';
import 'package:vigilante/routes.service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

final _locationService = LocationService();
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  // InAppPurchaseConnection.enablePendingPurchases();

  if (FirebaseAuth.instance.currentUser != null) {
    print('logged in');
    // final gqlClient = await EstatetialGraphQLClient.getClient();
    // print(gqlClient.link.toString());

    await _locationService.getLocation();
  }
  runApp(App());
}

class App extends StatefulWidget {
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  final _routeService = RouteService();
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        // ChangeNotifierProvider.value(
        //   value: _meService,
        // ),
        ChangeNotifierProvider.value(
          value: SessionService(),
        ),
        ChangeNotifierProvider.value(
          value: _routeService,
        ),
      ],
      builder: (context, child) => MaterialApp(
        title: 'Vigilante',
        // theme: ThemeData(
        //     fontFamily: 'Montserrat',
        //     primarySwatch: Colors.grey,
        //     accentColor: Color(0xff1aade4),
        //     appBarTheme:
        //         AppBarTheme(color: Colors.white, brightness: Brightness.light),
        //     textTheme: TextTheme(
        //         headline6: TextStyle(
        //             fontSize: 34,
        //             fontWeight: FontWeight.bold,
        //             color: Colors.black),
        //         headline5: TextStyle(fontSize: 34, color: Colors.black),
        //         headline4: TextStyle(
        //             fontSize: 28,
        //             fontWeight: FontWeight.bold,
        //             color: Colors.black),
        //         headline3: TextStyle(fontSize: 28, color: Colors.black),
        //         headline2: TextStyle(fontSize: 22, color: Colors.black),
        //         headline1: TextStyle(
        //             fontSize: 20,
        //             fontWeight: FontWeight.normal,
        //             color: Colors.black),
        //         bodyText1: TextStyle(
        //             fontSize: 13,
        //             fontWeight: FontWeight.normal,
        //             color: Colors.black),
        //         bodyText2: TextStyle(
        //             fontSize: 15,
        //             fontWeight: FontWeight.normal,
        //             color: Colors.black),
        //         subtitle1: TextStyle(fontSize: 17),
        //         subtitle2: TextStyle(fontSize: 15),
        //         caption: TextStyle(fontSize: 12))),
        initialRoute: Routes.root,
        navigatorKey: _routeService.rootNavigatorKey,
        onGenerateRoute: (routeSettings) => Routes.generateRoute(routeSettings),
      ),
    );
  }
}

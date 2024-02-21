import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';
import 'package:secure_cash_app/presentation/test.dart';
import 'package:secure_cash_app/routes/app_routes.dart';

import 'App Configurations/color_constants.dart';
import 'initial_bindings.dart';

import 'package:flutter/foundation.dart';

const AndroidNotificationChannel channel = AndroidNotificationChannel(
  'high_importance_channel', // id
  'High Importance Notifications',
  description: "This is description",// title
  importance: Importance.high,
);
final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  // If you're going to use other Firebase services in the background, such as Firestore,
  // make sure you call `initializeApp` before using other Firebase services.
  await Firebase.initializeApp();
  print('Handling a background message ${message.messageId}');
}

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp();
  await FlutterDownloader.initialize();
  await Firebase.initializeApp( options: const
  FirebaseOptions( apiKey: "AIzaSyAC0PgxH-WFcLDxr8JjTrFym1n-qoFK8qE",
    appId: "1:849138110745:android:cfb4494f2bf68e15903588",
    messagingSenderId: "849138110745", projectId: "mysequreapp-5fc1f", ), );

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  await flutterLocalNotificationsPlugin
      .resolvePlatformSpecificImplementation<
          AndroidFlutterLocalNotificationsPlugin>()
      ?.createNotificationChannel(channel);

  await FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
    alert: true,
    badge: true,
    sound: true,
  );
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  void initState() {
    var initializationSettingsAndroid =
    new AndroidInitializationSettings('ic_launcher');
    var initialzationSettingsAndroid =
    AndroidInitializationSettings('@mipmap/ic_launcher');
    var initializationSettings =
    InitializationSettings(android: initialzationSettingsAndroid);
    flutterLocalNotificationsPlugin.initialize(initializationSettings);
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      RemoteNotification? notification = message.notification;
      AndroidNotification? android = message.notification?.android;
      if (notification != null && android != null) {
        flutterLocalNotificationsPlugin.show(
            notification.hashCode,
            notification.title,
            notification.body,
            NotificationDetails(
              android: AndroidNotificationDetails(
                channel.id,
                channel.name,
                channelDescription: channel.description,
                color: Colors.blue,
                // TODO add a proper drawable resource to android, for now using
                //      one that already exists in example app.
                icon: "@mipmap/ic_launcher",
              ),
            ));
      }
    });
    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      RemoteNotification? notification = message.notification;
      AndroidNotification? android = message.notification?.android;
      if (notification != null && android != null) {
        showDialog(
          context: context,
            builder: (_) {
              return AlertDialog(
                title: Text(notification.title.toString()),
                content: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [Text(notification.body.toString())],
                  ),
                ),
              );
            });
      }
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    Map<int, Color> color =
    {
      50: Color(0xFF4CD080),
      100: Color(0xFF4CD080),
      200: Color(0xFF4CD080),
      300: Color(0xFF4CD080),
      400: Color(0xFF4CD080),
      500: Color(0xFF4CD080),
      600: Color(0xFF4CD080),
      700: Color(0xFF4CD080),
      800: Color(0xFF4CD080),
      900: Color(0xFF4CD080),
    };
    return GetMaterialApp(
      defaultTransition: Transition.fadeIn,
      transitionDuration: Duration(milliseconds: 500),
      debugShowCheckedModeBanner: false,
      locale: Get.deviceLocale,
      //for setting localization strings
      title: 'Secure Cashapp',
      theme: ThemeData(
          primarySwatch: MaterialColor(0xFF4CD080, color),
          splashColor:  ColorConstant.primaryLightGreen,
          highlightColor:  ColorConstant.primaryLightGreen,
      ),
      initialBinding: InitialBindings(),
      initialRoute: AppRoutes.splashScreen,
      getPages: AppRoutes.pages,
    );
  }
}

// // import 'package:firebase_messaging/firebase_messaging.dart';
// import 'dart:convert';
// import 'dart:developer';
// import 'package:firebase_messaging/firebase_messaging.dart';
// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_local_notifications/flutter_local_notifications.dart';
// import 'package:note_app/core/utils/app_constants.dart';
// import 'package:note_app/features/home/presentation/views/add_category_view.dart';
// import 'package:note_app/features/home/presentation/views/add_notes_view.dart';
// import 'package:note_app/features/home/presentation/views/notes_categorys_view.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:googleapis_auth/auth_io.dart' as auth;
// import 'package:http/http.dart' as http;
// import 'package:dio/dio.dart';

// abstract class FirebaseMessagingServices {
//   // this is used in init state of the app widget to give premtions
//   static giveAppNotificationPermtion() async {
//     FirebaseMessaging firebaseMessaging = FirebaseMessaging.instance;

//     NotificationSettings settings = await firebaseMessaging.requestPermission(
//       alert: true,
//       announcement: false,
//       badge: true,
//       carPlay: false,
//       criticalAlert: false,
//       provisional: false,
//       sound: true,
//     );

//     if (settings.authorizationStatus == AuthorizationStatus.authorized) {
//       print('User granted permission');
//     } else if (settings.authorizationStatus ==
//         AuthorizationStatus.provisional) {
//       print('User granted provisional permission');
//     } else {
//       print('User declined or has not accepted permission');
//     }
//   }

//   // this fun is used to get token of the app on this device
//   // this token is changed every time you install the app
//   //prefer get token every time user login and stored in shared pref
//   // this token is used to send notification to the app
//   static getToken() async {
//     String? mytoken = await FirebaseMessaging.instance.getToken();
//     log("***************");
//     log(mytoken ?? "");
//     final SharedPreferences prefs = await SharedPreferences.getInstance();
//     if (mytoken != null) {
//       prefs.setString(AppConstants.appTokenMessaging, mytoken);
//     }
//   }

// // for getting server key of the app in athor Name acessToken control your app
//   static Future<String?> getAccessToken() async {
//     final serviceAccountJson = {
//       //this part is changes for every app get it from firebase conole projsettings services account
//       // generate new private key and download json file contain this code
//       "type": "service_account",
//       "project_id": "noteapp-6def1",
//       "private_key_id": "78822d403d201ede189699cc61914645d194132f",
//       "private_key":
//           "-----BEGIN PRIVATE KEY-----\nMIIEvQIBADANBgkqhkiG9w0BAQEFAASCBKcwggSjAgEAAoIBAQCo2kUgYD2yzSe6\nvalqNAbhvl7PTO4bpin9XNa24EorARA7I/0WMD5MuQtJjIaT9f+V3aCT5TnmpC/p\nqEWvus30XRJEsqEnFLpl0DIxRaaGq5n0ugEErO7rcCzo3jzbWP1kg+jmiFKSHU/O\nYTXhAUExqmN/qTPnGkB94hKozBBMMeTBpglk+2sSnXVa+5DWurq5ridgdTKIpzho\n8W4dtGwfwJM+wyvO7dwVhWg/gQ20cBcpt1x68spVQHR0Dy3v6n0MfW8tPby9xYho\nJduArG+W49HSxGqC7nN577vhHtWbUFZerkYotrGVythhpepaUyzyGs8Ij0xXgunM\nzf/e/j07AgMBAAECggEASzKNt4n04ES6bVFa+he6et1/tr2RixG4wIOQgfgoP7el\nBVmVNET+8cc1Die9pXZYQWNmyIa8/wje56XPhx/f6fRrFtogp9l027PZLpVQwMf6\ndAFEQ9NKQeL+tSSIIL2kd5fBaK2MbFMOgCBN0Otwn9A8qJVvrnvD/evpGHBsz6lt\nDbChskd7q6LIZW7VOc3x1ffONk1uG4NihHOo7c25/XilUdeqd+I0RYldBl5Ft3AT\n/C4YRm7mVpy+cvoWJHK1nZayzWFY5UMoRW9BcGO45XXJ+dUpiJmz26yu89yDAuCf\n/G1AiK9+6WwhP3tjC5f8EU1B9E66qs1gGhMF5YIXqQKBgQDfAM54Es1BrBGYrP0k\nq9NlJYpGKVOPPSMddp1Cb4zY2MZDGdQLdBK3WgusYmxkNzw7xOUuJ6KTN4yZ16h4\nnAmt3IO5H7X/JNsIGz6vGtc5kPR8g5AAHsyKjtXmCPgvHFDVOH97flTp2+71Knzz\n+HmwuX9YMq7UcH5t3t8iRE8tCQKBgQDB1kgV2HTrVI18ArePDKMfvfAek9vqo+c8\nojzTwiEslSL15dEas5IS5f4cwJx6h92g04+SsZxZ46ZYhg5qpShXlLxpC6x/ik/B\nX3rqkH6UeVlMZHXihNaOmAY7CpplXd49saa1CU/plV7W+ousS/Bay8jo6a9XWi/l\n3ADxe9ytIwKBgHlfAgC+EvK8SPN0q25LCooRbXmUQoNCPhtqFFs1RU48ZWPd6de1\n+/3Ix3OyOdYtbd4F4spFDinb4O1WP74tBuOWkiauiKpuD7wQwAQjsqIFL9uY60X1\nfVOoO+iwVwuk+KWj01aOQn7pkdvjnRBX2zuBKjsBkr/S3izEUWNgFEupAoGAWJXU\nhd9Rt8cBjh4zw3V0C2qjlWXfiIF1iVlf0SsUPCrAOn7YLIrKhEaF9p/0I296Uyi8\nob74BICsoiJJ7mUiZbw8ywkhwXv1bRt0skRtBO/cZrQ2x9oLsEk797mlzBO1IJ7S\n4EOsOMUh/b+tG4XtB6HAZOl/T72QzEzaRYJk3N8CgYEAkr5u42MLho3VTsptCifh\nDdC3wndyFJ00g91QjfN4BkYjlmolW9JGz/6Qa0wP91QNwTmnclMhZ88r4UKDz68N\nNr0DJsIn0lFxJcJNXq9TVK+7HM1TZkCFJzg9Ke+xXwJaGJKKisenv+dBG3Wtv+bb\nOMOvF3oq8SV/RXtWy+5pf5k=\n-----END PRIVATE KEY-----\n",
//       "client_email":
//           "firebase-adminsdk-apqwx@noteapp-6def1.iam.gserviceaccount.com",
//       "client_id": "103094726214386260064",
//       "auth_uri": "https://accounts.google.com/o/oauth2/auth",
//       "token_uri": "https://oauth2.googleapis.com/token",
//       "auth_provider_x509_cert_url":
//           "https://www.googleapis.com/oauth2/v1/certs",
//       "client_x509_cert_url":
//           "https://www.googleapis.com/robot/v1/metadata/x509/firebase-adminsdk-apqwx%40noteapp-6def1.iam.gserviceaccount.com",
//       "universe_domain": "googleapis.com"
//     };

//     List<String> scopes = [
//       "https://www.googleapis.com/auth/userinfo.email",
//       "https://www.googleapis.com/auth/firebase.database",
//       "https://www.googleapis.com/auth/firebase.messaging"
//     ];

//     try {
//       http.Client client = await auth.clientViaServiceAccount(
//           auth.ServiceAccountCredentials.fromJson(serviceAccountJson), scopes);

//       auth.AccessCredentials credentials =
//           await auth.obtainAccessCredentialsViaServiceAccount(
//               auth.ServiceAccountCredentials.fromJson(serviceAccountJson),
//               scopes,
//               client);

//       client.close();
//       return credentials.accessToken.data;
//     } catch (e) {
//       print("Error getting access token: $e");
//       return null;
//     }
//   }

// //  take body data and turn it into json form

//   static Future<void> sendNotifications({
//     required String myFcmToken,
//     required String title,
//     required String notificationContetn,
//     @required String? userId,
//     String? type,
//   }) async {
//     try {
//       var serverKeyAuthorization = await getAccessToken();
//       var headersList = {
//         'Accept': '*/*',
//         'User-Agent': 'Thunder Client (https://www.thunderclient.com)',
//         'Content-Type': 'application/json',
//         'Authorization': 'Bearer $serverKeyAuthorization'
//       };
//       var url = Uri.parse(
//           'https://fcm.googleapis.com/v1/projects/noteapp-6def1/messages:send');

//       var body = {
//         "message": {
//           "token": myFcmToken,
//           "notification": {"title": title, "body": notificationContetn},
//           "android": {
//             "notification": {
//               "notification_priority": "PRIORITY_MAX",
//               "sound": "default",
//             },
//             'data': {"senderName": "Ahmed Awad Mohamed Nosir"}
//           },
//           "apns": {
//             "payload": {
//               "aps": {"content_available": true}
//             }
//           },
//           "data": {
//             "type": "type",
//             "id": "userId",
//             "click_action": "FLUTTER_NOTIFICATION_CLICK"
//           }
//         }
//       };

//       var req = http.Request('POST', url);
//       req.headers.addAll(headersList);
//       req.body = json.encode(body);

//       var res = await req.send();
//       final resBody = await res.stream.bytesToString();

//       if (res.statusCode >= 200 && res.statusCode < 300) {
//         print(resBody);
//       } else {
//         print(res.reasonPhrase);
//       }
//     } catch (e) {
//       print("Error sending notification: $e");
//     }
//   }

//   //firebaseMessaging.onMessage this stream listen take fn
//   //is apply when notification sended to app and it in forgroun on screen
//   static Future<void> OnMessageforgroundHandler() async {
//     FirebaseMessaging.onMessage.listen((RemoteMessage message) async {
//       //1-Create a new AndroidNotificationChannel instance
//       const AndroidNotificationChannel channel = AndroidNotificationChannel(
//         'high_importance_channel', // id
//         'High Importance Notifications', // title
//         // description
//         importance: Importance.max,
//       );
//       log("///onForgrounMessage************");
//       log(message.notification?.title ?? "");
//       log(message.notification?.body ?? "");
//       log(message.data['senderName']);

//       //2- create flutterLocalNotificationPlugin Object
//       final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
//           FlutterLocalNotificationsPlugin();

//       //3- apply chanel to flutterLocalNotificationPLugin
//       await flutterLocalNotificationsPlugin
//           .resolvePlatformSpecificImplementation<
//               AndroidFlutterLocalNotificationsPlugin>()
//           ?.createNotificationChannel(channel);
//       RemoteNotification? notification = message.notification;
//       AndroidNotification? android = message.notification?.android;

//       // If `onMessage` is triggered with a notification, construct our own
//       // local notification to show to users using the created channel.
//       if (notification != null && android != null) {
//         flutterLocalNotificationsPlugin.show(
//             notification.hashCode,
//             notification.title,
//             notification.body,
//             NotificationDetails(
//               android: AndroidNotificationDetails(
//                 channel.id,
//                 channel.name,
//                 icon: android?.smallIcon,
//                 // other properties...
//               ),
//             ));
//       }
//     });
//   }

//   //firebaseMessaging.OnBackGroundMessage this stream listen take fn
//   //is apply when notification sended to app and it in background or Terminated
//   static Future<void> onBackGroundHandler(RemoteMessage message) async {
//     if (message != null) {
//       log("Handling a background message: ${message.notification!.title}");
//     }
//   }

//   //this fun is applyed when i press the notification and app is background state
//   static void OnClickNotificationBackgroundAppHandler(BuildContext context) {
//     FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
//       log("OnClickNotificationBackgroundApp${message.notification!.title}");
//       Navigator.push(
//           context,
//           MaterialPageRoute(
//             builder: (context) => AddCategoryView(),
//           ));
//     });
//   }

//   //this fun is applyed when i press the notification and app is terminated state
//   static void OnClickNotificationTerminatedAppHandler(
//       BuildContext context) async {
//     RemoteMessage? intialMessage =
//         await FirebaseMessaging.instance.getInitialMessage();
//     if (intialMessage != null) {
//       log("OnClickNotificationTerminatedApp${intialMessage.notification!.title}");
//       Navigator.push(
//           context,
//           MaterialPageRoute(
//             builder: (context) => const AddCategoryView(),
//           ));
//     }
//   }
// }

// notification 설정
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

Future<void> initNotificationSettings() async {
  // Notification Plugin 객체 생성
  final flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

  // Android Notification 설정
  const AndroidInitializationSettings initializationSettingsAndroid =
      AndroidInitializationSettings('app_icon');

  // iOS Notification 설정 request...:true -> 앱을 키자마자 사용자에게 허용을 요청
  const DarwinInitializationSettings initializationSettingsDarwin = DarwinInitializationSettings(
    requestAlertPermission: true,
    requestBadgePermission: true,
    requestSoundPermission: true,
  );

  // 안드로이드와 iOS Notification 설정을 삽입
  const InitializationSettings initializationSettings = InitializationSettings(
    android: initializationSettingsAndroid,
    iOS: initializationSettingsDarwin,
  );

  // Notification 초기 설정 // 유저가 노티를 클릭했을때 콜백도 넣을수 있음
  //TODO: 노티를 클릭하면 실행할 함수 넣기
  await flutterLocalNotificationsPlugin.initialize(
    initializationSettings,
  );
}

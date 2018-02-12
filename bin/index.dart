import 'slack_rtm/slack_rtm.dart';
import 'dart:io';

Map<String, String> get environment => Platform.environment;

void main() {
  final token = environment['TOKEN'];
  print(token);
  final rtm = new Rtm(token, dumpUnhandle: true)
    ..on(RtmEvent.hello, (msg, sess) {
      print('>> $msg');
    });
  rtm.on(RtmEvent.desktopNotification, (msg, sess) {
    print(msg);
    rtm.send(msg, 'Hej');
  });
  rtm.connect();
}

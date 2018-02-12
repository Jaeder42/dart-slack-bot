import 'slack_rtm/slack_rtm.dart';

void main() {
  final token = 'xoxb-297894098656-1j5nMTbhFQiOtIa2BiyYkXdQ';

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

import 'package:mailer/mailer.dart';
import 'package:mailer/smtp_server.dart';
import 'package:url_launcher/url_launcher.dart';
void sendEmail(email) async {
  var url = Uri.parse("mailto:$email");
  await launchUrl(url);
}







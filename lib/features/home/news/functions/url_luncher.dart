import 'package:url_launcher/url_launcher.dart';

Future urlLuncher(String url) async {
  Uri urL = Uri.parse(url);
  if (await canLaunchUrl(urL)) {
    await launchUrl(
      urL,
      mode: LaunchMode.inAppBrowserView,
      browserConfiguration: const BrowserConfiguration(
        showTitle: true,
      ),
    );
  } else {
    throw Exception('Could not launch $url');
  }
}

import 'package:url_launcher/url_launcher.dart';

/// 이용약관 및 개인정보처리방침 url 링크 열기
Future<void> openTermsUrl() async {
  final String url =
      'https://coconut-resonance-d51.notion.site/damta-2e7d18a69c7080f09b1fc32b12639897';

  final Uri uri = Uri.parse(url);
  if (!await launchUrl(uri, mode: LaunchMode.inAppWebView)) {
    throw Exception('Could not launch $url');
  }
}

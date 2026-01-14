import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:damta/core/theme/app_theme.dart';

class TermsAgreementText extends StatelessWidget {
  const TermsAgreementText({super.key});

  static const String _policyUrl =
      'https://coconut-resonance-d51.notion.site/damta-2e7d18a69c7080f09b1fc32b12639897';

  Future<void> _launchURL(String url) async {
    final Uri uri = Uri.parse(url);
    if (!await launchUrl(uri, mode: LaunchMode.inAppWebView)) {
      throw Exception('Could not launch $url');
    }
  }

  @override
  Widget build(BuildContext context) {
    final variable = vrc(context);
    final fixed = fxc(context);

    final Color subTextColor = variable.detailText ?? Colors.grey;
    final Color linkColor = variable.labelText ?? Colors.black;

    final TextStyle linkStyle = TextStyle(
      color: linkColor,
      fontWeight: FontWeight.bold,
      decoration: TextDecoration.underline,
      decorationColor: linkColor,
      fontSize: 12,
    );

    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        style: TextStyle(
          color: subTextColor,
          fontSize: 12,
          fontFamily: 'pretendard',
        ),
        children: [
          TextSpan(
            text: '이용 약관',
            style: linkStyle,
            recognizer: TapGestureRecognizer()
              ..onTap = () => _launchURL(_policyUrl),
          ),
          const TextSpan(text: ' 및 '),
          TextSpan(
            text: '개인정보처리방침',
            style: linkStyle,
            recognizer: TapGestureRecognizer()
              ..onTap = () => _launchURL(_policyUrl),
          ),
          const TextSpan(text: '에 동의합니다.'),
        ],
      ),
    );
  }
}

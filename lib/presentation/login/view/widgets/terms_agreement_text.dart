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
    final Color textColor = vrc(context).detailText!;

    final TextStyle linkStyle = TextStyle(
      color: textColor,
      fontWeight: FontWeight.w500,
      decoration: TextDecoration.underline,
      decorationColor: textColor,
      fontSize: 12,
    );

    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        style: TextStyle(color: textColor, fontSize: 12),
        children: [
          TextSpan(
            text: '이용약관',
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

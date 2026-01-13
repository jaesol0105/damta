import 'package:damta/presentation/login/view/widgets/terms_agreement_text.dart';
import 'package:flutter/material.dart';
import 'package:kakao_flutter_sdk_user/kakao_flutter_sdk_user.dart';
import 'package:go_router/go_router.dart';
import 'package:damta/core/services/firebase_service.dart';
import 'package:firebase_auth/firebase_auth.dart' as fb_auth;
import 'package:flutter_svg/flutter_svg.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  Future<void> _kakaoLogin() async {
    try {
      final bool isInstalled = await isKakaoTalkInstalled();
      OAuthToken token;

      if (isInstalled) {
        try {
          token = await UserApi.instance.loginWithKakaoTalk();
          print("카카오톡 로그인 성공함 (-_- b)");
        } catch (error) {
          print("!!! 카카오톡 로그인 실패함 (계정으로) !!! : $error");
          token = await UserApi.instance.loginWithKakaoAccount();
          print("카카오 계정(웹)으로 로그인 성공 (-_- b)");
        }
      } else {
        token = await UserApi.instance.loginWithKakaoAccount();
        print("카카오 계정(웹)으로 로그인 성공 (-_- b)");
      }

      final user = await UserApi.instance.me();
      final String? kakaoId = user.id?.toString();

      if (kakaoId != null && mounted) {
        print("사용자 고유 ID : $kakaoId");
        // (임시) 일단은 무조건 임시 학교 찾기 페이지로 이동 (임시로 넣어두려 했는데 앱 실행에 문제 X, 그냥 그대로 가져갈듯)
        fb_auth.User? firebaseUser = await FirebaseService.instance
            .signInWithKakaoIdAndCreateUser(kakaoId);
        //
        if (firebaseUser == null) {
          _showErrorDialog(
            "Firebase 연결 오류",
            "사용자 정보를 Firebase에 연결하는 데 실패했습니다.",
          );
          return;
        }

        context.go('/school', extra: kakaoId);
      } else {
        _showErrorDialog("로그인 오류", "카카오 사용자 ID를 얻을 수 없습니다.");
      }
    } catch (error) {
      print("!!! 최종 로그인 실패 !!! : $error");
      _showErrorDialog("로그인 실패", "로그인 중 오류가 발생했습니다. 다시 시도해 주세요.");
    }
  }

  void _showErrorDialog(String title, String content) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: Text(content),
          actions: <Widget>[
            TextButton(
              child: const Text("확인"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset("assets/images/damta.png", height: 250),
            const SizedBox(height: 70),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40.0),
              child: ElevatedButton(
                onPressed: _kakaoLogin,
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFFEE500),
                  minimumSize: const Size(double.infinity, 52),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                    side: BorderSide.none,
                  ),
                  elevation: 0,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    //
                    SvgPicture.asset(
                      "assets/images/kakao_logo.svg",
                      height: 16.8,
                      width: 18,
                    ),

                    const SizedBox(width: 8),

                    const Text(
                      "카카오 계정으로 로그인",
                      style: TextStyle(
                        color: Colors.black87,
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 24),
            const TermsAgreementText(),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }
}

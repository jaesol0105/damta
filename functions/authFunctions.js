const functions = require("firebase-functions");
const admin = require("firebase-admin");
const axios = require("axios");

/// Kakao Custom Token 발급
exports.createKakaoCustomToken = functions.https.onCall(
  async (data, context) => {
    const kakaoAccessToken = data.accessToken;
    const response = await axios.get(
      "https://kapi.kakao.com/v2/user/me",
      {
        headers: {
          Authorization: `Bearer ${kakaoAccessToken}`,
        },
      }
    );
    const kakaoUser = response.data;
    const uid = `kakao:${kakaoUser.id}`;
    const customToken =
      await admin.auth().createCustomToken(uid);
    return { customToken };
  }
);

/// Naver Custom Token 발급
exports.createNaverCustomToken = functions.https.onCall(
  async (data, context) => {
    const naverAccessToken = data.accessToken;
    const response = await axios.get(
      "https://openapi.naver.com/v1/nid/me",
      {
        headers: {
          Authorization: `Bearer ${naverAccessToken}`,
        },
      }
    );
    const naverUser = response.data.response;
    const uid = `naver:${naverUser.id}`;
    const customToken =
      await admin.auth().createCustomToken(uid);
    return { customToken };
  }
);
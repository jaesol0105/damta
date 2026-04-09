// Firestore 문서가 업데이트될 때 자동으로 실행되는 트리거 함수
// 여기서 모아서 한 번에 export
// 배포 : firebase deploy --only functions

const functions = require("firebase-functions");
const admin = require("firebase-admin");

admin.initializeApp();

// 로그인
const authFunctions = require('./authFunctions');
exports.createKakaoCustomToken = authFunctions.createKakaoCustomToken;
exports.createNaverCustomToken = authFunctions.createNaverCustomToken;

// 푸시알림
const notiFunctions = require('./notiFunctions');
exports.sendPushOnNotificationCreate = notiFunctions.sendPushOnNotificationCreate;
exports.updateBadgeOnRead = notiFunctions.updateBadgeOnRead;
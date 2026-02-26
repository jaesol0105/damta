const functions = require("firebase-functions");
const admin = require("firebase-admin");

/// 푸시 알림 보내기
exports.sendPushOnNotificationCreate = functions
  .region("asia-northeast3")
  .firestore
  .document("notification/{notiId}")
  .onCreate(async (snap) => {
    const noti = snap.data();
    const { uId, pId, pTitle, content, isComment } = noti;
    if (!uId) return;

    // 읽지 않은 알림 개수 (배지 용)
    const unreadSnapshot = await admin.firestore()
      .collection("notification")
      .where("uId", "==", uId)
      .where("isRead", "==", false)
      .get(); 
    const badgeCount = unreadSnapshot.size;

    // 사용자 FCM 토큰
    const userDoc = await admin.firestore().collection("users").doc(uId).get();
    const token = userDoc.get("fcmToken");
    if (!token) return;

    const title = isComment
      ? `'${pTitle}' 에 댓글이 달렸습니다`
      : `'${pTitle}' 에 반응이 생겼습니다`;

    const body = content ?? "";

    // 메세지 생성
    const message = {
      token,

      // iOS 에서 반드시 필요한 notification
      notification: {
        title,
        body,
      },

      // APNs 설정 (이게 없으면 iOS에서 안 뜨는 경우 많음)
      apns: {
        headers: {
          "apns-push-type": "alert",
          "apns-priority": "10",
        },
        payload: {
          aps: {
            alert: {
              title,
              body,
            },
            sound: "default",
            badge: badgeCount,
          },
        },
      },

      // data는 앱 내부 처리용
      data: {
        pId: pId ?? "",
        pTitle: pTitle ?? "",
        content: content ?? "",
        isComment: isComment.toString(),
      },
    };

    // 메세지 전송
    const response = await admin.messaging().send(message);
  },
);

/// 배지 업데이트
exports.updateBadgeOnRead = functions
  .region("asia-northeast3")
  .firestore
  .document("notification/{notiId}")
  .onUpdate(async (change) => {
    const before = change.before.data();
    const after = change.after.data();
    if (before.isRead === false && after.isRead === true) {
      const uId = after.uId;
      const unreadSnapshot = await admin.firestore()
        .collection("notification")
        .where("uId", "==", uId)
        .where("isRead", "==", false)
        .get();
      const badgeCount = unreadSnapshot.size;
      const userDoc = await admin.firestore().collection("users").doc(uId).get();
      const token = userDoc.get("fcmToken");
      if (!token) return;
      await admin.messaging().send({
        token,
        apns: {
          payload: {
            aps: {
              badge: badgeCount,
            },
          },
        },
      });
    }
});
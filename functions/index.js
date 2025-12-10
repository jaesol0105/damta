const functions = require("firebase-functions");
const admin = require("firebase-admin");

admin.initializeApp();

exports.sendPushNotification = functions
  .region("asia-northeast3")
  .https.onCall(async (data, context) => {
    const { uId, pId, pTitle, content, isComment } = data;

    if (!uId) {
      throw new functions.https.HttpsError(
        "invalid-argument",
        "uId is missing"
      );
    }

    const userDoc = await admin.firestore().collection("users").doc(uId).get();
    const token = userDoc.get("fcmToken");

    if (!token) {
      console.log("No FCM token found for user", uId);
      return { success: false, message: "No token" };
    }

    const message = {
      data: {
        pTitle: pTitle ?? "",
        content: content ?? "",
        pId: pId ?? "",
        isComment: String(isComment),
      },
      token: token,
    };

    await admin.messaging().send(message);
    return { success: true };
  });

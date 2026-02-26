import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class UserProfile {
  final String schoolName;

  UserProfile({required this.schoolName});

  factory UserProfile.fromFirestore(Map<String, dynamic> data) {
    // 'schoolName' 필드가 없거나 null이면 기본값
    final schoolName = data['schoolName'] as String? ?? '학교 미지정';

    return UserProfile(schoolName: schoolName);
  }
}

final userProfileProvider = StreamProvider<UserProfile>((ref) {
  final auth = FirebaseAuth.instance;
  final firestore = FirebaseFirestore.instance;

  final user = auth.currentUser;
  if (user == null) {
    return Stream.value(UserProfile(schoolName: '로그인 필요'));
  }

  final userDocRef = firestore.collection('users').doc(user.uid);

  return userDocRef.snapshots().map((snapshot) {
    if (!snapshot.exists || snapshot.data() == null) {
      return UserProfile(schoolName: '학교 미지정');
    }

    return UserProfile.fromFirestore(snapshot.data()!);
  });
});

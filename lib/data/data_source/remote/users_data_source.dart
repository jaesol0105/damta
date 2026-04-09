import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:damta/data/dto/users_dto.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract interface class UsersDataSource {
  /// 사용자 정보 불러오기
  Future<UsersDto> getUser(String uId);

  /// 사용자의 학교 정보 저장
  Future<void> saveSchoolInfo({
    required String schoolName,
    required String officeCode,
    required String schoolCode,
  });
}

class UsersDataSourceImpl implements UsersDataSource {
  const UsersDataSourceImpl(this.firestore);
  final FirebaseFirestore firestore;

  @override
  Future<UsersDto> getUser(String uId) async {
    final doc = await firestore.collection('users').doc(uId).get();
    if (!doc.exists) {
      throw Exception('User not found: $uId');
    }
    return UsersDto.fromJson(doc.data()!);
  }

  @override
  Future<void> saveSchoolInfo({
    required String schoolName,
    required String officeCode,
    required String schoolCode,
  }) async {
    final uid = FirebaseAuth.instance.currentUser?.uid;
    if (uid == null) throw Exception('사용자가 로그인되어 있지 않습니다.');
    await firestore.collection('users').doc(uid).update({
      'schoolName': schoolName,
      'officeCode': officeCode,
      'schoolCode': schoolCode,
    });
  }
}

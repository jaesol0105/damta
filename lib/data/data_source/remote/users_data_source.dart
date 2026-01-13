import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:damta/data/dto/users_dto.dart';

abstract interface class UsersDataSource {
  Future<UsersDto> getUser(String uId);
}

class UsersDataSourceImpl implements UsersDataSource {
  const UsersDataSourceImpl(this.firestore);
  final FirebaseFirestore firestore;

  @override // R
  Future<UsersDto> getUser(String uId) async {
    final doc = await firestore.collection('users').doc(uId).get();
    if (!doc.exists) {
      throw Exception('User not found: $uId');
    }
    return UsersDto.fromJson(doc.data()!);
  }
}

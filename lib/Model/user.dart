import 'package:cloud_firestore/cloud_firestore.dart';

class UserDetails {
  late final String id;
  late final String username;
  late final String photoUrl;
  late final String email;
  late final String displayName;
  late final String bio;

  UserDetails({
    required this.id,
    required this.username,
    required this.photoUrl,
    required this.email,
    required this.displayName,
    required this.bio,
  });

  factory UserDetails.fromDocument(DocumentSnapshot doc) {
    return UserDetails(
        id: doc['id'],
        username: doc['username'],
        photoUrl: doc['photoUrl'],
        email: doc['email'],
        displayName: doc['displayName'],
        bio: doc['bio']);
  }
}

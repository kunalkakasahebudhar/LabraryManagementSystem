import 'package:flutter/material.dart';
import '../data/user_profile_model.dart';

class ProfileController extends ChangeNotifier {
  static final ProfileController _instance = ProfileController._internal();

  factory ProfileController() {
    return _instance;
  }

  ProfileController._internal();

  UserProfile _userProfile = UserProfile(
    name: 'hello joy',
    email: 'hello@example.com',
    college: 'MIT College',
    course: 'B.Tech CS',
    address: 'Pune, Maharashtra',
  );

  UserProfile get userProfile => _userProfile;

  void updateProfile({
    String? name,
    String? email,
    String? college,
    String? course,
    String? address,
  }) {
    _userProfile = _userProfile.copyWith(
      name: name,
      email: email,
      college: college,
      course: course,
      address: address,
    );
    notifyListeners();
  }
}

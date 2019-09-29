import 'package:chyc_sie_roboty/domain/auth/user.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:rxdart/rxdart.dart';

abstract class UserRepository {
  Observable login(FirebaseUser user);

  Observable<User> gimmeUser();

  Observable filterCourses(String category, String localization);

  Observable<User> userState();

  Observable filterJobs(String localization, String craft, String jobType, int experience);
}

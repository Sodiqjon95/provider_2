import 'package:flutter/foundation.dart';
import '../data_layer/db/cached_user_model.dart';
import '../data_layer/models/user_data.dart';
import '../data_layer/repository/user_repository.dart';

class UserViewModel extends ChangeNotifier {
  UserViewModel({required this.userRepository});

  final UserRepository userRepository;

  List<CachedUser> cachedUsers = [];
  UserData? userData;
  bool isLoading = false;

  void getCachedUsers() async {
    isLoading = true;
    notifyListeners();
    cachedUsers = await userRepository.getCachedUsers();
    isLoading = false;
    notifyListeners();
  }

  void getUserData() async {
    isLoading = true;
    notifyListeners();
    userData = await userRepository.getUserData();
    await userRepository.insertUserFromApi(userData: userData!);
    cachedUsers = await userRepository.getCachedUsers();
    isLoading = false;
    notifyListeners();
  }

  void deleteAllUsers()async{
    isLoading = true;
    notifyListeners();
    await userRepository.deleteAllUsers();
    cachedUsers = await userRepository.getCachedUsers();
    isLoading = false;
    notifyListeners();
  }


  void addUser( CachedUser cachedUser )async{
    isLoading = true;
    notifyListeners();
    // userData  = await userRepository.getUserData();
    // await userRepository.insertUserFromApi(userData: userData!);
    await userRepository.insertCachedUser(cachedUser);
    cachedUsers = await userRepository.getCachedUsers();
    isLoading = false;
    notifyListeners();
  }

}
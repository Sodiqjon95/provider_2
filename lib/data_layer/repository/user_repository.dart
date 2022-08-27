import '../db/cached_user_model.dart';
import '../db/local_database.dart';
import '../models/user_data.dart';
import '../services/api_service.dart';

class UserRepository {
  UserRepository({required ApiService apiService}) {
    _apiService = apiService;

  }

  late ApiService _apiService;

  Future<UserData> getUserData() => _apiService.getUserData();

  //-----------------------Local Users side-------------------

  Future<List<CachedUser>> getCachedUsers() => LocalDataBase.getAllCachedUsers();

  Future<CachedUser> insertCachedUser(CachedUser cachedUser) => LocalDataBase.insertCachedUser(cachedUser);


  Future<CachedUser> insertUserFromApi({required UserData userData}) => LocalDataBase.insertCachedUserFromApi(userData);

  Future<int> deleteAllUsers() => LocalDataBase.deleteAllCachedUsers();

}

abstract class IAuthenServiceRepository {
  Future<Map<String, dynamic>> authen(String userName, String password);
}

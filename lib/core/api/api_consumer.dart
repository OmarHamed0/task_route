
abstract class ApiConsumer{
  Future<dynamic>get({
    required String endPoint,
    Map<String,dynamic>?query,
    Map<String,dynamic>?data,
});
}
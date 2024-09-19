abstract class Failures{
 final String errorMassage;
  Failures({required this.errorMassage});

   @override
  String toString() {
     return errorMassage;
  }
}
class ServerFailure extends Failures{
  ServerFailure({required super.errorMassage});
}
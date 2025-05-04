import 'package:dio/dio.dart';

abstract class Failure {
  final String errorMessage;

  Failure(this.errorMessage);
}

class ServerFailure extends Failure {
  ServerFailure(super.errorMessage);
  factory ServerFailure.fromDioError(DioException dioError) {
    switch (dioError.type) {
      case DioExceptionType.connectionTimeout:
        return ServerFailure("Conection time out with ApiServer");
      case DioExceptionType.sendTimeout:
        return ServerFailure("Send time out with ApiServer");
      case DioExceptionType.receiveTimeout:
        return ServerFailure("Recive time out with ApiServer");
      case DioExceptionType.badCertificate:
        return ServerFailure(
            "An error occurred while establishing a secure connection Please try Later!.");
      case DioExceptionType.badResponse:
        return ServerFailure.fromBadResponse(dioError.response!
            .statusCode!); //ServerFailure.fromBadResponse(dioError.response!.statusCode!);
      case DioExceptionType.cancel:
        return ServerFailure("Requst with api service is canceld");
      case DioExceptionType.connectionError:
        return ServerFailure(
            "Unable to establish a conection to the server please check internetConection and try again ");

      case DioExceptionType.unknown:
        return ServerFailure("Unexpected Error please try later!");

      default:
        return ServerFailure(
            "Opps! There is an Error. please try later!defult");
    }
  }

  factory ServerFailure.fromBadResponse(int statusCode) {
    if (statusCode == 400 || statusCode == 401 || statusCode == 403) {
      return ServerFailure(
          "Opps Wrong username or password or there is an error with Api request or . please try later!");
    } else if (statusCode == 404) {
      return ServerFailure("Your request not found. please try later!");
    } else if (statusCode == 500) {
      return ServerFailure("Internal server error. please try later!");
    } else {
      return ServerFailure(
          "Opps there is an error please try later!frombadrespons");
    }
  }
}

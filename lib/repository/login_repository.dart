// import 'package:connectivity_plus/connectivity_plus.dart';
// import 'package:dartz/dartz.dart';
// import 'package:userapp/model/request/login_request_model.dart';
// import 'package:userapp/models/login_response_model.dart';

// import '../../../error/exceptions.dart';
// import '../../../error/failures.dart';
// import '../../../network/network_info.dart';
// import '../../sources/remote_data_source.dart';

// class LoginRepository {
//   // final RemoteDataSource remoteDataSource;
//   final NetworkInfo networkInfo;

//   LoginRepository({required this.networkInfo});

//   /// Login
//   Future<Either<Failure, LoginResponseModel>> login(
//       LoginRequestModel loginRequestModel) async {
//     if (await networkInfo.isConnected == ConnectivityResult.none) {
//       return Left(ConnectionFailure());
//     } else {
//       try {
//         // final response = await remoteDataSource.login(loginRequestModel);
//         // return Right(response);
//       } on ServerException catch (ex) {
//         return Left(ServerFailure(ex.errorResponseModel));
//       }
//     }
//   }
// }

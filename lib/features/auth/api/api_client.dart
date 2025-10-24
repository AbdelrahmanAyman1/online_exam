import 'dart:io';

import 'package:dio/dio.dart';
import 'package:online_exam/features/auth/data/model/login_request_model.dart';
import 'package:online_exam/features/auth/data/model/sign_up_request.dart';
import 'package:retrofit/retrofit.dart';
import 'package:online_exam/features/auth/data/model/sign_up_response_dto.dart';

import '../../home/data/model/subject_model.dart';
part 'api_client.g.dart';

@RestApi(baseUrl: 'https://exam.elevateegy.com/api/v1/')
abstract class ApiClient {
  factory ApiClient(Dio dio, {String? baseUrl}) = _ApiClient;

  @POST('auth/signup')
  Future<SignUpResponseDto> signUp(
    @Body() SignUpRequestModel signUpRequestModel,
  );

  @POST('auth/signin')
  Future<SignUpResponseDto> signIn(@Body() LoginRequestModel loginRequestModel);

  @GET('subjects')
  Future<List<SubjectModel>> getAllSubjects(
      @Header('token') String token,
      );

  @GET('subjects/{id}')
  Future<SubjectModel> getSubjectById(
      @Header('token') String token,
      @Path('id') int id,
      );

  @MultiPart()
  @PUT('subjects/{id}')
  Future<void> updateSubject(
      @Header('token') String token,
      @Path('id') int id,
      @Part(name: 'name') String name,
      @Part(name: 'icon') File icon,
      );


  @GET('subjects/search')
  Future<List<SubjectModel>> searchSubjects(
      @Header('token') String token,
      @Query('query') String query,
      );
  @DELETE('subjects/{id}')
  Future<void> deleteSubject(
      @Header('token') String token,
      @Path('id') int id,
      );
}

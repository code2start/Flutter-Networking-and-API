import 'package:chopper/chopper.dart';
part 'author_service.chopper.dart';

@ChopperApi(baseUrl: '/authors')
abstract class AuthorService extends ChopperService {
  @Get()
  Future<Response> getAllAuthors();

  @Get(path: '/{id}')
  Future<Response> getAuthorById(@Path() int id);

  @Post()
  Future<Response> createAuthor(@Body() Map<String, dynamic> author);

  @Delete(path: '/{id}')
  Future<Response> deleteAuthor(@Path() int id);

  @Put(path: '/{id}')
  Future<Response> updateAuthor(
      @Path() int id, @Body() Map<String, dynamic> author);

  static AuthorService create() {
    final client = ChopperClient(
        baseUrl: 'http://10.0.2.2:8888',
        services: [_$AuthorService()],
        converter: JsonConverter(),
        interceptors: [
          /* HttpLoggingInterceptor(), */
          /* CurlInterceptor(), */
          (Request request) async {
            print(request.method);
            return request;
          },
          (Response response) async {
            print(response.statusCode);
            return response;
          }
        ]);
    return _$AuthorService(client);
  }
}

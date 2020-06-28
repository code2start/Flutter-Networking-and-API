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

  static AuthorService create() {
    final client = ChopperClient(
        baseUrl: 'http://10.0.2.2:8888',
        services: [_$AuthorService()],
        converter: JsonConverter());
    return _$AuthorService(client);
  }
}

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'author_service.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

class _$AuthorService extends AuthorService {
  _$AuthorService([ChopperClient client]) {
    if (client == null) return;
    this.client = client;
  }

  final definitionType = AuthorService;

  Future<Response> getAllAuthors() {
    final $url = '/authors';
    final $request = Request('GET', $url, client.baseUrl);
    return client.send<dynamic, dynamic>($request);
  }

  Future<Response> getAuthorById(int id) {
    final $url = '/authors/${id}';
    final $request = Request('GET', $url, client.baseUrl);
    return client.send<dynamic, dynamic>($request);
  }

  Future<Response> createAuthor(Map<String, dynamic> author) {
    final $url = '/authors';
    final $body = author;
    final $request = Request('POST', $url, client.baseUrl, body: $body);
    return client.send<dynamic, dynamic>($request);
  }

  Future<Response> deleteAuthor(int id) {
    final $url = '/authors/${id}';
    final $request = Request('DELETE', $url, client.baseUrl);
    return client.send<dynamic, dynamic>($request);
  }

  Future<Response> updateAuthor(int id, Map<String, dynamic> author) {
    final $url = '/authors/${id}';
    final $body = author;
    final $request = Request('PUT', $url, client.baseUrl, body: $body);
    return client.send<dynamic, dynamic>($request);
  }
}

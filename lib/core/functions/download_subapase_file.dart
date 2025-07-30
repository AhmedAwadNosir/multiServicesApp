import 'package:http/http.dart' as http;
import 'dart:io';
import 'package:path_provider/path_provider.dart';

Future<String> downloadFile(String url) async {
  final resp = await http.get(Uri.parse(url));
  if (resp.statusCode != 200) throw Exception('Download failed');
  final dir = await getTemporaryDirectory();
  final name = url.split('/').last;
  final file = File('${dir.path}/$name');
  await file.writeAsBytes(resp.bodyBytes);
  return file.path;
}

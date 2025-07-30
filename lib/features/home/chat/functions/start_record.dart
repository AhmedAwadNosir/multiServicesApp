import 'package:path_provider/path_provider.dart';
import 'package:record/record.dart';
import 'package:uuid/uuid.dart';

Future<dynamic> startRecord({required AudioRecorder record}) async {
  final location = await getApplicationDocumentsDirectory();
  String name = Uuid().v1();
  if (await record.hasPermission()) {
    await record.start(RecordConfig(), path: location.path + name + ".m4a");
  }
}

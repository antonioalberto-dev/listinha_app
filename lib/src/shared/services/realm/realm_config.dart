import 'package:listinha/src/shared/services/realm/models/configuration/configuration_model.dart';
import 'package:listinha/src/shared/services/realm/models/task/task_model.dart';
import 'package:realm/realm.dart';

LocalConfiguration config = Configuration.local(
  [
    ConfigurationModel.schema,
    Task.schema,
    TaskBoard.schema,
  ],
  initialDataCallback: (realm) {
    realm.add(ConfigurationModel('system'));
  },
  schemaVersion: 1,
);

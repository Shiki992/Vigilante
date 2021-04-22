import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

class SessionService extends ChangeNotifier {
  String _session;

  String get session {
    if (_session == null) _session = Uuid().v4();

    return _session;
  }
}

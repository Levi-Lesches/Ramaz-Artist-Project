import "package:flutter/foundation.dart";

abstract class Model with ChangeNotifier {
	Future<void> init();
}
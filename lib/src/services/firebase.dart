import "package:firebase_core/firebase_core.dart" as plugin;

import "service.dart";

class Firebase extends Service {
	@override
	Future<void> init() => plugin.Firebase.initializeApp();
}
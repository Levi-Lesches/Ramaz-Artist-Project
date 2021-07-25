import "package:firebase_core/firebase_core.dart" as plugin;

import "service.dart";

/// The Firebase Core service.
/// 
/// This service initalizes Firebase, which is required for all other Firebase
/// services to function.
class Firebase extends Service {
	@override
	Future<void> init() => plugin.Firebase.initializeApp();
}
/// The library for service-related code. 
/// 
/// See the discussion at [Service] for why these classes are needed and what 
/// they do. When writing front-end code, rely on the [Services] singleton by
/// using [Services.instance].
/// 
/// All files are in `lib/src/services`.
library services;

import "src/services/firebase.dart";
import "src/services/firestore.dart";
import "src/services/service.dart";
import "src/services/storage.dart";

export "src/services/firestore.dart";
export "src/services/storage.dart";

/// The services manager. 
/// 
/// This service doesn't handle third-party code. Instead, it manages other
/// services and bundles their initialization methods together. This way, all 
/// services can be managed by convenient calls to this service. 
/// 
/// Do not create new instances of this object. Use [instance] as a singleton.
class Services extends Service {
	/// The singleton instance of this service. 
	static final Services instance = Services();

	/// The Firebase Core service. 
	/// 
	/// This service must be initialized before other Firebase services. 
	final Firebase firebase = Firebase();

	/// The Firebase Cloud Firestore service. 
	final Firestore firestore = Firestore();

	/// The Firebase Cloud Storage service. 
	final Storage storage = Storage();

	@override
	Future<void> init() async {
		await firebase.init();
		await firestore.init();
		await storage.init();
	}
}

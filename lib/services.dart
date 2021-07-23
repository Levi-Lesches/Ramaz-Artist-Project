import "src/services/firebase.dart";
import "src/services/firestore.dart";
import "src/services/service.dart";
import "src/services/storage.dart";

export "src/services/firestore.dart";
export "src/services/storage.dart";

class Services extends Service {
	static final Services instance = Services();

	final Firebase firebase = Firebase();
	final Firestore firestore = Firestore();
	final Storage storage = Storage();

	@override
	Future<void> init() async {
		await firebase.init();
		await firestore.init();
		await storage.init();
	}
}

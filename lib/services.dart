import "src/services/firebase.dart";
import "src/services/firestore.dart";
import "src/services/service.dart";

class Services extends Service {
	static final Services instance = Services();

	final Firebase firebase = Firebase();
	final Firestore firestore = Firestore();

	@override
	Future<void> init() async {
		await firebase.init();
		await firestore.init();
	}
}

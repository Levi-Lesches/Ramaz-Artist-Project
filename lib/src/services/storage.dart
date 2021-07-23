import "package:firebase_storage/firebase_storage.dart";
import "service.dart";

export "package:firebase_storage/firebase_storage.dart" show Reference;

class ProjectFiles {
	final String name;
	final Reference dir;
	ProjectFiles(this.name) : dir = Storage.storage.ref(name);

	Reference get thumbnail => dir.child("thumbnail");
	Reference get studentArt => dir.child("student-art");
	Future<List<Reference>> get episodeArt async => 
		(await dir.child("episode-art").listAll()).items;
}

class Storage extends Service {
	static final FirebaseStorage storage = FirebaseStorage.instance;

	static final Reference ramazLogo = storage.ref("RamazLogo.png");

	@override
	Future<void> init() async {}
}

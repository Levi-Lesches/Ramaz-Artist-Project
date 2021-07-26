import "package:firebase_storage/firebase_storage.dart";
import "package:artist_project/data.dart";

import "service.dart";

export "package:firebase_storage/firebase_storage.dart" show Reference;

/// A convenience class to return [Reference]s to files in a project. 
/// 
/// To be forwards-compatible with any type of image, this class doesn't use 
/// image extensions such as `.png` or `.jpg`.
class ProjectFiles {
	/// The directory this project's files are located in.
	/// 
	/// By default, this is the student's name.
	final Reference dir;

	/// Locates files for a project using the student's name.
	ProjectFiles(Project project) : 
		dir = Storage.storage.ref(project.student.name);

	/// The thumbnail image for this project.
	Reference get thumbnail => dir.child("thumbnail");

	/// The student's artwork to display.
	Reference get studentArt => dir.child("student-art");

	/// A list of all the art pieces shown in this project's video.
	Future<List<Reference>> get episodeArt async => 
		(await dir.child("episode-art").listAll()).items;
}

/// The Firebase Cloud Storage service. 
/// 
/// This service currently does nothing, as the `firebase_storage` package 
/// exports convenient APIs. Use the [ProjectFiles] class to get files 
/// belonging to a project.
class Storage extends Service {
	/// The Firebase Cloud Storage singleton object.
	static final FirebaseStorage storage = FirebaseStorage.instance;

	/// The location of the Ramaz Logo.
	static final Reference ramazLogo = storage.ref("RamazLogo.png");

	@override
	Future<void> init() async {}
}

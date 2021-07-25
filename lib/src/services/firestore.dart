import "package:cloud_firestore/cloud_firestore.dart";
import "package:artist_project/data.dart";
import "service.dart";

extension <T> on Query<T> {
	/// Simplifies getting all the results from this query.
	Future<List<T>> getAll() async {
		final QuerySnapshot<T> snapshot = await get();
		final List<QueryDocumentSnapshot<T>> documents = snapshot.docs;
		return [
			for (final QueryDocumentSnapshot<T> document in documents)
				document.data()
		];
	}
}

/// The Firebase Cloud Firestore service. 
/// 
/// This service defines methods to retrieve data, in structured form, from the
/// Cloud Firestore database. The data is structured according to the classes
/// from the `data` library.
class Firestore extends Service {
	/// The [FirebaseFirestore] singleton object.
	static final FirebaseFirestore firestore = FirebaseFirestore.instance;

	/// The projects collection in Firestore. 
	/// 
	/// Entries are represented by the [Project] class from the `data` library.
	CollectionReference<Project> projects = firestore.collection("projects")
		.withConverter<Project>(
			fromFirestore: (snapshot, _) => Project.fromJson(snapshot.data()!),
			toFirestore: (project, _) => project.toJson(),
		);

	@override
	Future<void> init() async { }

	/// Gets all the projects for a given season.
	Future<List<Project>> getSeason(int season) => projects
		.where("season", isEqualTo: season)
		.orderBy("student.name")
		.getAll();

	/// Returns the project belonging to a specific student.
	/// 
	/// If the student cannot be found, returns null.
	Future<Project?> getProject(String name) async {
		final Query<Project> query = projects.where("student.name", isEqualTo: name);
		final QuerySnapshot<Project> snapshot = await query.get();
		final List<QueryDocumentSnapshot<Project>> documents = snapshot.docs;
		if (documents.isEmpty) return null;
		final QueryDocumentSnapshot<Project> result = documents.first;
		return result.data();
	}
}

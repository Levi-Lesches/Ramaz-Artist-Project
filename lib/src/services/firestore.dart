import "package:cloud_firestore/cloud_firestore.dart";
import "package:artist_project/data.dart";
import "service.dart";

extension <T> on Query<T> {
	Future<List<T>> getAll() async {
		final QuerySnapshot<T> snapshot = await get();
		final List<QueryDocumentSnapshot<T>> documents = snapshot.docs;
		return [
			for (final QueryDocumentSnapshot<T> document in documents)
				document.data()
		];
	}
}

class Firestore extends Service {
	static final FirebaseFirestore firestore = FirebaseFirestore.instance;

	CollectionReference<Project> projects = firestore.collection("projects")
		.withConverter<Project>(
			fromFirestore: (snapshot, _) => Project.fromJson(snapshot.data()!),
			toFirestore: (project, _) => project.toJson(),
		);

	@override
	Future<void> init() async { }

	Future<List<Project>> getSeason(int season) => projects
		.where("season", isEqualTo: season)
		.getAll();
}

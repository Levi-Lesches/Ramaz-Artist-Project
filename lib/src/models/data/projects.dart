import "package:artist_project/services.dart";
import "package:artist_project/data.dart";

import "model.dart";

class Projects extends Model {
	final List<List<Project>> projects = [];

	@override
	Future<void> init() async {
		int season = 1;
		List<Project> seasonProjects = [];
		do {  // I repeat the condition twice here but I don't like while (true)
			seasonProjects = await Services.instance.firestore.getSeason(season++);
			if (seasonProjects.isNotEmpty) projects.add(seasonProjects);
		} while (seasonProjects.isNotEmpty);
	}
}

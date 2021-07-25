import "package:artist_project/services.dart";
import "package:artist_project/data.dart";

import "model.dart";

/// The data model for the projects. 
class Projects extends Model {
	/// Holds all the projects, sorted by season.
	/// 
	/// Each season has its own sublist. So `projects [0]` is season 1.
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

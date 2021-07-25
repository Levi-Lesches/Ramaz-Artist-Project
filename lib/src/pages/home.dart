import "package:flutter/material.dart";
import "package:provider/provider.dart";

import "package:artist_project/models.dart";
import "package:artist_project/data.dart";
import "package:artist_project/widgets.dart";

import "project.dart";

/// The home page. 
/// 
/// Shows all the students for all the seasons. Clicking on a name takes the 
/// user to a [ProjectPage] for that student's project. 
class HomePage extends StatefulWidget {
	@override
	HomePageState createState() => HomePageState();
}

/// The state for the home page. 
/// 
/// Allows the user to view different seasons. 
class HomePageState extends State<HomePage> {
	/// The season being shown on-screen.
	int season = 0;

	@override
	Widget build(BuildContext context) => ChangeNotifierProvider<Projects>.value(
		value: Models.instance.projects,
		builder: (_, __) => Scaffold(
			backgroundColor: Colors.white,
			body: Center(
				child: FractionallySizedBox(
					widthFactor: 3/4,
					// A ListView can't center its children horizontally, so we use a 
					// SingleChildScrollView of a Column instead.
					child: SingleChildScrollView(child: Column(
						children: [
							Text(
								"The Ramaz Upper School", 
								style: Theme.of(context).textTheme.headline5,
							),
							const SizedBox(height: 8),
							ArtistProjectLogo(
								style: Theme.of(context).textTheme.headline2,
							),
							const SizedBox(height: 8),
							Text(
								"What artists see when they look at The Met", 
								style: Theme.of(context).textTheme.subtitle1,
							),

							const SizedBox(height: 72),
							const Divider(),
							const SizedBox(height: 16),

							NamesList(season: season),

							const SizedBox(height: 4),
							const Divider(),
							const SizedBox(height: 24),

							ArtistProjectLogo(
								style: Theme.of(context).textTheme.subtitle1,
								prefix: "ABOUT ",
							)
						]
					))
				)
			)
		)
	);
}

/// A list of all the student's names. 
/// 
/// Clicking on a name takes the user to a [ProjectPage] for that student's 
/// project.
class NamesList extends StatelessWidget {
	/// The season being shown.
	final int season;

	/// Creates a list of names for the given season.
	const NamesList({required this.season});

	@override
	Widget build(BuildContext context) => Consumer(
		builder: (_, Projects model, __) {
			final List<Project> seasonProjects = model.projects [season];
			final int middle = seasonProjects.length ~/ 2;
			final List<Project> left = seasonProjects.sublist(0, middle);
			final List<Project> right = seasonProjects.sublist(middle);
			return Row(
				mainAxisAlignment: MainAxisAlignment.spaceBetween,
				children: [
					const SizedBox(width: 8),
					for (List<Project> projects in [left, right]) Column(
						children: [
							for (final Project project in projects) ...[
								InkWell(
									onTap: () => Navigator.of(context).push(
										MaterialPageRoute(
											builder: (_) => ProjectPage(project),
										)
									),
									child: Text(
										project.student.name, 
										style: Theme.of(context).textTheme.headline5
											?.copyWith(color: Colors.red, fontWeight: FontWeight.bold)
									),
								),
								const SizedBox(height: 12),
							]
						],
					),
					const SizedBox(width: 4),
				],
			);
		}
	);
}

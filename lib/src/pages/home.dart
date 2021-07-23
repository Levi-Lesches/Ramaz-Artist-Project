import "package:flutter/material.dart";
import "package:provider/provider.dart";

import "package:artist_project/models.dart";
import "package:artist_project/data.dart";

import "project.dart";

class HomePage extends StatefulWidget {
	@override
	HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
	int season = 0;

	Widget middleBold(
		TextStyle? basic, 
		String beginning, 
		String middle, 
		String end
	) => RichText(text: TextSpan(
		children: [
			TextSpan(text: beginning, style: basic),
			TextSpan(text: middle, style: basic?.copyWith(fontWeight: FontWeight.bold)),
			TextSpan(text: end, style: basic),
		]
	));

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
							middleBold(
								Theme.of(context).textTheme.headline2?.copyWith(color: Colors.black),
								"THE ", "ARTIST", " PROJECT"
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

							middleBold(
								Theme.of(context).textTheme.subtitle1,
								"ABOUT THE ", "ARTIST", " PROJECT"
							)
						]
					))
				)
			)
		)
	);
}

class NamesList extends StatelessWidget {
	final int season;
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

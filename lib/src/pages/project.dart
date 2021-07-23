import "package:flutter/material.dart";

import "package:artist_project/data.dart";
import "package:artist_project/pages.dart";
import "package:artist_project/widgets.dart";

class ProjectPage extends StatelessWidget {
	final Project project;
	const ProjectPage(this.project);

	@override
	Widget build(BuildContext context) => Scaffold(
		appBar: Header(),
		body: ListView(
			children: [
				const SizedBox(height: 12),
				ArtistProjectLogo(
					style: const TextStyle(fontStyle: FontStyle.italic),
					onTap: () => Navigator.of(context).pushNamed(Routes.home)
				),
				const SizedBox(height: 24),
				Text(
					project.student.name,
					style: Theme.of(context).textTheme.headline4
						?.copyWith(fontStyle: FontStyle.italic)
				),
				RichText(text: TextSpan(
					children: [
						TextSpan(
							text: project.artist == null ? "on " : "on ${project.artist}'s ",
							style: Theme.of(context).textTheme.subtitle1
						),
						TextSpan(
							text: project.artwork, 
							style: Theme.of(context).textTheme.subtitle1
								?.copyWith(fontStyle: FontStyle.italic)
						),
					]
				)),

				const SizedBox(height: 12),
				const Divider(),
				Text(project.quote, style: Theme.of(context).textTheme.headline3),
				const Divider(),
				const SizedBox(height: 12),

				Text("ABOUT THE ARTIST", style: Theme.of(context).textTheme.headline5),
				StudentBox(project.student),
				const SizedBox(height: 8),

				Text(
					"AS SEEN IN THE EPISODE", 
					style: Theme.of(context).textTheme.headline5
				),
				EpisodeArtBox(project.episodeArt),
			]
		)
	);
}

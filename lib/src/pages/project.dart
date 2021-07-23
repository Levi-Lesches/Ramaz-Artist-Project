import "package:flutter/material.dart";
import "package:youtube_player_iframe/youtube_player_iframe.dart";

import "package:artist_project/data.dart";
import "package:artist_project/pages.dart";
import "package:artist_project/services.dart";
import "package:artist_project/widgets.dart";

class ProjectPage extends StatefulWidget {
	final Project project;
	const ProjectPage(this.project);

	@override
	ProjectPageState createState() => ProjectPageState();
}

class ProjectPageState extends State<ProjectPage> {
	Project get project => widget.project;
	late YoutubePlayerController videoController;

	List<String>? episodeArtLinks;
	String? studentArtLink, ramazLogoLink;

	Future<void> downloadImages() async {
		final ProjectFiles files = ProjectFiles(project.student.name);
		final List<Reference> episodeFiles = await files.episodeArt;
		ramazLogoLink = await Storage.ramazLogo.getDownloadURL();
		setState(() {});
		studentArtLink = await files.studentArt.getDownloadURL();
		setState(() {});
		episodeArtLinks = await Future.wait([
			for (final Reference file in episodeFiles) file.getDownloadURL()
		]);
		setState(() {});
	}

	@override
	void initState() {
		super.initState();
		downloadImages();
		videoController = YoutubePlayerController(
			initialVideoId: project.videoLink,
			params: const YoutubePlayerParams(
				showFullscreenButton: true,
			),
		);

	}

	@override
	Widget build(BuildContext context) => Scaffold(
		appBar: Header(ramazLogoLink: ramazLogoLink),
		body: Center(
			child: ConstrainedBox(
				constraints: const BoxConstraints(maxWidth: 600),
				child: ListView(
					children: [
						const SizedBox(height: 24),
						Center(child: ArtistProjectLogo(
							style: Theme.of(context).textTheme.headline4,
							onTap: () => Navigator.of(context).pushNamed(Routes.home)
						)),

						const SizedBox(height: 72),
						YoutubePlayerIFrame(controller: videoController),
						const SizedBox(height: 72),

						Text(
							project.student.name,
							style: Theme.of(context).textTheme.headline5
						),

						const SizedBox(height: 8),
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

						const SizedBox(height: 48),
						const Divider(),
						Container(
							margin: const EdgeInsets.all(10),
							child: Text(
								'"${project.quote}"', 
								style: Theme.of(context).textTheme.headline3
							)
						),
						const Divider(),
						const SizedBox(height: 36),

						Text("ABOUT THE ARTIST", style: Theme.of(context).textTheme.headline5),
						StudentBox(project.student, imageLink: studentArtLink),
						const SizedBox(height: 8),

						Text(
							"AS SEEN IN THE EPISODE", 
							style: Theme.of(context).textTheme.headline5
						),
						EpisodeArtBox(project.episodeArt),
					]
				)
			)
		)
	);
}

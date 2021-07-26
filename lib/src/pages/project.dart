import "package:flutter/material.dart";
import "package:youtube_player_iframe/youtube_player_iframe.dart";

import "package:artist_project/data.dart";
import "package:artist_project/services.dart";
import "package:artist_project/widgets.dart";

/// A page to show off a project.
/// 
/// Each project has: 
/// 
/// - a video
/// - a quote from the student
/// - a short section about the student
/// - a short section about the art seen in the video
class ProjectPage extends StatefulWidget {
	/// The project being displayed. 
	final Project project;

	/// Creates a page to show off a project. 
	const ProjectPage(this.project);

	@override
	ProjectPageState createState() => ProjectPageState();
}

/// The state for a [ProjectPage].
/// 
/// Manages loading the images. 
class ProjectPageState extends State<ProjectPage> {
	/// The controller for the YouTube plugin.
	/// 
	/// Needs to be set using the widget's project field, so it's marked
	/// `late final` and set properly in [initState].
	late final YoutubePlayerController videoController;

	/// Links for all the "As seen in the episode" art pieces. 
	List<String>? episodeArtLinks;

	/// Links for various images on the page. 
	String? studentArtLink, ramazLogoLink;

	/// The project being shown. 
	/// 
	/// Refers to [ProjectPage.project] for convenience. 
	Project get project => widget.project;

	/// Saves the links to the images on the page to the appropriate variables.
	Future<void> getImages() async {
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
		getImages();
		videoController = YoutubePlayerController(initialVideoId: project.videoLink);
	}

	@override
	Widget build(BuildContext context) => Scaffold(
		appBar: Header(ramazLogoLink: ramazLogoLink),
		body: Center(
			child: ConstrainedBox(
				constraints: const BoxConstraints(maxWidth: 600),
				// ListView disposes its children. The YouTube player is an HTML plugin
				// and will reset every time it is scrolled out of view.  
				// TODO: Fix this behavior.
				child: ListView(
					children: [
						const SizedBox(height: 24),
						ArtistProjectLogo(
							style: Theme.of(context).textTheme.headline4,
							onTap: () => Navigator.of(context).pop(),
						),

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

						Text("ABOUT THE ARTIST", style: Theme.of(context).textTheme.subtitle1),
						const SizedBox(height: 8),
						StudentBox(project.student, imageLink: studentArtLink),
						const SizedBox(height: 48),

						Text(
							"AS SEEN IN THE EPISODE", 
							style: Theme.of(context).textTheme.subtitle1
						),
						const SizedBox(height: 8),
						if (episodeArtLinks != null)
							EpisodeArtBox(project.episodeArt, episodeArtLinks!),
					]
				)
			)
		)
	);
}

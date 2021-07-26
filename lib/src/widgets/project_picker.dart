import "package:flutter/material.dart";
import "package:provider/provider.dart";

import "package:artist_project/data.dart";
import "package:artist_project/models.dart";
import "package:artist_project/pages.dart";
import "package:artist_project/services.dart";

/// A list of all the student's names. 
/// 
/// Clicking on a name takes the user to a [ProjectPage] for that student's 
/// project. Hovering over a name causes the opposite side of the screen
/// to show that project's thumbnail.
class ProjectPicker extends StatefulWidget {
	/// The season being shown.
	final int season;

	/// Creates a list of names for the given season.
	const ProjectPicker({required this.season});

	@override
	ProjectPickerState createState() => ProjectPickerState();
}

/// The state for [ProjectPicker]. 
/// 
/// Manages the on-hover animations for the projects. 
class ProjectPickerState extends State<ProjectPicker> {
	/// Which projects are currently being shown in the on-hover animation.
	/// 
	/// This is indexed by -1 and 1 instead of a regular list so that the logic
	/// of switching sides is simple: `side * -1`.
	final Map<int, Project?> hovering = {-1: null, 1: null};

	@override
	Widget build(BuildContext context) => Consumer<Projects>(
		builder: (_, Projects model, __) {
			final List<Project> seasonProjects = model.projects [widget.season];
			final int middle = seasonProjects.length ~/ 2;
			final List<Project> left = seasonProjects.sublist(0, middle);
			final List<Project> right = seasonProjects.sublist(middle);
			final Map<int, List<Project>> sides = {-1: left, 1: right};

			return Row(
				mainAxisAlignment: MainAxisAlignment.spaceBetween,
				children: [
					const SizedBox(width: 8),
					for (final int side in [-1, 1]) AnimatedCrossFade(
						crossFadeState: hovering [side] == null 
							? CrossFadeState.showFirst
							: CrossFadeState.showSecond,
						duration: const Duration(milliseconds: 750),
						firstChild: NamesList(
							sides [side]!,
							onHover: (Project? project) => setState(
								() => hovering [side * -1] = project
							),
						),
						secondChild: ThumbnailPreview(project: hovering [side]),
						layoutBuilder: (Widget top, _, Widget bottom, __) => Stack(
							alignment: Alignment.center,
							children: [bottom, top],
						)
					),
					const SizedBox(width: 4),			
				]
			);
		}
	);
}

/// A list of projects with onHover and onTap callbacks. 
/// 
/// Displays the name of the student for each project. 
class NamesList extends StatelessWidget {
	/// The projects to display.
	final List<Project> projects;

	/// A callback for when the user hovers over a project.
	/// 
	/// When the user stops hovering, this will be called with `null`. 
	final void Function(Project?) onHover;

	/// Creates a list of projects that can be hovered or clicked on.
	const NamesList(this.projects, {required this.onHover});

	@override
	Widget build(BuildContext context) => Column(
		children: [
			for (final Project project in projects) ...[
				InkWell(
					onTap: () => Navigator.of(context).push(
						MaterialPageRoute(
							builder: (_) => ProjectPage(project),
						)
					),
					onHover: (bool value) => onHover(value ? project : null),
					child: Text(
						project.student.name, 
						style: Theme.of(context).textTheme.headline5
							?.copyWith(color: Colors.red, fontWeight: FontWeight.bold)
					),
				),
				const SizedBox(height: 12),
			]
		],
	);
}

/// The widget that shows the thumbnail for a project. 
/// 
/// This appears when the user hovers over a project name on the opposite side
/// of the screen. The behavior when [project] is null or when the user tries
/// to interact is irrelevant because this widget disappears when the user stops
/// hovering over the project name. 
class ThumbnailPreview extends StatefulWidget {
	/// the project being displayed, if any. 
	final Project? project;

	/// Creates a thumbnail widget for the given project.
	const ThumbnailPreview({required this.project});

	@override
	ThumbnailPreviewState createState() => ThumbnailPreviewState();
}

/// The state for [ThumbnailPreview]. 
/// 
/// Manages loading the image from the network and swapping links when the
/// user hovers over a different project. 
class ThumbnailPreviewState extends State<ThumbnailPreview> {
	/// The link to the thumbnail for the project. 
	/// 
	/// Is null when the user is not currently hovering over a project.
	Future<String>? imageLink;

	@override
	void initState() {
		super.initState();
		init();
	}

	@override
	void didUpdateWidget(ThumbnailPreview oldWidget) {
		super.didUpdateWidget(oldWidget);
		init();  // setState is called right after
	}

	/// Saves the URL of the image ot [imageLink].
	/// 
	/// Note that the actual image data is loaded by [Image.network].
	void init() {
		if (widget.project == null) return;
		imageLink = ProjectFiles(widget.project!).thumbnail.getDownloadURL();
	}

	@override
	Widget build(BuildContext context) => FutureBuilder<String>(
		future: imageLink,
		builder: (_, snapshot) => !snapshot.hasData ? const SizedBox() 
			: Image.network(
				snapshot.data!, 
				width: 300, 
				height: 300,
				frameBuilder: (_, Widget image, int? frame, ___) => frame == null
					? const CircularProgressIndicator() : image,
			)
	);
}

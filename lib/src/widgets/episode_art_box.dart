import "package:flutter/material.dart";

import "package:artist_project/data.dart";

/// A widget that shows information about artwork seen in the project's video.
class EpisodeArtBox extends StatelessWidget {
	/// The maximum height for an image. 
	static double maxHeight = 500;

	/// The artwork shown in the episode. 
	final List<EpisodeArt> art;

	/// The links to these images. 
	final List<String> links;

	/// Creates a widget to show information about artwork in the video. 
	/// 
	/// Pass a list of [EpisodeArt]s and links to the image files, in the 
	/// same order.  
	const EpisodeArtBox(this.art, this.links);

	@override
	Widget build(BuildContext context) => Container(
		decoration: BoxDecoration(
			border: Border.all(width: 0.4, color: const Color(0xffd3d3d3))
		),
		child: Column(
			children: [
				for (final String link in links)
					Image.network(link, height: maxHeight),
				const SizedBox(height: 8),
				for (int index = 0; index < art.length; index++) RichText(
					text: TextSpan(
						children: [
							TextSpan(
								text: "${index + 1}. ",
								style: Theme.of(context).textTheme.bodyText1,
							),
							TextSpan(
								text: "${art [index].title} ", 
								style: Theme.of(context).textTheme.bodyText1
									?.copyWith(fontStyle: FontStyle.italic)
							),
							TextSpan(
								text: art [index].caption,
								style: Theme.of(context).textTheme.bodyText1,
							),
						]
					)
				),
				const SizedBox(height: 8),
			]
		)
	);
}

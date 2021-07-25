/// Art pieces that appear in a project's video.
class EpisodeArt {
	/// Converts a list of JSON objects to a list of [EpisodeArt]s.
	static List<EpisodeArt> fromList(List<Map> json) =>  [
		for (final Map art in json) EpisodeArt.fromJson(art)
	];

	/// The name of this piece. 
	final String title;

	/// The caption for this image.
	final String caption;

	/// Creates an [EpisodeArt] with the given caption and title.
	const EpisodeArt({
		required this.caption,
		required this.title,
	});

	/// Creates an [EpisodeArt] from a JSON object.
	EpisodeArt.fromJson(Map json) : 
		caption = json ["caption"],
		title = json ["title"];

	/// Converts this object to JSON.
	Map<String, dynamic> toJson() => {
		"caption": caption,
		"title": title,
	};
}

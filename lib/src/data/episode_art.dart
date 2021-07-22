class EpisodeArt {
	static List<EpisodeArt> fromList(List<Map> json) =>  [
		for (final Map art in json) EpisodeArt.fromJson(art)
	];

	final String imageLink;
	final String caption;
	final String title;

	const EpisodeArt({
		required this.imageLink,
		required this.caption,
		required this.title,
	});

	EpisodeArt.fromJson(Map json) : 
		imageLink = json ["imageLink"],
		caption = json ["caption"],
		title = json ["title"];

	Map<String, dynamic> toJson() => {
		"imageLink": imageLink,
		"caption": caption,
		"title": title,
	};
}
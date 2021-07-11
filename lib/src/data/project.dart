import "artist.dart";
import "episode_art.dart";

class Project {
	final List<String> thumbnails;
	final String title;
	final String quote;

	final Artist artist;
	final List<EpisodeArt> episodeArts;

	const Project({
		required this.artist,
		required this.thumbnails,
		required this.title,
		required this.quote,
		required this.episodeArts,
	});
}
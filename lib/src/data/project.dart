import "episode_art.dart";
import "student.dart";

class Project {
	final List<EpisodeArt> episodeArt;
	final Student student;

	final int season;
	final String? artist;
	final String artwork;
	final String quote;
	final String videoLink;

	const Project({
		required this.episodeArt,
		required this.student,
		required this.season,
		required this.artist,
		required this.artwork,
		required this.quote,
		required this.videoLink,
	});

	Project.fromJson(Map json) : 
		episodeArt = EpisodeArt.fromList(json ["episodeArt"].cast<Map>()),
		student = Student.fromJson(json ["student"]),
		season = json ["season"],
		artist = json ["artist"],
		artwork = json["artwork"],
		quote = json ["quote"],
		videoLink = json ["videoLink"];

	Map<String, dynamic> toJson() => {
		"episodeArt": episodeArt.map((art) => art.toJson()),
		"student": student.toJson(),
		"season": season,
		"artist": artist,
		"artwork": artwork,
		"quote": quote,
		"videoLink": videoLink,
	};
}
import "episode_art.dart";
import "student.dart";

/// A project where students discuss famous artwork.
class Project {
	/// Details about various artwork seen in the video.
	final List<EpisodeArt> episodeArt;

	/// The student who made this project. 
	final Student student;

	/// The season this project belongs to.
	/// 
	/// Each "season" is a new year of seniors. 
	final int season;

	/// The artist this project focuses on.
	/// 
	/// Some artwork's artists are unknown, and some projects focus on multiple
	/// pieces, or pieces where there is no one artist, so this field is nullable.
	final String? artist;

	/// The specific piece of art this project focuses on.
	final String artwork;

	/// An inspirational quote from the student about the piece. 
	final String quote;

	/// A YouTube ID to the video this student made. 
	final String videoLink;

	/// Creates a [Project] with the given fields.
	const Project({
		required this.episodeArt,
		required this.student,
		required this.season,
		required this.artist,
		required this.artwork,
		required this.quote,
		required this.videoLink,
	});

	/// Creates a [Project] from a JSON object.
	Project.fromJson(Map json) : 
		episodeArt = EpisodeArt.fromList(json ["episodeArt"].cast<Map>()),
		student = Student.fromJson(json ["student"]),
		season = json ["season"],
		artist = json ["artist"],
		artwork = json["artwork"],
		quote = json ["quote"],
		videoLink = json ["videoLink"];

	/// Converts this object to JSON.
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
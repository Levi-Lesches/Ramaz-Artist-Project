/// A student who participated in the Artist Project.
class Student {
	/// This student's name.
	final String name;

	/// A short description of this student and their work. 
	final String bio;

	/// Creates a [Student] object from a given name and bio.
	const Student({
		required this.name,
		required this.bio,
	});

	/// Creates a [Student] object from a JSON object.
	Student.fromJson(Map json) : 
		name = json ["name"],
		bio = json ["bio"];

	/// Converts this object to JSON.
	Map<String, dynamic> toJson() => {
		"name": name,
		"bio": bio,
	};
}
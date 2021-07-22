class Student {
	final String name;
	final String bio;
	final String imageLink;

	const Student({
		required this.name,
		required this.bio,
		required this.imageLink,
	});

	Student.fromJson(Map json) : 
		name = json ["name"],
		bio = json ["bio"],
		imageLink = json ["imageLink"];

	Map<String, dynamic> toJson() => {
		"name": name,
		"bio": bio,
		"imageLink": imageLink,
	};
}
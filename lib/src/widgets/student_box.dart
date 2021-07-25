import "package:flutter/material.dart";

import "package:artist_project/data.dart";

/// A widget that exhibits a student and their art. 
class StudentBox extends StatelessWidget {
	/// The student being represented. 
	final Student student;

	/// The link to an image for this student's artwork.
	final String? imageLink;

	/// Creates a widget to exhibit a student and their art. 
	const StudentBox(this.student, {required this.imageLink});

	@override
	Widget build(BuildContext context) => Container(
		decoration: BoxDecoration(
			border: Border.all(width: 0.4, color: const Color(0xffd3d3d3))
		),
		child: Column(
			children: [
				AspectRatio(
					aspectRatio: 1.5,
					child: imageLink == null ? null : Image.network(imageLink!)
				),
				const SizedBox(height: 8),		
				Text(student.bio, style: Theme.of(context).textTheme.bodyText1),
				const SizedBox(height: 8),		
			]
		)
	);
}

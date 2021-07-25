import "package:flutter/material.dart";

import "package:artist_project/data.dart";

class StudentBox extends StatelessWidget {
	final Student student;
	final String? imageLink;
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

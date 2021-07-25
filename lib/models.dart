/// The library for models.
/// 
/// Models provide data for the UI to consume, and allow the UI to listen to 
/// updates by mixing in Flutter's `ChangeNotifier`. There are two types of 
/// models: view models and data models. 
/// 
/// 1. Data models exist across the entire app, and always have data available. 
/// Data models hold data relevant across the app, such as all the projects and 
/// seasons. As such, they may need to run async code to initialize, and may 
/// need to override their `ChangeNotifier.dispose` for cleanup. To conform to 
/// this, all data models should inherit from [Model]. When writing front-end 
/// code, rely on the [Models] singleton by using [Models.instance].
/// 
/// 2. View models are created specifically for limited areas of the UI, and are
/// disposed when the user navigates away. View models hold data and state 
/// relevant for the UI, such as contents of input fields and selections. View 
/// models should be created without running async code, as they need to provide
/// data to the UI immediately. 
/// 
/// Data models are in `lib/src/models/data` while view models are in `lib/src/models/view`. 
library models;

import "src/models/data/model.dart";
import "src/models/data/projects.dart";

export "src/models/data/projects.dart";

/// The data model for managing other data models. 
/// 
/// Instead of managing data, this model manages other data models. This makes
/// it simple to initialize all the app's data with a simple call to this model.
/// 
/// Do not create instances of this class. Use [instance] as a singleton.
class Models extends Model {
	/// The singleton instance of this class. 
	static final Models instance = Models();

	/// The data model for the projects.
	final Projects projects = Projects();

	@override
	Future<void> init() async {
		await projects.init();
	}

	@override
	void dispose() {
		projects.dispose();
		super.dispose();
	}
}

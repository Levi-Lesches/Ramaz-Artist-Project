import "src/models/data/model.dart";
import "src/models/data/projects.dart";

export "src/models/data/projects.dart";

class Models extends Model {
	static final Models instance = Models();

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

/// Defines the common interface for all services. 
/// 
/// Any code that exists to get data from a source or interact with third-party
/// code is considered a service in these docs. In this context, "third-party"
/// means any code that is not in this project. So even Google products would
/// fall under this label.
/// 
/// Every service this app uses should have a corresponding [Service] class
/// that handles initialization and data retrieval, as well as any other 
/// possible operations on that service. All service-specific code should be
/// localized to that [Service] object. Third-party classes may be exported
/// when convenient, but complex operations should be wrapped by a [Service]
/// or an extension on the third-party class.
abstract class Service {
	/// Initializes the service.
	Future<void> init();
}
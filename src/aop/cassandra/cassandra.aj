package aop.cassandra;

public aspect cassandra {
	pointcut main(): 
		execution(void org.apache.cassandra.service.CassandraDaemon+.main(..));
	
	before(): main() {
		System.out.println("Installing aspects");
		aop.monitoring.Requests.installRequestPerformanceMonitor();
		aop.monitoring.Clients.installClientConnectionsMonitor();
	}
}

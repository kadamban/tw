
## Scaling plan for the public release of application

* As it is a kubernetes cluster additional nodes can be added to the cluster to scale up.
* The replicas can be increased for the app and web which additionally creates a pod to serve the application
* The deployment workload has readiness and liveness probe. which checks the liveness every 5 seconds.
This helps for 0% downtime when any parameter changes or new deployments.
* Memory limits and Heapspace can be updated in the deployment configuration.

![Design plan](/scale-design.jpg)


Issues to be addressed

As Prevayler is memory based, It should be synchronized in a centralized storage or the requests can be queued via messaging services.

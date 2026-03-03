# SAGA Pattern
- The SAGA pattern provide a way to comunicate between services in a distributed system.
- The SAGA help us to ensure **ACID** transactions in a distributes system.
- In a SAGA architecture we have a **Saga Orchestration Service** that service is responsible to coordinate the comunitation and transactions between the another microsservices.
- The SAGA pattern is the oposite of **Choreography** when each service call the another service without an orchestration service.

<img src="https://docs.aws.amazon.com/pt_br/prescriptive-guidance/latest/cloud-design-patterns/images/saga-3.png">


## Benefits
- Ensure **ACID** transactions in a distributes system.
- More simple to monitoring.
- More simple to rollback transactions.
- More simple to debug.
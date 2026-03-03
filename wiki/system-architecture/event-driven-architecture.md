# Event-Driven Architecture
The event-driven architecture (EDA) Is a sofware architecture where __producer__ send events to a __broker__ and __consumer__ consume and process the events.

The EDA is the architecture used by messaging system's like RabbitMQ, Kafka, Redis, etc.

The goal of that architecture is decouple the event processing, or heavy processing, from the producer.

That architecture is also know as __Message-Driven Arquitecture (MDA)__.

Use microsservices isn't mean we use EDA, these are two different architectures.

### Components
- __Producer__ - Who produce the event. (_A microssevice can produce the event_)
- __Consumer__ - Consume the event. (_A task or another microservice can consume and process the event_)
- __Broker__ - Receive and store the event and forward to the consumer. (_A messaging system like RabbitMQ, Kafka, Redis, etc._)

__Obs:__ Redis can be used as a broker, but it isn't a broker like RabbitMQ or Kafka.

<img src="../imgs/eda.png" alt="EDA">
# C4 Model


- C4 Model is a model of documentation to describe the architecture of a system in different levels.
- The C4 model create a map of a sustem starting pro the most high level and going down to the most low level.
- The ideia behing C4 is to create a documentation where we could see our architecture from zoom out to zoom in going down the levels.

[C4 Model - Documentation](https://c4model.com/introduction)

### Diagrams

- C4 model have 4 types of diagrams and each diagram represent a level of the system architecture.

#### Level 1 - System Context Diagram

- The System Context Diagram have the goal to show a general scenarion of the system without details.
- The focus of it diagram are the people (actor, roles, personas) and software system ranther than the technology or low level details.

<img src="https://c4model.com/images/examples/SystemContext.png">

#### Level 2 - Container Diagram

- After to develop the System Context Diagram the next step is zoom in our architecture and develop a Container Diagram.
- The Container Diagram show the system boundary for instance, my SPA aplication comunicate with backend and  some file are saved in the database, after that an alert to user is sent.
- That diagram dont need to show all the microsservices present on the aplications or workers from a messagem queue, the ideia behind it is to show the system boundary and the communication between other systems.

<img src="https://c4model.com/images/examples/Containers.png">

#### Level 3 - Component Diagram

- After to develop to Contianer Diagram the next step is zoom in our architecture and decompose the Container to describe the components.
- The Component Diagram is responsible to all the components present in the archtecture and show the technologies, comunication and low level details.

<img src="https://c4model.com/images/examples/Components.png">


#### Level 4 - Code Diagram

- Finaly, after to develop the Component Diagram the next step is zoom in our project and show how to implement it as code, using UML class diragrams, entity relationship or similars.

- This is very optional level of detail and the C4 model recomend to usa some tools to generate these diagrams automaticaly like your IDE for class Diagram or Debeaver for Entity Relashionship and etc.

- This level of detail is not recommended for anithing but for the most of important or complex components.

<img src="https://c4model.com/images/examples/Code.png">
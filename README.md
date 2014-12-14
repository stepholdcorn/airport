Airport Challenge
=================

Software to control the flow of planes at an airport.

The following classes and modules are used.

### Class - Airport 
 Responsibilities        |Collaborators
 ------------------------|------------------
 Hold plane              |Plane
 Dispatch plane          |Plane
 Land plane 			 |Plane

### Class - Plane 
 Responsibilities        |Collaborators
 ------------------------|------------------
 Be at the airport       |Airport
 Take off		         |Airport
 Land					 |Airport

### Module - Weather 
 Responsibilities        |Collaborators
 ------------------------|------------------
 Be sunny		         |Airport
 Be stormy		         |Airport

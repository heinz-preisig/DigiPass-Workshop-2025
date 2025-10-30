# Basic example

Try in https://ulb-darmstadt.github.io/shacl-form/#try-your-own

```SHACL
@prefix sh: <http://www.w3.org/ns/shacl#> .
@prefix rdfs: <http://www.w3.org/2000/01/rdf-schema#> .
@prefix ex: <http://example.org#> .

ex:ExampleShape
   a sh:NodeShape, rdfs:Class ;
     sh:property [
     sh:name 'my value' ;
     sh:path ex:exampleValue ;
     sh:maxCount 3 ].
```




# https://ulb-darmstadt.github.io/shacl-form/#try-your-own



order does not seem to work in the Darmstadt test website



```turtle
@prefix sh:      <http://www.w3.org/ns/shacl#> .
@prefix rdfs:    <http://www.w3.org/2000/01/rdf-schema#> .
@prefix ex:      <http://example.org/> .

ex:ExampleShape1
  a sh:NodeShape, rdfs:class ;
  sh:property ex:propA ;
  sh:property ex:propB ;
  sh:property ex:propC
.

ex:propA
  a sh:PropertyShape ;
  sh:name "my 2." ;
  sh:path ex:exV1 ;
  sh:maxCount 3 ;
  sh:order 2 
.

ex:propB
  a sh:PropertyShape ;
  sh:name "my 1." ;
  sh:path ex:exV2 ;
  sh:maxCount 1 ;
  sh:order 1 
.

ex:propC
  a sh:PropertyShape ;
  sh:name "my 3." ;
  sh:path ex:exV3 ;
  sh:maxCount 3 ;
  sh:order 3 
.

```

![image-20241121111945158](/home/heinz/Dropbox/workspace/DPP-project/Test-external/image-20241121111945158.png)

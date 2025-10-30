# https://ulb-darmstadt.github.io/shacl-form/#try-your-own



order does not seem to work in the Darmstadt test website



```
@prefix dash:    <http://datashapes.org/dash#> .
@prefix dbpedia: <http://dbpedia.org/ontology/> .
@prefix dcat:    <http://www.w3.org/ns/dcat#> .
@prefix dcterms: <http://purl.org/dc/terms/> .
@prefix foaf:    <http://xmlns.com/foaf/0.1/> .
@prefix geo:     <http://www.opengis.net/ont/geosparql#> .
@prefix owl:     <http://www.w3.org/2002/07/owl#> .
@prefix rdf:     <http://www.w3.org/1999/02/22-rdf-syntax-ns#> .
@prefix rdfs:    <http://www.w3.org/2000/01/rdf-schema#> .
@prefix schema:  <http://schema.org/> .
@prefix sh:      <http://www.w3.org/ns/shacl#> .
@prefix xsd:     <http://www.w3.org/2001/XMLSchema#> .
@prefix prov:    <http://www.w3.org/ns/prov#> .
@prefix example: <http://example.org/> .


# looks like it goes in the opposite order
example:Root
  a             sh:NodeShape, rdfs:Class ;
  sh:node		example:Root-description, 
                        example:digipass, 
                        example:PhysicalPropertiesGroupDef,
                        example:Dataset 
                       .
  

# this retains the order
example:PhysicalPropertiesGroupDef
  a sh:PropertyNode ;
  sh:property	    example:Root-width, 
                    example:Root-height, 
                    example:Root-depth ,
		    example:Root-scale,
                    example:Root-material .
  
example:Root-description
  a sh:PropertyNode ;
  sh:description  "Location of the building" ;
  sh:name         "Location" ;
  sh:node         example:Location ;
  sh:path         dcterms:spatial .
  
example:Root-width
  a sh:PropertyNode ;
  sh:datatype     xsd:integer ;
                  sh:description  "Width [mm] of the model" ;
                  sh:group        example:PhysicalPropertiesGroup ;
                  sh:maxCount     1 ;
                  sh:minInclusive 1 ;
                  sh:name         "Width" ;
                  sh:path         schema:width
                 .
example:Root-height
  a sh:PropertyNode ; sh:datatype     xsd:integer ;
                  sh:description  "Height [mm] of the model" ;
                  sh:group        example:PhysicalPropertiesGroup ;
                  sh:maxCount     1 ;
                  sh:minInclusive 1 ;
                  sh:name         "Height" ;
                  sh:path         schema:height
                 .
                
example:Root-depth
  a sh:PropertyNode ; sh:datatype     xsd:integer ;
                  sh:description  "Depth [mm] of the model" ;
                  sh:group        example:PhysicalPropertiesGroup ;
                  sh:maxCount     1 ;
                  sh:minInclusive 1 ;
                  sh:name         "Depth" ;
                  sh:path         schema:depth
                 .
example:Root-scale
  a sh:PropertyNode ; sh:datatype     xsd:string ;
                  sh:description  "Scale of the model, e.g. 1:20" ;
                  sh:group        example:PhysicalPropertiesGroup ;
                  sh:maxCount     1 ;
                  sh:name         "Scale" ;
                  sh:path         dbpedia:scale ;
                  sh:pattern      "^\\d+:\\d+$"
                 .
example:Root-material
  a sh:PropertyNode ;
  sh:description  "Material used with this model"@en , "Beim Bau des Modells verwendetes Material"@de ;
                  sh:group        example:PhysicalPropertiesGroup ;
                  sh:name         "Artwork material" ;
                  sh:path         schema:artworkSurface ;
                  sh:class        example:Material ;
                 .
                 
example:Dataset
  a               sh:NodeShape, rdfs:Class ;
  sh:property   [ sh:datatype     rdf:langString ;
                  sh:languageIn   ( "en" "de" ) ;
                  sh:uniqueLang   true ;
                  sh:description  "Name of the dataset" , "Der Name des Datensatzes"@de ;
                  sh:minCount     1 ;
                  sh:maxCount     1 ;
                  sh:group 		  example:NameGroup;
                  sh:name         "Name" ;
                  sh:path         dcterms:title
                ] ;
  sh:property   [ dash:singleLine false ;
                  sh:datatype     rdf:langString ;
                  sh:languageIn   ( "en" "de" ) ;
                  sh:uniqueLang   true ;
                  sh:description  "Description of the dataset" ;
                  sh:minCount     1 ;
                  sh:maxCount     2 ;
                  sh:name         "Description" ;
                  sh:path         dcterms:description
                ] ;
  sh:property   [ sh:description  "License of the dataset" ;
                  sh:maxCount     1 ;
                  sh:minCount     1 ;
                  sh:name         "License" ;
                  sh:nodeKind     sh:IRI ;
                  sh:path         dcterms:license ;
                  sh:in (
                    # see below how labels are added to the list entries
                    <http://creativecommons.org/licenses/by/4.0/>
                    <http://creativecommons.org/licenses/by-nc/4.0/>
                  )
                ] ;
  sh:property   [ sh:datatype     xsd:date ;
                  sh:description  "Date this dataset has been issued" ;
                  sh:maxCount     1 ;
                  sh:minCount     1 ;
                  sh:name         "Issued" ;
                  sh:path         dcterms:issued
                ] ;
  sh:property   [ sh:name         "Attribution" ;
                  sh:node         example:Attribution ;
                  sh:path         prov:qualifiedAttribution ;
                ] ;
  sh:targetClass  dcat:Dataset .
  
example:PhysicalPropertiesGroup
  a               sh:PropertyGroup ;
  #sh:order 1 ;
  rdfs:label      "Physical properties" .
  
example:NameGroup
	a sh:PropertyGroup ;
	sh:order 0 ;
	rdfs:label "Name" .
  
example:Location
  a               sh:NodeShape ;
  rdfs:label      "Location" ;
  #sh:group		example:LocationGroup;
  sh:property   [ sh:datatype     geo:wktLiteral ;
                  sh:description  "Format WKT, e.g. POINT(8.65 49.87)" ;
                  sh:group		example:LocationGroup;
                  sh:maxCount     1 ;
                  sh:minCount     1 ;
                  sh:name         "Coordinates" ;
                  sh:path         geo:asWKT ;
                  sh:pattern      "^POINT\\([+\\-]?(?:[0-9]*[.])?[0-9]+ [+\\-]?(?:[0-9]*[.])?[0-9]+\\)$|^POLYGON\\(\\((?:[+\\-]?(?:[0-9]*[.])?[0-9]+[ ,]?){3,}\\)\\)$"
                ] ;
  sh:property   [ dash:singleLine false ;
                  sh:description  "Description of the location" ;
                  sh:maxCount     1 ;
                  sh:group		example:LocationGroup;
                  sh:name         "Description" ;
                  sh:path         dcterms:description
                ] ;
  sh:targetClass  dcterms:Location .
  
example:LocationGroup
	a sh:PropertyGroup ;
	sh:order 5 ;
	rdfs:label	"Location".
  
example:Person
  a               sh:NodeShape ;
  rdfs:label      "Person" ;
  sh:property   [ sh:maxCount     1 ;
                  sh:minCount     1 ;
                  sh:name         "Name" ;
                  sh:path         foaf:name
                ] ;
  sh:property   [ sh:datatype     xsd:string ;
                  sh:maxCount     1 ;
                  sh:name         "ORCID ID" ;
                  sh:path         dcterms:identifier ;
                  sh:pattern      "^https://orcid.org/\\d{4}-\\d{4}-\\d{4}-\\d{4}$"
                ] ;
  sh:targetClass  foaf:Person .
  
example:Organisation
  a               sh:NodeShape ;
  rdfs:label      "Organisation" ;
  sh:property   [ sh:maxCount     1 ;
                  sh:minCount     1 ;
                  sh:name         "Name" ;
                  sh:path         foaf:name
                ] ;
  sh:property   [ sh:name         "Address" ;
                  sh:path         example:Address
                ] ;
  sh:targetClass  foaf:Organisation .
  
example:digipass
	a 	sh:NodeShape ;
	sh:property	[sh:datatype	xsd:string;
				 sh:description "An digipass input";
				 sh:group		example:digipassGroup ;
				 sh:name		"DigiPass";
				 ].
				 
example:digipassGroup
	a			sh:PropertyGroup ;
	rdfs:label	"DigiPass Group".
	
	
example:Attribution
  a               sh:NodeShape ;
  # Import an external taxonomy to the shapes graph.
  # In this case, the taxonomy provides class instances of prov:Role,
  # which will be displayed in a dropdown to select from.
  owl:imports     <https://w3id.org/nfdi4ing/metadata4ing/> ;
  sh:property   [ sh:maxCount  1 ;
                  sh:minCount  1 ;
                  sh:path      prov:agent ;
                  sh:or (
                    [ sh:node example:Person ; rdfs:label "Person" ]
                    [ sh:node example:Organisation ; rdfs:label "Organisation" ]
                  )
                ] ;
  sh:property   [ sh:name      "Role" ;
                  sh:minCount  1 ;
                  sh:path      dcat:hadRole ;
                  sh:class     prov:Role ;
                ] ;
  sh:targetClass  prov:Attribution .
# add a label to the license IRIs
<http://creativecommons.org/licenses/by/4.0/>    rdfs:label "CC-BY" .
<http://creativecommons.org/licenses/by-nc/4.0/> rdfs:label "CC-BY-NC" .
```



![image-20241120172854292](/home/heinz/Dropbox/workspace/DPP-project/Test-external/image-20241120172854292.png)
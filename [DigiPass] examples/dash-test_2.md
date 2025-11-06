# https://ulb-darmstadt.github.io/shacl-form/#try-your-own

```turtle
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

# 

example:PersonViewShape-address
a sh:PropertyShape ;
sh:path schema:address ;
sh:name "address" ;
dash:viewer dash:DetailsViewer ;
sh:node example:AustralianAddressShape ;
sh:class schema:PostalAddress ;
sh:group example:AddressPropertyGroup ;
sh:maxCount 1 ;
sh:nodeKind sh:IRI .

example:HolgerKnublauch
a schema:Person ;
rdfs:label "Holger Knublauch" ;
schema:givenName "Holger" ;
schema:familyName "Knublauch" ;
schema:gender "male" ;
schema:address example:HolgersAddress .
example:HolgersAddress
a schema:PostalAddress ;
schema:addressLocality "Kewarra Beach" ;
schema:addressRegion "QLD" ;
schema:email "holger@knublauch.com" ;
schema:email "holger@topquadrant.com" ;
schema:postalCode "4879" ;
schema:streetAddress "3 Teewah Close" ;
rdfs:label "Holger's Address" .
```


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

example:AustralianAddressShape
a sh:NodeShape ;
rdfs:label "Australian address shape" ;
rdfs:comment "Defines the structure of addresses in Australia, stored using schema.org.";
sh:targetClass schema:PostalAddress ;
dash:defaultViewForRole dash:all ;
sh:property example:AustralianAddressShape-streetAddress ;
sh:property example:AustralianAddressShape-addressLocality ;
sh:property example:AustralianAddressShape-addressRegion ;
sh:property example:AustralianAddressShape-postalCode ;
sh:property example:AustralianAddressShape-email ;
sh:property example:AustralianAddressShape-telephone .

example:AustralianAddressShape-streetAddress
a sh:PropertyShape ;
sh:path schema:streetAddress ;
dash:editor dash:TextAreaEditor ;
dash:singleLine false ;
sh:datatype xsd:string ;
sh:group example:AddressPropertyGroup ;
sh:maxCount 1 ;
sh:name "street address" ;
sh:order "0"^^xsd:decimal .

example:AustralianAddressShape-addressLocality
a sh:PropertyShape ;
sh:path schema:addressLocality ;
sh:datatype xsd:string ;
sh:group example:AddressPropertyGroup ;
sh:maxCount 1 ;
sh:name "suburb" ;
sh:order "1"^^xsd:decimal .

example:AustralianAddressShape-addressRegion
a sh:PropertyShape ;
sh:path schema:addressRegion ;
sh:datatype xsd:string ;
sh:description "The abbreviation of the state or territory." ;
sh:group example:AddressPropertyGroup ;
sh:in ( "ACT" "NSW" "NT" "QLD" "SA" "TAS" "VIC" "WA" ) ;
sh:minCount 1 ;
sh:maxCount 1 ;
sh:name "state" ;
sh:order "2"^^xsd:decimal .

example:AustralianAddressShape-postalCode
a sh:PropertyShape ;
sh:path schema:postalCode ;
sh:datatype xsd:string ;
sh:description "An Australian postal code, between 0000 and 9999." ;
sh:group example:AddressPropertyGroup ;
sh:minCount 1 ;
sh:maxCount 1 ;
sh:minLength 4 ;
sh:maxLength 4 ;
sh:name "postal code" ;
sh:order "3"^^xsd:decimal ;
sh:pattern "[0-9][0-9][0-9][0-9]" .



example:AustralianAddressShape-email
a sh:PropertyShape ;
sh:path schema:email ;
sh:datatype xsd:string ;
sh:group example:ContactPropertyGroup ;
sh:name "email" ;
sh:nodeKind sh:Literal ;
sh:order "1"^^xsd:decimal .



example:AustralianAddressShape-telephone
a sh:PropertyShape ;
sh:path schema:telephone ;
sh:datatype xsd:string ;
sh:group example:ContactPropertyGroup ;
sh:name "phone number" ;
sh:order "2"^^xsd:decimal .



example:AddressPropertyGroup
a sh:PropertyGroup ;
rdfs:label "Address" ;
sh:order "0"^^xsd:decimal .
example:ContactPropertyGroup
a sh:PropertyGroup ;
rdfs:label "Contact" ;
sh:order "1"^^xsd:decimal .
```


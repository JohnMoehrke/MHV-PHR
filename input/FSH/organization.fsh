/*
To support GetOrganization()
*/


Profile:        MHVorganization
Parent:         http://hl7.org/fhir/us/core/StructureDefinition/us-core-organization
Id:             VA.MHV.PHR.organization
Title:          "VA MHV PHR Organization"
Description:    """
A profile on the Organization resource for MHV PHR exposing Organization using FHIR API.

- based on US-Core for Organization
- used for Lab Site. In FHIR R4, the Lab site needs to go into .performer which can't take a Location. (TechnicalDebt)
"""




/* 
 <labSiteId>989</labSiteId>
*/
Instance: ex-MHV-organization-989
InstanceOf: MHVorganization
Title: "Organization lab site 989"
Description: "This example derived off of a mock diagnostic report "
Usage: #example
* active = true
* name = "Lab Site 989"
* identifier[+].use = #official
* identifier[=].value = "989"
* identifier[=].system = "http://example.org/LabSiteTO"

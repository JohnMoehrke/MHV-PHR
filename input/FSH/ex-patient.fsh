

Instance: ex-MHV-patient-0
InstanceOf: MHVpatient
Title: "Example MHVLISAONE from PatientTO"
Description: """
This example is derived off of a mock PatientTO
"""
Usage: #example
* extension[religion].valueCodeableConcept.text = "PROTESTANT, NO DENOMINATION"
* name[+].use = #usual
* name[=].family = "MHVLISAONE"
* name[=].given[+] = "ROBERT"
* name[=].given[+] = "M"
* identifier[+].use = #secondary
* identifier[=].type = http://terminology.hl7.org/CodeSystem/v2-0203#SS "Social Security number"
* identifier[=].value = "666114838"
* identifier[=].system = "urn:oid:2.16.840.1.113883.4.1"
* gender = #male 
* birthDate = "1962-08-09"
* extension[us-core-ethnicity].extension[text].valueString = "WHITE, NOT OF HISPANIC ORIGIN"
// drop age as not useful in persisted data
* maritalStatus.text = "MARRIED"
* address[+].use = #home
* address[=].line[+] = "55 NORTH MCDONALD DRIVE"
* address[=].city = "WINCHESTER"
* address[=].district = "135"
* address[=].state = "INDIANA"
* address[=].postalCode = "47394"
* address[=].country = "USA"
* extension[birthPlace].valueAddress.city = "BOONE COUNTY"
* extension[birthPlace].valueAddress.state = "KENTUCKY"
* telecom[+].use = #home
* telecom[=].value = "765-555-6688"
* telecom[=].system = #phone
// drop occupation - Would be recorded as an Observation under SDOH
* contact[+].relationship = http://terminology.hl7.org/CodeSystem/v2-0131#N "Next-of-Kin"
* contact[=].name.family = "ANTRAS"
* contact[=].name.given[+] = "BETTY"
* contact[=].name.given[+] = "J"
* contact[=].address.line[+] = "55 NORTH MCDONALD DRIVE"
* contact[=].address.city = "WINCHESTER"
* contact[=].address.district = "135"
* contact[=].address.state = "INDIANA"
* contact[=].address.postalCode = "47394"
* contact[=].telecom[+].use = #home
* contact[=].telecom[=].value = "765-555-6688"
* contact[=].telecom[=].system = #phone
* contact[+].relationship = http://terminology.hl7.org/CodeSystem/v2-0131#C "Emergency Contact"
* contact[=].name.family = "ANTRAS"
* contact[=].name.given[+] = "BETTY"
* contact[=].name.given[+] = "J"
* contact[=].address.line[+] = "55 NORTH MCDONALD DRIVE"
* contact[=].address.city = "WINCHESTER"
* contact[=].address.district = "135"
* contact[=].address.state = "INDIANA"
* contact[=].address.postalCode = "47394"
* contact[=].telecom[+].use = #home
* contact[=].telecom[=].value = "765-555-6688"
* contact[=].telecom[=].system = #phone
* identifier[+].use = #official
// Not sure what .type to use
* identifier[=].type.text = "mpiPID"
* identifier[=].value = "1013025697"
* identifier[=].system = "http://example.org/mpiPID"
* identifier[+].use = #secondary
* identifier[=].type.text = "localPID"
* identifier[=].system = "http://example.org/localPID"
* identifier[=].value = "49906"
// not sure the meaning of confidentaility flag - could be .meta.security
// not sure the meaning of patientFlags
// dropping activeInsurance - could go into Account resource - could go in extension as text blob
// dropping currentMeansStatus
// dropping elegibilityCode

/*
<patientTO>
    <name>MTPZEROTWO,DAYTSHR</name>
    <patientName>MTPZEROTWO,DAYTSHR</patientName>
    <mpiPid>1013699147</mpiPid>
    <mpiChecksum>368567</mpiChecksum>
    <localPid>552164786</localPid>
    <confidentiality>
        <tag>0</tag>
    </confidentiality>
    <patientFlags>
        <count>0</count>
    </patientFlags>
</patientTO>
*/
Instance: ex-MHV-patient-1
InstanceOf: MHVpatient
Title: "Example DAYSHR from PatientTO"
Description: """
This example is derived off of a mock PatientTO
"""
Usage: #example
* name[+].use = #usual
* name[=].text = "MTPZEROTWO,DAYTSHR"
* name[=].family = "DAYTSHR"
* name[=].given = "MTPZEROTWO"
* gender = #male 
* identifier[+].use = #official
* identifier[=].type.text = "mpiPID"
* identifier[=].system = "http://example.org/mpiPID"
* identifier[=].value = "1013699147"
* identifier[+].use = #secondary
* identifier[=].type.text = "localPID"
* identifier[=].system = "http://example.org/localPID"
* identifier[=].value = "552164786"


/*
<patientTO>
    <name>MHVLISAONE,ROBERT M</name>
    <patientName>MHVLISAONE,ROBERT M</patientName>
    <mpiPid>1013025697</mpiPid>
    <mpiChecksum>197920</mpiChecksum>
    <localPid>49906</localPid>
    <confidentiality>
        <tag>0</tag>
    </confidentiality>
    <patientFlags>
        <count>0</count>
    </patientFlags>
</patientTO>
*/
Instance: ex-MHV-patient-2
InstanceOf: MHVpatient
Title: "Example ROBERT from PatientTO"
Description: """
This example is derived off of a mock PatientTO
"""
Usage: #example
* name[+].use = #usual
* name[=].text = "MHVLISAONE,ROBERT M"
* name[=].family = "MHVLISAONE"
* name[=].given[+] = "ROBERT"
* name[=].given[+] = "M"
* gender = #male 
* identifier[+].use = #official
* identifier[=].type.text = "mpiPID"
* identifier[=].system = "http://example.org/mpiPID"
* identifier[=].value = "1013025697"
* identifier[+].use = #secondary
* identifier[=].type.text = "localPID"
* identifier[=].system = "http://example.org/localPID"
* identifier[=].value = "49906"

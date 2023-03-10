<?xml version="1.0" encoding="UTF-8" ?>
<xsl:transform xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0" 
xmlns:soap="http://schemas.xmlsoap.org/soap/envelope/"  
xmlns:ns2="http://service.via.med.va.gov/"
xmlns:saxon="http://saxon.sf.net/" 
xmlns:uuid="java:java.util.UUID"
exclude-result-prefixes="soap ns2 uuid saxon"
>
<xsl:import href="fileman-to-datetime.xslt" />

    <xsl:output method="xml" encoding="UTF-8" indent="yes" />

    <xsl:template match="/">

    <Bundle xmlns="http://hl7.org/fhir">
    <id value="images"/>
    <type value="transaction"/>
    <timestamp>
        <xsl:attribute name="value">
            <xsl:value-of select="current-dateTime()"/>
        </xsl:attribute>
    </timestamp>
    <!-- TODO: should find a FHIR Patient given the PatientTO details GetPatient() -->
      <xsl:for-each select="soap:Envelope/soap:Body/ns2:getDataResponse/ns2:PatientMedicalRecordTO/imagingExams/arrays/taggedImagingExamArray/imagingExams/imagingExamTO">
        <entry>
           <xsl:variable name="fullUrl" select="uuid:randomUUID()"/>
            <fullUrl>
                <xsl:attribute name="value">
                    <xsl:value-of select="concat('urn:uuid:', $fullUrl)"/>
                </xsl:attribute>
            </fullUrl>
            <resource>
                <DocumentReference>
                <id>
                  <xsl:attribute name="value">
                    <xsl:value-of select="$fullUrl"/>                  
                  </xsl:attribute>
                </id>

                <meta>
                    <profile value="https://johnmoehrke.github.io/MHV-PHR/StructureDefinition/VA.MHV.PHR.imaging"/>
                </meta>

                <identifier>
                    <use value="usual"/>
                    <system value="https://johnmoehrke.github.io/MHV-PHR/Vista/111/ImagingExam.id"/>  <!-- TODO: system should be derived from Vista site -->
                    <value>
                    <xsl:attribute name="value">
                        <xsl:value-of select="id" />
                    </xsl:attribute>
                    </value>
                </identifier>
                <identifier>
                    <use value="official"/>
                    <system value="https://johnmoehrke.github.io/MHV-PHR/Vista/111/AccessionNumber"/>  <!-- TODO: system should be derived from Vista site -->
                    <value>
                    <xsl:attribute name="value">
                        <xsl:value-of select="radiologyReportTO/accessionNumber" />
                    </xsl:attribute>
                    </value>
                </identifier>
                    <identifier>
                    <use value="secondary"/>
                    <system value="https://johnmoehrke.github.io/MHV-PHR/Vista/111/Casenum"/>  <!-- TODO: system should be derived from Vista site -->
                    <value>
                    <xsl:attribute name="value">
                        <xsl:value-of select="casenum" />
                    </xsl:attribute>
                    </value>
                </identifier>
                <status value="current"/>
                <docStatus value="final"/>
                <type>
                    <coding>
                    <system value="http://loinc.org"/>
                    <code value="18748-4"/>
                    </coding>

                    <xsl:if test="type">
                        <coding>
                        <system value="http://www.ama-assn.org/go/cpt"/>
                        <code>
                        <xsl:attribute name="value">
                            <xsl:value-of select="type/id" />
                        </xsl:attribute>
                        </code>
                        <display>
                        <xsl:attribute name="value">
                            <xsl:value-of select="type/name" />
                        </xsl:attribute>
                        </display>
                        </coding>
                    </xsl:if>
                </type>
                <category>
                    <coding>
                    <system value="http://hl7.org/fhir/us/core/CodeSystem/us-core-documentreference-category"/>
                    <code value="clinical-note"/>
                    </coding>
                </category>
                <subject>
                    <reference value="Patient/ex-MHV-patient-0"/>  <!-- TODO: patient should come from patient lookup -->
                </subject>
                <date>
                  <xsl:attribute name="value">
                    <xsl:variable name="datetime">
                      <xsl:call-template name="fileman-to-datetime">
                        <xsl:with-param name="fileman-date" select="timestamp" />
                      </xsl:call-template>
                    </xsl:variable>
                    <xsl:value-of select="$datetime" /> 
                  </xsl:attribute>
                </date>
                <author>
                    <display>
                    <xsl:attribute name="value">
                        <xsl:value-of select="provider/name" /> <!-- TODO GetPractitioner() -->
                    </xsl:attribute>
                    </display>
                </author>
                <author>
                    <identifier>
                    <value>
                        <xsl:attribute name="value">
                            <xsl:value-of select="radiologyReportTO/facility/tag" /> <!-- TODO GetLocation() -->
                        </xsl:attribute>
                    </value>
                    </identifier>
                    <display>
                    <xsl:attribute name="value">
                        <xsl:value-of select="radiologyReportTO/facility/text" />
                    </xsl:attribute>
                    </display>
                </author>
                <custodian>
                    <identifier>
                        <value>
                            <xsl:attribute name="value">
                                <xsl:value-of select="imagingLocation/id" /> <!-- TODO GetLocation() -->
                            </xsl:attribute>              
                        </value>
                    </identifier>
                        <display>
                            <xsl:attribute name="value">
                                <xsl:value-of select="imagingLocation/name" />
                            </xsl:attribute>              
                        </display>
                </custodian>
                <xsl:if test="boolean(interpretation)">
                  <description>
                      <xsl:attribute name="value">
                          <xsl:value-of select="interpretation" />
                      </xsl:attribute>        
                  </description>
                </xsl:if>
                <content>
                    <attachment>
                        <contentType value="text/plain"/>      
                        <xsl:variable name="blob" select="radiologyReportTO/text"/>
                        <xsl:variable name="bblob" select="saxon:string-to-base64Binary($blob, 'UTF8')" /> 
                        <data>
                            <xsl:attribute name="value">
                                <xsl:value-of select="$bblob" />
                            </xsl:attribute>
                        </data>

                        <title>
                            <xsl:attribute name="value">
                                <xsl:value-of select="name" />
                            </xsl:attribute>              
                        </title>

                        <creation>
                            <xsl:attribute name="value">
                            <xsl:variable name="datetime">
                              <xsl:call-template name="fileman-to-datetime">
                                <xsl:with-param name="fileman-date" select="timestamp" />
                              </xsl:call-template>
                            </xsl:variable>
                            <xsl:value-of select="$datetime" /> 
                            </xsl:attribute>
                        </creation>

                    </attachment>
                </content>
                <xsl:if test="boolean(encounterId) or boolean(order/id)">
                <context>
                  <xsl:if test="boolean(encounterId)">
                    <encounter>
                        <identifier>
                            <value>
                                <xsl:attribute name="value">
                                <xsl:value-of select="encounterId" /> 
                                </xsl:attribute>                
                            </value>
                        </identifier>
                    </encounter>
                  </xsl:if>
                  <xsl:if test="boolean(order/id)">
                    <related>
                        <identifier>
                            <value>
                                <xsl:attribute name="value">
                                <xsl:value-of select="order/id" />
                                </xsl:attribute>                 
                            </value>
                        </identifier>
                        <display>
                            <xsl:attribute name="value">
                                <xsl:value-of select="order/type/name1" />
                            </xsl:attribute>                 
                        </display>
                    </related>
                  </xsl:if>
                </context>
                  </xsl:if>



                </DocumentReference>
            </resource>
            <request>
                <method value="POST"/>
                <url value="DocumentReference"/>
            </request>
        </entry>  
      </xsl:for-each>

      </Bundle>
    </xsl:template>
</xsl:transform>

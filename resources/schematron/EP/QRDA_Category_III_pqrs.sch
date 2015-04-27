<sch:phase id="errors">
	<sch:active pattern="document-errors"/>
        <sch:active pattern="p-DOCUMENT-TEMPLATE-PQRS" />
	<sch:active pattern="p-pqrs-2.16.840.1.113883.10.20.27.1.2-errors"/>
	<sch:active pattern="p-pqrs-2.16.840.1.113883.10.20.27.2.3-errors"/>
	<sch:active pattern="p-pqrs-2.16.840.1.113883.10.20.27.3.17-errors"/>
	<sch:active pattern="p-pqrs-2.16.840.1.113883.10.20.27.3.16-errors"/>
	<sch:active pattern="p-pqrs-2.16.840.1.113883.10.20.27.3.24-errors"/>
	<sch:active pattern="p-pqrs-2.16.840.1.113883.10.20.27.3.26-errors"/>
	<sch:active pattern="p-pqrs-2.16.840.1.113883.10.20.27.3.22-errors"/>
	<sch:active pattern="p-pqrs-2.16.840.1.113883.10.20.27.3.18-errors"/>
	<sch:active pattern="p-pqrs-2.16.840.1.113883.10.20.27.3.19-errors"/>
	<sch:active pattern="p-pqrs-2.16.840.1.113883.10.20.27.3.20-errors"/>
	<sch:active pattern="p-pqrs-2.16.840.1.113883.10.20.27.3.21-errors"/>
	<sch:active pattern="p-pqrs-2.16.840.1.113883.10.20.27.3.25-errors"/>
	<sch:active pattern="p-pqrs-2.16.840.1.113883.10.20.27.2.6-errors"/>
	<sch:active pattern="p-pqrs-2.16.840.1.113883.10.20.27.3.23-errors"/>
	<sch:active pattern="p-pqrs-PARTICIPANTTYPECODE-2.16.840.1.113883.10.20.27.1.2-errors"/>
	<sch:active pattern="p-pqrs-AUTHOR-2.16.840.1.113883.10.20.27.1.2-errors"/>
	<sch:active pattern="p-pqrs-PERFORMER-2.16.840.1.113883.10.20.27.1.2-errors"/>
</sch:phase>
<sch:phase id="warnings">
	<sch:active pattern="p-pqrs-2.16.840.1.113883.10.20.27.1.2-warnings"/>
	<sch:active pattern="p-pqrs-2.16.840.1.113883.10.20.27.2.3-warnings"/>
	<sch:active pattern="p-pqrs-2.16.840.1.113883.10.20.27.3.17-warnings"/>
	<sch:active pattern="p-pqrs-2.16.840.1.113883.10.20.27.3.16-warnings"/>
	<sch:active pattern="p-pqrs-2.16.840.1.113883.10.20.27.3.24-warnings"/>
	<sch:active pattern="p-pqrs-2.16.840.1.113883.10.20.27.3.26-warnings"/>
	<sch:active pattern="p-pqrs-2.16.840.1.113883.10.20.27.3.22-warnings"/>
	<sch:active pattern="p-pqrs-2.16.840.1.113883.10.20.27.3.18-warnings"/>
	<sch:active pattern="p-pqrs-2.16.840.1.113883.10.20.27.3.19-warnings"/>
	<sch:active pattern="p-pqrs-2.16.840.1.113883.10.20.27.3.20-warnings"/>
	<sch:active pattern="p-pqrs-2.16.840.1.113883.10.20.27.3.21-warnings"/>
	<sch:active pattern="p-pqrs-2.16.840.1.113883.10.20.27.3.25-warnings"/>
	<sch:active pattern="p-pqrs-2.16.840.1.113883.10.20.27.2.6-warnings"/>
	<sch:active pattern="p-pqrs-2.16.840.1.113883.10.20.27.3.23-warnings"/>
</sch:phase>
<sch:pattern id="p-pqrs-2.16.840.1.113883.10.20.27.1.2-errors">
	<sch:rule id="r-pqrs-2.16.840.1.113883.10.20.27.1.2-errors-abstract" abstract="true">
		<sch:extends rule="r-oid-2.16.840.1.113883.10.20.27.1.1-errors-abstract"/>
		<sch:assert id="a-17242" test="string-length(cda:id/@root)&gt;0">This id SHALL be a globally unique identifier for the document (CONF:17242).</sch:assert>
		<sch:assert id="a-18246" test="not(testable)">This assignedCustodian SHALL represent the organization that owns and reports the data (CONF:18246).</sch:assert>
		<sch:assert id="a-18262" test="not(cda:author/cda:assignedAuthor/cda:assignedAuthoringDevice) or cda:author/cda:assignedAuthor/cda:assignedAuthoringDevice[count(cda:softwareName)=1]">The assignedAuthoringDevice, if present, SHALL contain exactly one [1..1] softwareName (CONF:18262).</sch:assert>
		<sch:assert id="a-19671" test="not(cda:legalAuthenticator/cda:assignedEntity/cda:representedOrganization) or cda:legalAuthenticator/cda:assignedEntity/cda:representedOrganization[count(cda:id) &gt; 0]">The representedOrganization, if present, SHALL contain at least one [1..*] id (CONF:19671).</sch:assert>
		<sch:assert id="a-711141" test="cda:component/cda:structuredBody[count(cda:component/cda:section[count(cda:templateId[@root='2.16.840.1.113883.10.20.27.2.6'])=1])=1]">This structuredBody SHALL contain exactly one [1..1] component (CONF:17281) such that it SHALL contain exactly one [1..1] QRDA Category III Reporting Parameters Section (CMS EP) (templateId:2.16.840.1.113883.10.20.27.2.6) (CONF:711141).</sch:assert>
		<sch:assert id="a-711142" test="cda:component/cda:structuredBody[count(cda:component/cda:section[count(cda:templateId[@root='2.16.840.1.113883.10.20.27.2.3'])=1])=1]">This structuredBody SHALL contain exactly one [1..1] component (CONF:17283) such that it SHALL contain exactly one [1..1] QRDA Category III Measure Section (CMS EP) (templateId:2.16.840.1.113883.10.20.27.2.3) (CONF:711142).</sch:assert>
		<sch:assert id="a-711150" test="count(cda:participant[@typeCode='LOC']) &lt; 2">MAY contain zero or one [0..1] participant (CONF:711150) such that it SHALL contain exactly one [1..1] @typeCode="LOC" Location (CodeSystem: HL7ParticipationType 2.16.840.1.113883.5.90) (CONF:711151).</sch:assert>
		<sch:assert id="a-711152" test="not(cda:participant[@typeCode='LOC']) or cda:participant[@typeCode='LOC'][count(cda:associatedEntity)=1]">SHALL contain exactly one [1..1] associatedEntity (CONF:711152).</sch:assert>
		<sch:assert id="a-711153" test="not(cda:participant[@typeCode='LOC']/cda:associatedEntity) or cda:participant[@typeCode='LOC'][count(cda:associatedEntity[@classCode='SDLOC'])=1]">This associatedEntity SHALL contain exactly one [1..1] @classCode="SDLOC" Service Delivery Location (CodeSystem: RoleClass 2.16.840.1.113883.5.110) (CONF:711153).</sch:assert>
		<sch:assert id="a-711154" test="not(cda:participant[@typeCode='LOC']/cda:associatedEntity[@classCode='SDLOC']) or cda:participant[@typeCode='LOC']/cda:associatedEntity[@classCode='SDLOC'][count(cda:id)=1]">This associatedEntity SHALL contain exactly one [1..1] id (CONF:711154).</sch:assert>
		<sch:assert id="a-711155" test="not(cda:participant[@typeCode='LOC']/cda:associatedEntity[@classCode='SDLOC']/cda:id) or cda:participant[@typeCode='LOC']/cda:associatedEntity[@classCode='SDLOC'][count(cda:id[@root='2.16.840.1.113883.3.249.5.1'])=1]">This id SHALL contain exactly one [1..1] @root="2.16.840.1.113883.3.249.5.1" CPC Practice Site (CONF:711155).</sch:assert>
		<sch:assert id="a-711156" test="not(cda:participant[@typeCode='LOC']/cda:associatedEntity[@classCode='SDLOC']/cda:id[@root='2.16.840.1.113883.3.249.5.1']) or cda:participant[@typeCode='LOC']/cda:associatedEntity[@classCode='SDLOC']/cda:id[@root='2.16.840.1.113883.3.249.5.1'][@extension]">This id SHALL contain exactly one [1..1] @extension (CONF:711156).</sch:assert>
		<sch:assert id="a-711157" test="not(cda:participant[@typeCode='LOC']/cda:associatedEntity[@classCode='SDLOC']) or cda:participant[@typeCode='LOC']/cda:associatedEntity[@classCode='SDLOC'][count(cda:addr) =1]">This associatedEntity SHALL contain exactly one [1..1] addr (CONF:711157).</sch:assert>
		<sch:assert id="a-711158" test="count(cda:informationRecipient)=1">SHALL contain exactly one [1..1] informationRecipient (CONF:711158).</sch:assert>
		<sch:assert id="a-711159" test="cda:informationRecipient[count(cda:intendedRecipient) =1]">This informationRecipient SHALL contain exactly one [1..1] intendedRecipient (CONF:711159).</sch:assert>
		<sch:assert id="a-711160" test="cda:informationRecipient/cda:intendedRecipient[count(cda:id) =1]">This intendedRecipient SHALL contain exactly one [1..1] id (CONF:711160).</sch:assert>
		<sch:assert id="a-711161" test="cda:informationRecipient/cda:intendedRecipient/cda:id[@root='2.16.840.1.113883.3.249.7']">This id SHALL contain exactly one [1..1] @root="2.16.840.1.113883.3.249.7" CMS Program (CONF:711161).</sch:assert>
		<sch:assert id="a-711162" test="cda:informationRecipient/cda:intendedRecipient/cda:id[@extension ='CPC' or @extension ='PQRS_MU_INDIVIDUAL' or @extension ='PQRS_MU_GROUP' or @extension ='MU_ONLY']">This id SHALL contain exactly one [1..1] @extension, which SHALL be selected from ValueSet CMS Program Name 2.16.840.1.113883.3.249.14.101 STATIC (CONF:711162).</sch:assert>
		<sch:assert id="a-711173" test="count(cda:languageCode)=1">SHALL contain exactly one [1..1] languageCode (CONF:711173).</sch:assert>
		<sch:assert id="a-711174" test="count(cda:confidentialityCode)=1">SHALL contain exactly one [1..1] confidentialityCode (CONF:711174).</sch:assert>
		<sch:assert id="a-711214" test="count(cda:documentationOf) =1">SHALL contain exactly one [1..1] documentationOf (CONF:711214).</sch:assert>
		<sch:assert id="a-711218" test="not(cda:participant[@typeCode='LOC']/cda:associatedEntity[@classCode='SDLOC']) or cda:participant[@typeCode='LOC']/cda:associatedEntity[@classCode='SDLOC'][count(cda:code) =1]">This associatedEntity SHALL contain exactly one [1..1] code (CONF:711218).</sch:assert>
		<sch:assert id="a-711219" test="not(cda:participant[@typeCode='LOC']/cda:associatedEntity[@classCode='SDLOC']/cda:code) or cda:participant[@typeCode='LOC']/cda:associatedEntity[@classCode='SDLOC']/cda:code[@code='394730007']">This code SHALL contain exactly one [1..1] @code="394730007" Healthcare Related Organization (CodeSystem: SNOMED CT 2.16.840.1.113883.6.96) (CONF:711219).</sch:assert>
		<sch:assert id="a-711220" test="cda:documentationOf/cda:serviceEvent[count(cda:performer) &gt; 0]">This serviceEvent SHALL contain at least one [1..*] performer (CONF:711220).</sch:assert>
		<sch:assert id="a-711246" test="cda:confidentialityCode[@code='N' and @codeSystem='2.16.840.1.113883.5.25']">This confidentialityCode SHALL contain exactly one [1..1] @code="N" Normal (CodeSystem: ConfidentialityCode 2.16.840.1.113883.5.25 STATIC) (CONF:711246).</sch:assert>
		<sch:assert id="a-711247" test="cda:languageCode[@code='en']">This languageCode SHALL contain exactly one [1..1] @code="en" English (CodeSystem: Language 2.16.840.1.113883.6.121) (CONF:711247).</sch:assert>
		<sch:assert id="a-711248" test="not(cda:informationRecipient/cda:intendedRecipient/cda:id[@extension = 'CPC']) or count(cda:informationRecipient/cda:intendedRecipient/cda:id[@extension = 'CPC']) = count(cda:participant[@typeCode ='LOC'])">If ClinicalDocument/informationRecipient/intendedRecipient/id/@extension="CPC", then ClinicalDocument/participant/@typeCode="LOC" SHALL be present (CONF:711248).</sch:assert>
		<sch:assert id="a-711280" test="count(cda:templateId[@root='2.16.840.1.113883.10.20.27.1.2'])=1">SHALL contain exactly one [1..1] templateId (CONF:711280) such that it SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.27.1.2" (CONF:711281).</sch:assert>
	</sch:rule>
	<sch:rule id="r-pqrs-2.16.840.1.113883.10.20.27.1.2-errors" context="cda:ClinicalDocument[cda:templateId[@root='2.16.840.1.113883.10.20.27.1.2']]">
		<sch:extends rule="r-pqrs-2.16.840.1.113883.10.20.27.1.2-errors-abstract"/>
	</sch:rule>
</sch:pattern>
<sch:pattern id="p-DOCUMENT-TEMPLATE-PQRS">
  <sch:rule id="r-errors-PDOC-abstract" abstract="true">
    <sch:assert id="a-pqrs-0009" test="cda:templateId[@root='2.16.840.1.113883.10.20.27.1.2']">PQRS_10715: This document SHALL conform to template "QRDA Category III Report - CMS EP" (templateId: 2.16.840.1.113883.10.20.27.1.2).</sch:assert>
  </sch:rule>
  <sch:rule id="r-errors-PDOC" context="cda:ClinicalDocument">
    <sch:extends rule="r-errors-PDOC-abstract" />
  </sch:rule>
</sch:pattern>
<!--Handling Multiple Authors-->
<sch:pattern id="p-pqrs-AUTHOR-2.16.840.1.113883.10.20.27.1.2-errors">
	<sch:rule id="r-pqrs-AUTHOR-2.16.840.1.113883.10.20.27.1.2-errors-abstract" abstract="true">
		<sch:assert id="a-18163" test="cda:assignedAuthor[count(cda:representedOrganization)=1]">This assignedAuthor SHALL contain exactly one [1..1] representedOrganization (CONF:18163).</sch:assert>
		<sch:assert id="a-711240" test="cda:assignedAuthor[count(cda:id)=1]">This assignedAuthor SHALL contain exactly one [1..1] id (CONF:711240).</sch:assert>
	</sch:rule>
	<sch:rule id="r-pqrs-AUTHOR-2.16.840.1.113883.10.20.27.1.2-errors" context="cda:ClinicalDocument[cda:templateId/@root='2.16.840.1.113883.10.20.27.1.2']/cda:author">
		<sch:extends rule="r-pqrs-AUTHOR-2.16.840.1.113883.10.20.27.1.2-errors-abstract"/>
	</sch:rule>
</sch:pattern>
<!-- Mutliple participantstypecode -->
<sch:pattern id="p-pqrs-PARTICIPANTTYPECODE-2.16.840.1.113883.10.20.27.1.2-errors">
	<sch:rule id="r-pqrs-PARTICIPANTTYPECODE-2.16.840.1.113883.10.20.27.1.2-errors-abstract" abstract="true">
		<sch:assert id="a-18302" test="count(cda:associatedEntity)=1">SHALL contain exactly one [1..1] associatedEntity (CONF:18302).</sch:assert>
		<sch:assert id="a-18303" test="cda:associatedEntity[@classCode='RGPR']">This associatedEntity SHALL contain exactly one [1..1] @classCode="RGPR" Regulated Product (CodeSystem: RoleClass 2.16.840.1.113883.5.110 STATIC) (CONF:18303).</sch:assert>
		<sch:assert id="a-18304" test="not(cda:associatedEntity[@classCode='RGPR']/cda:id) or cda:associatedEntity[count(cda:id[@root='2.16.840.1.113883.3.2074.1'])=1]">This associatedEntity MAY contain zero or one [0..1] id (CONF:18304) such that it SHALL contain exactly one [1..1] @root="2.16.840.1.113883.3.2074.1" CMS EHR Certification ID (CONF:18305).</sch:assert>
		<sch:assert id="a-18308" test="not(cda:associatedEntity) or cda:associatedEntity[count(cda:code)=1]">This associatedEntity SHALL contain exactly one [1..1] code (CONF:18308).</sch:assert>
		<sch:assert id="a-18309" test="not(cda:associatedEntity/cda:code) or cda:associatedEntity/cda:code[@code='129465004' and @codeSystem='2.16.840.1.113883.6.96']">This code SHALL contain exactly one [1..1] @code="129465004" medical record, device (CodeSystem: SNOMED CT 2.16.840.1.113883.6.96 STATIC) (CONF:18309).</sch:assert>
	</sch:rule>
	<sch:rule id="r-pqrs-PARTICIPANTTYPECODE-2.16.840.1.113883.10.20.27.1.2-errors" context="cda:ClinicalDocument[cda:templateId/@root='2.16.840.1.113883.10.20.27.1.2']/cda:participant[@typeCode='DEV']">
		<sch:extends rule="r-pqrs-PARTICIPANTTYPECODE-2.16.840.1.113883.10.20.27.1.2-errors-abstract"/>
	</sch:rule>
</sch:pattern>
<!-- Mutliple Performers -->
<sch:pattern id="p-pqrs-PERFORMER-2.16.840.1.113883.10.20.27.1.2-errors">
	<sch:rule id="r-pqrs-PERFORMER-2.16.840.1.113883.10.20.27.1.2-errors-abstract" abstract="true">
		<sch:assert id="a-711167" test="cda:assignedEntity[count(cda:id[@root='2.16.840.1.113883.4.6'])=1]">This assignedEntity SHALL contain exactly one [1..1] id (CONF:711167) such that it SHALL contain exactly one [1..1] @root="2.16.840.1.113883.4.6" National Provider ID (CONF:711169).</sch:assert>
		<sch:assert id="a-711168" test="cda:assignedEntity/cda:representedOrganization[count(cda:id[@root='2.16.840.1.113883.4.2'])=1]">This representedOrganization SHALL contain exactly one [1..1] id (CONF:711168) such that it SHALL contain exactly one [1..1] @root="2.16.840.1.113883.4.2" Tax ID Number (CONF:711171).</sch:assert>
		<sch:let name="programName" value="../../../cda:informationRecipient/cda:intendedRecipient/cda:id[@root='2.16.840.1.113883.3.249.7']/@extension"/>
		<sch:assert id="a-711170" test="($programName='CPC' or $programName='PQRS_MU_INDIVIDUAL' or $programName='MU_ONLY' or $programName='PQRS_MU_GROUP') and (not($programName='PQRS_MU_GROUP') and count(cda:assignedEntity/cda:id[@root='2.16.840.1.113883.4.6']/@extension)=1) or (($programName='PQRS_MU_GROUP') and count(cda:assignedEntity/cda:id[@root='2.16.840.1.113883.4.6']/@extension)=0)">SHALL contain exactly one [1..1] @extension (CONF:711170). Note: This is the provider's NPI, it is only present when this is not PQRS GPRO reporting.</sch:assert>
		<sch:assert id="p-10706" test="(not($programName='CPC' or $programName='PQRS_MU_INDIVIDUAL' or $programName='MU_ONLY' or $programName='PQRS_MU_GROUP')) or (not($programName='PQRS_MU_GROUP') and cda:assignedEntity[count(cda:id[cda:isValidNPI(@extension)])=1]) or (($programName='PQRS_MU_GROUP') and count(cda:assignedEntity/cda:id/@extension)=0)">PQRS_10706: /ClinicalDocument/documentationOf/serviceEvent/performer/assignedEntity/id[@root=&quot;2.16.840.1.113883.4.6&quot;]/@extension When provided the NPI must be in the correct format. A valid NPI is 10 numeric digits where the 10th digit is a check digit computed using the Luhn algorithm. Note: For the Eligible Professional (EP) programs, NPI is required except for the Group Practice Reporting Option (GPRO). For GPRO, id/@root='2.16.840.1.113883.4.6' is coupled with @nullFlavor=&quot;NA&quot;, and @extension SHALL be omitted.</sch:assert>
<!--
<sch:assert id="a-711170" test="not(../../../cda:informationRecipient/cda:intendedRecipient/cda:id[@root='2.16.840.1.113883.3.249.7'][@extension ='CPC' or @extension ='PQRS_MU_INDIVIDUAL' or @extension ='MU_ONLY' or @extension ='PQRS_MU_GROUP']) or (../../../cda:informationRecipient/cda:intendedRecipient/cda:id[@root='2.16.840.1.113883.3.249.7'][@extension ='PQRS_MU_GROUP'] and not(cda:assignedEntity[count(cda:id[@extension])=1])) or (not(../../../cda:informationRecipient/cda:intendedRecipient/cda:id[@root='2.16.840.1.113883.3.249.7'][@extension ='PQRS_MU_GROUP']) and cda:assignedEntity[count(cda:id[cda:isValidNPI(@extension)])=1])">SHALL contain exactly one [1..1] @extension (CONF:711170). PQRS_10706: /ClinicalDocument/documentationOf/serviceEvent/performer/assignedEntity/id[@root=&quot;2.16.840.1.113883.4.6&quot;]/@extension When provided the NPI must be in the correct format. A valid NPI is 10 numeric digits where the 10th digit is a check digit computed using the Luhn algorithm. Note: For the Eligible Professional (EP) programs, NPI is required except for the Group Practice Reporting Option (GPRO). For GPRO, id/@root='2.16.840.1.113883.4.6' is coupled with @nullFlavor=&quot;NA&quot;, and @extension SHALL be omitted.</sch:assert>
-->
		<sch:assert id="a-711172" test="cda:assignedEntity/cda:representedOrganization[count(cda:id[cda:validateSSN(@extension)])=1]">SHALL contain exactly one [1..1] @extension (CONF:711172). Note: TIN is invalid length (must be 9-digit number) and/or format validation failed.</sch:assert>
		<sch:assert id="a-711249" test="not(../../../cda:informationRecipient/cda:intendedRecipient/cda:id[@root='2.16.840.1.113883.3.249.7'][@extension ='PQRS_MU_GROUP']) or (count(../../../cda:informationRecipient/cda:intendedRecipient/cda:id[@root='2.16.840.1.113883.3.249.7'][@extension ='PQRS_MU_GROUP'])=1 and cda:assignedEntity[count(cda:id[@nullFlavor='NA'])&lt;2])">This assignedEntity SHALL contain exactly one [1..1] id (CONF:711167) such that it MAY contain zero or one [0..1] @nullFlavor="NA" (CONF:711249).</sch:assert>
	</sch:rule>
	<sch:rule id="r-pqrs-PERFORMER-2.16.840.1.113883.10.20.27.1.2-errors" context="cda:ClinicalDocument[cda:templateId/@root='2.16.840.1.113883.10.20.27.1.2']/cda:documentationOf/cda:serviceEvent/cda:performer">
		<sch:extends rule="r-pqrs-PERFORMER-2.16.840.1.113883.10.20.27.1.2-errors-abstract"/>
	</sch:rule>
</sch:pattern>
<sch:pattern id="p-pqrs-2.16.840.1.113883.10.20.27.2.3-errors">
	<sch:rule id="r-pqrs-2.16.840.1.113883.10.20.27.2.3-errors-abstract" abstract="true">
		<sch:extends rule="r-oid-2.16.840.1.113883.10.20.27.2.1-errors-abstract"/>
		<sch:assert id="a-711283" test="count(cda:entry/cda:organizer[count(cda:templateId[@root='2.16.840.1.113883.10.20.27.3.17'])=1]) &gt; 0 ">SHALL contain at least one [1..*] entry (CONF:711283) such that it SHALL contain exactly one [1..1] Measure Reference and Results (CMS EP) (templateId:2.16.840.1.113883.10.20.27.3.17) (CONF:711284).</sch:assert>
		<sch:assert id="a-67-19532" test="count(cda:entry/cda:organizer[count(cda:templateId[@root='2.16.840.1.113883.10.20.24.3.98'])=1]) &gt; 0 ">SHALL contain exactly one [1..1] templateId (CONF:19532) such that it SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.24.3.98" (CONF:19533).</sch:assert>
	</sch:rule>
	<sch:rule id="r-pqrs-2.16.840.1.113883.10.20.27.2.3-errors" context="cda:section[cda:templateId[@root='2.16.840.1.113883.10.20.27.2.3']]">
		<sch:extends rule="r-pqrs-2.16.840.1.113883.10.20.27.2.3-errors-abstract"/>
	</sch:rule>
</sch:pattern>
<sch:pattern id="p-pqrs-2.16.840.1.113883.10.20.27.3.17-errors">
	<sch:rule id="r-pqrs-2.16.840.1.113883.10.20.27.3.17-errors-abstract" abstract="true">
		<sch:extends rule="r-oid-2.16.840.1.113883.10.20.27.3.1-errors-abstract"/>
		<sch:assert id="a-18425" test="count(cda:component/cda:observation[count(cda:templateId[@root='2.16.840.1.113883.10.20.27.3.16'])=1]) &gt;0">SHALL contain at least one [1..*] component (CONF:18425) such that it SHALL contain exactly one [1..1] Measure Data (CMS EP) (templateId:2.16.840.1.113883.10.20.27.3.16) (CONF:18428).</sch:assert>
		<sch:let name="measureID" value="cda:reference[@typeCode='REFR']/cda:externalDocument/cda:id[@root='2.16.840.1.113883.4.738']/@extension"/>
		<sch:assert id="a-21159" test="cda:reference[@typeCode='REFR']/cda:externalDocument[count(cda:id[@root='2.16.840.1.113883.4.738'][@extension])=1] and cda:isValidMeasureVersionSpecificID('2015',lower-case($measureID)) ">SHALL contain exactly one [1..1] @extension (CONF:21159). Note: This @extension SHALL equal the version specific identifier for eMeasure (i.e. QualityMeasureDocument/id)</sch:assert>
		<sch:assert id="a-711213" test="count(cda:component/cda:observation[count(cda:templateId[@root='2.16.840.1.113883.10.20.27.3.25'])=1]) &gt;0">SHALL contain one or more [1..*] component (CONF:711290) such that it SHALL contain exactly one [1..1] Performance Rate for Proportion Measure (CMS EP) (templateId:2.16.840.1.113883.10.20.27.3.25) (CONF:711213).</sch:assert>
	</sch:rule>
	<sch:rule id="r-pqrs-2.16.840.1.113883.10.20.27.3.17-errors" context="cda:organizer[cda:templateId[@root='2.16.840.1.113883.10.20.27.3.17']]">
		<sch:extends rule="r-pqrs-2.16.840.1.113883.10.20.27.3.17-errors-abstract"/>
	</sch:rule>
</sch:pattern>
<sch:pattern id="p-pqrs-2.16.840.1.113883.10.20.27.3.16-errors">
	<sch:rule id="r-pqrs-2.16.840.1.113883.10.20.27.3.16-errors-abstract" abstract="true">
		<sch:extends rule="r-oid-2.16.840.1.113883.10.20.27.3.5-errors-abstract"/>
		<sch:assert id="a-711180" test="count(cda:entryRelationship[@typeCode='COMP']/cda:observation[count(cda:templateId[@root='2.16.840.1.113883.10.20.27.3.20'])=1]) &gt;=0">MAY contain zero or more [0..*] entryRelationship (CONF:17918) such that it SHALL contain exactly one [1..1] @typeCode="COMP" (CONF:17919). SHALL contain exactly one [1..1] Reporting Stratum (CMS EP) (templateId:2.16.840.1.113883.10.20.27.3.20) (CONF:711180).</sch:assert>
		<sch:assert id="a-711181" test="count(cda:entryRelationship[@typeCode='COMP']/cda:observation[count(cda:templateId[@root='2.16.840.1.113883.10.20.27.3.21'])=1]) &gt;0">SHALL contain at least one [1..*] entryRelationship (CONF:711190) such that it SHALL contain exactly one [1..1] @typeCode="COMP" (CodeSystem: HL7ActRelationshipType 2.16.840.1.113883.5.1002 STATIC) (CONF:18137). SHALL contain exactly one [1..1] Sex Supplemental Data Element (CMS EP) (templateId:2.16.840.1.113883.10.20.27.3.21) (CONF:711181).</sch:assert>
		<sch:assert id="a-711182" test="count(cda:entryRelationship[@typeCode='COMP']/cda:observation[count(cda:templateId[@root='2.16.840.1.113883.10.20.27.3.22'])=1]) &gt;0">SHALL contain at least one [1..*] entryRelationship (CONF:711191) such that it SHALL contain exactly one [1..1] @typeCode="COMP" (CodeSystem: HL7ActRelationshipType 2.16.840.1.113883.5.1002 STATIC) (CONF:18144). SHALL contain exactly one [1..1] Ethnicity Supplemental Data Element (CMS EP) (templateId:2.16.840.1.113883.10.20.27.3.22) (CONF:711182).</sch:assert>
		<sch:assert id="a-711183" test="count(cda:entryRelationship[@typeCode='COMP']/cda:observation[count(cda:templateId[@root='2.16.840.1.113883.10.20.27.3.19'])=1]) &gt;0">SHALL contain at least one [1..*] entryRelationship (CONF:711192) such that it SHALL contain exactly one [1..1] @typeCode="COMP" (CodeSystem: HL7ActRelationshipType 2.16.840.1.113883.5.1002 STATIC) (CONF:18145). SHALL contain exactly one [1..1] Race Supplemental Data Element (CMS EP) (templateId:2.16.840.1.113883.10.20.27.3.19) (CONF:711183).</sch:assert>
		<sch:assert id="a-711184" test="count(cda:entryRelationship[@typeCode='COMP']/cda:observation[count(cda:templateId[@root='2.16.840.1.113883.10.20.27.3.18'])=1]) &gt;0">SHALL contain at least one [1..*] entryRelationship (CONF:711193) such that it SHALL contain exactly one [1..1] @typeCode="COMP" (CodeSystem: HL7ActRelationshipType 2.16.840.1.113883.5.1002 STATIC) (CONF:18146). SHALL contain exactly one [1..1] Payer Supplemental Data Element (CMS EP) (templateId:2.16.840.1.113883.10.20.27.3.18) (CONF:711184).</sch:assert>
		<sch:assert id="a-711198" test="count(cda:entryRelationship[@typeCode='SUBJ'][@inversionInd='true']/cda:observation[count(cda:templateId[@root='2.16.840.1.113883.10.20.27.3.24'])=1])=1">SHALL contain exactly one [1..1] entryRelationship (CONF:17619) such that it SHALL contain exactly one [1..1] @typeCode="SUBJ" (CONF:17910). SHALL contain exactly one [1..1] @inversionInd="true" (CONF:17911). SHALL contain exactly one [1..1] Aggregate Count (CMS EP) (templateId:2.16.840.1.113883.10.20.27.3.24) (CONF:711198).</sch:assert>
		<sch:assert id="a-711212" test="not(cda:value[@code = 'MSRPOPL']) or count(cda:entryRelationship[@typeCode='COMP']/cda:observation[count(cda:templateId[@root='2.16.840.1.113883.10.20.27.3.26'])=1]) &gt;=0">MAY contain zero or more [0..*] entryRelationship (CONF:18143) such that it SHALL contain exactly one [1..1] @typeCode="COMP" (CodeSystem: HL7ActRelationshipType 2.16.840.1.113883.5.1002 STATIC) (CONF:18148). SHALL contain exactly one [1..1] Continuous Variable Measure Value (CMS EP) (templateId:2.16.840.1.113883.10.20.27.3.26) (CONF:711212).</sch:assert>
		<sch:assert id="a-711233" test="cda:reference/cda:externalObservation[count(cda:id)=1]">This externalObservation SHALL contain exactly one [1..1] id (CONF:711233).</sch:assert>
	</sch:rule>
	<sch:rule id="r-pqrs-2.16.840.1.113883.10.20.27.3.16-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.27.3.16']]">
		<sch:extends rule="r-pqrs-2.16.840.1.113883.10.20.27.3.16-errors-abstract"/>
	</sch:rule>
</sch:pattern>
<sch:pattern id="p-pqrs-2.16.840.1.113883.10.20.27.3.24-errors">
	<sch:rule id="r-pqrs-2.16.840.1.113883.10.20.27.3.24-errors-abstract" abstract="true">
		<sch:extends rule="r-oid-2.16.840.1.113883.10.20.27.3.3-errors-abstract"/>
		<sch:assert id="a-711244" test="count(cda:statusCode)=1">SHALL contain exactly one [1..1] statusCode (CONF:711244).</sch:assert>
		<sch:assert id="a-711245" test="cda:statusCode[@code='completed']">This statusCode SHALL contain exactly one [1..1] @code="completed" Completed (CodeSystem: ActStatus 2.16.840.1.113883.5.14) (CONF:711245).</sch:assert>
	</sch:rule>
	<sch:rule id="r-pqrs-2.16.840.1.113883.10.20.27.3.24-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.27.3.24']]">
		<sch:extends rule="r-pqrs-2.16.840.1.113883.10.20.27.3.24-errors-abstract"/>
	</sch:rule>
</sch:pattern>
<sch:pattern id="p-pqrs-2.16.840.1.113883.10.20.27.3.26-errors">
	<sch:rule id="r-pqrs-2.16.840.1.113883.10.20.27.3.26-errors-abstract" abstract="true">
		<sch:extends rule="r-oid-2.16.840.1.113883.10.20.27.3.2-errors-abstract"/>
		<sch:assert id="a-711205" test="cda:reference/cda:externalObservation[count(cda:id)=1]">This externalObservation SHALL contain exactly one [1..1] id (CONF:711205).</sch:assert>
		<sch:assert id="a-711241" test="count(cda:statusCode)=1">SHALL contain exactly one [1..1] statusCode (CONF:711241).</sch:assert>
		<sch:assert id="a-711242" test="cda:statusCode[@code='completed']">This statusCode SHALL contain exactly one [1..1] @code="completed" Completed (CodeSystem: ActStatus 2.16.840.1.113883.5.14) (CONF:711242).</sch:assert>
		<sch:assert id="a-711243" test="not(testable)">This code element SHALL equal the code element in that eMeasure's measure observation definition (CONF:711243).</sch:assert>

	</sch:rule>
	<sch:rule id="r-pqrs-2.16.840.1.113883.10.20.27.3.26-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.27.3.26']]">
		<sch:extends rule="r-pqrs-2.16.840.1.113883.10.20.27.3.26-errors-abstract"/>
	</sch:rule>
</sch:pattern>
<sch:pattern id="p-pqrs-2.16.840.1.113883.10.20.27.3.22-errors">
	<sch:rule id="r-pqrs-2.16.840.1.113883.10.20.27.3.22-errors-abstract" abstract="true">
		<sch:extends rule="r-oid-2.16.840.1.113883.10.20.27.3.7-errors-abstract"/>
		<sch:assert id="a-711201" test="count(cda:entryRelationship[@typeCode='SUBJ'][@inversionInd='true']/cda:observation[count(cda:templateId[@root='2.16.840.1.113883.10.20.27.3.24'])=1])=1">SHALL contain exactly one [1..1] entryRelationship (CONF:18120) such that it SHALL contain exactly one [1..1] @typeCode="SUBJ" Has Subject (CodeSystem: HL7ActRelationshipType 2.16.840.1.113883.5.1002 STATIC) (CONF:18121). SHALL contain exactly one [1..1] @inversionInd="true" (CONF:18122). SHALL contain exactly one [1..1] Aggregate Count (CMS EP) (templateId:2.16.840.1.113883.10.20.27.3.24) (CONF:711201).</sch:assert>
	</sch:rule>
	<sch:rule id="r-pqrs-2.16.840.1.113883.10.20.27.3.22-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.27.3.22']]">
		<sch:extends rule="r-pqrs-2.16.840.1.113883.10.20.27.3.22-errors-abstract"/>
	</sch:rule>
</sch:pattern>
<sch:pattern id="p-pqrs-2.16.840.1.113883.10.20.27.3.18-errors">
	<sch:rule id="r-pqrs-2.16.840.1.113883.10.20.27.3.18-errors-abstract" abstract="true">
		<sch:extends rule="r-oid-2.16.840.1.113883.10.20.27.3.9-errors-abstract"/>
		<sch:assert id="a-711196" test="count(cda:value[@xsi:type='CD'])=1">SHALL contain exactly one [1..1] value with @xsi:type="CD" (CONF:711196).</sch:assert>
		<sch:assert id="a-711199" test="count(cda:entryRelationship[@typeCode='SUBJ'][@inversionInd='true']/cda:observation[count(cda:templateId[@root='2.16.840.1.113883.10.20.27.3.24'])=1])=1">SHALL contain exactly one [1..1] entryRelationship (CONF:18108) such that it SHALL contain exactly one [1..1] @typeCode="SUBJ" Has Subject (CodeSystem: HL7ActRelationshipType 2.16.840.1.113883.5.1002 STATIC) (CONF:18109). SHALL contain exactly one [1..1] @inversionInd="true" (CONF:18110). SHALL contain exactly one [1..1] Aggregate Count (CMS EP) (templateId:2.16.840.1.113883.10.20.27.3.24) (CONF:711199).</sch:assert>
		<sch:assert id="a-711229" test="count(cda:value[@nullFlavor='OTH'])=1">This value SHALL contain exactly one [1..1] @nullFlavor="OTH" (CONF:711229).</sch:assert>
		<sch:assert id="a-711230" test="cda:value[@xsi:type='CD'][count(cda:translation)=1]">This value SHALL contain exactly one [1..1] translation (CONF:711230).</sch:assert>
		<sch:assert id="a-711231" test="cda:value[@xsi:type='CD']/cda:translation[@code = 'A' or @code = 'B' or @code ='C' or @code ='D']">This translation SHALL contain exactly one [1..1] @code, which SHALL be selected from ValueSet CMS Payer Groupings 2.16.840.1.113883.3.249.14.102 (CONF:711231).</sch:assert>
		<sch:assert id="a-711271" test="count(cda:templateId[@root='2.16.840.1.113883.10.20.27.3.18'])=1">SHALL contain exactly one [1..1] templateId (CONF:711270) such that it SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.27.3.18" (CONF:711271).</sch:assert>
	</sch:rule>
	<sch:rule id="r-pqrs-2.16.840.1.113883.10.20.27.3.18-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.27.3.18']]">
		<sch:extends rule="r-pqrs-2.16.840.1.113883.10.20.27.3.18-errors-abstract"/>
	</sch:rule>
</sch:pattern>
<sch:pattern id="p-pqrs-2.16.840.1.113883.10.20.27.3.19-errors">
	<sch:rule id="r-pqrs-2.16.840.1.113883.10.20.27.3.19-errors-abstract" abstract="true">
		<sch:extends rule="r-oid-2.16.840.1.113883.10.20.27.3.8-errors-abstract"/>
		<sch:assert id="a-711200" test="count(cda:entryRelationship[@typeCode='SUBJ'][@inversionInd='true']/cda:observation[count(cda:templateId[@root='2.16.840.1.113883.10.20.27.3.24'])=1])=1">SHALL contain exactly one [1..1] entryRelationship (CONF:18114) such that it SHALL contain exactly one [1..1] @typeCode="SUBJ" Has Subject (CodeSystem: HL7ActRelationshipType 2.16.840.1.113883.5.1002 STATIC) (CONF:18115). SHALL contain exactly one [1..1] @inversionInd="true" (CONF:18116). SHALL contain exactly one [1..1] Aggregate Count (CMS EP) (templateId:2.16.840.1.113883.10.20.27.3.24) (CONF:711200).</sch:assert>
	</sch:rule>
	<sch:rule id="r-pqrs-2.16.840.1.113883.10.20.27.3.19-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.27.3.19']]">
		<sch:extends rule="r-pqrs-2.16.840.1.113883.10.20.27.3.19-errors-abstract"/>
	</sch:rule>
</sch:pattern>
<sch:pattern id="p-pqrs-2.16.840.1.113883.10.20.27.3.20-errors">
	<sch:rule id="r-pqrs-2.16.840.1.113883.10.20.27.3.20-errors-abstract" abstract="true">
		<sch:extends rule="r-oid-2.16.840.1.113883.10.20.27.3.4-errors-abstract"/>
		<sch:assert id="a-711197" test="count(cda:entryRelationship[@typeCode='SUBJ'][@inversionInd='true']/cda:observation[count(cda:templateId[@root='2.16.840.1.113883.10.20.27.3.24'])=1])=1">SHALL contain exactly one [1..1] entryRelationship (CONF:17581) such that it SHALL contain exactly one [1..1] @typeCode="SUBJ" (CONF:17582). SHALL contain exactly one [1..1] @inversionInd="true" (CONF:17583). SHALL contain exactly one [1..1] Aggregate Count (CMS EP) (templateId:2.16.840.1.113883.10.20.27.3.24) (CONF:711197).</sch:assert>
		<sch:assert id="a-711210" test="cda:reference/cda:externalObservation[count(cda:id)=1]">This externalObservation SHALL contain exactly one [1..1] id (CONF:711210).</sch:assert>
		<sch:assert id="a-711211" test="count(cda:entryRelationship/cda:observation[count(cda:templateId[@root='2.16.840.1.113883.10.20.27.3.26'])=1]) &gt;=0">MAY contain zero or more [0..*] entryRelationship (CONF:19511) such that it SHALL contain exactly one [1..1] Continuous Variable Measure Value (CMS EP) (templateId:2.16.840.1.113883.10.20.27.3.26) (CONF:711211).</sch:assert>
		<sch:assert id="a-711232" test="not(tested)">This value SHALL be the same as the contents of the observation/code element in the referenced eMeasure (e.g., 21112-8 'Birth date') (CONF:711232).</sch:assert>
		<sch:assert id="a-711275" test="count(cda:templateId[@root='2.16.840.1.113883.10.20.27.3.20'])=1">SHALL contain exactly one [1..1] templateId (CONF:711274) such that it SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.27.3.20" (CONF:711275).</sch:assert>
	</sch:rule>
	<sch:rule id="r-pqrs-2.16.840.1.113883.10.20.27.3.20-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.27.3.20']]">
		<sch:extends rule="r-pqrs-2.16.840.1.113883.10.20.27.3.20-errors-abstract"/>
	</sch:rule>
</sch:pattern>
<sch:pattern id="p-pqrs-2.16.840.1.113883.10.20.27.3.21-errors">
	<sch:rule id="r-pqrs-2.16.840.1.113883.10.20.27.3.21-errors-abstract" abstract="true">
		<sch:extends rule="r-oid-2.16.840.1.113883.10.20.27.3.6-errors-abstract"/>
		<sch:assert id="a-711202" test="count(cda:entryRelationship[@typeCode='SUBJ'][@inversionInd='true']/cda:observation[count(cda:templateId[@root='2.16.840.1.113883.10.20.27.3.24'])=1])=1">SHALL contain exactly one [1..1] entryRelationship (CONF:18126) such that it SHALL contain exactly one [1..1] @typeCode="SUBJ" Has Subject (CodeSystem: HL7ActRelationshipType 2.16.840.1.113883.5.1002 STATIC) (CONF:18127). SHALL contain exactly one [1..1] @inversionInd="true" (CONF:18128). SHALL contain exactly one [1..1] Aggregate Count (CMS EP) (templateId:2.16.840.1.113883.10.20.27.3.24) (CONF:711202).</sch:assert>
		<sch:assert id="a-711260" test="count(cda:templateId[@root='2.16.840.1.113883.10.20.27.3.21'])=1">SHALL contain exactly one [1..1] templateId (CONF:711259) such that it SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.27.3.21" (CONF:711260).</sch:assert>
		<sch:assert id="a-711261" test="not(tested)">Certification validators will allow use of Value Set - ONC Administrative Sex 2.16.840.1.113762.1.4.1 or Value Set - Administrative Gender (HL7 V3) 2.16.840.1.113883.1.11.1 (CONF:711261).</sch:assert>
	</sch:rule>
	<sch:rule id="r-pqrs-2.16.840.1.113883.10.20.27.3.21-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.27.3.21']]">
		<sch:extends rule="r-pqrs-2.16.840.1.113883.10.20.27.3.21-errors-abstract"/>
	</sch:rule>
</sch:pattern>
<sch:pattern id="p-pqrs-2.16.840.1.113883.10.20.27.3.25-errors">
	<sch:rule id="r-pqrs-2.16.840.1.113883.10.20.27.3.25-errors-abstract" abstract="true">
		<sch:extends rule="r-oid-2.16.840.1.113883.10.20.27.3.14-errors-abstract"/>
		<sch:assert id="a-711203" test="count(cda:reference)=1">SHALL contain exactly one [1..1] reference (CONF:711203).</sch:assert>
		<sch:assert id="a-711204" test="cda:reference/cda:externalObservation[count(cda:id)=1]">This externalObservation SHALL contain exactly one [1..1] id (CONF:711204).</sch:assert>
	</sch:rule>
	<sch:rule id="r-pqrs-2.16.840.1.113883.10.20.27.3.25-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.27.3.25']]">
		<sch:extends rule="r-pqrs-2.16.840.1.113883.10.20.27.3.25-errors-abstract"/>
	</sch:rule>
</sch:pattern>
<sch:pattern id="p-pqrs-2.16.840.1.113883.10.20.27.2.6-errors">
	<sch:rule id="r-pqrs-2.16.840.1.113883.10.20.27.2.6-errors-abstract" abstract="true">
		<sch:extends rule="r-oid-2.16.840.1.113883.10.20.27.2.2-errors-abstract"/>
		<sch:assert id="a-711175" test="count(cda:entry[@typeCode='DRIV']/cda:act[count(cda:templateId[@root='2.16.840.1.113883.10.20.27.3.23'])=1])=1">SHALL contain exactly one [1..1] entry (CONF:711285) such that it SHALL contain exactly one [1..1] @typeCode="DRIV" Is derived from (CodeSystem: HL7ActRelationshipType 2.16.840.1.113883.5.1002 STATIC) (CONF:711286). SHALL contain exactly one [1..1] Reporting Parameters Act (CMS EP) (templateId:2.16.840.1.113883.10.20.27.3.23) (CONF:711175).</sch:assert>
		<sch:assert id="a-711278" test="count(cda:templateId[@root='2.16.840.1.113883.10.20.27.2.6'])=1">SHALL contain exactly one [1..1] templateId (CONF:711278) such that it SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.27.2.6" (CONF:711279).</sch:assert>
	</sch:rule>
	<sch:rule id="r-pqrs-2.16.840.1.113883.10.20.27.2.6-errors" context="cda:section[cda:templateId[@root='2.16.840.1.113883.10.20.27.2.6']]">
		<sch:extends rule="r-pqrs-2.16.840.1.113883.10.20.27.2.6-errors-abstract"/>
	</sch:rule>
</sch:pattern>
<sch:pattern id="p-pqrs-2.16.840.1.113883.10.20.27.3.23-errors">
	<sch:rule id="r-pqrs-2.16.840.1.113883.10.20.27.3.23-errors-abstract" abstract="true">
		<sch:extends rule="r-oid-2.16.840.1.113883.10.20.17.3.8-errors-abstract"/>
		<sch:assert id="a-711288" test="cda:isValidDate(cda:effectiveTime/cda:low)">SHALL be precise to day (CONF:711288).</sch:assert>
		<sch:assert id="a-711289" test="cda:isValidDate(cda:effectiveTime/cda:high)">SHALL be precise to day (CONF:711289).</sch:assert>
	</sch:rule>
	<sch:rule id="r-pqrs-2.16.840.1.113883.10.20.27.3.23-errors" context="cda:act[cda:templateId[@root='2.16.840.1.113883.10.20.27.3.23']]">
		<sch:extends rule="r-pqrs-2.16.840.1.113883.10.20.27.3.23-errors-abstract"/>
	</sch:rule>
</sch:pattern>
<sch:pattern id="p-pqrs-2.16.840.1.113883.10.20.27.1.2-warnings">
	<sch:rule id="r-pqrs-2.16.840.1.113883.10.20.27.1.2-warnings-abstract" abstract="true">
		<sch:extends rule="r-oid-2.16.840.1.113883.10.20.27.1.1-warnings-abstract"/>
	</sch:rule>
	<sch:rule id="r-pqrs-2.16.840.1.113883.10.20.27.1.2-warnings" context="cda:ClinicalDocument[cda:templateId[@root='2.16.840.1.113883.10.20.27.1.2']]">
		<sch:extends rule="r-pqrs-2.16.840.1.113883.10.20.27.1.2-warnings-abstract"/>
	</sch:rule>
</sch:pattern>
<sch:pattern id="p-pqrs-2.16.840.1.113883.10.20.27.2.3-warnings">
	<sch:rule id="r-pqrs-2.16.840.1.113883.10.20.27.2.3-warnings-abstract" abstract="true">
		<sch:extends rule="r-oid-2.16.840.1.113883.10.20.27.2.1-warnings-abstract"/>
	</sch:rule>
	<sch:rule id="r-pqrs-2.16.840.1.113883.10.20.27.2.3-warnings" context="cda:section[cda:templateId[@root='2.16.840.1.113883.10.20.27.2.3']]">
		<sch:extends rule="r-pqrs-2.16.840.1.113883.10.20.27.2.3-warnings-abstract"/>
	</sch:rule>
</sch:pattern>
<sch:pattern id="p-pqrs-2.16.840.1.113883.10.20.27.3.17-warnings">
	<sch:rule id="r-pqrs-2.16.840.1.113883.10.20.27.3.17-warnings-abstract" abstract="true">
		<sch:extends rule="r-oid-2.16.840.1.113883.10.20.27.3.1-warnings-abstract"/>
	</sch:rule>
	<sch:rule id="r-pqrs-2.16.840.1.113883.10.20.27.3.17-warnings" context="cda:organizer[cda:templateId[@root='2.16.840.1.113883.10.20.27.3.17']]">
		<sch:extends rule="r-pqrs-2.16.840.1.113883.10.20.27.3.17-warnings-abstract"/>
	</sch:rule>
</sch:pattern>
<sch:pattern id="p-pqrs-2.16.840.1.113883.10.20.27.3.16-warnings">
	<sch:rule id="r-pqrs-2.16.840.1.113883.10.20.27.3.16-warnings-abstract" abstract="true">
		<sch:extends rule="r-oid-2.16.840.1.113883.10.20.27.3.5-warnings-abstract"/>
	</sch:rule>
	<sch:rule id="r-pqrs-2.16.840.1.113883.10.20.27.3.16-warnings" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.27.3.16']]">
		<sch:extends rule="r-pqrs-2.16.840.1.113883.10.20.27.3.16-warnings-abstract"/>
	</sch:rule>
</sch:pattern>
<sch:pattern id="p-pqrs-2.16.840.1.113883.10.20.27.3.24-warnings">
	<sch:rule id="r-pqrs-2.16.840.1.113883.10.20.27.3.24-warnings-abstract" abstract="true">
		<sch:extends rule="r-oid-2.16.840.1.113883.10.20.27.3.3-warnings-abstract"/>
	</sch:rule>
	<sch:rule id="r-pqrs-2.16.840.1.113883.10.20.27.3.24-warnings" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.27.3.24']]">
		<sch:extends rule="r-pqrs-2.16.840.1.113883.10.20.27.3.24-warnings-abstract"/>
	</sch:rule>
</sch:pattern>
<sch:pattern id="p-pqrs-2.16.840.1.113883.10.20.27.3.26-warnings">
	<sch:rule id="r-pqrs-2.16.840.1.113883.10.20.27.3.26-warnings-abstract" abstract="true">
		<sch:extends rule="r-oid-2.16.840.1.113883.10.20.27.3.2-warnings-abstract"/>
	</sch:rule>
	<sch:rule id="r-pqrs-2.16.840.1.113883.10.20.27.3.26-warnings" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.27.3.26']]">
		<sch:extends rule="r-pqrs-2.16.840.1.113883.10.20.27.3.26-warnings-abstract"/>
	</sch:rule>
</sch:pattern>
<sch:pattern id="p-pqrs-2.16.840.1.113883.10.20.27.3.22-warnings">
	<sch:rule id="r-pqrs-2.16.840.1.113883.10.20.27.3.22-warnings-abstract" abstract="true">
		<sch:extends rule="r-oid-2.16.840.1.113883.10.20.27.3.7-warnings-abstract"/>
	</sch:rule>
	<sch:rule id="r-pqrs-2.16.840.1.113883.10.20.27.3.22-warnings" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.27.3.22']]">
		<sch:extends rule="r-pqrs-2.16.840.1.113883.10.20.27.3.22-warnings-abstract"/>
	</sch:rule>
</sch:pattern>
<sch:pattern id="p-pqrs-2.16.840.1.113883.10.20.27.3.18-warnings">
	<sch:rule id="r-pqrs-2.16.840.1.113883.10.20.27.3.18-warnings-abstract" abstract="true">
		<sch:extends rule="r-oid-2.16.840.1.113883.10.20.27.3.9-warnings-abstract"/>
	</sch:rule>
	<sch:rule id="r-pqrs-2.16.840.1.113883.10.20.27.3.18-warnings" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.27.3.18']]">
		<sch:extends rule="r-pqrs-2.16.840.1.113883.10.20.27.3.18-warnings-abstract"/>
	</sch:rule>
</sch:pattern>
<sch:pattern id="p-pqrs-2.16.840.1.113883.10.20.27.3.19-warnings">
	<sch:rule id="r-pqrs-2.16.840.1.113883.10.20.27.3.19-warnings-abstract" abstract="true">
		<sch:extends rule="r-oid-2.16.840.1.113883.10.20.27.3.8-warnings-abstract"/>
	</sch:rule>
	<sch:rule id="r-pqrs-2.16.840.1.113883.10.20.27.3.19-warnings" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.27.3.19']]">
		<sch:extends rule="r-pqrs-2.16.840.1.113883.10.20.27.3.19-warnings-abstract"/>
	</sch:rule>
</sch:pattern>
<sch:pattern id="p-pqrs-2.16.840.1.113883.10.20.27.3.20-warnings">
	<sch:rule id="r-pqrs-2.16.840.1.113883.10.20.27.3.20-warnings-abstract" abstract="true">
		<sch:extends rule="r-oid-2.16.840.1.113883.10.20.27.3.4-warnings-abstract"/>
	</sch:rule>
	<sch:rule id="r-pqrs-2.16.840.1.113883.10.20.27.3.20-warnings" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.27.3.20']]">
		<sch:extends rule="r-pqrs-2.16.840.1.113883.10.20.27.3.20-warnings-abstract"/>
	</sch:rule>
</sch:pattern>
<sch:pattern id="p-pqrs-2.16.840.1.113883.10.20.27.3.21-warnings">
	<sch:rule id="r-pqrs-2.16.840.1.113883.10.20.27.3.21-warnings-abstract" abstract="true">
		<sch:extends rule="r-oid-2.16.840.1.113883.10.20.27.3.6-warnings-abstract"/>
	</sch:rule>
	<sch:rule id="r-pqrs-2.16.840.1.113883.10.20.27.3.21-warnings" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.27.3.21']]">
		<sch:extends rule="r-pqrs-2.16.840.1.113883.10.20.27.3.21-warnings-abstract"/>
	</sch:rule>
</sch:pattern>
<sch:pattern id="p-pqrs-2.16.840.1.113883.10.20.27.3.25-warnings">
	<sch:rule id="r-pqrs-2.16.840.1.113883.10.20.27.3.25-warnings-abstract" abstract="true">
		<sch:extends rule="r-oid-2.16.840.1.113883.10.20.27.3.14-warnings-abstract"/>
	</sch:rule>
	<sch:rule id="r-pqrs-2.16.840.1.113883.10.20.27.3.25-warnings" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.27.3.25']]">
		<sch:extends rule="r-pqrs-2.16.840.1.113883.10.20.27.3.25-warnings-abstract"/>
	</sch:rule>
</sch:pattern>
<sch:pattern id="p-pqrs-2.16.840.1.113883.10.20.27.2.6-warnings">
	<sch:rule id="r-pqrs-2.16.840.1.113883.10.20.27.2.6-warnings-abstract" abstract="true">
		<sch:extends rule="r-oid-2.16.840.1.113883.10.20.27.2.2-warnings-abstract"/>
	</sch:rule>
	<sch:rule id="r-pqrs-2.16.840.1.113883.10.20.27.2.6-warnings" context="cda:section[cda:templateId[@root='2.16.840.1.113883.10.20.27.2.6']]">
		<sch:extends rule="r-pqrs-2.16.840.1.113883.10.20.27.2.6-warnings-abstract"/>
	</sch:rule>
</sch:pattern>
<sch:pattern id="p-pqrs-2.16.840.1.113883.10.20.27.3.23-warnings">
	<sch:rule id="r-pqrs-2.16.840.1.113883.10.20.27.3.23-warnings-abstract" abstract="true">
		<sch:extends rule="r-oid-2.16.840.1.113883.10.20.17.3.8-warnings-abstract"/>
	</sch:rule>
	<sch:rule id="r-pqrs-2.16.840.1.113883.10.20.27.3.23-warnings" context="cda:act[cda:templateId[@root='2.16.840.1.113883.10.20.27.3.23']]">
		<sch:extends rule="r-pqrs-2.16.840.1.113883.10.20.27.3.23-warnings-abstract"/>
	</sch:rule>
</sch:pattern>
<sch:rule id="r-oid-2.16.840.1.113883.10.20.27.1.1-errors-abstract" abstract="true">
	<sch:assert id="a-18189" test="cda:isValidDate(cda:effectiveTime)">The content SHALL be a conformant US Realm Date and Time (DTM.US.FIELDED) (2.16.840.1.113883.10.20.22.5.4) (CONF:18189).</sch:assert>
</sch:rule>
<sch:rule id="r-oid-2.16.840.1.113883.10.20.27.1.1-warnings-abstract" abstract="true">
	<sch:assert id="a-77-17238-v" test="cda:confidentialityCode[cda:isVOCCodeValid('2.16.840.1.113883.1.11.16926',  @code, @codeSystem)]">10710: //confidentialityCode/@code - SHALL Value set validation error.</sch:assert>
</sch:rule>
<sch:rule id="r-oid-2.16.840.1.113883.10.20.27.2.1-errors-abstract" abstract="true">
		<sch:assert id="a-711277" test="count(cda:templateId[@root='2.16.840.1.113883.10.20.27.2.3'])=1">SHALL contain exactly one [1..1] templateId (CONF:711276) such that it SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.27.2.3" (CONF:711277).</sch:assert>
</sch:rule>
<sch:rule id="r-oid-2.16.840.1.113883.10.20.27.2.2-errors-abstract" abstract="true">
        <sch:assert id="a-711278" test="count(cda:templateId[@root='2.16.840.1.113883.10.20.27.2.6'])=1">SHALL contain exactly one [1..1] templateId (CONF:711278) such that it SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.27.2.6" (CONF:711279).</sch:assert>
</sch:rule>
<sch:rule id="r-oid-2.16.840.1.113883.10.20.27.3.3-errors-abstract" abstract="true">
        <sch:assert id="a-711263" test="count(cda:templateId[@root='2.16.840.1.113883.10.20.27.3.24'])=1">SHALL contain exactly one [1..1] templateId (CONF:711262) such that it SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.27.3.24" (CONF:711263).</sch:assert>
 </sch:rule>
<sch:rule id="r-oid-2.16.840.1.113883.10.20.27.3.2-errors-abstract" abstract="true">
	<sch:assert id="a-77-18242" test="cda:methodCode[cda:isVOCCodeValid('2.16.840.1.113883.1.11.20450',  @code, @codeSystem)]">10710: //component/observation/entryRelationship/observation/templateId[@root='2.16.840.1.113883.10.20.27.3.2']/../methodCode/@code - SHALL Value set validation error.</sch:assert>
			<sch:assert id="a-711265" test="count(cda:templateId[@root='2.16.840.1.113883.10.20.27.3.26'])=1">SHALL contain exactly one [1..1] templateId (CONF:711264) such that it SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.27.3.26" (CONF:711265).</sch:assert>
	</sch:rule>
<sch:rule id="r-oid-2.16.840.1.113883.10.20.27.3.7-errors-abstract" abstract="true">
	<sch:assert id="a-711254" test="count(cda:templateId[@root='2.16.840.1.113883.10.20.27.3.22'])=1">SHALL contain exactly one [1..1] templateId (CONF:711253) such that it SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.27.3.22" (CONF:711254).</sch:assert>
</sch:rule>
<sch:rule id="r-oid-2.16.840.1.113883.10.20.27.3.5-errors-abstract" abstract="true">
        <sch:assert id="a-711267" test="count(cda:templateId[@root='2.16.840.1.113883.10.20.27.3.16'])=1">SHALL contain exactly one [1..1] templateId (CONF:711266) such that it SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.27.3.16" (CONF:711267).</sch:assert>
</sch:rule>
<sch:rule id="r-oid-2.16.840.1.113883.10.20.27.3.1-errors-abstract" abstract="true">
        <sch:assert id="a-711269" test="count(cda:templateId[@root='2.16.840.1.113883.10.20.27.3.17'])=1">SHALL contain exactly one [1..1] templateId (CONF:711268) such that it SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.27.3.17" (CONF:711269).</sch:assert>
</sch:rule>
<sch:rule id="r-oid-2.16.840.1.113883.10.20.27.3.9-errors-abstract" abstract="true">
</sch:rule>
<sch:rule id="r-oid-2.16.840.1.113883.10.20.27.3.14-errors-abstract" abstract="true">
        <sch:assert id="a-711256" test="count(cda:templateId[@root='2.16.840.1.113883.10.20.27.3.25'])=1">SHALL contain exactly one [1..1] templateId (CONF:711255) such that it SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.27.3.25" (CONF:711256).</sch:assert>
        <sch:assert id="p_19652_P01" test="not(cda:reference) or cda:reference[@typeCode='REFR']">The reference SHALL contain exactly one [1..1] @typeCode="REFR" refers to (CodeSystem: HL7ActRelationshipType 2.16.840.1.113883.5.1002) (CONF:19652_P01).</sch:assert>
</sch:rule>
<sch:rule id="r-oid-2.16.840.1.113883.10.20.17.3.8-errors-abstract" abstract="true">
        <sch:assert id="a-3274" test="cda:effectiveTime/cda:isValidDate(cda:low)">10705: //act[templateId/@root='2.16.840.1.113883.10.20.17.3.8']/effectiveTime/low/@value - SHALL Invalid date and/or time format.</sch:assert>
        <sch:assert id="a-3275" test="cda:effectiveTime/cda:isValidDate(cda:high)">10705: //act[templateId/@root='2.16.840.1.113883.10.20.17.3.8']/effectiveTime/high/@value - SHALL Invalid date and/or time format.</sch:assert>
        <sch:assert id="a-711273" test="count(cda:templateId[@root='2.16.840.1.113883.10.20.27.3.23'])=1">SHALL contain exactly one [1..1] templateId (CONF:711272) such that it SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.27.3.23" (CONF:711273).</sch:assert>
</sch:rule>
<sch:rule id="r-oid-2.16.840.1.113883.10.20.27.3.8-errors-abstract" abstract="true">
        <sch:assert id="a-711258" test="count(cda:templateId[@root='2.16.840.1.113883.10.20.27.3.19'])=1">SHALL contain exactly one [1..1] templateId (CONF:711257) such that it SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.27.3.19" (CONF:711258).</sch:assert>
</sch:rule>
<sch:rule id="r-oid-2.16.840.1.113883.10.20.27.3.4-errors-abstract" abstract="true">
</sch:rule>
<sch:rule id="r-oid-2.16.840.1.113883.10.20.27.3.6-errors-abstract" abstract="true">
 </sch:rule>
<sch:rule id="r-oid-2.16.840.1.113883.10.20.17.2.1-errors-abstract" abstract="true">
</sch:rule>
<sch:rule id="r-oid-2.16.840.1.113883.10.20.24.3.55-errors-abstract" abstract="true">
</sch:rule>
<sch:rule id="r-oid-2.16.840.1.113883.10.20.24.2.2-errors-abstract" abstract="true">
<!--      <sch:assert id="a-67-19230" test="cda:code[@code='55186-1' and @codeSystem='2.16.840.1.113883.6.1']">This code SHALL contain exactly one [1..1] @code="55186-1" Measure Section (CodeSystem: LOINC 2.16.840.1.113883.6.1) (CONF:19230).</sch:assert> -->
</sch:rule>
<sch:rule id="r-oid-2.16.840.1.113883.10.20.24.3.98-errors-abstract" abstract="true">
</sch:rule>
<sch:rule id="r-oid-2.16.840.1.113883.10.20.27.3.10-errors-abstract" abstract="true">
</sch:rule>
<sch:rule id="r-oid-2.16.840.1.113883.10.20.27.3.11-errors-abstract" abstract="true">
</sch:rule>
<sch:rule id="r-oid-2.16.840.1.113883.10.20.27.3.15-errors-abstract" abstract="true">
</sch:rule>
<sch:pattern id="document-errors">
	<sch:rule context="cda:ClinicalDocument">
		<sch:assert id="a-pqrs_0001" test="cda:checkLength(cda:versionNumber[1]/@value, 20, 'N')">10701: /ClinicalDocument/versionNumber value SHALL not exceed the maximum allowable length 20.</sch:assert>
	</sch:rule>
	<sch:rule context="cda:ClinicalDocument/cda:author/cda:assignedAuthor/cda:id[@root='2.16.840.1.113883.4.6']">
		<sch:assert id="a-pqrs_0002" test="cda:checkLength(@extension, 64, 'N')">10701: /ClinicalDocument/author/assignedAuthor/id[@root="2.16.840.1.113883.4.6"]/@extension SHALL not exceed the maximum allowable length 64.</sch:assert>
	</sch:rule>
	<sch:rule context="cda:ClinicalDocument/cda:legalAuthenticator/cda:assignedEntity/cda:representedOrganization/cda:id[@root='2.16.840.1.113883.19.5']">
		<sch:assert id="a-pqrs_0003" test="cda:checkLength(@extension, 9, 'N')">10701: /ClinicalDocument/legalAuthenticator/assignedEntity/representedOrganization/id[@root="2.16.840.1.113883.19.5"]/@extension SHALL not exceed the maximum allowable length 9.</sch:assert>
	</sch:rule>
	<sch:rule context="cda:ClinicalDocument/cda:legalAuthenticator/cda:assignedEntity/cda:representedOrganization">
		<sch:assert id="a-pqrs_0004" test="cda:checkLength(cda:name[1], 100, 'N')">10701: /ClinicalDocument/legalAuthenticator/assignedEntity/representedOrganization/name SHALL not exceed the maximum allowable length 100.</sch:assert>
	</sch:rule>
	<sch:rule context="cda:ClinicalDocument/cda:documentationOf/cda:serviceEvent/cda:performer/cda:assignedEntity/cda:telecom">
		<sch:assert id="a-pqrs_0005" test="cda:checkLength(@value, 100, 'N')">10701: /ClinicalDocument/documentationOf/serviceEvent/performer/assignedEntity/telecom/@value SHALL not exceed the maximum allowable length 100.</sch:assert>
	</sch:rule>
	<sch:rule context="cda:ClinicalDocument/cda:participant[@typeCode='LOC']/cda:associatedEntity[@classCode='SDLOC']/cda:id">
		<sch:assert id="a-pqrs_0006" test="cda:checkLength(@extension, 16, 'N')">10701: /ClinicalDocument/participant[@typeCode="LOC"]/associatedEntity[@classCode="SDLOC"]/id/@extension SHALL not exceed the maximum allowable length 16.</sch:assert>
	</sch:rule>
	<sch:rule context="cda:observation[cda:templateId/@root='2.16.840.1.113883.10.20.27.3.2']">
		<sch:assert id="a-pqrs_0007" test="cda:checkLength(cda:value[1]/@xsi:type, 16, 'N')">10701: /ClinicalDocument/component/structuredBody/component/section/entry/organizer/component/observation/entryRelationship/observation/templateId[@root='2.16.840.1.113883.10.20.27.3.2']/parent::observation/value/@xsi:type SHALL not exceed the maximum allowable length 16.</sch:assert>
		<sch:assert id="a-pqrs_0008" test="cda:checkLength(cda:value[1]/@unit, 8, 'N')">10701: /ClinicalDocument/component/structuredBody/component/section/entry/organizer/component/observation/entryRelationship/observation/templateId[@root="2.16.840.1.113883.10.20.27.3.2"]/parent::observation/value/@unit SHALL not exceed the maximum allowable length 8.</sch:assert>
	</sch:rule>
</sch:pattern>
<!-- pqrs March 2015 Release changes, added new function to validate Version specific measure IDs -->
<xsl:function name="cda:isValidMeasureVersionSpecificID" as="xs:boolean">
	<!--xsl:function xmlns:javaClassName="java:gov.cms.pqrs.qrda3.service.Qrda3ValidationsUtil" name="cda:isValidMeasureVersionSpecificID" as="xs:boolean"-->
	<xsl:param name="pgmYear" as="xs:string?"/>
	<xsl:param name="isValidMeasureVersionSpecificID" as="xs:string?"/>
	<xsl:value-of select="true()"/>
	<!--xsl:choose>
		<xsl:when test="javaClassName:isValidMeasureVersionSpecificID($pgmYear,$isValidMeasureVersionSpecificID)">
			<xsl:value-of select="true()"/>
		</xsl:when>
		<xsl:otherwise>
			<xsl:value-of select="false()"/>
		</xsl:otherwise>
	</xsl:choose-->
</xsl:function>
<!-- Added algorithm to check the string-length of NPI value(if greater than 10 digits - error triggered - for 2012 Phase 1 - 12/12/11) -->
<xsl:function name="cda:isValidNPI" as="xs:boolean">
	<xsl:param name="npi-string" as="xs:string?"/>
	<xsl:choose>
		<xsl:when test="matches(substring($npi-string,1,4),'1234')">
			<xsl:value-of select="false()"/>
		</xsl:when>
		<xsl:when test="string-length($npi-string) &gt; 10">
			<xsl:value-of select="false()"/>
		</xsl:when>
		<xsl:when test="matches($npi-string,'\d{10}')">
			<xsl:variable name="step2" select="concat('80840',$npi-string)"/>
			<xsl:variable name="step3" select="substring($step2,1,14)"/>
			<xsl:variable name="checkDig" select="xs:integer(substring($step2,15,1))"/>
			<xsl:analyze-string select="$step3" regex="(\d)(\d)(\d)(\d)(\d)(\d)(\d)(\d)(\d)(\d)(\d)(\d)(\d)(\d)">
				<xsl:matching-substring>
					<xsl:variable name="d1" select="xs:integer(regex-group(1))"/>
					<xsl:variable name="d2" select="xs:integer(regex-group(2))"/>
					<xsl:variable name="d3" select="xs:integer(regex-group(3))"/>
					<xsl:variable name="d4" select="xs:integer(regex-group(4))"/>
					<xsl:variable name="d5" select="xs:integer(regex-group(5))"/>
					<xsl:variable name="d6" select="xs:integer(regex-group(6))"/>
					<xsl:variable name="d7" select="xs:integer(regex-group(7))"/>
					<xsl:variable name="d8" select="xs:integer(regex-group(8))"/>
					<xsl:variable name="d9" select="xs:integer(regex-group(9))"/>
					<xsl:variable name="d10" select="xs:integer(regex-group(10))"/>
					<xsl:variable name="d11" select="xs:integer(regex-group(11))"/>
					<xsl:variable name="d12" select="xs:integer(regex-group(12))"/>
					<xsl:variable name="d13" select="xs:integer(regex-group(13))"/>
					<xsl:variable name="d14" select="xs:integer(regex-group(14))"/>
					<xsl:variable name="d14s1" select="xs:integer(cda:sumDigits(xs:string($d14*2)))"/>
					<xsl:variable name="d12s1" select="xs:integer(cda:sumDigits(xs:string($d12*2)))"/>
					<xsl:variable name="d10s1" select="xs:integer(cda:sumDigits(xs:string($d10*2)))"/>
					<xsl:variable name="d8s1" select="xs:integer(cda:sumDigits(xs:string($d8*2)))"/>
					<xsl:variable name="d6s1" select="xs:integer(cda:sumDigits(xs:string($d6*2)))"/>
					<xsl:variable name="d4s1" select="xs:integer(cda:sumDigits(xs:string($d4*2)))"/>
					<xsl:variable name="d2s1" select="xs:integer(cda:sumDigits(xs:string($d2*2)))"/>
					<xsl:variable name="digRigGrpTotal" select="$d14s1+$d12s1+$d10s1+$d8s1+$d6s1+$d4s1+$d2s1"/>
					<xsl:variable name="step4" select="$digRigGrpTotal+($d1+$d3+$d5+$d7+$d9+$d11+$d13)"/>
					<xsl:value-of select="cda:checkNPI($step4,$checkDig)"/>
				</xsl:matching-substring>
				<xsl:non-matching-substring>
					<xsl:value-of select="false()"/>
				</xsl:non-matching-substring>
			</xsl:analyze-string>
		</xsl:when>
		<xsl:otherwise>
			<xsl:value-of select="false()"/>
		</xsl:otherwise>
	</xsl:choose>
</xsl:function>
<xsl:function name="cda:sumDigits" as="xs:string">
	<xsl:param name="content" as="xs:string"/>
	<xsl:choose>
		<xsl:when test="string-length($content)=2">
			<xsl:analyze-string select="$content" regex="(\d)(\d)">
				<xsl:matching-substring>
					<xsl:value-of select="xs:integer(regex-group(1)) + xs:integer(regex-group(2))"/>
				</xsl:matching-substring>
				<xsl:non-matching-substring>
					<xsl:value-of select="0"/>
				</xsl:non-matching-substring>
			</xsl:analyze-string>
		</xsl:when>
		<xsl:otherwise>
			<xsl:value-of select="xs:integer($content)"/>
		</xsl:otherwise>
	</xsl:choose>
</xsl:function>
<xsl:function name="cda:checkNPI" as="xs:boolean">
	<xsl:param name="total" as="xs:double"/>
	<xsl:param name="checkDigit" as="xs:integer"/>
	<xsl:choose>
		<xsl:when test="($total + $checkDigit) mod 10 = 0">
			<xsl:value-of select="true()"/>
		</xsl:when>
		<xsl:otherwise>
			<xsl:value-of select="false()"/>
		</xsl:otherwise>
	</xsl:choose>
</xsl:function>
<xsl:function name="cda:validateSSN" as="xs:boolean">
	<xsl:param name="ssn" as="xs:string?"/>
	<xsl:choose>
		<xsl:when test="$ssn != '999999999'">
			<xsl:analyze-string select="$ssn" regex="^\d{{9}}$">
				<xsl:matching-substring>
					<xsl:value-of select="true()"/>
				</xsl:matching-substring>
				<xsl:non-matching-substring>
					<xsl:value-of select="false()"/>
				</xsl:non-matching-substring>
			</xsl:analyze-string>
		</xsl:when>
		<xsl:otherwise>
			<xsl:value-of select="false()"/>
		</xsl:otherwise>
	</xsl:choose>
</xsl:function>
<!-- pqrs August 2014 Release changes, added new function used to validate date strings -->
<xsl:function name="cda:isValidDate" as="xs:boolean">
	<!--xsl:function xmlns:javaClassName="java:gov.cms.pqri.ehrsevt.validators.ValidatorHelper" name="cda:isValidDate" as="xs:boolean"-->
	<xsl:param name="date-stringT" as="node()*"/>
	<!--xsl:variable name="date-string" select="$date-stringT[1]/@value"/-->
	<xsl:value-of select="true()"/>
	<!--xsl:choose>
		<xsl:when test="javaClassName:isValidDate($date-string)">
			<xsl:value-of select="true()"/>
		</xsl:when>
		<xsl:otherwise>
			<xsl:value-of select="false()"/>
		</xsl:otherwise>
	</xsl:choose-->
</xsl:function>
<!-- Function to validate effective date, this functions is taken from EHRPROD sch file. -->
<xsl:function xmlns="http://purl.oclc.org/dsdl/schematron" name="cda:isValidEffectiveTime" as="xs:boolean">
	<xsl:param name="effectiveDateP" as="node()*"/>
	<xsl:choose>
		<xsl:when test="count($effectiveDateP/@value) = 1">
			<xsl:choose>
				<xsl:when test="cda:isValidDate($effectiveDateP)">
					<xsl:value-of select="true()"/>
				</xsl:when>
				<xsl:otherwise>
					<xsl:value-of select="false()"/>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:when>
		<xsl:when test="count($effectiveDateP/cda:low) = 1">
			<xsl:variable name="low" select="$effectiveDateP/cda:low"/>
			<xsl:choose>
				<xsl:when test="cda:isValidDate($low)">
					<xsl:value-of select="true()"/>
				</xsl:when>
				<xsl:otherwise>
					<xsl:value-of select="false()"/>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:when>
		<xsl:when test="count($effectiveDateP/cda:center) = 1">
			<xsl:variable name="center" select="$effectiveDateP/cda:center"/>
			<xsl:choose>
				<xsl:when test="cda:isValidDate($center)">
					<xsl:value-of select="true()"/>
				</xsl:when>
				<xsl:otherwise>
					<xsl:value-of select="false()"/>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:when>
		<xsl:when test="count($effectiveDateP/cda:high) = 1">
			<xsl:variable name="high" select="$effectiveDateP/cda:high"/>
			<xsl:choose>
				<xsl:when test="cda:isValidDate($high)">
					<xsl:value-of select="true()"/>
				</xsl:when>
				<xsl:otherwise>
					<xsl:value-of select="false()"/>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:when>
		<xsl:otherwise>
			<xsl:value-of select="false()"/>
		</xsl:otherwise>
	</xsl:choose>
</xsl:function>
<!-- Check Length Function -->
<xsl:function name="cda:checkLength" as="xs:boolean">
	<xsl:param name="content" as="xs:string?"/>
	<xsl:param name="length" as="xs:integer"/>
	<xsl:param name="isRequired" as="xs:string"/>
	<xsl:choose>
		<xsl:when test="string-length($content) &gt; $length">
			<xsl:value-of select="false()"/>
		</xsl:when>
		<xsl:when test="string-length($content) = 0">
			<xsl:choose>
				<xsl:when test="$isRequired='Y'">
					<xsl:value-of select="false()"/>
				</xsl:when>
				<xsl:otherwise>
					<xsl:value-of select="true()"/>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:when>
		<xsl:otherwise>
			<xsl:value-of select="true()"/>
		</xsl:otherwise>
	</xsl:choose>
</xsl:function>
<!-- pqrs August 2015 Release changes, added new function to validate VOC values -->
<xsl:function name="cda:isVOCCodeValid" as="xs:boolean">
	<!--xsl:function xmlns:javaClassName="java:gov.cms.pqrs.qrda3.service.Qrda3ValidationsUtil" name="cda:isVOCCodeValid" as="xs:boolean"-->
	<xsl:param name="vsid" as="xs:string?"/>
	<xsl:param name="code" as="xs:string?"/>
	<xsl:param name="codesystem" as="xs:string?"/>
	<xsl:value-of select="true()"/>
	<!--xsl:choose>
		<xsl:when test="javaClassName:isVOCCodeValid($vsid,$codesystem,$code)">
			<xsl:value-of select="true()"/>
		</xsl:when>
		<xsl:otherwise>
			<xsl:value-of select="false()"/>
		</xsl:otherwise>
	</xsl:choose-->
</xsl:function>
<!-- pqrs August 2015 Release changes, added new function to validate performance rates -->
<xsl:function name="cda:isValidPerfRates" as="xs:boolean">
	<!--xsl:function xmlns:javaClassName="java:gov.cms.pqrs.qrda3.service.Qrda3ValidationsUtil" name="cda:isValidPerfRates" as="xs:boolean"-->
	<xsl:param name="versionID" as="xs:string?"/>
	<xsl:param name="numPerfRates" as="xs:integer?"/>
	<xsl:value-of select="true()"/>
	<!--xsl:value-of select="javaClassName:isValidPerfRates($versionID,$numPerfRates)"/-->
</xsl:function>

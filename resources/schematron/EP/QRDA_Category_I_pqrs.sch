<?xml version="1.0" encoding="utf-8" standalone="yes"?>
<!DOCTYPE schema [
	<!ENTITY sch-qrda-r2-base SYSTEM 'QRDA_Category_I_lantana.sch'>
]>
<sch:schema xmlns:voc="http://www.lantanagroup.com/voc" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:svs="urn:ihe:iti:svs:2008" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:sdtc="urn:hl7-org:sdtc" xmlns="urn:hl7-org:v3" xmlns:cda="urn:hl7-org:v3" xmlns:sch="http://purl.oclc.org/dsdl/schematron" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<sch:ns prefix="voc" uri="http://www.lantanagroup.com/voc"/>
	<sch:ns prefix="svs" uri="urn:ihe:iti:svs:2008"/>
	<sch:ns prefix="xsi" uri="http://www.w3.org/2001/XMLSchema-instance"/>
	<sch:ns prefix="sdtc" uri="urn:hl7-org:sdtc"/>
	<sch:ns prefix="cda" uri="urn:hl7-org:v3"/>
	<sch:phase id="errors">
		<sch:active pattern="p-pqrs-sdtc-errors-code"/>
		<sch:active pattern="p-pqrs-sdtc-errors-value"/>
		<sch:active pattern="p-pqrs-required-template-ids"/>
		<sch:active pattern="p-pqrs-DOCUMENT-TEMPLATE"/>
		<sch:active pattern="p-pqrs-2.16.840.1.113883.10.20.17.3.8-errors"/>
		<sch:active pattern="p-pqrs-2.16.840.1.113883.10.20.17.2.1-errors"/>
		<sch:active pattern="p-pqrs-2.16.840.1.113883.10.20.17.2.4-errors"/>
		<sch:active pattern="p-pqrs-2.16.840.1.113883.10.20.22.1.1-errors"/>
		<sch:active pattern="p-pqrs-2.16.840.1.113883.10.20.22.4.16-errors"/>
		<sch:active pattern="p-pqrs-2.16.840.1.113883.10.20.22.4.2-errors"/>
		<sch:active pattern="p-pqrs-2.16.840.1.113883.10.20.22.4.28-errors"/>
		<sch:active pattern="p-pqrs-2.16.840.1.113883.10.20.22.4.9-errors"/>
		<sch:active pattern="p-pqrs-2.16.840.1.113883.10.20.22.4.8-errors"/>
		<sch:active pattern="p-pqrs-2.16.840.1.113883.10.20.22.4.6-errors"/>
		<sch:active pattern="p-pqrs-2.16.840.1.113883.10.20.22.4.25-errors"/>
		<sch:active pattern="p-pqrs-2.16.840.1.113883.10.20.24.3.90-errors"/>
		<sch:active pattern="p-pqrs-2.16.840.1.113883.10.20.22.4.7-errors"/>
		<sch:active pattern="p-pqrs-2.16.840.1.113883.10.20.22.4.20-errors"/>
		<sch:active pattern="p-pqrs-2.16.840.1.113883.10.20.22.4.23-errors"/>
		<sch:active pattern="p-pqrs-2.16.840.1.113883.10.20.22.4.17-errors"/>
		<sch:active pattern="p-pqrs-2.16.840.1.113883.10.20.22.4.18-errors"/>
		<sch:active pattern="p-pqrs-2.16.840.1.113883.10.20.22.4.19-errors"/>
		<sch:active pattern="p-pqrs-2.16.840.1.113883.10.20.22.4.24-errors"/>
		<sch:active pattern="p-pqrs-2.16.840.1.113883.10.20.22.4.14-errors"/>
		<sch:active pattern="p-pqrs-2.16.840.1.113883.10.20.22.4.31-errors"/>
		<sch:active pattern="p-pqrs-2.16.840.1.113883.10.20.22.4.32-errors"/>
		<sch:active pattern="p-pqrs-2.16.840.1.113883.10.20.22.4.4-errors"/>
		<sch:active pattern="p-pqrs-2.16.840.1.113883.10.20.22.4.37-errors"/>
		<sch:active pattern="p-pqrs-2.16.840.1.113883.10.20.22.4.12-errors"/>
		<sch:active pattern="p-pqrs-2.16.840.1.113883.10.20.22.4.13-errors"/>
		<sch:active pattern="p-pqrs-2.16.840.1.113883.10.20.22.4.39-errors"/>
		<sch:active pattern="p-pqrs-2.16.840.1.113883.10.20.22.4.40-errors"/>
		<sch:active pattern="p-pqrs-2.16.840.1.113883.10.20.22.4.41-errors"/>
		<sch:active pattern="p-pqrs-2.16.840.1.113883.10.20.22.4.42-errors"/>
		<sch:active pattern="p-pqrs-2.16.840.1.113883.10.20.22.4.43-errors"/>
		<sch:active pattern="p-pqrs-2.16.840.1.113883.10.20.22.4.44-errors"/>
		<sch:active pattern="p-pqrs-2.16.840.1.113883.10.20.22.4.46-errors"/>
		<sch:active pattern="p-pqrs-2.16.840.1.113883.10.20.22.4.45-errors"/>
		<sch:active pattern="p-pqrs-2.16.840.1.113883.10.20.22.4.47-errors"/>
		<sch:active pattern="p-pqrs-2.16.840.1.113883.10.20.22.4.49-errors"/>
		<sch:active pattern="p-pqrs-2.16.840.1.113883.10.20.22.4.50-errors"/>
		<sch:active pattern="p-pqrs-2.16.840.1.113883.10.20.22.4.54-errors"/>
		<sch:active pattern="p-pqrs-2.16.840.1.113883.10.20.22.4.5-errors"/>
		<sch:active pattern="p-pqrs-2.16.840.1.113883.10.20.22.4.5-CLOSEDTEMPLATE"/>
		<sch:active pattern="p-pqrs-2.16.840.1.113883.10.20.24.3.104-errors"/>
		<sch:active pattern="p-pqrs-2.16.840.1.113883.10.20.24.3.61-errors"/>
		<sch:active pattern="p-pqrs-2.16.840.1.113883.10.20.24.3.65-errors"/>
		<sch:active pattern="p-pqrs-2.16.840.1.113883.10.20.24.3.83-errors"/>
		<sch:active pattern="p-pqrs-2.16.840.1.113883.10.20.24.3.84-errors"/>
		<sch:active pattern="p-pqrs-2.16.840.1.113883.10.20.24.3.85-errors"/>
		<sch:active pattern="p-pqrs-2.16.840.1.113883.10.20.24.3.1-errors"/>
		<sch:active pattern="p-pqrs-2.16.840.1.113883.10.20.24.3.63-errors"/>
		<sch:active pattern="p-pqrs-2.16.840.1.113883.10.20.24.3.66-errors"/>
		<sch:active pattern="p-pqrs-2.16.840.1.113883.10.20.24.3.2-errors"/>
		<sch:active pattern="p-pqrs-2.16.840.1.113883.10.20.24.3.64-errors"/>
		<sch:active pattern="p-pqrs-2.16.840.1.113883.10.20.24.3.88-errors"/>
		<sch:active pattern="p-pqrs-2.16.840.1.113883.10.20.24.3.89-errors"/>
		<sch:active pattern="p-pqrs-2.16.840.1.113883.10.20.24.3.62-errors"/>
		<sch:active pattern="p-pqrs-2.16.840.1.113883.10.20.24.3.4-errors"/>
		<sch:active pattern="p-pqrs-2.16.840.1.113883.10.20.24.3.82-errors"/>
		<sch:active pattern="p-pqrs-2.16.840.1.113883.10.20.24.3.87-errors"/>
		<sch:active pattern="p-pqrs-2.16.840.1.113883.10.20.24.3.91-errors"/>
		<sch:active pattern="p-pqrs-2.16.840.1.113883.10.20.24.3.93-errors"/>
		<sch:active pattern="p-pqrs-2.16.840.1.113883.10.20.24.3.38-errors"/>
		<sch:active pattern="p-pqrs-2.16.840.1.113883.10.20.24.3.16-errors"/>
		<sch:active pattern="p-pqrs-2.16.840.1.113883.10.20.24.3.40-errors"/>
		<sch:active pattern="p-pqrs-2.16.840.1.113883.10.20.24.3.15-errors"/>
		<sch:active pattern="p-pqrs-2.16.840.1.113883.10.20.24.3.39-errors"/>
		<sch:active pattern="p-pqrs-2.16.840.1.113883.10.20.24.3.3-errors"/>
		<sch:active pattern="p-pqrs-2.16.840.1.113883.10.20.24.3.23-errors"/>
		<sch:active pattern="p-pqrs-2.16.840.1.113883.10.20.24.3.21-errors"/>
		<sch:active pattern="p-pqrs-2.16.840.1.113883.10.20.24.3.24-errors"/>
		<sch:active pattern="p-pqrs-2.16.840.1.113883.10.20.24.3.22-errors"/>
		<sch:active pattern="p-pqrs-2.16.840.1.113883.10.20.24.3.37-errors"/>
		<sch:active pattern="p-pqrs-2.16.840.1.113883.10.20.24.3.11-errors"/>
		<sch:active pattern="p-pqrs-2.16.840.1.113883.10.20.24.3.13-errors"/>
		<sch:active pattern="p-pqrs-2.16.840.1.113883.10.20.24.3.14-errors"/>
		<sch:active pattern="p-pqrs-2.16.840.1.113883.10.20.24.3.41-errors"/>
		<sch:active pattern="p-pqrs-2.16.840.1.113883.10.20.24.3.5-errors"/>
		<sch:active pattern="p-pqrs-2.16.840.1.113883.10.20.24.3.6-errors"/>
		<sch:active pattern="p-pqrs-2.16.840.1.113883.10.20.24.3.8-errors"/>
		<sch:active pattern="p-pqrs-2.16.840.1.113883.10.20.24.3.94-errors"/>
		<sch:active pattern="p-pqrs-2.16.840.1.113883.10.20.24.3.95-errors"/>
		<sch:active pattern="p-pqrs-2.16.840.1.113883.10.20.24.3.96-errors"/>
		<sch:active pattern="p-pqrs-2.16.840.1.113883.10.20.24.3.76-errors"/>
		<sch:active pattern="p-pqrs-2.16.840.1.113883.10.20.24.3.78-errors"/>
		<sch:active pattern="p-pqrs-2.16.840.1.113883.10.20.24.3.79-errors"/>
		<sch:active pattern="p-pqrs-2.16.840.1.113883.10.20.24.3.9-errors"/>
		<sch:active pattern="p-pqrs-2.16.840.1.113883.10.20.24.3.10-errors"/>
		<sch:active pattern="p-pqrs-2.16.840.1.113883.10.20.24.3.7-errors"/>
		<sch:active pattern="p-pqrs-2.16.840.1.113883.10.20.24.3.42-errors"/>
		<sch:active pattern="p-pqrs-2.16.840.1.113883.10.20.24.3.48-errors"/>
		<sch:active pattern="p-pqrs-2.16.840.1.113883.10.20.24.3.67-errors"/>
		<sch:active pattern="p-pqrs-2.16.840.1.113883.10.20.22.4.69-errors"/>
		<sch:active pattern="p-pqrs-2.16.840.1.113883.10.20.24.3.69-errors"/>
		<sch:active pattern="p-pqrs-2.16.840.1.113883.10.20.22.4.79-errors"/>
		<sch:active pattern="p-pqrs-2.16.840.1.113883.10.20.24.3.54-errors"/>
		<sch:active pattern="p-pqrs-2.16.840.1.113883.10.20.24.3.51-errors"/>
		<sch:active pattern="p-pqrs-2.16.840.1.113883.10.20.24.3.55-errors"/>
		<sch:active pattern="p-pqrs-2.16.840.1.113883.10.20.24.3.47-errors"/>
		<sch:active pattern="p-pqrs-2.16.840.1.113883.10.20.24.3.59-errors"/>
		<sch:active pattern="p-pqrs-2.16.840.1.113883.10.20.24.3.60-errors"/>
		<sch:active pattern="p-pqrs-2.16.840.1.113883.10.20.24.3.58-errors"/>
		<sch:active pattern="p-pqrs-2.16.840.1.113883.10.20.24.3.57-errors"/>
		<sch:active pattern="p-pqrs-2.16.840.1.113883.10.20.24.3.26-errors"/>
		<sch:active pattern="p-pqrs-2.16.840.1.113883.10.20.24.3.25-errors"/>
		<sch:active pattern="p-pqrs-2.16.840.1.113883.10.20.24.2.1-errors"/>
		<sch:active pattern="p-pqrs-2.16.840.1.113883.10.20.24.2.2-errors"/>
		<sch:active pattern="p-pqrs-2.16.840.1.113883.10.20.24.2.3-errors"/>
		<sch:active pattern="p-pqrs-2.16.840.1.113883.10.20.24.3.98-errors"/>
		<sch:active pattern="p-pqrs-2.16.840.1.113883.10.20.24.3.97-errors"/>
		<sch:active pattern="p-pqrs-2.16.840.1.113883.10.20.24.3.27-errors"/>
		<sch:active pattern="p-pqrs-2.16.840.1.113883.10.20.22.4.67-errors"/>
		<sch:active pattern="p-pqrs-2.16.840.1.113883.10.20.24.3.28-errors"/>
		<sch:active pattern="p-pqrs-2.16.840.1.113883.10.20.24.3.77-errors"/>
		<sch:active pattern="p-pqrs-2.16.840.1.113883.10.20.24.1.1-errors"/>
		<sch:active pattern="p-pqrs-2.16.840.1.113883.10.20.24.3.18-errors"/>
		<sch:active pattern="p-pqrs-2.16.840.1.113883.10.20.24.1.2-errors"/>
		<sch:active pattern="p-pqrs-2.16.840.1.113883.10.20.24.3.81-errors"/>
		<sch:active pattern="p-pqrs-2.16.840.1.113883.10.20.24.3.100-errors"/>
		<sch:active pattern="p-pqrs-2.16.840.1.113883.10.20.24.3.19-errors"/>
		<sch:active pattern="p-pqrs-2.16.840.1.113883.10.20.24.3.17-errors"/>
		<sch:active pattern="p-pqrs-2.16.840.1.113883.10.20.24.3.29-errors"/>
		<sch:active pattern="p-pqrs-2.16.840.1.113883.10.20.24.3.32-errors"/>
		<sch:active pattern="p-pqrs-2.16.840.1.113883.10.20.24.3.30-errors"/>
		<sch:active pattern="p-pqrs-2.16.840.1.113883.10.20.24.3.34-errors"/>
		<sch:active pattern="p-pqrs-2.16.840.1.113883.10.20.24.3.31-errors"/>
		<sch:active pattern="p-pqrs-2.16.840.1.113883.10.20.24.3.75-errors"/>
		<sch:active pattern="p-pqrs-2.16.840.1.113883.10.20.24.3.33-errors"/>
		<sch:active pattern="p-pqrs-2.16.840.1.113883.10.20.24.3.20-errors"/>
		<sch:active pattern="p-pqrs-2.16.840.1.113883.10.20.24.3.99-errors"/>
		<sch:active pattern="p-pqrs-2.16.840.1.113883.10.20.24.3.45-errors"/>
		<sch:active pattern="p-pqrs-2.16.840.1.113883.10.20.24.3.36-errors"/>
		<sch:active pattern="p-pqrs-2.16.840.1.113883.10.20.24.3.35-errors"/>
		<sch:active pattern="p-pqrs-2.16.840.1.113883.10.20.24.3.46-errors"/>
		<sch:active pattern="p-pqrs-2.16.840.1.113883.10.20.24.3.43-errors"/>
		<sch:active pattern="p-pqrs-2.16.840.1.113883.10.20.24.3.44-errors"/>
		<sch:active pattern="p-pqrs-2.16.840.1.113883.10.20.24.3.12-errors"/>
		<sch:active pattern="p-pqrs-2.16.840.1.113883.10.20.22.4.72-errors"/>
		<sch:active pattern="p-pqrs-2.16.840.1.113883.10.20.22.4.80-errors"/>
		<sch:active pattern="p-pqrs-2.16.840.1.113883.10.20.24.3.102-errors"/>
		<sch:active pattern="p-pqrs-2.16.840.1.113883.10.20.24.3.101-errors"/>
		<sch:active pattern="p-pqrs-2.16.840.1.113883.10.20.24.3.103-errors"/>
		<sch:active pattern="p-pqrs-2.16.840.1.113883.10.20.24.3.105-errors"/>
		<sch:active pattern="p-pqrs-2.16.840.1.113883.10.20.22.4.85-errors"/>
		<sch:active pattern="p-pqrs-2.16.840.1.113883.10.20.22.4.86-errors"/>
		<sch:active pattern="p-pqrs-length-checking-validation-rules"/>
	</sch:phase>
	<sch:phase id="warnings">
		<sch:active pattern="p-pqrs-2.16.840.1.113883.10.20.17.3.8-warnings"/>
		<sch:active pattern="p-pqrs-2.16.840.1.113883.10.20.17.2.1-warnings"/>
		<sch:active pattern="p-pqrs-2.16.840.1.113883.10.20.17.2.4-warnings"/>
		<sch:active pattern="p-pqrs-2.16.840.1.113883.10.20.22.1.1-warnings"/>
		<sch:active pattern="p-pqrs-2.16.840.1.113883.10.20.22.4.16-warnings"/>
		<sch:active pattern="p-pqrs-2.16.840.1.113883.10.20.22.4.2-warnings"/>
		<sch:active pattern="p-pqrs-2.16.840.1.113883.10.20.22.4.28-warnings"/>
		<sch:active pattern="p-pqrs-2.16.840.1.113883.10.20.22.4.9-warnings"/>
		<sch:active pattern="p-pqrs-2.16.840.1.113883.10.20.22.4.8-warnings"/>
		<sch:active pattern="p-pqrs-2.16.840.1.113883.10.20.22.4.6-warnings"/>
		<sch:active pattern="p-pqrs-2.16.840.1.113883.10.20.22.4.25-warnings"/>
		<sch:active pattern="p-pqrs-2.16.840.1.113883.10.20.24.3.90-warnings"/>
		<sch:active pattern="p-pqrs-2.16.840.1.113883.10.20.22.4.7-warnings"/>
		<sch:active pattern="p-pqrs-2.16.840.1.113883.10.20.22.4.20-warnings"/>
		<sch:active pattern="p-pqrs-2.16.840.1.113883.10.20.22.4.23-warnings"/>
		<sch:active pattern="p-pqrs-2.16.840.1.113883.10.20.22.4.17-warnings"/>
		<sch:active pattern="p-pqrs-2.16.840.1.113883.10.20.22.4.18-warnings"/>
		<sch:active pattern="p-pqrs-2.16.840.1.113883.10.20.22.4.19-warnings"/>
		<sch:active pattern="p-pqrs-2.16.840.1.113883.10.20.22.4.24-warnings"/>
		<sch:active pattern="p-pqrs-2.16.840.1.113883.10.20.22.4.14-warnings"/>
		<sch:active pattern="p-pqrs-2.16.840.1.113883.10.20.22.4.31-warnings"/>
		<sch:active pattern="p-pqrs-2.16.840.1.113883.10.20.22.4.32-warnings"/>
		<sch:active pattern="p-pqrs-2.16.840.1.113883.10.20.22.4.4-warnings"/>
		<sch:active pattern="p-pqrs-2.16.840.1.113883.10.20.22.4.37-warnings"/>
		<sch:active pattern="p-pqrs-2.16.840.1.113883.10.20.22.4.12-warnings"/>
		<sch:active pattern="p-pqrs-2.16.840.1.113883.10.20.22.4.13-warnings"/>
		<sch:active pattern="p-pqrs-2.16.840.1.113883.10.20.22.4.39-warnings"/>
		<sch:active pattern="p-pqrs-2.16.840.1.113883.10.20.22.4.40-warnings"/>
		<sch:active pattern="p-pqrs-2.16.840.1.113883.10.20.22.4.41-warnings"/>
		<sch:active pattern="p-pqrs-2.16.840.1.113883.10.20.22.4.42-warnings"/>
		<sch:active pattern="p-pqrs-2.16.840.1.113883.10.20.22.4.43-warnings"/>
		<sch:active pattern="p-pqrs-2.16.840.1.113883.10.20.22.4.44-warnings"/>
		<sch:active pattern="p-pqrs-2.16.840.1.113883.10.20.22.4.46-warnings"/>
		<sch:active pattern="p-pqrs-2.16.840.1.113883.10.20.22.4.45-warnings"/>
		<sch:active pattern="p-pqrs-2.16.840.1.113883.10.20.22.4.47-warnings"/>
		<sch:active pattern="p-pqrs-2.16.840.1.113883.10.20.22.4.49-warnings"/>
		<sch:active pattern="p-pqrs-2.16.840.1.113883.10.20.22.4.50-warnings"/>
		<sch:active pattern="p-pqrs-2.16.840.1.113883.10.20.22.4.54-warnings"/>
		<sch:active pattern="p-pqrs-2.16.840.1.113883.10.20.22.4.5-warnings"/>
		<sch:active pattern="p-pqrs-2.16.840.1.113883.10.20.24.3.104-warnings"/>
		<sch:active pattern="p-pqrs-2.16.840.1.113883.10.20.24.3.61-warnings"/>
		<sch:active pattern="p-pqrs-2.16.840.1.113883.10.20.24.3.65-warnings"/>
		<sch:active pattern="p-pqrs-2.16.840.1.113883.10.20.24.3.83-warnings"/>
		<sch:active pattern="p-pqrs-2.16.840.1.113883.10.20.24.3.84-warnings"/>
		<sch:active pattern="p-pqrs-2.16.840.1.113883.10.20.24.3.85-warnings"/>
		<sch:active pattern="p-pqrs-2.16.840.1.113883.10.20.24.3.1-warnings"/>
		<sch:active pattern="p-pqrs-2.16.840.1.113883.10.20.24.3.63-warnings"/>
		<sch:active pattern="p-pqrs-2.16.840.1.113883.10.20.24.3.66-warnings"/>
		<sch:active pattern="p-pqrs-2.16.840.1.113883.10.20.24.3.2-warnings"/>
		<sch:active pattern="p-pqrs-2.16.840.1.113883.10.20.24.3.64-warnings"/>
		<sch:active pattern="p-pqrs-2.16.840.1.113883.10.20.24.3.88-warnings"/>
		<sch:active pattern="p-pqrs-2.16.840.1.113883.10.20.24.3.89-warnings"/>
		<sch:active pattern="p-pqrs-2.16.840.1.113883.10.20.24.3.62-warnings"/>
		<sch:active pattern="p-pqrs-2.16.840.1.113883.10.20.24.3.4-warnings"/>
		<sch:active pattern="p-pqrs-2.16.840.1.113883.10.20.24.3.82-warnings"/>
		<sch:active pattern="p-pqrs-2.16.840.1.113883.10.20.24.3.87-warnings"/>
		<sch:active pattern="p-pqrs-2.16.840.1.113883.10.20.24.3.91-warnings"/>
		<sch:active pattern="p-pqrs-2.16.840.1.113883.10.20.24.3.93-warnings"/>
		<sch:active pattern="p-pqrs-2.16.840.1.113883.10.20.24.3.38-warnings"/>
		<sch:active pattern="p-pqrs-2.16.840.1.113883.10.20.24.3.16-warnings"/>
		<sch:active pattern="p-pqrs-2.16.840.1.113883.10.20.24.3.40-warnings"/>
		<sch:active pattern="p-pqrs-2.16.840.1.113883.10.20.24.3.15-warnings"/>
		<sch:active pattern="p-pqrs-2.16.840.1.113883.10.20.24.3.39-warnings"/>
		<sch:active pattern="p-pqrs-2.16.840.1.113883.10.20.24.3.3-warnings"/>
		<sch:active pattern="p-pqrs-2.16.840.1.113883.10.20.24.3.23-warnings"/>
		<sch:active pattern="p-pqrs-2.16.840.1.113883.10.20.24.3.21-warnings"/>
		<sch:active pattern="p-pqrs-2.16.840.1.113883.10.20.24.3.24-warnings"/>
		<sch:active pattern="p-pqrs-2.16.840.1.113883.10.20.24.3.22-warnings"/>
		<sch:active pattern="p-pqrs-2.16.840.1.113883.10.20.24.3.37-warnings"/>
		<sch:active pattern="p-pqrs-2.16.840.1.113883.10.20.24.3.11-warnings"/>
		<sch:active pattern="p-pqrs-2.16.840.1.113883.10.20.24.3.13-warnings"/>
		<sch:active pattern="p-pqrs-2.16.840.1.113883.10.20.24.3.14-warnings"/>
		<sch:active pattern="p-pqrs-2.16.840.1.113883.10.20.24.3.41-warnings"/>
		<sch:active pattern="p-pqrs-2.16.840.1.113883.10.20.24.3.5-warnings"/>
		<sch:active pattern="p-pqrs-2.16.840.1.113883.10.20.24.3.6-warnings"/>
		<sch:active pattern="p-pqrs-2.16.840.1.113883.10.20.24.3.8-warnings"/>
		<sch:active pattern="p-pqrs-2.16.840.1.113883.10.20.24.3.94-warnings"/>
		<sch:active pattern="p-pqrs-2.16.840.1.113883.10.20.24.3.95-warnings"/>
		<sch:active pattern="p-pqrs-2.16.840.1.113883.10.20.24.3.96-warnings"/>
		<sch:active pattern="p-pqrs-2.16.840.1.113883.10.20.24.3.76-warnings"/>
		<sch:active pattern="p-pqrs-2.16.840.1.113883.10.20.24.3.78-warnings"/>
		<sch:active pattern="p-pqrs-2.16.840.1.113883.10.20.24.3.79-warnings"/>
		<sch:active pattern="p-pqrs-2.16.840.1.113883.10.20.24.3.9-warnings"/>
		<sch:active pattern="p-pqrs-2.16.840.1.113883.10.20.24.3.10-warnings"/>
		<sch:active pattern="p-pqrs-2.16.840.1.113883.10.20.24.3.7-warnings"/>
		<sch:active pattern="p-pqrs-2.16.840.1.113883.10.20.24.3.42-warnings"/>
		<sch:active pattern="p-pqrs-2.16.840.1.113883.10.20.24.3.48-warnings"/>
		<sch:active pattern="p-pqrs-2.16.840.1.113883.10.20.24.3.67-warnings"/>
		<sch:active pattern="p-pqrs-2.16.840.1.113883.10.20.22.4.69-warnings"/>
		<sch:active pattern="p-pqrs-2.16.840.1.113883.10.20.24.3.69-warnings"/>
		<sch:active pattern="p-pqrs-2.16.840.1.113883.10.20.22.4.79-warnings"/>
		<sch:active pattern="p-pqrs-2.16.840.1.113883.10.20.24.3.54-warnings"/>
		<sch:active pattern="p-pqrs-2.16.840.1.113883.10.20.24.3.51-warnings"/>
		<sch:active pattern="p-pqrs-2.16.840.1.113883.10.20.24.3.55-warnings"/>
		<sch:active pattern="p-pqrs-2.16.840.1.113883.10.20.24.3.47-warnings"/>
		<sch:active pattern="p-pqrs-2.16.840.1.113883.10.20.24.3.59-warnings"/>
		<sch:active pattern="p-pqrs-2.16.840.1.113883.10.20.24.3.60-warnings"/>
		<sch:active pattern="p-pqrs-2.16.840.1.113883.10.20.24.3.58-warnings"/>
		<sch:active pattern="p-pqrs-2.16.840.1.113883.10.20.24.3.57-warnings"/>
		<sch:active pattern="p-pqrs-2.16.840.1.113883.10.20.24.3.26-warnings"/>
		<sch:active pattern="p-pqrs-2.16.840.1.113883.10.20.24.3.25-warnings"/>
		<sch:active pattern="p-pqrs-2.16.840.1.113883.10.20.24.2.1-warnings"/>
		<sch:active pattern="p-pqrs-2.16.840.1.113883.10.20.24.2.2-warnings"/>
		<sch:active pattern="p-pqrs-2.16.840.1.113883.10.20.24.2.3-warnings"/>
		<sch:active pattern="p-pqrs-2.16.840.1.113883.10.20.24.3.98-warnings"/>
		<sch:active pattern="p-pqrs-2.16.840.1.113883.10.20.24.3.97-warnings"/>
		<sch:active pattern="p-pqrs-2.16.840.1.113883.10.20.24.3.27-warnings"/>
		<sch:active pattern="p-pqrs-2.16.840.1.113883.10.20.22.4.67-warnings"/>
		<sch:active pattern="p-pqrs-2.16.840.1.113883.10.20.24.3.28-warnings"/>
		<sch:active pattern="p-pqrs-2.16.840.1.113883.10.20.24.3.77-warnings"/>
		<sch:active pattern="p-pqrs-2.16.840.1.113883.10.20.24.1.1-warnings"/>
		<sch:active pattern="p-pqrs-2.16.840.1.113883.10.20.24.3.18-warnings"/>
		<sch:active pattern="p-pqrs-2.16.840.1.113883.10.20.24.1.2-warnings"/>
		<sch:active pattern="p-pqrs-2.16.840.1.113883.10.20.24.3.81-warnings"/>
		<sch:active pattern="p-pqrs-2.16.840.1.113883.10.20.24.3.100-warnings"/>
		<sch:active pattern="p-pqrs-2.16.840.1.113883.10.20.24.3.19-warnings"/>
		<sch:active pattern="p-pqrs-2.16.840.1.113883.10.20.24.3.17-warnings"/>
		<sch:active pattern="p-pqrs-2.16.840.1.113883.10.20.24.3.29-warnings"/>
		<sch:active pattern="p-pqrs-2.16.840.1.113883.10.20.24.3.32-warnings"/>
		<sch:active pattern="p-pqrs-2.16.840.1.113883.10.20.24.3.30-warnings"/>
		<sch:active pattern="p-pqrs-2.16.840.1.113883.10.20.24.3.34-warnings"/>
		<sch:active pattern="p-pqrs-2.16.840.1.113883.10.20.24.3.31-warnings"/>
		<sch:active pattern="p-pqrs-2.16.840.1.113883.10.20.24.3.75-warnings"/>
		<sch:active pattern="p-pqrs-2.16.840.1.113883.10.20.24.3.33-warnings"/>
		<sch:active pattern="p-pqrs-2.16.840.1.113883.10.20.24.3.20-warnings"/>
		<sch:active pattern="p-pqrs-2.16.840.1.113883.10.20.24.3.99-warnings"/>
		<sch:active pattern="p-pqrs-2.16.840.1.113883.10.20.24.3.45-warnings"/>
		<sch:active pattern="p-pqrs-2.16.840.1.113883.10.20.24.3.36-warnings"/>
		<sch:active pattern="p-pqrs-2.16.840.1.113883.10.20.24.3.35-warnings"/>
		<sch:active pattern="p-pqrs-2.16.840.1.113883.10.20.24.3.46-warnings"/>
		<sch:active pattern="p-pqrs-2.16.840.1.113883.10.20.24.3.43-warnings"/>
		<sch:active pattern="p-pqrs-2.16.840.1.113883.10.20.24.3.44-warnings"/>
		<sch:active pattern="p-pqrs-2.16.840.1.113883.10.20.24.3.12-warnings"/>
		<sch:active pattern="p-pqrs-2.16.840.1.113883.10.20.22.4.72-warnings"/>
		<sch:active pattern="p-pqrs-2.16.840.1.113883.10.20.22.4.80-warnings"/>
		<sch:active pattern="p-pqrs-2.16.840.1.113883.10.20.24.3.102-warnings"/>
		<sch:active pattern="p-pqrs-2.16.840.1.113883.10.20.24.3.101-warnings"/>
		<sch:active pattern="p-pqrs-2.16.840.1.113883.10.20.24.3.103-warnings"/>
		<sch:active pattern="p-pqrs-2.16.840.1.113883.10.20.24.3.105-warnings"/>
		<sch:active pattern="p-pqrs-2.16.840.1.113883.10.20.22.4.85-warnings"/>
		<sch:active pattern="p-pqrs-2.16.840.1.113883.10.20.22.4.86-warnings"/>
	</sch:phase>
  
  &sch-qrda-r2-base;
  
  <sch:pattern id="p-pqrs-sdtc-errors-code">
		<sch:rule id="r-pqrs-sdtc-errors-abstract-code" abstract="true">
    </sch:rule>
		<sch:rule id="r-pqrs-sdtc-errors-code" context="cda:code">
			<sch:extends rule="r-pqrs-sdtc-errors-abstract-code"/>
		</sch:rule>
	</sch:pattern>
	<sch:pattern id="p-pqrs-sdtc-errors-value">
		<sch:rule id="r-pqrs-sdtc-errors-abstract-value" abstract="true">
    </sch:rule>
		<sch:rule id="r-pqrs-sdtc-errors-value" context="cda:value">
			<sch:extends rule="r-pqrs-sdtc-errors-abstract-value"/>
		</sch:rule>
	</sch:pattern>
	<sch:pattern id="p-pqrs-required-template-ids">
		<sch:rule id="r-pqrs-required-template-ids-abstract" abstract="true">
    </sch:rule>
		<sch:rule id="r-pqrs-required-template-ids" context="cda:ClinicalDocument">
			<sch:extends rule="r-pqrs-required-template-ids-abstract"/>
		</sch:rule>
	</sch:pattern>
	<sch:pattern id="p-pqrs-DOCUMENT-TEMPLATE">
		<sch:rule id="r-pqrs-errors-DOC-abstract" abstract="true">
    </sch:rule>
		<sch:rule id="r-pqrs-errors-DOC" context="cda:ClinicalDocument">
			<sch:extends rule="r-pqrs-errors-DOC-abstract"/>
		</sch:rule>
	</sch:pattern>
	<sch:pattern id="p-pqrs-2.16.840.1.113883.10.20.17.3.8-errors">
		<sch:rule id="r-pqrs-2.16.840.1.113883.10.20.17.3.8-errors-abstract" abstract="true">
			<sch:assert id="a-CMS_0027" test="not(cda:effectiveTime[count(cda:low)=1]) or (string-length(cda:effectiveTime/cda:low/@value) &gt;= 8)">SHALL be precise to day (CONF:CMS_0027).</sch:assert>
			<sch:assert id="a-CMS_0027a" test="not(cda:effectiveTime[count(cda:low)=1]) or not(string-length(cda:effectiveTime/cda:low/@value) &gt;= 8) or (cda:isValidDate(cda:effectiveTime/cda:low))">PQRS_10705: //act[templateId/@root='2.16.840.1.113883.10.20.17.3.8']/effectiveTime/low Invalid date and/or time format.</sch:assert>
			<sch:assert id="a-CMS_0028" test="not(cda:effectiveTime[count(cda:high)=1]) or (string-length(cda:effectiveTime/cda:high/@value) &gt;= 8)">SHALL be precise to day (CONF:CMS_0028).</sch:assert>
			<sch:assert id="a-CMS_0028a" test="not(cda:effectiveTime[count(cda:high)=1]) or not(string-length(cda:effectiveTime/cda:high/@value) &gt;= 8) or (cda:isValidDate(cda:effectiveTime/cda:high))">PQRS_10705: //act[templateId/@root='2.16.840.1.113883.10.20.17.3.8']/effectiveTime/high Invalid date and/or time format.</sch:assert>
		</sch:rule>
		<sch:rule id="r-pqrs-2.16.840.1.113883.10.20.17.3.8-errors" context="cda:act[cda:templateId[@root='2.16.840.1.113883.10.20.17.3.8']]">
			<sch:extends rule="r-pqrs-2.16.840.1.113883.10.20.17.3.8-errors-abstract"/>
		</sch:rule>
	</sch:pattern>
	<sch:pattern id="p-pqrs-2.16.840.1.113883.10.20.17.2.1-errors">
		<sch:rule id="r-pqrs-2.16.840.1.113883.10.20.17.2.1-errors-abstract" abstract="true">
    </sch:rule>
		<sch:rule id="r-pqrs-2.16.840.1.113883.10.20.17.2.1-errors" context="cda:section[cda:templateId[@root='2.16.840.1.113883.10.20.17.2.1']]">
			<sch:extends rule="r-pqrs-2.16.840.1.113883.10.20.17.2.1-errors-abstract"/>
		</sch:rule>
	</sch:pattern>
	<sch:pattern id="p-pqrs-2.16.840.1.113883.10.20.17.2.4-errors">
		<sch:rule id="r-pqrs-2.16.840.1.113883.10.20.17.2.4-errors-abstract" abstract="true">
    </sch:rule>
		<sch:rule id="r-pqrs-2.16.840.1.113883.10.20.17.2.4-errors" context="cda:section[cda:templateId[@root='2.16.840.1.113883.10.20.17.2.4']]">
			<sch:extends rule="r-pqrs-2.16.840.1.113883.10.20.17.2.4-errors-abstract"/>
		</sch:rule>
	</sch:pattern>
	<sch:pattern id="p-pqrs-2.16.840.1.113883.10.20.22.1.1-errors">
		<sch:rule id="r-pqrs-2.16.840.1.113883.10.20.22.1.1-errors-abstract" abstract="true">
			<sch:assert id="a-CMS_0001" test="count(cda:templateId[@root='2.16.840.1.113883.10.20.24.1.3'])=1">SHALL contain exactly one [1..1] templateId (CONF:CMS_0001) such that it SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.24.1.3" (CONF:CMS_0002).</sch:assert>
			<sch:assert id="a-CMS_0010" test="not(count(cda:languageCode)=1) or ( count(cda:languageCode[@code='en'])=1 )">This languageCode SHALL contain exactly one [1..1] @code="en" English (CodeSystem: Language 2.16.840.1.113883.6.121)(CMS_0010).</sch:assert>
			<sch:assert id="a-CMS_0011" test="count(cda:recordTarget/cda:patientRole/cda:patient/cda:administrativeGenderCode)=1">This patient SHALL contain exactly one [1..1] administrativeGenderCode, which SHALL be selected from either ValueSet ONC Administrative Sex 2.16.840.1.113762.1.4.1 or ValueSet Administrative Gender (HL7 V3) 2.16.840.1.113883.1.11.1 DYNAMIC (CONF:CMS_0011).</sch:assert>
			<sch:assert id="a-CMS_0011a" test="not(count(cda:recordTarget/cda:patientRole/cda:patient/cda:administrativeGenderCode)=1) or (cda:recordTarget/cda:patientRole/cda:patient[count(cda:administrativeGenderCode[cda:isValidValueSetForQDMCategory('2.16.840.1.113762.1.4.1', @code, @codeSystem, '2.16.840.1.113883.10.20.24.3.55') or cda:isVOCCodeValid('2.16.840.1.113883.1.11.1',  @code, @codeSystem)])=1])">PQRS_10710: /ClinicalDocument/recordTarget/patientRole/patient/administrativeGenderCode ValueSet validation failed. The provided code, codeSystem, and valueSet are incompatible.</sch:assert>
			<sch:assert id="a-CMS_0012" test="count(cda:recordTarget/cda:patientRole/cda:patient/cda:birthTime)=1">SHALL be precise to day (CONF:CMS_0012).</sch:assert>
			<sch:assert id="a-CMS_0012a" test="not(count(cda:recordTarget/cda:patientRole/cda:patient/cda:birthTime)=1) or (string-length(cda:recordTarget/cda:patientRole/cda:patient/cda:birthTime/@value) &gt;= 8  and cda:isValidDate(cda:recordTarget/cda:patientRole/cda:patient/cda:birthTime))">PQRS_10705: /ClinicalDocument/recordTarget/patientRole/patient/birthTime Invalid date and/or time format.
</sch:assert>
			<sch:assert id="a-CMS_0013" test="count(cda:recordTarget/cda:patientRole/cda:patient/cda:raceCode)=1">This patient SHALL contain exactly one [1..1] raceCode, which SHALL be selected from ValueSet Race 2.16.840.1.114222.4.11.836 DYNAMIC (CONF:CMS_0013).</sch:assert>
			<sch:assert id="a-CMS_0013a" test="not(count(cda:recordTarget/cda:patientRole/cda:patient/cda:raceCode)=1) or (count(cda:recordTarget/cda:patientRole/cda:patient/cda:raceCode[cda:isValidValueSetForQDMCategory('2.16.840.1.114222.4.11.836', @code, @codeSystem, '2.16.840.1.113883.10.20.24.3.55') or @nullFlavor])=1)">PQRS_10710: /ClinicalDocument/recordTarget/patientRole/patient/raceCode ValueSet validation failed. The provided code, codeSystem, and valueSet are incompatible.
</sch:assert>
			<sch:assert id="a-CMS_0014a" test="not( count(cda:recordTarget/cda:patientRole/cda:patient/sdtc:raceCode)&gt;0 ) or (cda:recordTarget/cda:patientRole/cda:patient/sdtc:raceCode[cda:isValidValueSetForQDMCategory('2.16.840.1.114222.4.11.836', @code, @codeSystem, '2.16.840.1.113883.10.20.24.3.55') or @nullFlavor])">PQRS_10710: /ClinicalDocument/recordTarget/patientRole/patient/sdtc:raceCode ValueSet validation failed. The provided code, codeSystem, and valueSet are incompatible.</sch:assert>
			<sch:assert id="a-CMS_0015" test="count(cda:recordTarget/cda:patientRole/cda:patient/cda:ethnicGroupCode)=1">This patient SHALL contain exactly one [1..1] ethnicGroupCode, which SHALL be selected from ValueSet Ethnicity Value 2.16.840.1.114222.4.11.837 DYNAMIC (CONF:CMS_0015).</sch:assert>
			<sch:assert id="a-CMS_0015a" test="not(count(cda:recordTarget/cda:patientRole/cda:patient/cda:ethnicGroupCode)=1) or (count(cda:recordTarget/cda:patientRole/cda:patient/cda:ethnicGroupCode[cda:isValidValueSetForQDMCategory('2.16.840.1.114222.4.11.837', @code, @codeSystem,'2.16.840.1.113883.10.20.24.3.55') or @nullFlavor])=1)">PQRS_10710: /ClinicalDocument/recordTarget/patientRole/patient/ethnicGroupCode ValueSet validation failed. The provided code, codeSystem, and valueSet are incompatible.</sch:assert>
			<sch:assert id="a-6387" test="not(cda:versionNumber) or count(cda:setId[@root])=1">MAY contain zero or one [0..1] versionNumber (CONF:5264).If versionNumber is present setId SHALL be present (CONF:6387).</sch:assert>
			<sch:assert id="a-7157" test="count(cda:recordTarget/cda:patientRole/cda:patient/cda:name/cda:given)&gt;0">SHALL contain at least one [1..*] given (CONF:7157).</sch:assert>
			<sch:assert id="a-7159" test="count(cda:recordTarget/cda:patientRole/cda:patient/cda:name/cda:family)=1">SHALL contain exactly one [1..1] family (CONF:7159).</sch:assert>
			<sch:assert id="a-10024" test="cda:recordTarget/cda:patientRole/cda:addr[(not(cda:country='US') and not(cda:country='USA') and cda:country and not(cda:country='')) or ((cda:country='US' or cda:country='USA' or not(cda:country) or cda:country='') and count(cda:state)= 1 and  contains('AL AK AZ AR CA CO CT DE DC FL GA HI ID IL IN IA KS KY LA ME MD MA MI MN MS MO MT NE NV NH NJ NM NY NC ND OH OK OR PA RI SC SD TN TX UT VT VA WA WV WI WY ', cda:state))]">State SHALL be provided if the country is US. If country is not specified, it is assumed to be the US. If country is something other than US, the state MAY be present but MAY be bound to different vocabularies (CONF:10024).</sch:assert>
			<sch:assert id="a-10025" test="cda:recordTarget/cda:patientRole/cda:addr[(not(cda:country='US') and not(cda:country='USA') and cda:country and not(cda:country='')) or ((cda:country='US' or cda:country='USA' or not(cda:country) or cda:country='') and count(cda:postalCode)= 1)]">PostalCode SHALL be provided if the country is US. If country is not specified, it is assumed to be the US. If country is something other than US, the postalCode MAY be present but MAY be bound to different vocabularies (CONF:10025).</sch:assert>
			<sch:assert id="a-16865-d" test="not(string-length(cda:effectiveTime//@value)&gt;=8) or ( cda:isValidDate(cda:effectiveTime))">PQRS_10705: /ClinicalDocument/effectiveTime Invalid date and/or time format.</sch:assert>
		</sch:rule>
		<sch:rule id="r-pqrs-2.16.840.1.113883.10.20.22.1.1-errors" context="cda:ClinicalDocument[cda:templateId[@root='2.16.840.1.113883.10.20.22.1.1']]">
			<sch:extends rule="r-pqrs-2.16.840.1.113883.10.20.22.1.1-errors-abstract"/>
		</sch:rule>
	</sch:pattern>
	<sch:pattern id="p-pqrs-2.16.840.1.113883.10.20.22.4.16-errors">
		<sch:rule id="r-pqrs-2.16.840.1.113883.10.20.22.4.16-errors-abstract" abstract="true">
			<sch:assert id="a-7511a" test="not(count(cda:effectiveTime[count(cda:low)=1])=1) or (count(cda:effectiveTime[count(cda:low)=1])=1 and cda:isValidDate(cda:effectiveTime/cda:low))">PQRS_10705: //substanceAdministration[templateId/@root='2.16.840.1.113883.10.20.24.3.41']/effectiveTime/low Invalid date and/or time format.</sch:assert>
			<sch:assert id="a-7512a" test="not(count(cda:effectiveTime[count(cda:high)=1])=1) or (count(cda:effectiveTime[count(cda:high)=1])=1 and cda:isValidDate(cda:effectiveTime/cda:high))">PQRS_10705: //substanceAdministration[templateId/@root='2.16.840.1.113883.10.20.24.3.41']/effectiveTime/high Invalid date and/or time format.</sch:assert>
		</sch:rule>
		<sch:rule id="r-pqrs-2.16.840.1.113883.10.20.22.4.16-errors" context="cda:substanceAdministration[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.16']]">
			<sch:extends rule="r-pqrs-2.16.840.1.113883.10.20.22.4.16-errors-abstract"/>
		</sch:rule>
	</sch:pattern>
	<sch:pattern id="p-pqrs-2.16.840.1.113883.10.20.22.4.2-errors">
		<sch:rule id="r-pqrs-2.16.840.1.113883.10.20.22.4.2-errors-abstract" abstract="true">
			<sch:assert id="a-7140-1" test="not(cda:effectiveTime[count(cda:low)=1]) or (cda:effectiveTime[count(cda:low)=1] and cda:isValidDate(cda:effectiveTime/cda:low))">PQRS_10705: //observation[templateId[@root='2.16.840.1.113883.10.20.22.4.2']/effectiveTime/low Invalid date and/or time format.</sch:assert>
			<sch:assert id="a-7140-2" test="not(cda:effectiveTime[count(cda:high)=1]) or (cda:effectiveTime[count(cda:high)=1] and cda:isValidDate(cda:effectiveTime/cda:high))">PQRS_10705: //observation[templateId[@root='2.16.840.1.113883.10.20.22.4.2']/effectiveTime/high Invalid date and/or time format.</sch:assert>
		</sch:rule>
		<sch:rule id="r-pqrs-2.16.840.1.113883.10.20.22.4.2-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.2']]">
			<sch:extends rule="r-pqrs-2.16.840.1.113883.10.20.22.4.2-errors-abstract"/>
		</sch:rule>
	</sch:pattern>
	<sch:pattern id="p-pqrs-2.16.840.1.113883.10.20.22.4.28-errors">
		<sch:rule id="r-pqrs-2.16.840.1.113883.10.20.22.4.28-errors-abstract" abstract="true">
    </sch:rule>
		<sch:rule id="r-pqrs-2.16.840.1.113883.10.20.22.4.28-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.28']]">
			<sch:extends rule="r-pqrs-2.16.840.1.113883.10.20.22.4.28-errors-abstract"/>
		</sch:rule>
	</sch:pattern>
	<sch:pattern id="p-pqrs-2.16.840.1.113883.10.20.22.4.9-errors">
		<sch:rule id="r-pqrs-2.16.840.1.113883.10.20.22.4.9-errors-abstract" abstract="true">
    </sch:rule>
		<sch:rule id="r-pqrs-2.16.840.1.113883.10.20.22.4.9-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.9']]">
			<sch:extends rule="r-pqrs-2.16.840.1.113883.10.20.22.4.9-errors-abstract"/>
		</sch:rule>
	</sch:pattern>
	<sch:pattern id="p-pqrs-2.16.840.1.113883.10.20.22.4.8-errors">
		<sch:rule id="r-pqrs-2.16.840.1.113883.10.20.22.4.8-errors-abstract" abstract="true">
			<sch:assert id="a-7356" test="not(count(cda:value[@xsi:type='CD'])=1) or (count(cda:value[@xsi:type='CD'][cda:isValidValueSetForQDMCategory(@sdtc:valueSet, @code, @codeSystem, '2.16.840.1.113883.10.20.22.4.8')])=1)">PQRS_10710: //observation[templateId/@root='2.16.840.1.113883.10.20.22.4.8']/value ValueSet validation failed. The provided code, codeSystem, and valueSet are incompatible.</sch:assert>
		</sch:rule>
		<sch:rule id="r-pqrs-2.16.840.1.113883.10.20.22.4.8-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.8']]">
			<sch:extends rule="r-pqrs-2.16.840.1.113883.10.20.22.4.8-errors-abstract"/>
		</sch:rule>
	</sch:pattern>
	<sch:pattern id="p-pqrs-2.16.840.1.113883.10.20.22.4.6-errors">
		<sch:rule id="r-pqrs-2.16.840.1.113883.10.20.22.4.6-errors-abstract" abstract="true">
    </sch:rule>
		<sch:rule id="r-pqrs-2.16.840.1.113883.10.20.22.4.6-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.6']]">
			<sch:extends rule="r-pqrs-2.16.840.1.113883.10.20.22.4.6-errors-abstract"/>
		</sch:rule>
	</sch:pattern>
	<sch:pattern id="p-pqrs-2.16.840.1.113883.10.20.22.4.25-errors">
		<sch:rule id="r-pqrs-2.16.840.1.113883.10.20.22.4.25-errors-abstract" abstract="true"/>
		<sch:rule id="r-pqrs-2.16.840.1.113883.10.20.22.4.25-errors" context="cda:criterion[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.25']]">
			<sch:extends rule="r-pqrs-2.16.840.1.113883.10.20.22.4.25-errors-abstract"/>
		</sch:rule>
	</sch:pattern>
	<sch:pattern id="p-pqrs-2.16.840.1.113883.10.20.24.3.90-errors">
		<!--Pattern is used in an implied relationship.-->
		<sch:rule id="r-pqrs-2.16.840.1.113883.10.20.24.3.90-errors-abstract" abstract="true">
    </sch:rule>
		<sch:rule id="r-pqrs-2.16.840.1.113883.10.20.24.3.90-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.90']]">
			<sch:extends rule="r-pqrs-2.16.840.1.113883.10.20.24.3.90-errors-abstract"/>
		</sch:rule>
	</sch:pattern>
	<sch:pattern id="p-pqrs-2.16.840.1.113883.10.20.22.4.7-errors">
		<sch:rule id="r-pqrs-2.16.840.1.113883.10.20.22.4.7-errors-abstract" abstract="true">
			<sch:extends rule="r-pqrs-2.16.840.1.113883.10.20.24.3.90-errors-abstract"/>
		</sch:rule>
		<sch:rule id="r-pqrs-2.16.840.1.113883.10.20.22.4.7-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.7']]">
			<sch:extends rule="r-pqrs-2.16.840.1.113883.10.20.22.4.7-errors-abstract"/>
		</sch:rule>
	</sch:pattern>
	<sch:pattern id="p-pqrs-2.16.840.1.113883.10.20.22.4.20-errors">
		<sch:rule id="r-pqrs-2.16.840.1.113883.10.20.22.4.20-errors-abstract" abstract="true">
    </sch:rule>
		<sch:rule id="r-pqrs-2.16.840.1.113883.10.20.22.4.20-errors" context="cda:act[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.20']]">
			<sch:extends rule="r-pqrs-2.16.840.1.113883.10.20.22.4.20-errors-abstract"/>
		</sch:rule>
	</sch:pattern>
	<sch:pattern id="p-pqrs-2.16.840.1.113883.10.20.22.4.23-errors">
		<sch:rule id="r-pqrs-2.16.840.1.113883.10.20.22.4.23-errors-abstract" abstract="true">
			<sch:assert id="a-7412" test="not(cda:manufacturedMaterial[count(cda:code)=1]) or (cda:manufacturedMaterial[count(cda:code[cda:isValidValueSetForQDMCategory(@sdtc:valueSet, @code, @codeSystem,'2.16.840.1.113883.10.20.24.3.41')])=1])">PQRS_10710: manufacturedProduct[templateId[@root='2.16.840.1.113883.10.20.22.4.23']]/manufacturedMaterial/code ValueSet validation failed. The provided code, codeSystem, and valueSet are incompatible.</sch:assert>
		</sch:rule>
		<sch:rule id="r-pqrs-2.16.840.1.113883.10.20.22.4.23-errors" context="cda:manufacturedProduct[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.23']]">
			<sch:extends rule="r-pqrs-2.16.840.1.113883.10.20.22.4.23-errors-abstract"/>
		</sch:rule>
	</sch:pattern>
	<sch:pattern id="p-pqrs-2.16.840.1.113883.10.20.22.4.17-errors">
		<sch:rule id="r-pqrs-2.16.840.1.113883.10.20.22.4.17-errors-abstract" abstract="true">
    </sch:rule>
		<sch:rule id="r-pqrs-2.16.840.1.113883.10.20.22.4.17-errors" context="cda:supply[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.17']]">
			<sch:extends rule="r-pqrs-2.16.840.1.113883.10.20.22.4.17-errors-abstract"/>
		</sch:rule>
	</sch:pattern>
	<sch:pattern id="p-pqrs-2.16.840.1.113883.10.20.22.4.18-errors">
		<sch:rule id="r-pqrs-2.16.840.1.113883.10.20.22.4.18-errors-abstract" abstract="true">
    </sch:rule>
		<sch:rule id="r-pqrs-2.16.840.1.113883.10.20.22.4.18-errors" context="cda:supply[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.18']]">
			<sch:extends rule="r-pqrs-2.16.840.1.113883.10.20.22.4.18-errors-abstract"/>
		</sch:rule>
	</sch:pattern>
	<sch:pattern id="p-pqrs-2.16.840.1.113883.10.20.22.4.19-errors">
		<sch:rule id="r-pqrs-2.16.840.1.113883.10.20.22.4.19-errors-abstract" abstract="true">
    </sch:rule>
		<sch:rule id="r-pqrs-2.16.840.1.113883.10.20.22.4.19-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.19']]">
			<sch:extends rule="r-pqrs-2.16.840.1.113883.10.20.22.4.19-errors-abstract"/>
		</sch:rule>
	</sch:pattern>
	<sch:pattern id="p-pqrs-2.16.840.1.113883.10.20.22.4.24-errors">
		<sch:rule id="r-pqrs-2.16.840.1.113883.10.20.22.4.24-errors-abstract" abstract="true">
    </sch:rule>
		<sch:rule id="r-pqrs-2.16.840.1.113883.10.20.22.4.24-errors" context="cda:participantRole[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.24']]">
			<sch:extends rule="r-pqrs-2.16.840.1.113883.10.20.22.4.24-errors-abstract"/>
		</sch:rule>
	</sch:pattern>
	<sch:pattern id="p-pqrs-2.16.840.1.113883.10.20.22.4.14-errors">
		<sch:rule id="r-pqrs-2.16.840.1.113883.10.20.22.4.14-errors-abstract" abstract="true">
			<sch:assert id="a-7656" test="not(count(cda:code)=1) or (count(cda:code[@code='360030002'])=1) or (count(cda:code[cda:isValidValueSetForQDMCategory(@sdtc:valueSet, @code, @codeSystem,'2.16.840.1.113883.10.20.24.3.64')])=1)">PQRS_10710: //procedure[templateId/@root='2.16.840.1.113883.10.20.22.4.14']/code ValueSet validation failed. The provided code, codeSystem, and valueSet are incompatible.</sch:assert>
			<sch:assert id="a-7661" test="not(count(cda:statusCode)=1) or (count(cda:statusCode[@code][ cda:isVOCCodeValid('2.16.840.1.113883.11.20.9.22', @code, '2.16.840.1.113883.5.14')])=1)">PQRS_10710: //procedure[templateId/@root='2.16.840.1.113883.10.20.22.4.14']/statusCode ValueSet validation failed. The provided code, codeSystem, and valueSet are incompatible.</sch:assert>
		</sch:rule>
		<sch:rule id="r-pqrs-2.16.840.1.113883.10.20.22.4.14-errors" context="cda:procedure[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.14']]">
			<sch:extends rule="r-pqrs-2.16.840.1.113883.10.20.22.4.14-errors-abstract"/>
		</sch:rule>
		<sch:rule id="r-pqrs-2.16.840.1.113883.10.20.22.4.14-7718-branch-7718-errors-abstract" abstract="true">
    </sch:rule>
		<sch:rule id="r-pqrs-2.16.840.1.113883.10.20.22.4.14-7718-branch-7718-errors" context="cda:procedure[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.14']]/cda:performer[cda:assignedEntity[cda:id][cda:addr][cda:telecom]]">
			<sch:extends rule="r-pqrs-2.16.840.1.113883.10.20.22.4.14-7718-branch-7718-errors-abstract"/>
		</sch:rule>
	</sch:pattern>
	<sch:pattern id="p-pqrs-2.16.840.1.113883.10.20.22.4.31-errors">
		<sch:rule id="r-pqrs-2.16.840.1.113883.10.20.22.4.31-errors-abstract" abstract="true">
    </sch:rule>
		<sch:rule id="r-pqrs-2.16.840.1.113883.10.20.22.4.31-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.31']]">
			<sch:extends rule="r-pqrs-2.16.840.1.113883.10.20.22.4.31-errors-abstract"/>
		</sch:rule>
	</sch:pattern>
	<sch:pattern id="p-pqrs-2.16.840.1.113883.10.20.22.4.32-errors">
		<sch:rule id="r-pqrs-2.16.840.1.113883.10.20.22.4.32-errors-abstract" abstract="true">
    </sch:rule>
		<sch:rule id="r-pqrs-2.16.840.1.113883.10.20.22.4.32-errors" context="cda:participantRole[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.32']]">
			<sch:extends rule="r-pqrs-2.16.840.1.113883.10.20.22.4.32-errors-abstract"/>
		</sch:rule>
	</sch:pattern>
	<sch:pattern id="p-pqrs-2.16.840.1.113883.10.20.22.4.4-errors">
		<sch:rule id="r-pqrs-2.16.840.1.113883.10.20.22.4.4-errors-abstract" abstract="true">			
		</sch:rule>
		<sch:rule id="r-pqrs-2.16.840.1.113883.10.20.22.4.4-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.4']]">
			<sch:extends rule="r-pqrs-2.16.840.1.113883.10.20.22.4.4-errors-abstract"/>
		</sch:rule>
	</sch:pattern>
	<sch:pattern id="p-pqrs-2.16.840.1.113883.10.20.22.4.37-errors">
		<sch:rule id="r-pqrs-2.16.840.1.113883.10.20.22.4.37-errors-abstract" abstract="true">
    </sch:rule>
		<sch:rule id="r-pqrs-2.16.840.1.113883.10.20.22.4.37-errors" context="cda:participantRole[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.37']]">
			<sch:extends rule="r-pqrs-2.16.840.1.113883.10.20.22.4.37-errors-abstract"/>
		</sch:rule>
	</sch:pattern>
	<sch:pattern id="p-pqrs-2.16.840.1.113883.10.20.22.4.12-errors">
		<sch:rule id="r-pqrs-2.16.840.1.113883.10.20.22.4.12-errors-abstract" abstract="true">
			<sch:assert id="a-8298" test="not(count(cda:statusCode)=1) or (count(cda:statusCode[@code][ cda:isVOCCodeValid('2.16.840.1.113883.11.20.9.22', @code, '2.16.840.1.113883.5.14')])=1)">PQRS_10710: //act[templateId/@root='2.16.840.1.113883.10.20.24.3.32']/statusCode ValueSet validation failed. The provided code, codeSystem, and valueSet are incompatible.</sch:assert>
		</sch:rule>
		<sch:rule id="r-pqrs-2.16.840.1.113883.10.20.22.4.12-errors" context="cda:act[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.12']]">
			<sch:extends rule="r-pqrs-2.16.840.1.113883.10.20.22.4.12-errors-abstract"/>
		</sch:rule>
	</sch:pattern>
	<sch:pattern id="p-pqrs-2.16.840.1.113883.10.20.22.4.13-errors">
		<sch:rule id="r-pqrs-2.16.840.1.113883.10.20.22.4.13-errors-abstract" abstract="true">			
		</sch:rule>
		<sch:rule id="r-pqrs-2.16.840.1.113883.10.20.22.4.13-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.13']]">
			<sch:extends rule="r-pqrs-2.16.840.1.113883.10.20.22.4.13-errors-abstract"/>
		</sch:rule>
	</sch:pattern>
	<sch:pattern id="p-pqrs-2.16.840.1.113883.10.20.22.4.39-errors">
		<sch:rule id="r-pqrs-2.16.840.1.113883.10.20.22.4.39-errors-abstract" abstract="true">
    </sch:rule>
		<sch:rule id="r-pqrs-2.16.840.1.113883.10.20.22.4.39-errors" context="cda:act[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.39']]">
			<sch:extends rule="r-pqrs-2.16.840.1.113883.10.20.22.4.39-errors-abstract"/>
		</sch:rule>
	</sch:pattern>
	<sch:pattern id="p-pqrs-2.16.840.1.113883.10.20.22.4.40-errors">
		<sch:rule id="r-pqrs-2.16.840.1.113883.10.20.22.4.40-errors-abstract" abstract="true">
    </sch:rule>
		<sch:rule id="r-pqrs-2.16.840.1.113883.10.20.22.4.40-errors" context="cda:encounter[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.40']]">
			<sch:extends rule="r-pqrs-2.16.840.1.113883.10.20.22.4.40-errors-abstract"/>
		</sch:rule>
	</sch:pattern>
	<sch:pattern id="p-pqrs-2.16.840.1.113883.10.20.22.4.41-errors">
		<sch:rule id="r-pqrs-2.16.840.1.113883.10.20.22.4.41-errors-abstract" abstract="true">
    </sch:rule>
		<sch:rule id="r-pqrs-2.16.840.1.113883.10.20.22.4.41-errors" context="cda:procedure[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.41']]">
			<sch:extends rule="r-pqrs-2.16.840.1.113883.10.20.22.4.41-errors-abstract"/>
		</sch:rule>
	</sch:pattern>
	<sch:pattern id="p-pqrs-2.16.840.1.113883.10.20.22.4.42-errors">
		<sch:rule id="r-pqrs-2.16.840.1.113883.10.20.22.4.42-errors-abstract" abstract="true">
    </sch:rule>
		<sch:rule id="r-pqrs-2.16.840.1.113883.10.20.22.4.42-errors" context="cda:substanceAdministration[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.42']]">
			<sch:extends rule="r-pqrs-2.16.840.1.113883.10.20.22.4.42-errors-abstract"/>
		</sch:rule>
	</sch:pattern>
	<sch:pattern id="p-pqrs-2.16.840.1.113883.10.20.22.4.43-errors">
		<sch:rule id="r-pqrs-2.16.840.1.113883.10.20.22.4.43-errors-abstract" abstract="true">
    </sch:rule>
		<sch:rule id="r-pqrs-2.16.840.1.113883.10.20.22.4.43-errors" context="cda:supply[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.43']]">
			<sch:extends rule="r-pqrs-2.16.840.1.113883.10.20.22.4.43-errors-abstract"/>
		</sch:rule>
	</sch:pattern>
	<sch:pattern id="p-pqrs-2.16.840.1.113883.10.20.22.4.44-errors">
		<sch:rule id="r-pqrs-2.16.840.1.113883.10.20.22.4.44-errors-abstract" abstract="true">
    </sch:rule>
		<sch:rule id="r-pqrs-2.16.840.1.113883.10.20.22.4.44-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.44']]">
			<sch:extends rule="r-pqrs-2.16.840.1.113883.10.20.22.4.44-errors-abstract"/>
		</sch:rule>
	</sch:pattern>
	<sch:pattern id="p-pqrs-2.16.840.1.113883.10.20.22.4.46-errors">
		<sch:rule id="r-pqrs-2.16.840.1.113883.10.20.22.4.46-errors-abstract" abstract="true">
			<sch:assert id="a-8591_P01" test="count(cda:value[@xsi:type='CD'][cda:isValidValueSetForQDMCategory(@sdtc:valueSet, @code, @codeSystem,'2.16.840.1.113883.10.20.24.3.12') or cda:isVOCCodeValid('2.16.840.1.113883.3.88.12.3221.7.4', @code, @codeSystem)])=1">PQRS_10710: //organizer[templateId/@root='2.16.840.1.113883.10.20.24.3.12']/component/observation/[templateId/@root='2.16.840.1.113883.10.20.22.4.46']/value ValueSet validation failed. The provided code, codeSystem, and valueSet are incompatible.</sch:assert>
		</sch:rule>
		<sch:rule id="r-pqrs-2.16.840.1.113883.10.20.22.4.46-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.46']]">
			<sch:extends rule="r-pqrs-2.16.840.1.113883.10.20.22.4.46-errors-abstract"/>
		</sch:rule>
	</sch:pattern>
	<sch:pattern id="p-pqrs-2.16.840.1.113883.10.20.22.4.45-errors">
		<sch:rule id="r-pqrs-2.16.840.1.113883.10.20.22.4.45-errors-abstract" abstract="true">
			<sch:assert id="a-15976" test="not(cda:subject/cda:relatedSubject/cda:subject) or (cda:subject/cda:relatedSubject/cda:subject[count(cda:birthTime)=1] and cda:isValidDate(cda:subject/cda:relatedSubject/cda:subject/cda:birthTime))">PQRS_10705:  //organizer[templateId/@root='2.16.840.1.113883.10.20.24.3.12']/subject/relatedSubject/subject/birthTime Invalid date and/or time format.</sch:assert>
		</sch:rule>
		<sch:rule id="r-pqrs-2.16.840.1.113883.10.20.22.4.45-errors" context="cda:organizer[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.45']]">
			<sch:extends rule="r-pqrs-2.16.840.1.113883.10.20.22.4.45-errors-abstract"/>
		</sch:rule>
	</sch:pattern>
	<sch:pattern id="p-pqrs-2.16.840.1.113883.10.20.22.4.47-errors">
		<sch:rule id="r-pqrs-2.16.840.1.113883.10.20.22.4.47-errors-abstract" abstract="true">
    </sch:rule>
		<sch:rule id="r-pqrs-2.16.840.1.113883.10.20.22.4.47-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.47']]">
			<sch:extends rule="r-pqrs-2.16.840.1.113883.10.20.22.4.47-errors-abstract"/>
		</sch:rule>
	</sch:pattern>
	<sch:pattern id="p-pqrs-2.16.840.1.113883.10.20.22.4.49-errors">
		<sch:rule id="r-pqrs-2.16.840.1.113883.10.20.22.4.49-errors-abstract" abstract="true">
    </sch:rule>
		<sch:rule id="r-pqrs-2.16.840.1.113883.10.20.22.4.49-errors" context="cda:encounter[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.49']]">
			<sch:extends rule="r-pqrs-2.16.840.1.113883.10.20.22.4.49-errors-abstract"/>
		</sch:rule>
	</sch:pattern>
	<sch:pattern id="p-pqrs-2.16.840.1.113883.10.20.22.4.50-errors">
		<sch:rule id="r-pqrs-2.16.840.1.113883.10.20.22.4.50-errors-abstract" abstract="true">
    </sch:rule>
		<sch:rule id="r-pqrs-2.16.840.1.113883.10.20.22.4.50-errors" context="cda:supply[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.50']]">
			<sch:extends rule="r-pqrs-2.16.840.1.113883.10.20.22.4.50-errors-abstract"/>
		</sch:rule>
	</sch:pattern>
	<sch:pattern id="p-pqrs-2.16.840.1.113883.10.20.22.4.54-errors">
		<sch:rule id="r-pqrs-2.16.840.1.113883.10.20.22.4.54-errors-abstract" abstract="true">
    </sch:rule>
		<sch:rule id="r-pqrs-2.16.840.1.113883.10.20.22.4.54-errors" context="cda:manufacturedProduct[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.54']]">
			<sch:extends rule="r-pqrs-2.16.840.1.113883.10.20.22.4.54-errors-abstract"/>
		</sch:rule>
	</sch:pattern>
	<sch:pattern id="p-pqrs-2.16.840.1.113883.10.20.22.4.5-errors">
		<sch:rule id="r-pqrs-2.16.840.1.113883.10.20.22.4.5-errors-abstract" abstract="true">
    </sch:rule>
		<sch:rule id="r-pqrs-2.16.840.1.113883.10.20.22.4.5-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.5']]">
			<sch:extends rule="r-pqrs-2.16.840.1.113883.10.20.22.4.5-errors-abstract"/>
		</sch:rule>
	</sch:pattern>
	<sch:pattern id="p-pqrs-2.16.840.1.113883.10.20.22.4.5-CLOSEDTEMPLATE">
		<sch:rule id="r-pqrs-2.16.840.1.113883.10.20.22.4.5-errors-CL-abstract" abstract="true">
    </sch:rule>
		<sch:rule id="r-pqrs-2.16.840.1.113883.10.20.22.4.5-errors-CL" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.5']]">
			<sch:extends rule="r-pqrs-2.16.840.1.113883.10.20.22.4.5-errors-CL-abstract"/>
		</sch:rule>
	</sch:pattern>
	<sch:pattern id="p-pqrs-2.16.840.1.113883.10.20.24.3.104-errors">
		<!--Pattern is used in an implied relationship.-->
		<sch:rule id="r-pqrs-2.16.840.1.113883.10.20.24.3.104-errors-abstract" abstract="true">
    </sch:rule>
		<sch:rule id="r-pqrs-2.16.840.1.113883.10.20.24.3.104-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.104']]">
			<sch:extends rule="r-pqrs-2.16.840.1.113883.10.20.24.3.104-errors-abstract"/>
		</sch:rule>
	</sch:pattern>
	<sch:pattern id="p-pqrs-2.16.840.1.113883.10.20.24.3.61-errors">
		<sch:rule id="r-pqrs-2.16.840.1.113883.10.20.24.3.61-errors-abstract" abstract="true">
			<sch:extends rule="r-pqrs-2.16.840.1.113883.10.20.24.3.104-errors-abstract"/>
		</sch:rule>
		<sch:rule id="r-pqrs-2.16.840.1.113883.10.20.24.3.61-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.61']]">
			<sch:extends rule="r-pqrs-2.16.840.1.113883.10.20.24.3.61-errors-abstract"/>
		</sch:rule>
	</sch:pattern>
	<sch:pattern id="p-pqrs-2.16.840.1.113883.10.20.24.3.65-errors">
		<sch:rule id="r-pqrs-2.16.840.1.113883.10.20.24.3.65-errors-abstract" abstract="true">
			<sch:extends rule="r-pqrs-2.16.840.1.113883.10.20.22.4.41-errors-abstract"/>
		</sch:rule>
		<sch:rule id="r-pqrs-2.16.840.1.113883.10.20.24.3.65-errors" context="cda:procedure[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.65']]">
			<sch:extends rule="r-pqrs-2.16.840.1.113883.10.20.24.3.65-errors-abstract"/>
		</sch:rule>
	</sch:pattern>
	<sch:pattern id="p-pqrs-2.16.840.1.113883.10.20.24.3.83-errors">
		<sch:rule id="r-pqrs-2.16.840.1.113883.10.20.24.3.83-errors-abstract" abstract="true">			
		</sch:rule>
		<sch:rule id="r-pqrs-2.16.840.1.113883.10.20.24.3.83-errors" context="cda:entryRelationship[@typeCode='RSON']/cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.83']]">
			<sch:extends rule="r-pqrs-2.16.840.1.113883.10.20.24.3.83-errors-abstract"/>
		</sch:rule>
	</sch:pattern>
	<sch:pattern id="p-pqrs-2.16.840.1.113883.10.20.24.3.84-errors">
		<sch:rule id="r-pqrs-2.16.840.1.113883.10.20.24.3.84-errors-abstract" abstract="true">			
		</sch:rule>
		<sch:rule id="r-pqrs-2.16.840.1.113883.10.20.24.3.84-errors" context="cda:entryRelationship[@typeCode='RSON']/cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.84']]">
			<sch:extends rule="r-pqrs-2.16.840.1.113883.10.20.24.3.84-errors-abstract"/>
		</sch:rule>
	</sch:pattern>
	<sch:pattern id="p-pqrs-2.16.840.1.113883.10.20.24.3.85-errors">
		<sch:rule id="r-pqrs-2.16.840.1.113883.10.20.24.3.85-errors-abstract" abstract="true">
			<sch:extends rule="r-pqrs-2.16.840.1.113883.10.20.22.4.9-errors-abstract"/>
		</sch:rule>
		<sch:rule id="r-pqrs-2.16.840.1.113883.10.20.24.3.85-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.85']]">
			<sch:extends rule="r-pqrs-2.16.840.1.113883.10.20.24.3.85-errors-abstract"/>
		</sch:rule>
	</sch:pattern>
	<sch:pattern id="p-pqrs-2.16.840.1.113883.10.20.24.3.1-errors">
		<sch:rule id="r-pqrs-2.16.840.1.113883.10.20.24.3.1-errors-abstract" abstract="true">
			<sch:extends rule="r-pqrs-2.16.840.1.113883.10.20.22.4.44-errors-abstract"/>
		</sch:rule>
		<sch:rule id="r-pqrs-2.16.840.1.113883.10.20.24.3.1-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.1']]">
			<sch:extends rule="r-pqrs-2.16.840.1.113883.10.20.24.3.1-errors-abstract"/>
		</sch:rule>
	</sch:pattern>
	<sch:pattern id="p-pqrs-2.16.840.1.113883.10.20.24.3.63-errors">
		<sch:rule id="r-pqrs-2.16.840.1.113883.10.20.24.3.63-errors-abstract" abstract="true">
			<sch:assert id="a-11101" test="not(count(cda:code)=1) or (count(cda:code[cda:isValidValueSetForQDMCategory(@sdtc:valueSet, @code, @codeSystem, '2.16.840.1.113883.10.20.24.3.63')])=1)">PQRS_10710: //procedure[templateId/@root='2.16.840.1.113883.10.20.24.3.63']/code ValueSet validation failed. The provided code, codeSystem, and valueSet are incompatible.</sch:assert>
			<sch:assert id="a-11367-24-3-63" test="not(count(cda:entryRelationship[@typeCode='RSON']/cda:observation[cda:templateId/@root='2.16.840.1.113883.10.20.24.3.88']/cda:value[@xsi:type='CD'])=1) or (count(cda:entryRelationship[@typeCode='RSON']/cda:observation/cda:value[@xsi:type='CD'][cda:isValidValueSetForQDMCategory(@sdtc:valueSet, @code, @codeSystem,'2.16.840.1.113883.10.20.24.3.63')])=1)">PQRS_10710: //procedure[templateId/@root='2.16.840.1.113883.10.20.24.3.63']/entryRelationship[@typeCode="RSON"]/observation[templateId/@root='2.16.840.1.113883.10.20.24.3.88']/value[xsi:type="CD"] ValueSet validation failed. The provided code, codeSystem, and valueSet are incompatible.</sch:assert>
			<sch:assert id="a-11596" test="not(cda:author[count(cda:time)=1]) or (cda:author[count(cda:time)=1] and cda:isValidDate(cda:author/cda:time))">PQRS_10705: //procedure[templateId/@root='2.16.840.1.113883.10.20.24.3.63']/author/time -  SHALL Invalid date and/or time format.</sch:assert>
			<sch:extends rule="r-pqrs-2.16.840.1.113883.10.20.22.4.41-errors-abstract"/>
		</sch:rule>
		<sch:rule id="r-pqrs-2.16.840.1.113883.10.20.24.3.63-errors" context="cda:procedure[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.63']]">
			<sch:extends rule="r-pqrs-2.16.840.1.113883.10.20.24.3.63-errors-abstract"/>
		</sch:rule>
	</sch:pattern>
	<sch:pattern id="p-pqrs-2.16.840.1.113883.10.20.24.3.66-errors">
		<sch:rule id="r-pqrs-2.16.840.1.113883.10.20.24.3.66-errors-abstract" abstract="true">
			<sch:assert id="a-11112" test="not(count(cda:code)=1) or (count(cda:code[cda:isValidValueSetForQDMCategory(@sdtc:valueSet, @code, @codeSystem, '2.16.840.1.113883.10.20.24.3.66')])=1)">PQRS_10710: //procedure[templateId/@root='2.16.840.1.113883.10.20.24.3.66']/code ValueSet validation failed. The provided code, codeSystem, and valueSet are incompatible.</sch:assert>
			<sch:assert id="a-11367-24-3-66" test="not(count(cda:entryRelationship[@typeCode='RSON']/cda:observation[cda:templateId/@root='2.16.840.1.113883.10.20.24.3.88']/cda:value[@xsi:type='CD'])=1) or (count(cda:entryRelationship[@typeCode='RSON']/cda:observation/cda:value[@xsi:type='CD'][cda:isValidValueSetForQDMCategory(@sdtc:valueSet, @code, @codeSystem,'2.16.840.1.113883.10.20.24.3.66')])=1)">PQRS_10710: //procedure[templateId/@root='2.16.840.1.113883.10.20.24.3.66']/entryRelationship[@typeCode="RSON"]/observation[templateId/@root='2.16.840.1.113883.10.20.24.3.88']/value[xsi:type="CD"] ValueSet validation failed. The provided code, codeSystem, and valueSet are incompatible.</sch:assert>
			<sch:assert id="a-11696" test="not(cda:effectiveTime[count(cda:low)=1]) or (cda:effectiveTime[count(cda:low)=1] and cda:isValidDate(cda:effectiveTime/cda:low))">PQRS_10705: //procedure[templateId/@root='2.16.840.1.113883.10.20.24.3.66']/effectiveTime/low Invalid date and/or time format.</sch:assert>
			<sch:assert id="a-11697" test="not(cda:effectiveTime[count(cda:high)=1]) or (cda:effectiveTime[count(cda:high)=1] and cda:isValidDate(cda:effectiveTime/cda:high))">PQRS_10705: //procedure[templateId/@root='2.16.840.1.113883.10.20.24.3.66']/effectiveTime/high Invalid date and/or time format.</sch:assert>
			<sch:extends rule="r-pqrs-2.16.840.1.113883.10.20.22.4.14-errors-abstract"/>
		</sch:rule>
		<sch:rule id="r-pqrs-2.16.840.1.113883.10.20.24.3.66-errors" context="cda:procedure[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.66']]">
			<sch:extends rule="r-pqrs-2.16.840.1.113883.10.20.24.3.66-errors-abstract"/>
		</sch:rule>
	</sch:pattern>
	<sch:pattern id="p-pqrs-2.16.840.1.113883.10.20.24.3.2-errors">
		<sch:rule id="r-pqrs-2.16.840.1.113883.10.20.24.3.2-errors-abstract" abstract="true">
			<sch:assert id="a-11367-24-3-2" test="not(count(cda:entryRelationship[@typeCode='RSON']/cda:observation[cda:templateId/@root='2.16.840.1.113883.10.20.24.3.88']/cda:value[@xsi:type='CD'])=1) or (count(cda:entryRelationship[@typeCode='RSON']/cda:observation/cda:value[@xsi:type='CD'][cda:isValidValueSetForQDMCategory(@sdtc:valueSet, @code, @codeSystem,'2.16.840.1.113883.10.20.24.3.2')])=1)">PQRS_10710: //act[templateId/@root='2.16.840.1.113883.10.20.24.3.2']/entryRelationship[@typeCode="RSON"]/observation[templateId/@root='2.16.840.1.113883.10.20.24.3.88']/value[xsi:type="CD"] ValueSet validation failed. The provided code, codeSystem, and valueSet are incompatible.</sch:assert>
			<sch:assert id="a-26946" test="not(count(cda:code)=1) or (count(cda:code[cda:isValidValueSetForQDMCategory(@sdtc:valueSet, @code, @codeSystem,'2.16.840.1.113883.10.20.24.3.2')])=1)">PQRS_10710: //act[templateId/@root='2.16.840.1.113883.10.20.24.3.2']/code ValueSet validation failed. The provided code, codeSystem, and valueSet are incompatible.</sch:assert>
			<sch:assert id="a-11622" test="not(count(cda:effectiveTime)=1) or (count(cda:effectiveTime)=1 and cda:isValidEffectiveTime(cda:effectiveTime))">PQRS_10705: //act[templateId/@root='2.16.840.1.113883.10.20.24.3.2']/effectiveTime Invalid date and/or time format.</sch:assert>
		</sch:rule>
		<sch:rule id="r-pqrs-2.16.840.1.113883.10.20.24.3.2-errors" context="cda:act[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.2']]">
			<sch:extends rule="r-pqrs-2.16.840.1.113883.10.20.24.3.2-errors-abstract"/>
		</sch:rule>
	</sch:pattern>
	<sch:pattern id="p-pqrs-2.16.840.1.113883.10.20.24.3.64-errors">
		<sch:rule id="r-pqrs-2.16.840.1.113883.10.20.24.3.64-errors-abstract" abstract="true">
			<sch:assert id="a-11670" test="not(cda:effectiveTime[count(cda:low)=1]) or (cda:effectiveTime[count(cda:low)=1] and cda:isValidDate(cda:effectiveTime/cda:low))">PQRS_10705: //procedure[templateId/@root='2.16.840.1.113883.10.20.24.3.64']/effectiveTime/low Invalid date and/or time format.</sch:assert>
			<sch:assert id="a-11671" test="not(cda:effectiveTime[count(cda:high)=1]) or (cda:effectiveTime[count(cda:high)=1] and cda:isValidDate(cda:effectiveTime/cda:high))">PQRS_10705: //procedure[templateId/@root='2.16.840.1.113883.10.20.24.3.64']/effectiveTime/high Invalid date and/or time format.</sch:assert>
			<sch:assert id="a-11371_P01" test="not(@negationInd='true') or (@negationInd='true' and count(cda:entryRelationship[@typeCode='RSON'][count(cda:observation[cda:templateId/@root='2.16.840.1.113883.10.20.24.3.88']/cda:value[@xsi:type='CD'])=1])=1)">SHALL contain exactly one [1..1] entryRelationship (CONF:11371_P01) such that it SHALL contain exactly one [1..1] @typeCode="RSON" (CodeSystem: HL7ActRelationshipType 2.16.840.1.113883.5.1002 STATIC) (CONF:11372).SHALL contain exactly one [1..1] Reason (identifier: oid:2.16.840.1.113883.10.20.24.3.88) (CONF:11498).</sch:assert>
			<sch:assert id="a-11367-24-3-64" test="not(count(cda:entryRelationship[@typeCode='RSON']/cda:observation[cda:templateId/@root='2.16.840.1.113883.10.20.24.3.88']/cda:value[@xsi:type='CD'])=1) or (count(cda:entryRelationship[@typeCode='RSON']/cda:observation/cda:value[@xsi:type='CD'][cda:isValidValueSetForQDMCategory(@sdtc:valueSet, @code, @codeSystem,'2.16.840.1.113883.10.20.24.3.64')])=1)">PQRS_10710: //procedure[templateId/@root='2.16.840.1.113883.10.20.24.3.64']/entryRelationship[@typeCode="RSON"]/observation[templateId/@root='2.16.840.1.113883.10.20.24.3.88']/value[xsi:type="CD"] ValueSet validation failed. The provided code, codeSystem, and valueSet are incompatible.</sch:assert>
			<sch:extends rule="r-pqrs-2.16.840.1.113883.10.20.22.4.14-errors-abstract"/>
		</sch:rule>
		<sch:rule id="r-pqrs-2.16.840.1.113883.10.20.24.3.64-errors" context="cda:procedure[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.64']]">
			<sch:extends rule="r-pqrs-2.16.840.1.113883.10.20.24.3.64-errors-abstract"/>
		</sch:rule>
	</sch:pattern>
	<sch:pattern id="p-pqrs-2.16.840.1.113883.10.20.24.3.88-errors">
		<sch:rule id="r-pqrs-2.16.840.1.113883.10.20.24.3.88-errors-abstract" abstract="true">
			<sch:assert id="a-11366" test="not(count(cda:effectiveTime)=1) or (count(cda:effectiveTime)=1 and cda:isValidEffectiveTime(cda:effectiveTime))">PQRS_10705:  //observation[templateId/@root='2.16.840.1.113883.10.20.24.3.88']/effectiveTime Invalid date and/or time format.</sch:assert>
		</sch:rule>
		<sch:rule id="r-pqrs-2.16.840.1.113883.10.20.24.3.88-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.88']]">
			<sch:extends rule="r-pqrs-2.16.840.1.113883.10.20.24.3.88-errors-abstract"/>
		</sch:rule>
	</sch:pattern>
	<sch:pattern id="p-pqrs-2.16.840.1.113883.10.20.24.3.89-errors">
		<sch:rule id="r-pqrs-2.16.840.1.113883.10.20.24.3.89-errors-abstract" abstract="true">
    </sch:rule>
		<sch:rule id="r-pqrs-2.16.840.1.113883.10.20.24.3.89-errors" context="cda:procedure[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.89']]">
			<sch:extends rule="r-pqrs-2.16.840.1.113883.10.20.24.3.89-errors-abstract"/>
		</sch:rule>
	</sch:pattern>
	<sch:pattern id="p-pqrs-2.16.840.1.113883.10.20.24.3.62-errors">
		<sch:rule id="r-pqrs-2.16.840.1.113883.10.20.24.3.62-errors-abstract" abstract="true">
			<sch:assert id="a-11367-24-3-62" test="not(count(cda:entryRelationship[@typeCode='RSON']/cda:observation[cda:templateId/@root='2.16.840.1.113883.10.20.24.3.88']/cda:value[@xsi:type='CD'])=1) or (count(cda:entryRelationship[@typeCode='RSON']/cda:observation/cda:value[@xsi:type='CD'][cda:isValidValueSetForQDMCategory(@sdtc:valueSet, @code, @codeSystem,'2.16.840.1.113883.10.20.24.3.62')])=1)">PQRS_10710: //observation[templateId/@root='2.16.840.1.113883.10.20.24.3.62']/entryRelationship[@typeCode="RSON"]/observation[templateId/@root='2.16.840.1.113883.10.20.24.3.88']/value[xsi:type="CD"] ValueSet validation failed. The provided code, codeSystem, and valueSet are incompatible.</sch:assert>
			<sch:assert id="a-11444" test="not(cda:effectiveTime[count(cda:low)=1]) or (cda:effectiveTime[count(cda:low)=1] and cda:isValidDate(cda:effectiveTime/cda:low))">PQRS_10705: //observation[templateId/@root='2.16.840.1.113883.10.20.24.3.62']/effectiveTime/low - Invalid date and/or time format.</sch:assert>
			<sch:assert id="a-11445" test="not(cda:effectiveTime[count(cda:high)=1]) or (cda:isValidDate(cda:effectiveTime/cda:high))">PQRS_10705: //observation[templateId/@root='2.16.840.1.113883.10.20.24.3.62']/effectiveTime/high Invalid date and/or time format.</sch:assert>
			<sch:extends rule="r-pqrs-2.16.840.1.113883.10.20.24.3.104-errors-abstract"/>
		</sch:rule>
		<sch:rule id="r-pqrs-2.16.840.1.113883.10.20.24.3.62-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.62']]">
			<sch:extends rule="r-pqrs-2.16.840.1.113883.10.20.24.3.62-errors-abstract"/>
		</sch:rule>
	</sch:pattern>
	<sch:pattern id="p-pqrs-2.16.840.1.113883.10.20.24.3.4-errors">
		<sch:rule id="r-pqrs-2.16.840.1.113883.10.20.24.3.4-errors-abstract" abstract="true">
			<sch:assert id="a-26950" test="not(count(cda:code)=1) or (count(cda:code[cda:isValidValueSetForQDMCategory(@sdtc:valueSet, @code, @codeSystem,'2.16.840.1.113883.10.20.24.3.4')])=1)">PQRS_10710: //act[templateId/@root='2.16.840.1.113883.10.20.24.3.4']/code ValueSet validation failed. The provided code, codeSystem, and valueSet are incompatible.</sch:assert>
			<sch:assert id="a-11823" test="not(count(cda:effectiveTime)=1) or (count(cda:effectiveTime)=1 and cda:isValidEffectiveTime(cda:effectiveTime))">PQRS_10705: //act[templateId/@root='2.16.840.1.113883.10.20.24.3.4']/effectiveTime Invalid date and/or time format.</sch:assert>
			<sch:assert id="a-PQRS_P0013" test="not(@negationInd='true') or (@negationInd='true' and count(cda:entryRelationship[@typeCode='RSON'][count(cda:observation[cda:templateId/@root='2.16.840.1.113883.10.20.24.3.88']/cda:value[@xsi:type='CD'])=1])=1)">SHALL contain exactly one [1..1] entryRelationship (CONF:PQRS_P0012) such that it SHALL contain exactly one [1..1] @typeCode="RSON" (CodeSystem: HL7ActRelationshipType 2.16.840.1.113883.5.1002 STATIC) (CONF:PQRS_P0011).SHALL contain exactly one [1..1] Reason (identifier: oid:2.16.840.1.113883.10.20.24.3.88) (CONF:PQRS_P0013).</sch:assert>
			<sch:assert id="a-11367-24-3-4" test="not(count(cda:entryRelationship[@typeCode='RSON']/cda:observation[cda:templateId/@root='2.16.840.1.113883.10.20.24.3.88']/cda:value[@xsi:type='CD'])=1) or (count(cda:entryRelationship[@typeCode='RSON']/cda:observation/cda:value[@xsi:type='CD'][cda:isValidValueSetForQDMCategory(@sdtc:valueSet, @code, @codeSystem,'2.16.840.1.113883.10.20.24.3.4')])=1)">PQRS_10710: //act[templateId/@root='2.16.840.1.113883.10.20.24.3.4']/entryRelationship[@typeCode="RSON"]/observation[templateId/@root='2.16.840.1.113883.10.20.24.3.88']/value[xsi:type="CD"] ValueSet validation failed. The provided code, codeSystem, and valueSet are incompatible.</sch:assert>
		</sch:rule>
		<sch:rule id="r-pqrs-2.16.840.1.113883.10.20.24.3.4-errors" context="cda:act[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.4']]">
			<sch:extends rule="r-pqrs-2.16.840.1.113883.10.20.24.3.4-errors-abstract"/>
		</sch:rule>
	</sch:pattern>
	<sch:pattern id="p-pqrs-2.16.840.1.113883.10.20.24.3.82-errors">
		<sch:rule id="r-pqrs-2.16.840.1.113883.10.20.24.3.82-errors-abstract" abstract="true">
    </sch:rule>
		<sch:rule id="r-pqrs-2.16.840.1.113883.10.20.24.3.82-errors" context="cda:participant[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.82']]">
			<sch:extends rule="r-pqrs-2.16.840.1.113883.10.20.24.3.82-errors-abstract"/>
		</sch:rule>
	</sch:pattern>
	<sch:pattern id="p-pqrs-2.16.840.1.113883.10.20.24.3.87-errors">
		<sch:rule id="r-pqrs-2.16.840.1.113883.10.20.24.3.87-errors-abstract" abstract="true">
			<sch:assert id="a-7133b" test="not(count(cda:code)=1) or cda:code[cda:isValidValueSetForQDMCategory(@sdtc:valueSet, @code, @codeSystem, '2.16.840.1.113883.10.20.24.3.87')]">PQRS_10710: //observation[templateId[@root='2.16.840.1.113883.10.20.24.3.87']/code ValueSet validation failed. The provided code, codeSystem, and valueSet are incompatible.</sch:assert>
			<sch:assert id="a-16702" test="not(count(cda:value) = 1) or not( cda:value[@xsi:type='PQ'] ) or ((string-length(cda:value/@unit) &gt; 0) and (string-length(cda:value/@value) &gt; 0))">If xsi:type=PQ, then @units shall be drawn from Unified Code for Units of Measure (UCUM) 2.16.840.1.113883.6.8 code system. Additional constraint is dependent on criteria in the corresponding eMeasure (CONF:16702).</sch:assert>
			<sch:extends rule="r-pqrs-2.16.840.1.113883.10.20.22.4.2-errors-abstract"/>
		</sch:rule>
		<sch:rule id="r-pqrs-2.16.840.1.113883.10.20.24.3.87-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.87']]">
			<sch:extends rule="r-pqrs-2.16.840.1.113883.10.20.24.3.87-errors-abstract"/>
		</sch:rule>
	</sch:pattern>
	<sch:pattern id="p-pqrs-2.16.840.1.113883.10.20.24.3.91-errors">
		<sch:rule id="r-pqrs-2.16.840.1.113883.10.20.24.3.91-errors-abstract" abstract="true">
    </sch:rule>
		<sch:rule id="r-pqrs-2.16.840.1.113883.10.20.24.3.91-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.91']]">
			<sch:extends rule="r-pqrs-2.16.840.1.113883.10.20.24.3.91-errors-abstract"/>
		</sch:rule>
	</sch:pattern>
	<sch:pattern id="p-pqrs-2.16.840.1.113883.10.20.24.3.93-errors">
		<sch:rule id="r-pqrs-2.16.840.1.113883.10.20.24.3.93-errors-abstract" abstract="true">
    </sch:rule>
		<sch:rule id="r-pqrs-2.16.840.1.113883.10.20.24.3.93-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.93']]">
			<sch:extends rule="r-pqrs-2.16.840.1.113883.10.20.24.3.93-errors-abstract"/>
		</sch:rule>
	</sch:pattern>
	<sch:pattern id="p-pqrs-2.16.840.1.113883.10.20.24.3.38-errors">
		<sch:rule id="r-pqrs-2.16.840.1.113883.10.20.24.3.38-errors-abstract" abstract="true">
			<sch:assert id="a-11708" test="not(count(cda:code)=1) or (count(cda:code[cda:isValidValueSetForQDMCategory(@sdtc:valueSet, @code, @codeSystem,'2.16.840.1.113883.10.20.24.3.38')])=1)">PQRS_10710: //observation[templateId/@root='2.16.840.1.113883.10.20.24.3.38']/code ValueSet validation failed. The provided code, codeSystem, and valueSet are incompatible.</sch:assert>
			<sch:assert id="a-11712" test="not(cda:effectiveTime[count(cda:low)=1]) or (cda:effectiveTime[count(cda:low)=1] and cda:isValidDate(cda:effectiveTime/cda:low))">PQRS_10705: //observation[templateId/@root='2.16.840.1.113883.10.20.24.3.38']/effectiveTime/low Invalid date and/or time format.</sch:assert>
			<sch:assert id="a-11713" test="not(cda:effectiveTime[count(cda:high)=1]) or (cda:effectiveTime[count(cda:high)=1] and cda:isValidDate(cda:effectiveTime/cda:high))">PQRS_10705: //observation[templateId/@root='2.16.840.1.113883.10.20.24.3.38']/effectiveTime/high Invalid date and/or time format.</sch:assert>
			<sch:assert id="a-11727_P01" test="not(@negationInd='true') or (@negationInd='true' and count(cda:entryRelationship[@typeCode='RSON'][count(cda:observation[cda:templateId/@root='2.16.840.1.113883.10.20.24.3.88']/cda:value[@xsi:type='CD'])=1])=1)">SHALL contain exactly one [1..1] entryRelationship (CONF:11727_P01) such that it SHALL contain exactly one [1..1] @typeCode="RSON" (CodeSystem: HL7ActRelationshipType 2.16.840.1.113883.5.1002 STATIC) (CONF:11728).SHALL contain exactly one [1..1] Reason (identifier: oid:2.16.840.1.113883.10.20.24.3.88) (CONF:11729).</sch:assert>
			<sch:assert id="a-11367-24-3-38" test="not(count(cda:entryRelationship[@typeCode='RSON']/cda:observation[cda:templateId/@root='2.16.840.1.113883.10.20.24.3.88']/cda:value[@xsi:type='CD'])=1) or (count(cda:entryRelationship[@typeCode='RSON']/cda:observation/cda:value[@xsi:type='CD'][cda:isValidValueSetForQDMCategory(@sdtc:valueSet, @code, @codeSystem,'2.16.840.1.113883.10.20.24.3.38')])=1)">PQRS_10710: //observation[templateId/@root='2.16.840.1.113883.10.20.24.3.38']/entryRelationship[@typeCode="RSON"]/observation[templateId/@root='2.16.840.1.113883.10.20.24.3.88']/value[xsi:type="CD"] ValueSet validation failed. The provided code, codeSystem, and valueSet are incompatible.</sch:assert>
		</sch:rule>
		<sch:rule id="r-pqrs-2.16.840.1.113883.10.20.24.3.38-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.38']]">
			<sch:extends rule="r-pqrs-2.16.840.1.113883.10.20.24.3.38-errors-abstract"/>
		</sch:rule>
	</sch:pattern>
	<sch:pattern id="p-pqrs-2.16.840.1.113883.10.20.24.3.16-errors">
		<sch:rule id="r-pqrs-2.16.840.1.113883.10.20.24.3.16-errors-abstract" abstract="true">
			<sch:extends rule="r-pqrs-2.16.840.1.113883.10.20.24.3.104-errors-abstract"/>
		</sch:rule>
		<sch:rule id="r-pqrs-2.16.840.1.113883.10.20.24.3.16-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.16']]">
			<sch:extends rule="r-pqrs-2.16.840.1.113883.10.20.24.3.16-errors-abstract"/>
		</sch:rule>
	</sch:pattern>
	<sch:pattern id="p-pqrs-2.16.840.1.113883.10.20.24.3.40-errors">
		<sch:rule id="r-pqrs-2.16.840.1.113883.10.20.24.3.40-errors-abstract" abstract="true">
			<sch:assert id="a-7133c" test="not(count(cda:code)=1) or cda:code[cda:isValidValueSetForQDMCategory(@sdtc:valueSet, @code, @codeSystem, '2.16.840.1.113883.10.20.24.3.40')]">PQRS_10710: //observation[templateId[@root='2.16.840.1.113883.10.20.24.3.40']/code ValueSet validation failed. The provided code, codeSystem, and valueSet are incompatible.</sch:assert>
			<sch:assert id="a-16698" test="not(count(cda:value) = 1) or not( cda:value[@xsi:type='PQ'] ) or  ((string-length(cda:value/@unit) &gt; 0) and (string-length(cda:value/@value) &gt; 0))">If xsi:type=PQ, then @units shall be drawn from Unified Code for Units of Measure (UCUM) 2.16.840.1.113883.6.8 code system. Additional constraint is dependent on criteria in the corresponding eMeasure (CONF:16698).</sch:assert>
			<sch:assert id="a-11367-24-3-40" test="not(count(cda:entryRelationship[@typeCode='RSON']/cda:observation[cda:templateId/@root='2.16.840.1.113883.10.20.24.3.88']/cda:value[@xsi:type='CD'])=1) or (count(cda:entryRelationship[@typeCode='RSON']/cda:observation/cda:value[@xsi:type='CD'][cda:isValidValueSetForQDMCategory(@sdtc:valueSet, @code, @codeSystem,'2.16.840.1.113883.10.20.24.3.40')])=1)">PQRS_10710: //observation[templateId/@root='2.16.840.1.113883.10.20.24.3.40']/entryRelationship[@typeCode="RSON"]/observation[templateId/@root='2.16.840.1.113883.10.20.24.3.88']/value[xsi:type="CD"] ValueSet validation failed. The provided code, codeSystem, and valueSet are incompatible.</sch:assert>
			<sch:extends rule="r-pqrs-2.16.840.1.113883.10.20.22.4.2-errors-abstract"/>
		</sch:rule>
		<sch:rule id="r-pqrs-2.16.840.1.113883.10.20.24.3.40-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.40']]">
			<sch:extends rule="r-pqrs-2.16.840.1.113883.10.20.24.3.40-errors-abstract"/>
		</sch:rule>
	</sch:pattern>
	<sch:pattern id="p-pqrs-2.16.840.1.113883.10.20.24.3.15-errors">
		<sch:rule id="r-pqrs-2.16.840.1.113883.10.20.24.3.15-errors-abstract" abstract="true">
			<sch:extends rule="r-pqrs-2.16.840.1.113883.10.20.24.3.104-errors-abstract"/>
		</sch:rule>
		<sch:rule id="r-pqrs-2.16.840.1.113883.10.20.24.3.15-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.15']]">
			<sch:extends rule="r-pqrs-2.16.840.1.113883.10.20.24.3.15-errors-abstract"/>
		</sch:rule>
	</sch:pattern>
	<sch:pattern id="p-pqrs-2.16.840.1.113883.10.20.24.3.39-errors">
		<sch:rule id="r-pqrs-2.16.840.1.113883.10.20.24.3.39-errors-abstract" abstract="true">
			<sch:extends rule="r-pqrs-2.16.840.1.113883.10.20.22.4.44-errors-abstract"/>
		</sch:rule>
		<sch:rule id="r-pqrs-2.16.840.1.113883.10.20.24.3.39-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.39']]">
			<sch:extends rule="r-pqrs-2.16.840.1.113883.10.20.24.3.39-errors-abstract"/>
		</sch:rule>
	</sch:pattern>
	<sch:pattern id="p-pqrs-2.16.840.1.113883.10.20.24.3.3-errors">
		<sch:rule id="r-pqrs-2.16.840.1.113883.10.20.24.3.3-errors-abstract" abstract="true">
			<sch:assert id="a-11367-24-3-3" test="not(count(cda:entryRelationship[@typeCode='RSON']/cda:observation[cda:templateId/@root='2.16.840.1.113883.10.20.24.3.88']/cda:value[@xsi:type='CD'])=1) or (count(cda:entryRelationship[@typeCode='RSON']/cda:observation/cda:value[@xsi:type='CD'][cda:isValidValueSetForQDMCategory(@sdtc:valueSet, @code, @codeSystem,'2.16.840.1.113883.10.20.24.3.3')])=1)">PQRS_10710: //act[templateId/@root='2.16.840.1.113883.10.20.24.3.3']/entryRelationship[@typeCode="RSON"]/observation[templateId/@root='2.16.840.1.113883.10.20.24.3.88']/value[xsi:type="CD"] ValueSet validation failed. The provided code, codeSystem, and valueSet are incompatible.</sch:assert>
			<sch:assert id="a-26947" test="not(count(cda:code)=1) or (count(cda:code[cda:isValidValueSetForQDMCategory(@sdtc:valueSet, @code, @codeSystem,'2.16.840.1.113883.10.20.24.3.3')])=1)">PQRS_10710: //act[templateId/@root='2.16.840.1.113883.10.20.24.3.3']/code ValueSet validation failed. The provided code, codeSystem, and valueSet are incompatible.</sch:assert>
			<sch:assert id="a-11847" test="not(count(cda:effectiveTime)=1) or (count(cda:effectiveTime)=1 and cda:isValidEffectiveTime(cda:effectiveTime))">PQRS_10705: //act[templateId/@root='2.16.840.1.113883.10.20.24.3.3']/effectiveTime Invalid date and/or time format.</sch:assert>
		</sch:rule>
		<sch:rule id="r-pqrs-2.16.840.1.113883.10.20.24.3.3-errors" context="cda:act[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.3']]">
			<sch:extends rule="r-pqrs-2.16.840.1.113883.10.20.24.3.3-errors-abstract"/>
		</sch:rule>
	</sch:pattern>
	<sch:pattern id="p-pqrs-2.16.840.1.113883.10.20.24.3.23-errors">
		<sch:rule id="r-pqrs-2.16.840.1.113883.10.20.24.3.23-errors-abstract" abstract="true">
			<sch:assert id="a-11864" test="not(count(cda:code)=1) or (count(cda:code[cda:isValidValueSetForQDMCategory(@sdtc:valueSet, @code, @codeSystem,'2.16.840.1.113883.10.20.24.3.23')])=1)">PQRS_10710: //encounter[templateId/@root='2.16.840.1.113883.10.20.24.3.23']/code ValueSet validation failed. The provided code, codeSystem, and valueSet are incompatible.</sch:assert>
			<sch:assert id="a-11877" test="not(cda:effectiveTime[count(cda:low)=1]) or (cda:effectiveTime[count(cda:low)=1] and cda:isValidDate(cda:effectiveTime/cda:low))">PQRS_10705: //encounter[templateId/@root='2.16.840.1.113883.10.20.24.3.23']/effectiveTime/low Invalid date and/or time format.</sch:assert>
			<sch:assert id="a-11878" test="not(cda:effectiveTime[count(cda:high)=1]) or (cda:effectiveTime[count(cda:high)=1]  and cda:isValidDate(cda:effectiveTime/cda:high))">PQRS_10705: //encounter[templateId/@root='2.16.840.1.113883.10.20.24.3.23']/effectiveTime/high Invalid date and/or time format.</sch:assert>
			<sch:assert id="a-11367-24-3-23" test="not(count(cda:entryRelationship[@typeCode='RSON']/cda:observation[cda:templateId/@root='2.16.840.1.113883.10.20.24.3.88']/cda:value[@xsi:type='CD'])=1) or (count(cda:entryRelationship[@typeCode='RSON']/cda:observation/cda:value[@xsi:type='CD'][cda:isValidValueSetForQDMCategory(@sdtc:valueSet, @code, @codeSystem,'2.16.840.1.113883.10.20.24.3.23')])=1)">PQRS_10710: //observation[templateId/@root='2.16.840.1.113883.10.20.24.3.23']/entryRelationship[@typeCode="RSON"]/observation[templateId/@root='2.16.840.1.113883.10.20.24.3.88']/value[xsi:type="CD"] ValueSet validation failed. The provided code, codeSystem, and valueSet are incompatible.</sch:assert>
			<sch:extends rule="r-pqrs-2.16.840.1.113883.10.20.22.4.49-errors-abstract"/>
		</sch:rule>
		<sch:rule id="r-pqrs-2.16.840.1.113883.10.20.24.3.23-errors" context="cda:encounter[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.23']]">
			<sch:extends rule="r-pqrs-2.16.840.1.113883.10.20.24.3.23-errors-abstract"/>
		</sch:rule>
	</sch:pattern>
	<sch:pattern id="p-pqrs-2.16.840.1.113883.10.20.24.3.21-errors">
		<sch:rule id="r-pqrs-2.16.840.1.113883.10.20.24.3.21-errors-abstract" abstract="true">
			<sch:extends rule="r-pqrs-2.16.840.1.113883.10.20.22.4.49-errors-abstract"/>
		</sch:rule>
		<sch:rule id="r-pqrs-2.16.840.1.113883.10.20.24.3.21-errors" context="cda:encounter[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.21']]">
			<sch:extends rule="r-pqrs-2.16.840.1.113883.10.20.24.3.21-errors-abstract"/>
		</sch:rule>
	</sch:pattern>
	<sch:pattern id="p-pqrs-2.16.840.1.113883.10.20.24.3.24-errors">
		<sch:rule id="r-pqrs-2.16.840.1.113883.10.20.24.3.24-errors-abstract" abstract="true">
			<sch:extends rule="r-pqrs-2.16.840.1.113883.10.20.22.4.40-errors-abstract"/>
		</sch:rule>
		<sch:rule id="r-pqrs-2.16.840.1.113883.10.20.24.3.24-errors" context="cda:encounter[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.24']]">
			<sch:extends rule="r-pqrs-2.16.840.1.113883.10.20.24.3.24-errors-abstract"/>
		</sch:rule>
	</sch:pattern>
	<sch:pattern id="p-pqrs-2.16.840.1.113883.10.20.24.3.22-errors">
		<sch:rule id="r-pqrs-2.16.840.1.113883.10.20.24.3.22-errors-abstract" abstract="true">
			<sch:assert id="a-11936" test="not(count(cda:code)=1) or (count(cda:code[cda:isValidValueSetForQDMCategory(@sdtc:valueSet, @code, @codeSystem,'2.16.840.1.113883.10.20.24.3.22')])=1)">PQRS_10710: //encounter[templateId/@root='2.16.840.1.113883.10.20.24.3.22']/code ValueSet validation failed. The provided code, codeSystem, and valueSet are incompatible.</sch:assert>
			<!-- Lantana base file assertion is in error, below is the correct test that should be done. -->
			<!--<sch:assert id="a-11938" test="count(cda:statusCode[@code='new'])=1">This statusCode SHALL contain exactly one [1..1] @code="new" (CodeSystem: ActStatus 2.16.840.1.113883.5.14 STATIC) (CONF:11938).</sch:assert>-->
			<sch:assert id="a-11940" test="not(cda:author[count(cda:time)=1]) or (cda:author[count(cda:time)=1] and  cda:isValidDate(cda:author/cda:time))">PQRS_10705: //encounter[templateId/@root='2.16.840.1.113883.10.20.24.3.22']/author/time Invalid date and/or time format.</sch:assert>
			<sch:assert id="a-11367-24-3-22" test="not(count(cda:entryRelationship[@typeCode='RSON']/cda:observation[cda:templateId/@root='2.16.840.1.113883.10.20.24.3.88']/cda:value[@xsi:type='CD'])=1) or (count(cda:entryRelationship[@typeCode='RSON']/cda:observation/cda:value[@xsi:type='CD'][cda:isValidValueSetForQDMCategory(@sdtc:valueSet, @code, @codeSystem,'2.16.840.1.113883.10.20.24.3.22')])=1)">PQRS_10710: //observation[templateId/@root='2.16.840.1.113883.10.20.24.3.22']/entryRelationship[@typeCode="RSON"]/observation[templateId/@root='2.16.840.1.113883.10.20.24.3.88']/value[xsi:type="CD"] ValueSet validation failed. The provided code, codeSystem, and valueSet are incompatible.</sch:assert>
			<sch:extends rule="r-pqrs-2.16.840.1.113883.10.20.22.4.40-errors-abstract"/>
		</sch:rule>
		<sch:rule id="r-pqrs-2.16.840.1.113883.10.20.24.3.22-errors" context="cda:encounter[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.22']]">
			<sch:extends rule="r-pqrs-2.16.840.1.113883.10.20.24.3.22-errors-abstract"/>
		</sch:rule>
	</sch:pattern>
	<sch:pattern id="p-pqrs-2.16.840.1.113883.10.20.24.3.37-errors">
		<sch:rule id="r-pqrs-2.16.840.1.113883.10.20.24.3.37-errors-abstract" abstract="true">
			<sch:assert id="a-11367-24-3-37" test="not(count(cda:entryRelationship[@typeCode='RSON']/cda:observation[cda:templateId/@root='2.16.840.1.113883.10.20.24.3.88']/cda:value[@xsi:type='CD'])=1) or (count(cda:entryRelationship[@typeCode='RSON']/cda:observation/cda:value[@xsi:type='CD'][cda:isValidValueSetForQDMCategory(@sdtc:valueSet, @code, @codeSystem,'2.16.840.1.113883.10.20.24.3.37')])=1)">PQRS_10710: //observation[templateId/@root='2.16.840.1.113883.10.20.24.3.37']/entryRelationship[@typeCode="RSON"]/observation[templateId/@root='2.16.840.1.113883.10.20.24.3.88']/value[xsi:type="CD"] ValueSet validation failed. The provided code, codeSystem, and valueSet are incompatible.</sch:assert>
			<sch:assert id="a-11957" test="not(count(cda:code)=1) or (count(cda:code[cda:isValidValueSetForQDMCategory(@sdtc:valueSet, @code, @codeSystem,'2.16.840.1.113883.10.20.24.3.37')])=1)">PQRS_10710: //observation[templateId/@root='2.16.840.1.113883.10.20.24.3.37']/code ValueSet validation failed. The provided code, codeSystem, and valueSet are incompatible.</sch:assert>
			<sch:assert id="a-11961" test="not(count(cda:author[count(cda:time)=1])=1) or (count(cda:author[count(cda:time)=1])=1 and cda:isValidDate(cda:author/cda:time))">PQRS_10705: //observation[templateId/@root='2.16.840.1.113883.10.20.24.3.37']/author/time Invalid date and/or time format.</sch:assert>
			<sch:extends rule="r-pqrs-2.16.840.1.113883.10.20.22.4.44-errors-abstract"/>
		</sch:rule>
		<sch:rule id="r-pqrs-2.16.840.1.113883.10.20.24.3.37-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.37']]">
			<sch:extends rule="r-pqrs-2.16.840.1.113883.10.20.24.3.37-errors-abstract"/>
		</sch:rule>
	</sch:pattern>
	<sch:pattern id="p-pqrs-2.16.840.1.113883.10.20.24.3.11-errors">
		<sch:rule id="r-pqrs-2.16.840.1.113883.10.20.24.3.11-errors-abstract" abstract="true">
			<sch:assert id="a-11984" test="not(cda:effectiveTime[count(cda:low)=1]) or (cda:effectiveTime[count(cda:low)=1] and cda:isValidDate(cda:effectiveTime/cda:low))">PQRS_10705: //observation[templateId/@root='2.16.840.1.113883.10.20.24.3.11']/effectiveTime/low Invalid date and/or time format.</sch:assert>
			<sch:assert id="a-11985" test="not(cda:effectiveTime[count(cda:high)=1]) or (cda:effectiveTime[count(cda:high)=1] and cda:isValidDate(cda:effectiveTime/cda:high))">PQRS_10705: //observation[templateId/@root='2.16.840.1.113883.10.20.24.3.11']/effectiveTime/high Invalid date and/or time format.</sch:assert>
			<sch:assert id="a-12008" test="not(count(cda:value[@xsi:type='CD'])=1) or (count(cda:value[@xsi:type='CD'][cda:isValidValueSetForQDMCategory(@sdtc:valueSet, @code, @codeSystem,'2.16.840.1.113883.10.20.24.3.11')])=1)">PQRS_10710: //observation[templateId/@root='2.16.840.1.113883.10.20.24.3.11']/value[@xsi:type="CD"] ValueSet validation failed. The provided code, codeSystem, and valueSet are incompatible.</sch:assert>
			<sch:assert id="a-11367-24-3-11" test="not(count(cda:entryRelationship[@typeCode='RSON']/cda:observation[cda:templateId/@root='2.16.840.1.113883.10.20.24.3.88']/cda:value[@xsi:type='CD'])=1) or (count(cda:entryRelationship[@typeCode='RSON']/cda:observation/cda:value[@xsi:type='CD'][cda:isValidValueSetForQDMCategory(@sdtc:valueSet, @code, @codeSystem,'2.16.840.1.113883.10.20.24.3.11')])=1)">PQRS_10710: //observation[templateId/@root='2.16.840.1.113883.10.20.24.3.11']/entryRelationship[@typeCode="RSON"]/observation[templateId/@root='2.16.840.1.113883.10.20.24.3.88']/value[xsi:type="CD"] ValueSet validation failed. The provided code, codeSystem, and valueSet are incompatible.</sch:assert>
			<sch:assert id="a-PQRS_P0014" test="not(cda:priorityCode) or count(cda:priorityCode[@sdtc:valueSet])=1">The priorityCode, if present, SHALL contain the @sdtc:valueSet extension to reference the value set from which the supplied code was drawn (CONF:PQRS_P0014).</sch:assert>
			<sch:assert id="a-PQRS_P0014-a" test="not(cda:priorityCode) or (count(cda:priorityCode[@sdtc:valueSet][cda:isValidValueSetForQDMCategory(@sdtc:valueSet, @code, @codeSystem,'2.16.840.1.113883.10.20.24.3.88')])=1)">PQRS_10710: //observation[templateId/@root='2.16.840.1.113883.10.20.24.3.11']/priorityCode[@sdtc:valueSet] ValueSet validation failed. The provided code, codeSystem, and valueSet are incompatible.</sch:assert>
			<sch:extends rule="r-pqrs-2.16.840.1.113883.10.20.22.4.4-errors-abstract"/>
		</sch:rule>
		<sch:rule id="r-pqrs-2.16.840.1.113883.10.20.24.3.11-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.11']]">
			<sch:extends rule="r-pqrs-2.16.840.1.113883.10.20.24.3.11-errors-abstract"/>
		</sch:rule>
	</sch:pattern>
	<sch:pattern id="p-pqrs-2.16.840.1.113883.10.20.24.3.13-errors">
		<sch:rule id="r-pqrs-2.16.840.1.113883.10.20.24.3.13-errors-abstract" abstract="true">
			<sch:assert id="a-9058a" test="count(cda:value[@xsi:type='PQ'])=1 or (count(cda:value[not (@xsi:type='PQ')][cda:isValidValueSetForQDMCategory(@sdtc:valueSet, @code, @codeSystem,'2.16.840.1.113883.10.20.24.3.13')])=1)">PQRS_10710: //observation[templateId/@root='2.16.840.1.113883.10.20.24.3.13']/value[@xsi:type="CD"] ValueSet validation failed. The provided code, codeSystem, and valueSet are incompatible.</sch:assert>
			<sch:assert id="a-12029" test="not(cda:effectiveTime[count(cda:low)=1]) or (cda:effectiveTime[count(cda:low)=1] and cda:isValidDate(cda:effectiveTime/cda:low))">PQRS_10705: //observation[templateId/@root='2.16.840.1.113883.10.20.24.3.13']/effectiveTime/low Invalid date and/or time format.</sch:assert>
			<sch:assert id="a-12030" test="not(cda:effectiveTime[count(cda:high)=1]) or (cda:effectiveTime[count(cda:high)=1] and cda:isValidDate(cda:effectiveTime/cda:high))">PQRS_10705: //observation[templateId/@root='2.16.840.1.113883.10.20.24.3.13']/effectiveTime/high Invalid date and/or time format.</sch:assert>
			<sch:assert id="a-11367-24-3-13" test="not(count(cda:entryRelationship[@typeCode='RSON']/cda:observation[cda:templateId/@root='2.16.840.1.113883.10.20.24.3.88']/cda:value[@xsi:type='CD'])=1) or (count(cda:entryRelationship[@typeCode='RSON']/cda:observation/cda:value[@xsi:type='CD'][cda:isValidValueSetForQDMCategory(@sdtc:valueSet, @code, @codeSystem,'2.16.840.1.113883.10.20.24.3.13')])=1)">PQRS_10710: //observation[templateId/@root='2.16.840.1.113883.10.20.24.3.13']/entryRelationship[@typeCode="RSON"]/observation[templateId/@root='2.16.840.1.113883.10.20.24.3.88']/value[xsi:type="CD"] ValueSet validation failed. The provided code, codeSystem, and valueSet are incompatible.</sch:assert>
			<sch:extends rule="r-pqrs-2.16.840.1.113883.10.20.22.4.4-errors-abstract"/>
		</sch:rule>
		<sch:rule id="r-pqrs-2.16.840.1.113883.10.20.24.3.13-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.13']]">
			<sch:extends rule="r-pqrs-2.16.840.1.113883.10.20.24.3.13-errors-abstract"/>
		</sch:rule>
	</sch:pattern>
	<sch:pattern id="p-pqrs-2.16.840.1.113883.10.20.24.3.14-errors">
		<sch:rule id="r-pqrs-2.16.840.1.113883.10.20.24.3.14-errors-abstract" abstract="true">
			<sch:assert id="a-9058b" test="count(cda:value[@xsi:type='PQ'])=1 or (count(cda:value[not (@xsi:type='PQ')][cda:isValidValueSetForQDMCategory(@sdtc:valueSet, @code, @codeSystem,'2.16.840.1.113883.10.20.24.3.14')])=1)">PQRS_10710: //observation[templateId/@root='2.16.840.1.113883.10.20.24.3.14']/value[@xsi:type="CD"] ValueSet validation failed. The provided code, codeSystem, and valueSet are incompatible.</sch:assert>
			<sch:assert id="a-12062" test="not(cda:effectiveTime[count(cda:low)=1]) or (cda:effectiveTime[count(cda:low)=1] and cda:isValidDate(cda:effectiveTime/cda:low))">PQRS_10705: //observation[templateId/@root='2.16.840.1.113883.10.20.24.3.14']/effectiveTime/low Invalid date and/or time format.</sch:assert>
			<sch:assert id="a-12063" test="not(cda:effectiveTime[count(cda:high)=1]) or (cda:effectiveTime[count(cda:high)=1]  and cda:isValidDate(cda:effectiveTime/cda:high))">PQRS_10705: //observation[templateId/@root='2.16.840.1.113883.10.20.24.3.14']/effectiveTime/high Invalid date and/or time format.</sch:assert>
			<sch:assert id="a-11367-24-3-14" test="not(count(cda:entryRelationship[@typeCode='RSON']/cda:observation[cda:templateId/@root='2.16.840.1.113883.10.20.24.3.88']/cda:value[@xsi:type='CD'])=1) or (count(cda:entryRelationship[@typeCode='RSON']/cda:observation/cda:value[@xsi:type='CD'][cda:isValidValueSetForQDMCategory(@sdtc:valueSet, @code, @codeSystem,'2.16.840.1.113883.10.20.24.3.14')])=1)">PQRS_10710: //observation[templateId/@root='2.16.840.1.113883.10.20.24.3.14']/entryRelationship[@typeCode="RSON"]/observation[templateId/@root='2.16.840.1.113883.10.20.24.3.88']/value[xsi:type="CD"] ValueSet validation failed. The provided code, codeSystem, and valueSet are incompatible.</sch:assert>
			<sch:extends rule="r-pqrs-2.16.840.1.113883.10.20.22.4.4-errors-abstract"/>
		</sch:rule>
		<sch:rule id="r-pqrs-2.16.840.1.113883.10.20.24.3.14-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.14']]">
			<sch:extends rule="r-pqrs-2.16.840.1.113883.10.20.24.3.14-errors-abstract"/>
		</sch:rule>
	</sch:pattern>
	<sch:pattern id="p-pqrs-2.16.840.1.113883.10.20.24.3.41-errors">
		<sch:rule id="r-pqrs-2.16.840.1.113883.10.20.24.3.41-errors-abstract" abstract="true">
			<sch:assert id="a-11367-24-3-41" test="not(count(cda:entryRelationship[@typeCode='RSON']/cda:observation[cda:templateId/@root='2.16.840.1.113883.10.20.24.3.88']/cda:value[@xsi:type='CD'])=1) or (count(cda:entryRelationship[@typeCode='RSON']/cda:observation/cda:value[@xsi:type='CD'][cda:isValidValueSetForQDMCategory(@sdtc:valueSet, @code, @codeSystem,'2.16.840.1.113883.10.20.24.3.41')])=1)">PQRS_10710: //observation[templateId/@root='2.16.840.1.113883.10.20.24.3.41']/entryRelationship[@typeCode="RSON"]/observation[templateId/@root='2.16.840.1.113883.10.20.24.3.88']/value[xsi:type="CD"] ValueSet validation failed. The provided code, codeSystem, and valueSet are incompatible.</sch:assert>
			<sch:extends rule="r-pqrs-2.16.840.1.113883.10.20.22.4.16-errors-abstract"/>
		</sch:rule>
		<sch:rule id="r-pqrs-2.16.840.1.113883.10.20.24.3.41-errors" context="cda:substanceAdministration[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.41']]">
			<sch:extends rule="r-pqrs-2.16.840.1.113883.10.20.24.3.41-errors-abstract"/>
		</sch:rule>
	</sch:pattern>
	<sch:pattern id="p-pqrs-2.16.840.1.113883.10.20.24.3.5-errors">
		<sch:rule id="r-pqrs-2.16.840.1.113883.10.20.24.3.5-errors-abstract" abstract="true">
			<sch:extends rule="r-pqrs-2.16.840.1.113883.10.20.24.3.90-errors-abstract"/>
		</sch:rule>
		<sch:rule id="r-pqrs-2.16.840.1.113883.10.20.24.3.5-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.5']]">
			<sch:extends rule="r-pqrs-2.16.840.1.113883.10.20.24.3.5-errors-abstract"/>
		</sch:rule>
	</sch:pattern>
	<sch:pattern id="p-pqrs-2.16.840.1.113883.10.20.24.3.6-errors">
		<sch:rule id="r-pqrs-2.16.840.1.113883.10.20.24.3.6-errors-abstract" abstract="true">
			<sch:extends rule="r-pqrs-2.16.840.1.113883.10.20.24.3.90-errors-abstract"/>
		</sch:rule>
		<sch:rule id="r-pqrs-2.16.840.1.113883.10.20.24.3.6-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.6']]">
			<sch:extends rule="r-pqrs-2.16.840.1.113883.10.20.24.3.6-errors-abstract"/>
		</sch:rule>
	</sch:pattern>
	<sch:pattern id="p-pqrs-2.16.840.1.113883.10.20.24.3.8-errors">
		<sch:rule id="r-pqrs-2.16.840.1.113883.10.20.24.3.8-errors-abstract" abstract="true">
			<sch:extends rule="r-pqrs-2.16.840.1.113883.10.20.24.3.90-errors-abstract"/>
		</sch:rule>
		<sch:rule id="r-pqrs-2.16.840.1.113883.10.20.24.3.8-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.8']]">
			<sch:extends rule="r-pqrs-2.16.840.1.113883.10.20.24.3.8-errors-abstract"/>
		</sch:rule>
	</sch:pattern>
	<sch:pattern id="p-pqrs-2.16.840.1.113883.10.20.24.3.94-errors">
		<sch:rule id="r-pqrs-2.16.840.1.113883.10.20.24.3.94-errors-abstract" abstract="true">
			<sch:extends rule="r-pqrs-2.16.840.1.113883.10.20.22.4.6-errors-abstract"/>
		</sch:rule>
		<sch:rule id="r-pqrs-2.16.840.1.113883.10.20.24.3.94-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.94']]">
			<sch:extends rule="r-pqrs-2.16.840.1.113883.10.20.24.3.94-errors-abstract"/>
		</sch:rule>
	</sch:pattern>
	<sch:pattern id="p-pqrs-2.16.840.1.113883.10.20.24.3.95-errors">
		<sch:rule id="r-pqrs-2.16.840.1.113883.10.20.24.3.95-errors-abstract" abstract="true">
			<sch:extends rule="r-pqrs-2.16.840.1.113883.10.20.22.4.6-errors-abstract"/>
		</sch:rule>
		<sch:rule id="r-pqrs-2.16.840.1.113883.10.20.24.3.95-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.95']]">
			<sch:extends rule="r-pqrs-2.16.840.1.113883.10.20.24.3.95-errors-abstract"/>
		</sch:rule>
	</sch:pattern>
	<sch:pattern id="p-pqrs-2.16.840.1.113883.10.20.24.3.96-errors">
		<sch:rule id="r-pqrs-2.16.840.1.113883.10.20.24.3.96-errors-abstract" abstract="true">
			<sch:extends rule="r-pqrs-2.16.840.1.113883.10.20.22.4.6-errors-abstract"/>
		</sch:rule>
		<sch:rule id="r-pqrs-2.16.840.1.113883.10.20.24.3.96-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.96']]">
			<sch:extends rule="r-pqrs-2.16.840.1.113883.10.20.24.3.96-errors-abstract"/>
		</sch:rule>
	</sch:pattern>
	<sch:pattern id="p-pqrs-2.16.840.1.113883.10.20.24.3.76-errors">
		<sch:rule id="r-pqrs-2.16.840.1.113883.10.20.24.3.76-errors-abstract" abstract="true">
			<sch:extends rule="r-pqrs-2.16.840.1.113883.10.20.22.4.4-errors-abstract"/>
		</sch:rule>
		<sch:rule id="r-pqrs-2.16.840.1.113883.10.20.24.3.76-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.76']]">
			<sch:extends rule="r-pqrs-2.16.840.1.113883.10.20.24.3.76-errors-abstract"/>
		</sch:rule>
	</sch:pattern>
	<sch:pattern id="p-pqrs-2.16.840.1.113883.10.20.24.3.78-errors">
		<sch:rule id="r-pqrs-2.16.840.1.113883.10.20.24.3.78-errors-abstract" abstract="true">
			<sch:extends rule="r-pqrs-2.16.840.1.113883.10.20.22.4.4-errors-abstract"/>
		</sch:rule>
		<sch:rule id="r-pqrs-2.16.840.1.113883.10.20.24.3.78-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.78']]">
			<sch:extends rule="r-pqrs-2.16.840.1.113883.10.20.24.3.78-errors-abstract"/>
		</sch:rule>
	</sch:pattern>
	<sch:pattern id="p-pqrs-2.16.840.1.113883.10.20.24.3.79-errors">
		<sch:rule id="r-pqrs-2.16.840.1.113883.10.20.24.3.79-errors-abstract" abstract="true">
			<sch:extends rule="r-pqrs-2.16.840.1.113883.10.20.22.4.4-errors-abstract"/>
		</sch:rule>
		<sch:rule id="r-pqrs-2.16.840.1.113883.10.20.24.3.79-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.79']]">
			<sch:extends rule="r-pqrs-2.16.840.1.113883.10.20.24.3.79-errors-abstract"/>
		</sch:rule>
	</sch:pattern>
	<sch:pattern id="p-pqrs-2.16.840.1.113883.10.20.24.3.9-errors">
		<sch:rule id="r-pqrs-2.16.840.1.113883.10.20.24.3.9-errors-abstract" abstract="true">
			<sch:extends rule="r-pqrs-2.16.840.1.113883.10.20.22.4.43-errors-abstract"/>
		</sch:rule>
		<sch:rule id="r-pqrs-2.16.840.1.113883.10.20.24.3.9-errors" context="cda:supply[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.9']]">
			<sch:extends rule="r-pqrs-2.16.840.1.113883.10.20.24.3.9-errors-abstract"/>
		</sch:rule>
	</sch:pattern>
	<sch:pattern id="p-pqrs-2.16.840.1.113883.10.20.24.3.10-errors">
		<sch:rule id="r-pqrs-2.16.840.1.113883.10.20.24.3.10-errors-abstract" abstract="true">
			<sch:extends rule="r-pqrs-2.16.840.1.113883.10.20.22.4.43-errors-abstract"/>
		</sch:rule>
		<sch:rule id="r-pqrs-2.16.840.1.113883.10.20.24.3.10-errors" context="cda:supply[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.10']]">
			<sch:extends rule="r-pqrs-2.16.840.1.113883.10.20.24.3.10-errors-abstract"/>
		</sch:rule>
	</sch:pattern>
	<sch:pattern id="p-pqrs-2.16.840.1.113883.10.20.24.3.7-errors">
		<sch:rule id="r-pqrs-2.16.840.1.113883.10.20.24.3.7-errors-abstract" abstract="true">
			<sch:assert id="a-11367-24-3-7" test="not(count(cda:entryRelationship[@typeCode='RSON']/cda:observation[cda:templateId/@root='2.16.840.1.113883.10.20.24.3.88']/cda:value[@xsi:type='CD'])=1) or (count(cda:entryRelationship[@typeCode='RSON']/cda:observation/cda:value[@xsi:type='CD'][cda:isValidValueSetForQDMCategory(@sdtc:valueSet, @code, @codeSystem,'2.16.840.1.113883.10.20.24.3.7')])=1)">PQRS_10710: //procedure[templateId/@root='2.16.840.1.113883.10.20.24.3.7']/entryRelationship[@typeCode="RSON"]/observation[templateId/@root='2.16.840.1.113883.10.20.24.3.88']/value[xsi:type="CD"] ValueSet validation failed. The provided code, codeSystem, and valueSet are incompatible.</sch:assert>
			<sch:assert id="a-12395" test="not(count(cda:effectiveTime)=1) or (count(cda:effectiveTime)=1 and cda:isValidEffectiveTime(cda:effectiveTime))">PQRS_10705: //procedure[templateId/@root='2.16.840.1.113883.10.20.24.3.7'/effectiveTime Invalid date and/or time format.</sch:assert>
			<sch:assert id="a-12402" test="not(count(cda:participant/cda:participantRole/cda:playingDevice/cda:code)=1) or (count(cda:participant/cda:participantRole/cda:playingDevice/cda:code[cda:isValidValueSetForQDMCategory(@sdtc:valueSet, @code, @codeSystem, '2.16.840.1.113883.10.20.24.3.7')])=1)">PQRS_10710: //procedure[templateId/@root='2.16.840.1.113883.10.20.24.3.7'/participant/participantRole/playingDevice[@classCode="DEV"]/code ValueSet validation failed. The provided code, codeSystem, and valueSet are incompatible.</sch:assert>
			<sch:extends rule="r-pqrs-2.16.840.1.113883.10.20.22.4.14-errors-abstract"/>
		</sch:rule>
		<sch:rule id="r-pqrs-2.16.840.1.113883.10.20.24.3.7-errors" context="cda:procedure[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.7']]">
			<sch:extends rule="r-pqrs-2.16.840.1.113883.10.20.24.3.7-errors-abstract"/>
		</sch:rule>
	</sch:pattern>
	<sch:pattern id="p-pqrs-2.16.840.1.113883.10.20.24.3.42-errors">
		<sch:rule id="r-pqrs-2.16.840.1.113883.10.20.24.3.42-errors-abstract" abstract="true">
			<sch:assert id="a-26714" test="not(count(cda:effectiveTime)=1) or (count(cda:effectiveTime)=1 and cda:isValidEffectiveTime(cda:effectiveTime))">PQRS_10705: //act[templateId/@root='2.16.840.1.113883.10.20.24.3.42']/effectiveTime Invalid date and/or time format.</sch:assert>
			<sch:assert id="a-PQRS_P0020" test="not(@negationInd='true') or (@negationInd='true' and count(cda:entryRelationship[@typeCode='RSON'][count(cda:observation[cda:templateId/@root='2.16.840.1.113883.10.20.24.3.88']/cda:value[@xsi:type='CD'])=1])=1)">SHALL contain exactly one [1..1] entryRelationship (CONF:PQRS_P0020) such that it SHALL contain exactly one [1..1] @typeCode="RSON" (CodeSystem: HL7ActRelationshipType 2.16.840.1.113883.5.1002 STATIC) (CONF:PQRS_P0021).SHALL contain exactly one [1..1] Reason (identifier: oid:2.16.840.1.113883.10.20.24.3.88) (CONF:PQRS_P0022).</sch:assert>
			<sch:assert id="a-11367-24-3-42" test="not(count(cda:entryRelationship[@typeCode='RSON']/cda:observation[cda:templateId/@root='2.16.840.1.113883.10.20.24.3.88']/cda:value[@xsi:type='CD'])=1) or (count(cda:entryRelationship[@typeCode='RSON']/cda:observation/cda:value[@xsi:type='CD'][cda:isValidValueSetForQDMCategory(@sdtc:valueSet, @code, @codeSystem,'2.16.840.1.113883.10.20.24.3.42')])=1)">PQRS_10710: //act[templateId/@root='2.16.840.1.113883.10.20.24.3.42']/entryRelationship[@typeCode="RSON"]/observation[templateId/@root='2.16.840.1.113883.10.20.24.3.88']/value[xsi:type="CD"] ValueSet validation failed. The provided code, codeSystem, and valueSet are incompatible.</sch:assert>
		</sch:rule>
		<sch:rule id="r-pqrs-2.16.840.1.113883.10.20.24.3.42-errors" context="cda:act[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.42']]">
			<sch:extends rule="r-pqrs-2.16.840.1.113883.10.20.24.3.42-errors-abstract"/>
		</sch:rule>
	</sch:pattern>
	<sch:pattern id="p-pqrs-2.16.840.1.113883.10.20.24.3.48-errors">
		<sch:rule id="r-pqrs-2.16.840.1.113883.10.20.24.3.48-errors-abstract" abstract="true">
    </sch:rule>
		<sch:rule id="r-pqrs-2.16.840.1.113883.10.20.24.3.48-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.48']]">
			<sch:extends rule="r-pqrs-2.16.840.1.113883.10.20.24.3.48-errors-abstract"/>
		</sch:rule>
	</sch:pattern>
	<sch:pattern id="p-pqrs-2.16.840.1.113883.10.20.24.3.67-errors">
		<sch:rule id="r-pqrs-2.16.840.1.113883.10.20.24.3.67-errors-abstract" abstract="true">
    </sch:rule>
		<sch:rule id="r-pqrs-2.16.840.1.113883.10.20.24.3.67-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.67']]">
			<sch:extends rule="r-pqrs-2.16.840.1.113883.10.20.24.3.67-errors-abstract"/>
		</sch:rule>
	</sch:pattern>
	<sch:pattern id="p-pqrs-2.16.840.1.113883.10.20.22.4.69-errors">
		<!--Pattern is used in an implied relationship.-->
		<sch:rule id="r-pqrs-2.16.840.1.113883.10.20.22.4.69-errors-abstract" abstract="true">
			<sch:assert id="a-14439" test="not(count(cda:code)=1) or (count(cda:code[cda:isValidValueSetForQDMCategory(@sdtc:valueSet, @code, @codeSystem, '2.16.840.1.113883.10.20.24.3.69')])=1)">PQRS_10710: //observation[templateId/@root='2.16.840.1.113883.10.20.24.3.69']/code ValueSet validation failed. The provided code, codeSystem, and valueSet are incompatible.</sch:assert>
			<sch:assert id="a-14445" test="not(count(cda:effectiveTime)=1) or (count(cda:effectiveTime)=1 and cda:isValidEffectiveTime(cda:effectiveTime))">PQRS_10705: //observation[templateId/@root='2.16.840.1.113883.10.20.24.3.69']/effectiveTime Invalid date and/or time format.</sch:assert>
		</sch:rule>
		<sch:rule id="r-pqrs-2.16.840.1.113883.10.20.22.4.69-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.69']]">
			<sch:extends rule="r-pqrs-2.16.840.1.113883.10.20.22.4.69-errors-abstract"/>
		</sch:rule>
	</sch:pattern>
	<sch:pattern id="p-pqrs-2.16.840.1.113883.10.20.24.3.69-errors">
		<sch:rule id="r-pqrs-2.16.840.1.113883.10.20.24.3.69-errors-abstract" abstract="true">
			<sch:assert id="a-14450_P01" test="not(count(cda:value) = 1) or (cda:value[@xsi:type='PQ']  and string-length(cda:value/@value) &gt; 0)">SHALL contain exactly one [1..1] value with xsi:type="PQ" (CONF:14450_P01).</sch:assert>
			<!--<sch:assert id="a-PQRS_P0030" test="not(@negationInd='true') or ((@negationInd='true') and ((count(cda:entryRelationship[@typeCode='RSON'][count(cda:observation[cda:templateId/@root='2.16.840.1.113883.10.20.24.3.88']/cda:value[@xsi:type='CD'])=1])=1) and (cda:validateNegationType(cda:entryRelationship[@typeCode='RSON']/cda:observation[cda:templateId/@root='2.16.840.1.113883.10.20.24.3.88']/cda:value, '2.16.840.1.113883.10.20.24.3.69')))
)">SHALL contain exactly one [1..1] entryRelationship (CONF:PQRS_P0030) such that it SHALL contain exactly one [1..1] @typeCode="RSON" (CodeSystem: HL7ActRelationshipType 2.16.840.1.113883.5.1002 STATIC) (CONF:PQRS_P0031).SHALL contain exactly one [1..1] Reason (identifier: oid:2.16.840.1.113883.10.20.24.3.88) (CONF:PQRS_P0032).</sch:assert>-->
			<sch:assert id="a-PQRS_P0030" test="not(@negationInd='true') or (@negationInd='true' and count(cda:entryRelationship[@typeCode='RSON'][count(cda:observation[cda:templateId/@root='2.16.840.1.113883.10.20.24.3.88']/cda:value[@xsi:type='CD'])=1])=1)">SHALL contain exactly one [1..1] entryRelationship (CONF:PQRS_P0030) such that it SHALL contain exactly one [1..1] @typeCode="RSON" (CodeSystem: HL7ActRelationshipType 2.16.840.1.113883.5.1002 STATIC) (CONF:PQRS_P0031).SHALL contain exactly one [1..1] Reason (identifier: oid:2.16.840.1.113883.10.20.24.3.88) (CONF:PQRS_P0032).</sch:assert>
			<sch:assert id="a-11367-24-3-69" test="not(count(cda:entryRelationship[@typeCode='RSON']/cda:observation[cda:templateId/@root='2.16.840.1.113883.10.20.24.3.88']/cda:value[@xsi:type='CD'])=1) or (count(cda:entryRelationship[@typeCode='RSON']/cda:observation/cda:value[@xsi:type='CD'][cda:isValidValueSetForQDMCategory(@sdtc:valueSet, @code, @codeSystem,'2.16.840.1.113883.10.20.24.3.69')])=1)">PQRS_10710: //observation[templateId/@root='2.16.840.1.113883.10.20.24.3.69']/entryRelationship[@typeCode="RSON"]/observation[templateId/@root='2.16.840.1.113883.10.20.24.3.88']/value[xsi:type="CD"] ValueSet validation failed. The provided code, codeSystem, and valueSet are incompatible.</sch:assert>
			<sch:extends rule="r-pqrs-2.16.840.1.113883.10.20.22.4.69-errors-abstract"/>
		</sch:rule>
		<sch:rule id="r-pqrs-2.16.840.1.113883.10.20.24.3.69-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.69']]">
			<sch:extends rule="r-pqrs-2.16.840.1.113883.10.20.24.3.69-errors-abstract"/>
		</sch:rule>
	</sch:pattern>
	<sch:pattern id="p-pqrs-2.16.840.1.113883.10.20.22.4.79-errors">
		<!--Pattern is used in an implied relationship.-->
		<sch:rule id="r-pqrs-2.16.840.1.113883.10.20.22.4.79-errors-abstract" abstract="true">
			<sch:assert id="a-14874" test="not(cda:effectiveTime[count(cda:low)=1]) or (cda:effectiveTime[count(cda:low)=1] and cda:isValidDate(cda:effectiveTime/cda:low))">PQRS_10705: //observation[templateId/@root='2.16.840.1.113883.10.20.24.3.54']/effectiveTime/low Invalid date and/or time format.</sch:assert>
			<sch:assert id="a-15142" test="not(cda:value[@xsi:type='CD'][@code='419099009']) or (cda:value[@xsi:type='CD'][@code='419099009'][@codeSystem='2.16.840.1.113883.6.96'])">This value SHALL contain exactly one [1..1] @code="419099009" Dead (CodeSystem: SNOMED-CT 2.16.840.1.113883.6.96 STATIC) (CONF:15142).</sch:assert>
		</sch:rule>
		<sch:rule id="r-pqrs-2.16.840.1.113883.10.20.22.4.79-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.79']]">
			<sch:extends rule="r-pqrs-2.16.840.1.113883.10.20.22.4.79-errors-abstract"/>
		</sch:rule>
	</sch:pattern>
	<sch:pattern id="p-pqrs-2.16.840.1.113883.10.20.24.3.54-errors">
		<sch:rule id="r-pqrs-2.16.840.1.113883.10.20.24.3.54-errors-abstract" abstract="true">
			<sch:extends rule="r-pqrs-2.16.840.1.113883.10.20.22.4.79-errors-abstract"/>
		</sch:rule>
		<sch:rule id="r-pqrs-2.16.840.1.113883.10.20.24.3.54-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.54']]">
			<sch:extends rule="r-pqrs-2.16.840.1.113883.10.20.24.3.54-errors-abstract"/>
		</sch:rule>
	</sch:pattern>
	<sch:pattern id="p-pqrs-2.16.840.1.113883.10.20.24.3.51-errors">
		<sch:rule id="r-pqrs-2.16.840.1.113883.10.20.24.3.51-errors-abstract" abstract="true">
			<sch:assert id="a-12536" test="not(count(cda:effectiveTime)=1) or (count(cda:effectiveTime)=1 and cda:isValidEffectiveTime(cda:effectiveTime))">PQRS_10705: //observation[templateId/@root='2.16.840.1.113883.10.20.24.3.51']/effectiveTime Invalid date and/or time format.</sch:assert>
			<sch:assert id="a-16712" test="not(count(cda:value[@xsi:type='CD'])=1) or (count(cda:value[@xsi:type='CD'][cda:isValidValueSetForQDMCategory(@sdtc:valueSet, @code, @codeSystem,'2.16.840.1.113883.10.20.24.3.51')])=1)">PQRS_10710: //observation[templateId/@root='2.16.840.1.113883.10.20.24.3.51']/value[xsi:type="CD"] ValueSet validation failed. The provided code, codeSystem, and valueSet are incompatible.</sch:assert>
			<sch:assert id="a-11367-24-3-51" test="not(count(cda:entryRelationship[@typeCode='RSON']/cda:observation[cda:templateId/@root='2.16.840.1.113883.10.20.24.3.88']/cda:value[@xsi:type='CD'])=1) or (count(cda:entryRelationship[@typeCode='RSON']/cda:observation/cda:value[@xsi:type='CD'][cda:isValidValueSetForQDMCategory(@sdtc:valueSet, @code, @codeSystem,'2.16.840.1.113883.10.20.24.3.51')])=1)">PQRS_10710: //observation[templateId/@root='2.16.840.1.113883.10.20.24.3.51']/entryRelationship[@typeCode="RSON"]/observation[templateId/@root='2.16.840.1.113883.10.20.24.3.88']/value[xsi:type="CD"] ValueSet validation failed. The provided code, codeSystem, and valueSet are incompatible.</sch:assert>
		</sch:rule>
		<sch:rule id="r-pqrs-2.16.840.1.113883.10.20.24.3.51-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.51']]">
			<sch:extends rule="r-pqrs-2.16.840.1.113883.10.20.24.3.51-errors-abstract"/>
		</sch:rule>
	</sch:pattern>
	<sch:pattern id="p-pqrs-2.16.840.1.113883.10.20.24.3.55-errors">
		<sch:rule id="r-pqrs-2.16.840.1.113883.10.20.24.3.55-errors-abstract" abstract="true">
			<sch:assert id="a-16710_P01" test="not(count(cda:value[@xsi:type='CD'])=1) or (count(cda:value[@xsi:type='CD'][cda:isValidValueSetForQDMCategory('2.16.840.1.114222.4.11.3591', @code, @codeSystem,'2.16.840.1.113883.10.20.24.3.55')])=1)">PQRS_10710: //observation[templateId/@root='2.16.840.1.113883.10.20.24.3.55']/value[@xsi:type='CD'] ValueSet validation failed. The provided code, codeSystem, and valueSet are incompatible.</sch:assert>
			<sch:assert id="a-11367-24-3-55" test="not(count(cda:entryRelationship[@typeCode='RSON']/cda:observation[cda:templateId/@root='2.16.840.1.113883.10.20.24.3.88']/cda:value[@xsi:type='CD'])=1) or (count(cda:entryRelationship[@typeCode='RSON']/cda:observation/cda:value[@xsi:type='CD'][cda:isValidValueSetForQDMCategory(@sdtc:valueSet, @code, @codeSystem,'2.16.840.1.113883.10.20.24.3.55')])=1)">PQRS_10710: //observation[templateId/@root='2.16.840.1.113883.10.20.24.3.55']/entryRelationship[@typeCode="RSON"]/observation[templateId/@root='2.16.840.1.113883.10.20.24.3.88']/value[xsi:type="CD"] ValueSet validation failed. The provided code, codeSystem, and valueSet are incompatible.</sch:assert>
		</sch:rule>
		<sch:let name="medicarePayer" value="//cda:observation[cda:templateId/@root='2.16.840.1.113883.10.20.24.3.55']/cda:value/@code"/>
		<sch:rule id="r-pqrs-2.16.840.1.113883.10.20.24.3.55-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.55']]">
			<sch:extends rule="r-pqrs-2.16.840.1.113883.10.20.24.3.55-errors-abstract"/>
		</sch:rule>
	</sch:pattern>
	<sch:pattern id="p-pqrs-2.16.840.1.113883.10.20.24.3.47-errors">
		<sch:rule id="r-pqrs-2.16.840.1.113883.10.20.24.3.47-errors-abstract" abstract="true">
			<!--<sch:assert id="a-PQRS_P0024" test="not(@negationInd='true') or ((@negationInd='true') and ((count(cda:entryRelationship[@typeCode='RSON'][count(cda:observation[cda:templateId/@root='2.16.840.1.113883.10.20.24.3.88']/cda:value[@xsi:type='CD'])=1])=1) and (cda:validateNegationType(cda:entryRelationship[@typeCode='RSON']/cda:observation[cda:templateId/@root='2.16.840.1.113883.10.20.24.3.88']/cda:value, '2.16.840.1.113883.10.20.24.3.47')))
)">SHALL contain exactly one [1..1] entryRelationship (CONF:PQRS_P0024) such that it SHALL contain exactly one [1..1] @typeCode="RSON" (CodeSystem: HL7ActRelationshipType 2.16.840.1.113883.5.1002 STATIC) (CONF:PQRS_P0025).SHALL contain exactly one [1..1] Reason (identifier: oid:2.16.840.1.113883.10.20.24.3.88) (CONF:PQRS_P0026).</sch:assert>-->
			<sch:assert id="a-PQRS_P0024" test="not(@negationInd='true') or (@negationInd='true' and count(cda:entryRelationship[@typeCode='RSON'][count(cda:observation[cda:templateId/@root='2.16.840.1.113883.10.20.24.3.88']/cda:value[@xsi:type='CD'])=1])=1)">SHALL contain exactly one [1..1] entryRelationship (CONF:PQRS_P0024) such that it SHALL contain exactly one [1..1] @typeCode="RSON" (CodeSystem: HL7ActRelationshipType 2.16.840.1.113883.5.1002 STATIC) (CONF:PQRS_P0025).SHALL contain exactly one [1..1] Reason (identifier: oid:2.16.840.1.113883.10.20.24.3.88) (CONF:PQRS_P0026).</sch:assert>
			<sch:assert id="a-11367-24-3-47" test="not(count(cda:entryRelationship[@typeCode='RSON']/cda:observation[cda:templateId/@root='2.16.840.1.113883.10.20.24.3.88']/cda:value[@xsi:type='CD'])=1) or (count(cda:entryRelationship[@typeCode='RSON']/cda:observation/cda:value[@xsi:type='CD'][cda:isValidValueSetForQDMCategory(@sdtc:valueSet, @code, @codeSystem,'2.16.840.1.113883.10.20.24.3.47')])=1)">PQRS_10710: //observation[templateId/@root='2.16.840.1.113883.10.20.24.3.47']/entryRelationship[@typeCode="RSON"]/observation[templateId/@root='2.16.840.1.113883.10.20.24.3.88']/value[xsi:type="CD"] ValueSet validation failed. The provided code, codeSystem, and valueSet are incompatible.</sch:assert>
			<sch:assert id="a-PQRS_P0033" test="(count(cda:author)=1) and (count(cda:author/cda:time)=1)">SHALL contain exactly one [1..1] author (CONF:PQRS_P0033) such that it SHALL contain exactly one [1..1] time (CONF:PQRS_P0034).</sch:assert>
			<sch:assert id="a-PQRS_P0034" test="not((count(cda:author)=1) and (count(cda:author/cda:time)=1)) or cda:isValidDate(cda:author/cda:time)">PQRS_10705: //substanceAdministration[templateId/@root='2.16.840.1.113883.10.20.24.3.47']/author/time Invalid date and/or time format.</sch:assert>
			<sch:extends rule="r-pqrs-2.16.840.1.113883.10.20.22.4.42-errors-abstract"/>
		</sch:rule>
		<sch:rule id="r-pqrs-2.16.840.1.113883.10.20.24.3.47-errors" context="cda:substanceAdministration[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.47']]">
			<sch:extends rule="r-pqrs-2.16.840.1.113883.10.20.24.3.47-errors-abstract"/>
		</sch:rule>
	</sch:pattern>
	<sch:pattern id="p-pqrs-2.16.840.1.113883.10.20.24.3.59-errors">
		<sch:rule id="r-pqrs-2.16.840.1.113883.10.20.24.3.59-errors-abstract" abstract="true">
			<sch:assert id="a-12652" test="not(cda:effectiveTime[count(cda:low)=1]) or (cda:effectiveTime[count(cda:low)=1] and cda:isValidDate(cda:effectiveTime/cda:low))">PQRS_10705: //observation[templateId/@root='2.16.840.1.113883.10.20.24.3.59']/effectiveTime/low Invalid date and/or time format.</sch:assert>
			<sch:assert id="a-12653" test="not(cda:effectiveTime[count(cda:high)=1]) or (cda:effectiveTime[count(cda:high)=1] and cda:isValidDate(cda:effectiveTime/cda:high))">PQRS_10705: //observation[templateId/@root='2.16.840.1.113883.10.20.24.3.59']/effectiveTime/high Invalid date and/or time format.</sch:assert>
			<!--<sch:assert id="a-12656_P01" test="not(@negationInd='true') or (@negationInd='true' and count(cda:entryRelationship[@typeCode='RSON'][count(cda:observation[cda:templateId/@root='2.16.840.1.113883.10.20.24.3.88']/cda:value[@xsi:type='CD'])=1])=1 and cda:validateNegationType(cda:entryRelationship[@typeCode='RSON']/cda:observation[cda:templateId/@root='2.16.840.1.113883.10.20.24.3.88']/cda:value,'2.16.840.1.113883.10.20.24.3.59'))">SHALL contain exactly one [1..1] entryRelationship (CONF:12656_P01) such that it SHALL contain exactly one [1..1] @typeCode="RSON" (CodeSystem: HL7ActRelationshipType 2.16.840.1.113883.5.1002 STATIC) (CONF:12657).SHALL contain exactly one [1..1] Reason (identifier: oid:2.16.840.1.113883.10.20.24.3.88) (CONF:12658).</sch:assert>-->
			<sch:assert id="a-12656_P01" test="not(@negationInd='true') or (@negationInd='true' and count(cda:entryRelationship[@typeCode='RSON'][count(cda:observation[cda:templateId/@root='2.16.840.1.113883.10.20.24.3.88']/cda:value[@xsi:type='CD'])=1])=1)">SHALL contain exactly one [1..1] entryRelationship (CONF:12656_P01) such that it SHALL contain exactly one [1..1] @typeCode="RSON" (CodeSystem: HL7ActRelationshipType 2.16.840.1.113883.5.1002 STATIC) (CONF:12657).SHALL contain exactly one [1..1] Reason (identifier: oid:2.16.840.1.113883.10.20.24.3.88) (CONF:12658).</sch:assert>
			<sch:assert id="a-11367-24-3-59" test="not(count(cda:entryRelationship[@typeCode='RSON']/cda:observation[cda:templateId/@root='2.16.840.1.113883.10.20.24.3.88']/cda:value[@xsi:type='CD'])=1) or (count(cda:entryRelationship[@typeCode='RSON']/cda:observation/cda:value[@xsi:type='CD'][cda:isValidValueSetForQDMCategory(@sdtc:valueSet, @code, @codeSystem,'2.16.840.1.113883.10.20.24.3.59')])=1)">PQRS_10710: //observation[templateId/@root='2.16.840.1.113883.10.20.24.3.59']/entryRelationship[@typeCode="RSON"]/observation[templateId/@root='2.16.840.1.113883.10.20.24.3.88']/value[xsi:type="CD"] ValueSet validation failed. The provided code, codeSystem, and valueSet are incompatible.</sch:assert>
			<sch:assert id="a-19197b" test="not(count(cda:code)=1) or (count(cda:code[cda:isValidValueSetForQDMCategory(@sdtc:valueSet, @code, @codeSystem, '2.16.840.1.113883.10.20.24.3.59')])=1)">PQRS_10710: //observation[templateId/@root='2.16.840.1.113883.10.20.24.3.59']/code ValueSet validation failed. The provided code, codeSystem, and valueSet are incompatible.</sch:assert>
			<sch:extends rule="r-pqrs-2.16.840.1.113883.10.20.22.4.13-errors-abstract"/>
		</sch:rule>
		<sch:rule id="r-pqrs-2.16.840.1.113883.10.20.24.3.59-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.59']]">
			<sch:extends rule="r-pqrs-2.16.840.1.113883.10.20.24.3.59-errors-abstract"/>
		</sch:rule>
	</sch:pattern>
	<sch:pattern id="p-pqrs-2.16.840.1.113883.10.20.24.3.60-errors">
		<sch:rule id="r-pqrs-2.16.840.1.113883.10.20.24.3.60-errors-abstract" abstract="true">
			<sch:extends rule="r-pqrs-2.16.840.1.113883.10.20.22.4.44-errors-abstract"/>
		</sch:rule>
		<sch:rule id="r-pqrs-2.16.840.1.113883.10.20.24.3.60-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.60']]">
			<sch:extends rule="r-pqrs-2.16.840.1.113883.10.20.24.3.60-errors-abstract"/>
		</sch:rule>
	</sch:pattern>
	<sch:pattern id="p-pqrs-2.16.840.1.113883.10.20.24.3.58-errors">
		<sch:rule id="r-pqrs-2.16.840.1.113883.10.20.24.3.58-errors-abstract" abstract="true">
			<sch:extends rule="r-pqrs-2.16.840.1.113883.10.20.22.4.44-errors-abstract"/>
		</sch:rule>
		<sch:rule id="r-pqrs-2.16.840.1.113883.10.20.24.3.58-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.58']]">
			<sch:extends rule="r-pqrs-2.16.840.1.113883.10.20.24.3.58-errors-abstract"/>
		</sch:rule>
	</sch:pattern>
	<sch:pattern id="p-pqrs-2.16.840.1.113883.10.20.24.3.57-errors">
		<sch:rule id="r-pqrs-2.16.840.1.113883.10.20.24.3.57-errors-abstract" abstract="true">
			<sch:assert id="a-7133d" test="not(count(cda:code)=1) or cda:code[cda:isValidValueSetForQDMCategory(@sdtc:valueSet, @code, @codeSystem, '2.16.840.1.113883.10.20.24.3.57')]">PQRS_10710: //observation[templateId[@root='2.16.840.1.113883.10.20.24.3.57']/code ValueSet validation failed. The provided code, codeSystem, and valueSet are incompatible.</sch:assert>
			<sch:assert id="a-16700" test="not(count(cda:value) = 1) or not( cda:value[@xsi:type='PQ'] ) or ((string-length(cda:value/@unit) &gt; 0) and (string-length(cda:value/@value) &gt; 0))">If xsi:type=PQ, then @units shall be drawn from Unified Code for Units of Measure (UCUM) 2.16.840.1.113883.6.8 code system. Additional constraint is dependent on criteria in the corresponding eMeasure (CONF:16700).</sch:assert>
			<sch:assert id="a-16700a" test="not(count(cda:value) = 1) or (cda:value[@xsi:type='PQ']) or (count(cda:value[cda:isValidValueSetForQDMCategory(@sdtc:valueSet, @code, @codeSystem,'2.16.840.1.113883.10.20.24.3.57')])=1)">PQRS_10710: //observation[templateId/@root='2.16.840.1.113883.10.20.24.3.57']/value ValueSet validation failed. The provided code, codeSystem, and valueSet are incompatible.</sch:assert>
			<sch:assert id="a-11367-24-3-57" test="not(count(cda:entryRelationship[@typeCode='RSON']/cda:observation[cda:templateId/@root='2.16.840.1.113883.10.20.24.3.88']/cda:value[@xsi:type='CD'])=1) or (count(cda:entryRelationship[@typeCode='RSON']/cda:observation/cda:value[@xsi:type='CD'][cda:isValidValueSetForQDMCategory(@sdtc:valueSet, @code, @codeSystem,'2.16.840.1.113883.10.20.24.3.57')])=1)">PQRS_10710: //observation[templateId/@root='2.16.840.1.113883.10.20.24.3.57']/entryRelationship[@typeCode="RSON"]/observation[templateId/@root='2.16.840.1.113883.10.20.24.3.88']/value[xsi:type="CD"] ValueSet validation failed. The provided code, codeSystem, and valueSet are incompatible.</sch:assert>
			<sch:extends rule="r-pqrs-2.16.840.1.113883.10.20.22.4.2-errors-abstract"/>
		</sch:rule>
		<sch:rule id="r-pqrs-2.16.840.1.113883.10.20.24.3.57-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.57']]">
			<sch:extends rule="r-pqrs-2.16.840.1.113883.10.20.24.3.57-errors-abstract"/>
		</sch:rule>
	</sch:pattern>
	<sch:pattern id="p-pqrs-2.16.840.1.113883.10.20.24.3.26-errors">
		<sch:rule id="r-pqrs-2.16.840.1.113883.10.20.24.3.26-errors-abstract" abstract="true">
			<sch:extends rule="r-pqrs-2.16.840.1.113883.10.20.22.4.13-errors-abstract"/>
		</sch:rule>
		<sch:rule id="r-pqrs-2.16.840.1.113883.10.20.24.3.26-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.26']]">
			<sch:extends rule="r-pqrs-2.16.840.1.113883.10.20.24.3.26-errors-abstract"/>
		</sch:rule>
	</sch:pattern>
	<sch:pattern id="p-pqrs-2.16.840.1.113883.10.20.24.3.25-errors">
		<sch:rule id="r-pqrs-2.16.840.1.113883.10.20.24.3.25-errors-abstract" abstract="true">
			<sch:extends rule="r-pqrs-2.16.840.1.113883.10.20.22.4.44-errors-abstract"/>
		</sch:rule>
		<sch:rule id="r-pqrs-2.16.840.1.113883.10.20.24.3.25-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.25']]">
			<sch:extends rule="r-pqrs-2.16.840.1.113883.10.20.24.3.25-errors-abstract"/>
		</sch:rule>
	</sch:pattern>
	<sch:pattern id="p-pqrs-2.16.840.1.113883.10.20.24.2.1-errors">
		<sch:rule id="r-pqrs-2.16.840.1.113883.10.20.24.2.1-errors-abstract" abstract="true">
			<sch:assert id="a-CMS_0029" test="count(cda:entry) &gt; 0">SHALL contain at least one [1..*] entry (CONF:CMS_0029)</sch:assert>
			<sch:extends rule="r-pqrs-2.16.840.1.113883.10.20.17.2.4-errors-abstract"/>
		</sch:rule>
		<sch:rule id="r-pqrs-2.16.840.1.113883.10.20.24.2.1-errors" context="cda:section[cda:templateId[@root='2.16.840.1.113883.10.20.24.2.1']]">
			<sch:extends rule="r-pqrs-2.16.840.1.113883.10.20.24.2.1-errors-abstract"/>
		</sch:rule>
		<sch:rule id="r-pqrs-2.16.840.1.113883.10.20.24.2.1-12833-branch-12833-errors-abstract" abstract="true">
    </sch:rule>
		<sch:rule id="r-pqrs-2.16.840.1.113883.10.20.24.2.1-12833-branch-12833-errors" context="cda:section[cda:templateId[@root='2.16.840.1.113883.10.20.24.2.1']]/cda:entry">
			<sch:extends rule="r-pqrs-2.16.840.1.113883.10.20.24.2.1-12833-branch-12833-errors-abstract"/>
		</sch:rule>
	</sch:pattern>
	<sch:pattern id="p-pqrs-2.16.840.1.113883.10.20.24.2.2-errors">
		<sch:rule id="r-pqrs-2.16.840.1.113883.10.20.24.2.2-errors-abstract" abstract="true">
    </sch:rule>
		<sch:rule id="r-pqrs-2.16.840.1.113883.10.20.24.2.2-errors" context="cda:section[cda:templateId[@root='2.16.840.1.113883.10.20.24.2.2']]">
			<sch:extends rule="r-pqrs-2.16.840.1.113883.10.20.24.2.2-errors-abstract"/>
		</sch:rule>
	</sch:pattern>
	<sch:pattern id="p-pqrs-2.16.840.1.113883.10.20.24.2.3-errors">
		<sch:rule id="r-pqrs-2.16.840.1.113883.10.20.24.2.3-errors-abstract" abstract="true">
			<sch:extends rule="r-pqrs-2.16.840.1.113883.10.20.24.2.2-errors-abstract"/>
		</sch:rule>
		<sch:rule id="r-pqrs-2.16.840.1.113883.10.20.24.2.3-errors" context="cda:section[cda:templateId[@root='2.16.840.1.113883.10.20.24.2.3']]">
			<sch:extends rule="r-pqrs-2.16.840.1.113883.10.20.24.2.3-errors-abstract"/>
		</sch:rule>
	</sch:pattern>
	<sch:pattern id="p-pqrs-2.16.840.1.113883.10.20.24.3.98-errors">
		<!--Pattern is used in an implied relationship.-->
		<sch:rule id="r-pqrs-2.16.840.1.113883.10.20.24.3.98-errors-abstract" abstract="true">
    </sch:rule>
		<sch:rule id="r-pqrs-2.16.840.1.113883.10.20.24.3.98-errors" context="cda:organizer[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.98']]">
			<sch:extends rule="r-pqrs-2.16.840.1.113883.10.20.24.3.98-errors-abstract"/>
		</sch:rule>
		<sch:rule id="r-pqrs-2.16.840.1.113883.10.20.24.3.98-12982-branch-12982-errors-abstract" abstract="true">
    </sch:rule>
		<sch:rule id="r-pqrs-2.16.840.1.113883.10.20.24.3.98-12982-branch-12982-errors" context="cda:organizer[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.98']]/cda:reference[@typeCode='REFR'][cda:externalDocument]">
			<sch:extends rule="r-pqrs-2.16.840.1.113883.10.20.24.3.98-12982-branch-12982-errors-abstract"/>
		</sch:rule>
	</sch:pattern>
	<sch:pattern id="p-pqrs-2.16.840.1.113883.10.20.24.3.97-errors">
		<sch:rule id="r-pqrs-2.16.840.1.113883.10.20.24.3.97-errors-abstract" abstract="true">
			<sch:let name="measureID" value="cda:reference[@typeCode='REFR']/cda:externalDocument[@classCode='DOC']/cda:id[@root='2.16.840.1.113883.4.738']/@extension"/>
			<sch:assert id="a-12813-c" test="not (cda:reference[@typeCode='REFR']/cda:externalDocument[@classCode='DOC'][count(cda:id[@root='2.16.840.1.113883.4.738'][@extension])=1]) or (cda:isValidMeasureVersionSpecificID('2015',lower-case($measureID)))">PQRS_10715: //section[templateId/@root= '2.16.840.1.113883.10.20.24.2.3']/entry/ organizer[templateId/@root= '2.16.840.1.113883.10.20.24.3.97']/ reference[@typeCode="REFR"]/external Document[@classCode="DOC"] [@moodCode="EVN"]/id/@extension Invalid eMeasure Version Specific Identifier.</sch:assert>
			<sch:extends rule="r-pqrs-2.16.840.1.113883.10.20.24.3.98-errors-abstract"/>
		</sch:rule>
		<sch:rule id="r-pqrs-2.16.840.1.113883.10.20.24.3.97-errors" context="cda:organizer[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.97']]">
			<sch:extends rule="r-pqrs-2.16.840.1.113883.10.20.24.3.97-errors-abstract"/>
		</sch:rule>
		<sch:rule id="r-pqrs-2.16.840.1.113883.10.20.24.3.97-12808-branch-12808-errors-abstract" abstract="true">
    </sch:rule>
		<sch:rule id="r-pqrs-2.16.840.1.113883.10.20.24.3.97-12808-branch-12808-errors" context="cda:organizer[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.97']]/cda:reference[@typeCode='REFR']">
			<sch:extends rule="r-pqrs-2.16.840.1.113883.10.20.24.3.97-12808-branch-12808-errors-abstract"/>
		</sch:rule>
	</sch:pattern>
	<sch:pattern id="p-pqrs-2.16.840.1.113883.10.20.24.3.27-errors">
		<sch:rule id="r-pqrs-2.16.840.1.113883.10.20.24.3.27-errors-abstract" abstract="true">
			<sch:extends rule="r-pqrs-2.16.840.1.113883.10.20.22.4.44-errors-abstract"/>
		</sch:rule>
		<sch:rule id="r-pqrs-2.16.840.1.113883.10.20.24.3.27-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.27']]">
			<sch:extends rule="r-pqrs-2.16.840.1.113883.10.20.24.3.27-errors-abstract"/>
		</sch:rule>
	</sch:pattern>
	<sch:pattern id="p-pqrs-2.16.840.1.113883.10.20.22.4.67-errors">
		<!--Pattern is used in an implied relationship.-->
		<sch:rule id="r-pqrs-2.16.840.1.113883.10.20.22.4.67-errors-abstract" abstract="true">
			<sch:assert id="a-13930" test="not(count(cda:effectiveTime)=1) or (count(cda:effectiveTime)=1  and cda:isValidEffectiveTime(cda:effectiveTime))">PQRS_10705:  //observation[templateId/@root='2.16.840.1.113883.10.20.24.3.28']/effectiveTime Invalid date and/or time format.</sch:assert>
			<sch:extends rule="r-pqrs-2.16.840.1.113883.10.20.22.4.2-errors-abstract"/>
		</sch:rule>
		<sch:rule id="r-pqrs-2.16.840.1.113883.10.20.22.4.67-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.67']]">
			<sch:extends rule="r-pqrs-2.16.840.1.113883.10.20.22.4.67-errors-abstract"/>
		</sch:rule>
	</sch:pattern>
	<sch:pattern id="p-pqrs-2.16.840.1.113883.10.20.24.3.28-errors">
		<sch:rule id="r-pqrs-2.16.840.1.113883.10.20.24.3.28-errors-abstract" abstract="true">
			<sch:assert id="a-26448" test="not(count(cda:code)=1) or (cda:code[@code and cda:isValidValueSetForQDMCategory(@sdtc:valueSet, @code, @codeSystem, '2.16.840.1.113883.10.20.24.3.28')])">PQRS_10710:  //observation[templateId/@root='2.16.840.1.113883.10.20.24.3.28']/code ValueSet validation failed. The provided code, codeSystem, and valueSet are incompatible.</sch:assert>
			<sch:extends rule="r-pqrs-2.16.840.1.113883.10.20.22.4.67-errors-abstract"/>
		</sch:rule>
		<sch:rule id="r-pqrs-2.16.840.1.113883.10.20.24.3.28-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.28']]">
			<sch:extends rule="r-pqrs-2.16.840.1.113883.10.20.24.3.28-errors-abstract"/>
		</sch:rule>
	</sch:pattern>
	<sch:pattern id="p-pqrs-2.16.840.1.113883.10.20.24.3.77-errors">
		<sch:rule id="r-pqrs-2.16.840.1.113883.10.20.24.3.77-errors-abstract" abstract="true">
			<sch:extends rule="r-pqrs-2.16.840.1.113883.10.20.22.4.4-errors-abstract"/>
		</sch:rule>
		<sch:rule id="r-pqrs-2.16.840.1.113883.10.20.24.3.77-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.77']]">
			<sch:extends rule="r-pqrs-2.16.840.1.113883.10.20.24.3.77-errors-abstract"/>
		</sch:rule>
	</sch:pattern>
	<sch:pattern id="p-pqrs-2.16.840.1.113883.10.20.24.1.1-errors">
		<sch:rule id="r-pqrs-2.16.840.1.113883.10.20.24.1.1-errors-abstract" abstract="true">
			<sch:extends rule="r-pqrs-2.16.840.1.113883.10.20.22.1.1-errors-abstract"/>
		</sch:rule>
		<sch:rule id="r-pqrs-2.16.840.1.113883.10.20.24.1.1-errors" context="cda:ClinicalDocument[cda:templateId[@root='2.16.840.1.113883.10.20.24.1.1']]">
			<sch:extends rule="r-pqrs-2.16.840.1.113883.10.20.24.1.1-errors-abstract"/>
		</sch:rule>
		<sch:rule id="r-pqrs-2.16.840.1.113883.10.20.24.1.1-47522-branch-47522-errors-abstract" abstract="true">
    </sch:rule>
		<sch:rule id="r-pqrs-2.16.840.1.113883.10.20.24.1.1-47522-branch-47522-errors" context="cda:ClinicalDocument[cda:templateId[@root='2.16.840.1.113883.10.20.24.1.1']]/cda:custodian[cda:assignedCustodian][cda:representedCustodianOrganization][cda:id]">
			<sch:extends rule="r-pqrs-2.16.840.1.113883.10.20.24.1.1-47522-branch-47522-errors-abstract"/>
		</sch:rule>
	</sch:pattern>
	<sch:pattern id="p-pqrs-2.16.840.1.113883.10.20.24.3.18-errors">
		<sch:rule id="r-pqrs-2.16.840.1.113883.10.20.24.3.18-errors-abstract" abstract="true">
			<sch:assert id="a-12959" test="not(cda:effectiveTime[count(cda:low)=1]) or (cda:effectiveTime[count(cda:low)=1]  and cda:isValidDate(cda:effectiveTime/cda:low))">PQRS_10705: //observation[templateId/@root='2.16.840.1.113883.10.20.24.3.18']/effectiveTime/low Invalid date and/or time format.</sch:assert>
			<sch:assert id="a-12960" test="not(cda:effectiveTime[count(cda:high)=1]) or (cda:effectiveTime[count(cda:high)=1]  and cda:isValidDate(cda:effectiveTime/cda:high))">PQRS_10705: //observation[templateId/@root='2.16.840.1.113883.10.20.24.3.18']/effectiveTime/high Invalid date and/or time format.</sch:assert>
			<!--<sch:assert id="a-12963_P01" test="not(@negationInd='true') or ((@negationInd='true') and ((count(cda:entryRelationship[@typeCode='RSON'][count(cda:observation[cda:templateId/@root='2.16.840.1.113883.10.20.24.3.88']/cda:value[@xsi:type='CD'])=1])=1) and (cda:validateNegationType(cda:entryRelationship[@typeCode='RSON']/cda:observation[cda:templateId/@root='2.16.840.1.113883.10.20.24.3.88']/cda:value, '2.16.840.1.113883.10.20.24.3.18')))
)">SHALL contain exactly one [1..1] entryRelationship (CONF:12963_P01) such that it SHALL contain exactly one [1..1] @typeCode="RSON" (CodeSystem: HL7ActRelationshipType 2.16.840.1.113883.5.1002 STATIC) (CONF:12964). SHALL contain exactly one [1..1] Reason (identifier: oid:2.16.840.1.113883.10.20.24.3.88) (CONF:12965).</sch:assert>-->
			<sch:assert id="a-12963_P01" test="not(@negationInd='true') or (@negationInd='true' and count(cda:entryRelationship[@typeCode='RSON'][count(cda:observation[cda:templateId/@root='2.16.840.1.113883.10.20.24.3.88']/cda:value[@xsi:type='CD'])=1])=1)">SHALL contain exactly one [1..1] entryRelationship (CONF:12963_P01) such that it SHALL contain exactly one [1..1] @typeCode="RSON" (CodeSystem: HL7ActRelationshipType 2.16.840.1.113883.5.1002 STATIC) (CONF:12964). SHALL contain exactly one [1..1] Reason (identifier: oid:2.16.840.1.113883.10.20.24.3.88) (CONF:12965).</sch:assert>
			<sch:assert id="a-11367-24-3-18" test="not(count(cda:entryRelationship[@typeCode='RSON']/cda:observation[cda:templateId/@root='2.16.840.1.113883.10.20.24.3.88']/cda:value[@xsi:type='CD'])=1) or (count(cda:entryRelationship[@typeCode='RSON']/cda:observation/cda:value[@xsi:type='CD'][cda:isValidValueSetForQDMCategory(@sdtc:valueSet, @code, @codeSystem,'2.16.840.1.113883.10.20.24.3.18')])=1)">PQRS_10710: //observation[templateId/@root='2.16.840.1.113883.10.20.24.3.18']/entryRelationship[@typeCode="RSON"]/observation[templateId/@root='2.16.840.1.113883.10.20.24.3.88']/value[xsi:type="CD"] ValueSet validation failed. The provided code, codeSystem, and valueSet are incompatible.</sch:assert>
			<sch:assert id="a-19197a" test="not(count(cda:code)=1) or (count(cda:code[cda:isValidValueSetForQDMCategory(@sdtc:valueSet, @code, @codeSystem, '2.16.840.1.113883.10.20.24.3.18')])=1)">PQRS_10710: //observation[templateId/@root='2.16.840.1.113883.10.20.24.3.18']/code ValueSet validation failed. The provided code, codeSystem, and valueSet are incompatible.</sch:assert>
			<sch:extends rule="r-pqrs-2.16.840.1.113883.10.20.22.4.13-errors-abstract"/>
		</sch:rule>
		<sch:rule id="r-pqrs-2.16.840.1.113883.10.20.24.3.18-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.18']]">
			<sch:extends rule="r-pqrs-2.16.840.1.113883.10.20.24.3.18-errors-abstract"/>
		</sch:rule>
	</sch:pattern>
	<sch:pattern id="p-pqrs-2.16.840.1.113883.10.20.24.1.2-errors">
		<sch:rule id="r-pqrs-2.16.840.1.113883.10.20.24.1.2-errors-abstract" abstract="true">
			<sch:assert id="a-CMS_0007" test="cda:recordTarget/cda:patientRole[(count(cda:id[@extension][not(@root='2.16.840.1.113883.4.572')]) = 1)]">This patientRole SHALL contain exactly one [1..1] id such that it SHALL contain exactly one [1..1] Patient Identifier Number (CONF:CMS_0007)</sch:assert>
			<sch:assert id="a-CMS_0017" test="count(cda:documentationOf)=1">SHALL contain exactly one [1..1] documentationOf (CONF:CMS_0017)</sch:assert>
			<sch:assert id="a-CMS_0018" test="count(/cda:ClinicalDocument[cda:templateId/@root='2.16.840.1.113883.10.20.24.1.2']/cda:documentationOf/cda:serviceEvent[@classCode='PCPR']/cda:performer[@typeCode='PRF']/cda:assignedEntity/cda:id[@root='2.16.840.1.113883.4.6'])=1">This assignedEntity SHALL contain exactly one [1..1] id (CONF:CMS_0018) such that it SHALL contain exactly one [1..1] @root="2.16.840.1.113883.4.6" National Provider ID (CONF:16588).</sch:assert>
			<sch:assert id="a-CMS_0021" test="count(/cda:ClinicalDocument[cda:templateId/@root='2.16.840.1.113883.10.20.24.1.2']/cda:documentationOf/cda:serviceEvent[@classCode='PCPR']/cda:performer[@typeCode='PRF']/cda:assignedEntity/cda:representedOrganization[count(cda:id[@root='2.16.840.1.113883.4.2'][cda:validateSSN(@extension)])=1]) = 1">PQRS_10707: /ClinicalDocument[templateId/@root= '2.16.840.1.113883.10.20.24.1.3']/ documentationOf/serviceEvent [@classCode="PCPR"]/performer [@typeCode="PRF"]/assignedEntity/ representedOrganization/id [@root='2.16.840.1.113883.4.2']/ Tax Identification Number (TIN) length and/or format validation failed.</sch:assert>
			<sch:assert id="a-CMS_0023" test="count(cda:informationRecipient) = 1">SHALL contain exactly one [1..1] informationRecipient (CONF:CMS_0023).</sch:assert>
			<sch:assert id="a-CMS_0025" test="not(cda:informationRecipient/cda:intendedRecipient) or cda:informationRecipient/cda:intendedRecipient[count(cda:id[@root='2.16.840.1.113883.3.249.7'][@extension])=1]">This intendedRecipient SHALL contain exactly one [1..1] id (CONF:CMS_0024) It SHALL contain exactly one [1..1] @root='2.16.840.1.113883.3.249.7'(CONF:CMS_0025) It SHALL contain exactly one [1..1] @extension, the value of @extension is CMS Program Name, which SHALL be selected from ValueSet QRDA-I CMS Program Name 2.16.840.1.113883.3.249.14.103 STATIC (CONF:CMS_0026).</sch:assert>
			<sch:assert id="a-CMS_0025a" test="not(cda:informationRecipient/cda:intendedRecipient) or not(cda:informationRecipient/cda:intendedRecipient[count(cda:id[@root='2.16.840.1.113883.3.249.7'][@extension])=1]) or cda:informationRecipient/cda:intendedRecipient[count(cda:id[@root='2.16.840.1.113883.3.249.7'][@extension='PQRS_MU_INDIVIDUAL' or @extension='PQRS_MU_GROUP'])=1]">PQRS_10709: /ClinicalDocument/information Recipient/intendedRecipient/id[root= '2.16.840.1.113883.3.249.7']/@extension The CMS Program Name in XML file is not a valid program for PQRS Program.</sch:assert>
			<sch:assert id="a-7291-c" test="cda:recordTarget/cda:patientRole/cda:addr[count(cda:streetAddressLine)&gt;=1] and cda:recordTarget/cda:patientRole/cda:addr[count(cda:streetAddressLine)&lt;=4]">SHALL contain at least one and not more than 4 streetAddressLine (CONF:7291).</sch:assert>
			<sch:assert id="a-7292-c" test="cda:recordTarget/cda:patientRole/cda:addr[count(cda:city)=1]">The content of addr SHALL contain exactly one [1..1] city (CONF:7292).</sch:assert>
			<sch:assert id="a-16581" test="count(cda:documentationOf/cda:serviceEvent[@classCode='PCPR'])=1">SHALL contain exactly one [1..1] serviceEvent (CONF:16580). This serviceEvent SHALL contain exactly one [1..1] @classCode="PCPR" Care Provision (CONF:16581).</sch:assert>
			<sch:assert id="a-16583" test="count(cda:documentationOf/cda:serviceEvent[@classCode='PCPR']/cda:performer) &gt; 0 ">This serviceEvent SHALL contain at least one [1..*] performer (CONF:16583).</sch:assert>
			<sch:assert id="a-16584" test="count(/cda:ClinicalDocument[cda:templateId/@root='2.16.840.1.113883.10.20.24.1.2']/cda:documentationOf/cda:serviceEvent[@classCode='PCPR']/cda:performer[@typeCode='PRF'])=1">Such performers SHALL contain exactly one [1..1] @typeCode="PRF" Performer (CONF:16584).</sch:assert>
			<sch:assert id="a-16586" test="count(/cda:ClinicalDocument[cda:templateId/@root='2.16.840.1.113883.10.20.24.1.2']/cda:documentationOf/cda:serviceEvent[@classCode='PCPR']/cda:performer[@typeCode='PRF']/cda:assignedEntity) = 1">Such performers SHALL contain exactly one [1..1] assignedEntity (CONF:16586).</sch:assert>
			<sch:assert id="a-16588_P01" test="not ($programName= 'PQRS_MU_INDIVIDUAL' or $programName= 'PQRS_MU_GROUP') or ($programName= 'PQRS_MU_INDIVIDUAL' and /cda:ClinicalDocument[cda:templateId/@root='2.16.840.1.113883.10.20.24.1.2']/cda:documentationOf/cda:serviceEvent[@classCode='PCPR']/cda:performer[@typeCode='PRF']/cda:assignedEntity/cda:id[@root='2.16.840.1.113883.4.6'][cda:isValidNPI(@extension)]) or ($programName= 'PQRS_MU_GROUP' and count(/cda:ClinicalDocument[cda:templateId/@root='2.16.840.1.113883.10.20.24.1.2']/cda:documentationOf/cda:serviceEvent[@classCode='PCPR']/cda:performer[@typeCode='PRF']/cda:assignedEntity/cda:id[@root='2.16.840.1.113883.4.6'])=1 and not(/cda:ClinicalDocument[cda:templateId/@root='2.16.840.1.113883.10.20.24.1.2']/cda:documentationOf/cda:serviceEvent[@classCode='PCPR']/cda:performer[@typeCode='PRF']/cda:assignedEntity/cda:id[count(@extension)=1]))">PQRS_10706: /ClinicalDocument[templateId/@root='2.16.840.1.113883.10.20.24.1.3']/documentationOf/serviceEvent[@classCode="PCPR"]/performer[@typeCode="PRF"]/assignedEntity/id When provided the NPI must be in the correct format. A valid NPI is 10 numeric digits where the 10th digit is a check digit computed using the Luhn algorithm. Note: For the Eligible Professional (EP) programs, NPI is required except for the Group Practice Reporting Option (GPRO). For GPRO, id/@root='2.16.840.1.113883.4.6' is coupled with @nullFlavor=&quot;NA&quot;, and @extension SHALL be omitted.</sch:assert>
			<sch:assert id="a-16858-branch-16857-a" test="((count(cda:recordTarget/cda:patientRole/cda:id[cda:validateHIC(@extension)][@root='2.16.840.1.113883.4.572']) = 1) 
and ($medicarePayer ='1' or $medicarePayer ='11' or $medicarePayer ='111' or $medicarePayer ='112' or $medicarePayer ='113' or $medicarePayer ='119' or $medicarePayer ='12' or $medicarePayer ='121' or $medicarePayer ='122' or $medicarePayer ='123' or $medicarePayer ='129' or $medicarePayer ='19') or ((count(cda:recordTarget/cda:patientRole/cda:id[@root='2.16.840.1.113883.4.572']) = 0) and (not($medicarePayer ='1' or $medicarePayer ='11' or $medicarePayer ='111' or $medicarePayer ='112' or $medicarePayer ='113' or $medicarePayer ='119' or $medicarePayer ='12' or $medicarePayer ='121' or $medicarePayer ='122' or $medicarePayer ='123' or $medicarePayer ='129' or $medicarePayer ='19'))))">PQRS_10716: /ClinicalDocument/record Target/patientRole/id [@root='2.16.840.1.113883.4.572'] For PQRS the HIC number, in a valid format, is required for Medicare patients. The HIC number is not allowed for non-Medicare patients.</sch:assert>
			<sch:extends rule="r-pqrs-2.16.840.1.113883.10.20.24.1.1-errors-abstract"/>
		</sch:rule>
		<sch:let name="programName" value="cda:ClinicalDocument[cda:templateId/@root='2.16.840.1.113883.10.20.24.1.2']/cda:informationRecipient/cda:intendedRecipient/cda:id/@extension"/>
		<sch:rule id="r-pqrs-2.16.840.1.113883.10.20.24.1.2-errors" context="cda:ClinicalDocument[cda:templateId[@root='2.16.840.1.113883.10.20.24.1.2']]">
			<sch:extends rule="r-pqrs-2.16.840.1.113883.10.20.24.1.2-errors-abstract"/>
		</sch:rule>
	</sch:pattern>
	<sch:pattern id="p-pqrs-2.16.840.1.113883.10.20.24.3.81-errors">
		<sch:rule id="r-pqrs-2.16.840.1.113883.10.20.24.3.81-errors-abstract" abstract="true">
    </sch:rule>
		<sch:rule id="r-pqrs-2.16.840.1.113883.10.20.24.3.81-errors" context="cda:participant[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.81']]">
			<sch:extends rule="r-pqrs-2.16.840.1.113883.10.20.24.3.81-errors-abstract"/>
		</sch:rule>
	</sch:pattern>
	<sch:pattern id="p-pqrs-2.16.840.1.113883.10.20.24.3.100-errors">
		<sch:rule id="r-pqrs-2.16.840.1.113883.10.20.24.3.100-errors-abstract" abstract="true">
			<sch:assert id="a-13378" test="not(cda:participantRole[count(cda:code)=1]) or (cda:participantRole[count(cda:code[cda:isValidValueSetForQDMCategory(@sdtc:valueSet, @code, @codeSystem, '2.16.840.1.113883.10.20.24.3.100')])=1])">PQRS_10710: //Participant[templateId/@root='2.16.840.1.113883.10.20.24.3.100']/ParticipantRole[@classCode="SDLOC"]/code ValueSet validation failed. The provided code, codeSystem, and valueSet are incompatible.</sch:assert>
			<sch:assert id="a-13384" test="not(cda:time[count(cda:low)=1]) or (cda:time[count(cda:low)=1] and cda:isValidDate(cda:time/cda:low))">PQRS_10705: //Participant[templateId/@root='2.16.840.1.113883.10.20.24.3.100'][@typeCode="LOC"]/time/low Invalid date and/or time format.</sch:assert>
			<sch:assert id="a-13385" test="not(cda:time[count(cda:high)=1]) or (cda:time[count(cda:high)=1] and cda:isValidDate(cda:time/cda:high))">PQRS_10705: //Participant[templateId/@root='2.16.840.1.113883.10.20.24.3.100'][@typeCode="LOC"]/time/high Invalid date and/or time format.</sch:assert>
		</sch:rule>
		<sch:rule id="r-pqrs-2.16.840.1.113883.10.20.24.3.100-errors" context="cda:participant[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.100']]">
			<sch:extends rule="r-pqrs-2.16.840.1.113883.10.20.24.3.100-errors-abstract"/>
		</sch:rule>
	</sch:pattern>
	<sch:pattern id="p-pqrs-2.16.840.1.113883.10.20.24.3.19-errors">
		<sch:rule id="r-pqrs-2.16.840.1.113883.10.20.24.3.19-errors-abstract" abstract="true">
			<sch:extends rule="r-pqrs-2.16.840.1.113883.10.20.22.4.44-errors-abstract"/>
		</sch:rule>
		<sch:rule id="r-pqrs-2.16.840.1.113883.10.20.24.3.19-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.19']]">
			<sch:extends rule="r-pqrs-2.16.840.1.113883.10.20.24.3.19-errors-abstract"/>
		</sch:rule>
	</sch:pattern>
	<sch:pattern id="p-pqrs-2.16.840.1.113883.10.20.24.3.17-errors">
		<sch:rule id="r-pqrs-2.16.840.1.113883.10.20.24.3.17-errors-abstract" abstract="true">
			<sch:assert id="a-11367-24-3-17" test="not(count(cda:entryRelationship[@typeCode='RSON']/cda:observation[cda:templateId/@root='2.16.840.1.113883.10.20.24.3.88']/cda:value[@xsi:type='CD'])=1) or (count(cda:entryRelationship[@typeCode='RSON']/cda:observation/cda:value[@xsi:type='CD'][cda:isValidValueSetForQDMCategory(@sdtc:valueSet, @code, @codeSystem,'2.16.840.1.113883.10.20.24.3.17')])=1)">PQRS_10710: //observation[templateId/@root='2.16.840.1.113883.10.20.24.3.17']/entryRelationship[@typeCode="RSON"]/observation[templateId/@root='2.16.840.1.113883.10.20.24.3.88']/value[xsi:type="CD"] ValueSet validation failed. The provided code, codeSystem, and valueSet are incompatible.</sch:assert>
			<sch:assert id="a-13415" test="not(count(cda:code)=1) or (count(cda:code[cda:isValidValueSetForQDMCategory(@sdtc:valueSet, @code, @codeSystem,'2.16.840.1.113883.10.20.24.3.17')])=1)">PQRS_10710: //observation[templateId/@root='2.16.840.1.113883.10.20.24.3.17']/code ValueSet validation failed. The provided code, codeSystem, and valueSet are incompatible.</sch:assert>
			<sch:assert id="a-13419" test="not(count(cda:author[count(cda:time)=1])=1) or (count(cda:author[count(cda:time)=1])=1 and cda:isValidDate(cda:author/cda:time))">PQRS_10705: //observation[templateId/@root='2.16.840.1.113883.10.20.24.3.17']/author/time Invalid date and/or time format.</sch:assert>
			<sch:extends rule="r-pqrs-2.16.840.1.113883.10.20.22.4.44-errors-abstract"/>
		</sch:rule>
		<sch:rule id="r-pqrs-2.16.840.1.113883.10.20.24.3.17-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.17']]">
			<sch:extends rule="r-pqrs-2.16.840.1.113883.10.20.24.3.17-errors-abstract"/>
		</sch:rule>
	</sch:pattern>
	<sch:pattern id="p-pqrs-2.16.840.1.113883.10.20.24.3.29-errors">
		<sch:rule id="r-pqrs-2.16.840.1.113883.10.20.24.3.29-errors-abstract" abstract="true">
			<sch:extends rule="r-pqrs-2.16.840.1.113883.10.20.24.3.104-errors-abstract"/>
		</sch:rule>
		<sch:rule id="r-pqrs-2.16.840.1.113883.10.20.24.3.29-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.29']]">
			<sch:extends rule="r-pqrs-2.16.840.1.113883.10.20.24.3.29-errors-abstract"/>
		</sch:rule>
	</sch:pattern>
	<sch:pattern id="p-pqrs-2.16.840.1.113883.10.20.24.3.32-errors">
		<sch:rule id="r-pqrs-2.16.840.1.113883.10.20.24.3.32-errors-abstract" abstract="true">
			<sch:assert id="a-13594" test="not(count(cda:code)=1) or (count(cda:code[cda:isValidValueSetForQDMCategory(@sdtc:valueSet, @code, @codeSystem,'2.16.840.1.113883.10.20.24.3.32')])=1)">PQRS_10710: //act[templateId/@root='2.16.840.1.113883.10.20.24.3.32']/code ValueSet validation failed. The provided code, codeSystem, and valueSet are incompatible.</sch:assert>
			<!--<sch:assert id="a-13604_P01" test="not(@negationInd='true') or (@negationInd='true' and count(cda:entryRelationship[@typeCode='RSON'][count(cda:observation[cda:templateId/@root='2.16.840.1.113883.10.20.24.3.88']/cda:value[@xsi:type='CD'])=1])=1 and cda:validateNegationType(cda:entryRelationship[@typeCode='RSON']/cda:observation[cda:templateId/@root='2.16.840.1.113883.10.20.24.3.88']/cda:value,'2.16.840.1.113883.10.20.24.3.32'))">SHALL contain exactly one [1..1] entryRelationship (CONF:13604_P01) such that it SHALL contain exactly one [1..1] @typeCode="RSON" (CodeSystem: HL7ActRelationshipType 2.16.840.1.113883.5.1002 STATIC) (CONF:13605).SHALL contain exactly one [1..1] Reason (identifier: oid:2.16.840.1.113883.10.20.24.3.88) (CONF:13606).</sch:assert>-->
			<sch:assert id="a-13604_P01" test="not(@negationInd='true') or (@negationInd='true' and count(cda:entryRelationship[@typeCode='RSON'][count(cda:observation[cda:templateId/@root='2.16.840.1.113883.10.20.24.3.88']/cda:value[@xsi:type='CD'])=1])=1)">SHALL contain exactly one [1..1] entryRelationship (CONF:13604_P01) such that it SHALL contain exactly one [1..1] @typeCode="RSON" (CodeSystem: HL7ActRelationshipType 2.16.840.1.113883.5.1002 STATIC) (CONF:13605).SHALL contain exactly one [1..1] Reason (identifier: oid:2.16.840.1.113883.10.20.24.3.88) (CONF:13606).</sch:assert>
			<sch:assert id="a-11367-24-3-32" test="not(count(cda:entryRelationship[@typeCode='RSON']/cda:observation[cda:templateId/@root='2.16.840.1.113883.10.20.24.3.88']/cda:value[@xsi:type='CD'])=1) or (count(cda:entryRelationship[@typeCode='RSON']/cda:observation/cda:value[@xsi:type='CD'][cda:isValidValueSetForQDMCategory(@sdtc:valueSet, @code, @codeSystem,'2.16.840.1.113883.10.20.24.3.32')])=1)">PQRS_10710: //observation[templateId/@root='2.16.840.1.113883.10.20.24.3.32']/entryRelationship[@typeCode="RSON"]/observation[templateId/@root='2.16.840.1.113883.10.20.24.3.88']/value[xsi:type="CD"] ValueSet validation failed. The provided code, codeSystem, and valueSet are incompatible.</sch:assert>
			<sch:assert id="a-13612" test="not(cda:effectiveTime[count(cda:low)=1]) or (cda:effectiveTime[count(cda:low)=1]  and cda:isValidDate(cda:effectiveTime/cda:low))">PQRS_10705: //act[templateId/@root='2.16.840.1.113883.10.20.24.3.32']/effectiveTime/low Invalid date and/or time format.</sch:assert>
			<sch:assert id="a-13613" test="not(cda:effectiveTime[count(cda:high)=1]) or (cda:effectiveTime[count(cda:high)=1]  and cda:isValidDate(cda:effectiveTime/cda:high))">PQRS_10705: //act[templateId/@root='2.16.840.1.113883.10.20.24.3.32']/effectiveTime/high Invalid date and/or time format.</sch:assert>
			<sch:extends rule="r-pqrs-2.16.840.1.113883.10.20.22.4.12-errors-abstract"/>
		</sch:rule>
		<sch:rule id="r-pqrs-2.16.840.1.113883.10.20.24.3.32-errors" context="cda:act[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.32']]">
			<sch:extends rule="r-pqrs-2.16.840.1.113883.10.20.24.3.32-errors-abstract"/>
		</sch:rule>
	</sch:pattern>
	<sch:pattern id="p-pqrs-2.16.840.1.113883.10.20.24.3.30-errors">
		<sch:rule id="r-pqrs-2.16.840.1.113883.10.20.24.3.30-errors-abstract" abstract="true">
			<sch:extends rule="r-pqrs-2.16.840.1.113883.10.20.24.3.104-errors-abstract"/>
		</sch:rule>
		<sch:rule id="r-pqrs-2.16.840.1.113883.10.20.24.3.30-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.30']]">
			<sch:extends rule="r-pqrs-2.16.840.1.113883.10.20.24.3.30-errors-abstract"/>
		</sch:rule>
	</sch:pattern>
	<sch:pattern id="p-pqrs-2.16.840.1.113883.10.20.24.3.34-errors">
		<sch:rule id="r-pqrs-2.16.840.1.113883.10.20.24.3.34-errors-abstract" abstract="true">
			<sch:extends rule="r-pqrs-2.16.840.1.113883.10.20.22.4.12-errors-abstract"/>
		</sch:rule>
		<sch:rule id="r-pqrs-2.16.840.1.113883.10.20.24.3.34-errors" context="cda:act[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.34']]">
			<sch:extends rule="r-pqrs-2.16.840.1.113883.10.20.24.3.34-errors-abstract"/>
		</sch:rule>
	</sch:pattern>
	<sch:pattern id="p-pqrs-2.16.840.1.113883.10.20.24.3.31-errors">
		<sch:rule id="r-pqrs-2.16.840.1.113883.10.20.24.3.31-errors-abstract" abstract="true">
			<sch:assert id="a-PQRS_P0006" test="count(cda:statusCode)=1">SHALL contain exactly one [1..1] statusCode (CONF:PQRS_P0006).</sch:assert>
			<sch:assert id="a-PQRS_P0016" test="count(cda:statusCode[@code='new'])=1">This statusCode SHALL contain exactly one [1..1] @code="new" (CodeSystem: ActStatus 2.16.840.1.113883.5.14 STATIC) (CONF:PQRS_P0016).</sch:assert>
			<sch:assert id="a-13746" test="not(count(cda:code)=1) or (count(cda:code[cda:isValidValueSetForQDMCategory(@sdtc:valueSet, @code, @codeSystem,'2.16.840.1.113883.10.20.24.3.31')])=1)">PQRS_10710:  //act[templateId/@root='2.16.840.1.113883.10.20.24.3.31']/code ValueSet validation failed. The provided code, codeSystem, and valueSet are incompatible.</sch:assert>
			<sch:assert id="a-13748" test="not(cda:author[count(cda:time)=1]) or (cda:author[count(cda:time)=1] and  cda:isValidDate(cda:author/cda:time))">PQRS_10705: //act[templateId/@root='2.16.840.1.113883.10.20.24.3.31']/author/time Invalid date and/or time format.</sch:assert>
			<sch:extends rule="r-pqrs-2.16.840.1.113883.10.20.22.4.39-errors-abstract"/>
		</sch:rule>
		<sch:rule id="r-pqrs-2.16.840.1.113883.10.20.24.3.31-errors" context="cda:act[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.31']]">
			<sch:extends rule="r-pqrs-2.16.840.1.113883.10.20.24.3.31-errors-abstract"/>
		</sch:rule>
	</sch:pattern>
	<sch:pattern id="p-pqrs-2.16.840.1.113883.10.20.24.3.75-errors">
		<sch:rule id="r-pqrs-2.16.840.1.113883.10.20.24.3.75-errors-abstract" abstract="true">
			<sch:extends rule="r-pqrs-2.16.840.1.113883.10.20.22.4.42-errors-abstract"/>
		</sch:rule>
		<sch:rule id="r-pqrs-2.16.840.1.113883.10.20.24.3.75-errors" context="cda:substanceAdministration[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.75']]">
			<sch:extends rule="r-pqrs-2.16.840.1.113883.10.20.24.3.75-errors-abstract"/>
		</sch:rule>
	</sch:pattern>
	<sch:pattern id="p-pqrs-2.16.840.1.113883.10.20.24.3.33-errors">
		<sch:rule id="r-pqrs-2.16.840.1.113883.10.20.24.3.33-errors-abstract" abstract="true">
			<sch:extends rule="r-pqrs-2.16.840.1.113883.10.20.22.4.39-errors-abstract"/>
		</sch:rule>
		<sch:rule id="r-pqrs-2.16.840.1.113883.10.20.24.3.33-errors" context="cda:act[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.33']]">
			<sch:extends rule="r-pqrs-2.16.840.1.113883.10.20.24.3.33-errors-abstract"/>
		</sch:rule>
	</sch:pattern>
	<sch:pattern id="p-pqrs-2.16.840.1.113883.10.20.24.3.20-errors">
		<sch:rule id="r-pqrs-2.16.840.1.113883.10.20.24.3.20-errors-abstract" abstract="true">
			<sch:assert id="a-7133a" test="not(count(cda:code)=1) or cda:code[cda:isValidValueSetForQDMCategory(@sdtc:valueSet, @code, @codeSystem, '2.16.840.1.113883.10.20.24.3.20')]">PQRS_10710: //observation[templateId[@root='2.16.840.1.113883.10.20.24.3.20']/code ValueSet validation failed. The provided code, codeSystem, and valueSet are incompatible.</sch:assert>
			<sch:assert id="a-16695" test="not(count(cda:value)=1) or (count(cda:value[cda:isValidValueSetForQDMCategory(@sdtc:valueSet, @code, @codeSystem,'2.16.840.1.113883.10.20.24.3.20')])=1)">PQRS_10710: //observation[templateId/@root='2.16.840.1.113883.10.20.24.3.20']/value[@xsi:type='CD'] ValueSet validation failed. The provided code, codeSystem, and valueSet are incompatible.</sch:assert>
			<sch:assert id="a-13804_P01" test="not(@negationInd='true') or (@negationInd='true' 
	     and
	    count(cda:entryRelationship[@typeCode='RSON']
	    [count(cda:observation[cda:templateId/@root='2.16.840.1.113883.10.20.24.3.88']/cda:value[@xsi:type='CD'])=1])=1)">SHALL contain exactly one [1..1] entryRelationship (CONF:13804_P01) such that it SHALL contain exactly one [1..1] @typeCode="RSON" (CodeSystem: HL7ActRelationshipType 2.16.840.1.113883.5.1002 STATIC) (CONF:13805).SHALL contain exactly one [1..1] Reason (identifier: oid:2.16.840.1.113883.10.20.24.3.88) (CONF:13806).</sch:assert>
			<sch:assert id="a-11367-24.3.20" test="not(count(cda:entryRelationship[@typeCode='RSON']/cda:observation/cda:value[@xsi:type='CD'])=1) or (count(cda:entryRelationship[@typeCode='RSON']/cda:observation/cda:value[@xsi:type='CD'][cda:isValidValueSetForQDMCategory(@sdtc:valueSet, @code, @codeSystem,'2.16.840.1.113883.10.20.24.3.20')])=1)">PQRS_10710: //observation[templateId/@root='2.16.840.1.113883.10.20.24.3.20']/entryRelationship[@typeCode="RSON"]/observation[templateId/@root='2.16.840.1.113883.10.20.24.3.88']/value[xsi:type="CD"] ValueSet validation failed. The provided code, codeSystem, and valueSet are incompatible.</sch:assert>
			<sch:extends rule="r-pqrs-2.16.840.1.113883.10.20.22.4.2-errors-abstract"/>
		</sch:rule>
		<sch:rule id="r-pqrs-2.16.840.1.113883.10.20.24.3.20-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.20']]">
			<sch:extends rule="r-pqrs-2.16.840.1.113883.10.20.24.3.20-errors-abstract"/>
		</sch:rule>
	</sch:pattern>
	<sch:pattern id="p-pqrs-2.16.840.1.113883.10.20.24.3.99-errors">
		<sch:rule id="r-pqrs-2.16.840.1.113883.10.20.24.3.99-errors-abstract" abstract="true">
			<sch:extends rule="r-pqrs-2.16.840.1.113883.10.20.22.4.43-errors-abstract"/>
		</sch:rule>
		<sch:rule id="r-pqrs-2.16.840.1.113883.10.20.24.3.99-errors" context="cda:supply[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.99']]">
			<sch:extends rule="r-pqrs-2.16.840.1.113883.10.20.24.3.99-errors-abstract"/>
		</sch:rule>
	</sch:pattern>
	<sch:pattern id="p-pqrs-2.16.840.1.113883.10.20.24.3.45-errors">
		<sch:rule id="r-pqrs-2.16.840.1.113883.10.20.24.3.45-errors-abstract" abstract="true">
			<sch:assert id="a-13856" test="not(count(cda:effectiveTime[@xsi:type='IVL_TS'])=1) or (count(cda:effectiveTime[@xsi:type='IVL_TS'])=1  and cda:isValidEffectiveTime(cda:effectiveTime))">PQRS_10705: //supply[templateId/@root='2.16.840.1.113883.10.20.24.3.45']/effectiveTime Invalid date and/or time format.</sch:assert>
			<sch:extends rule="r-pqrs-2.16.840.1.113883.10.20.22.4.18-errors-abstract"/>
		</sch:rule>
		<sch:rule id="r-pqrs-2.16.840.1.113883.10.20.24.3.45-errors" context="cda:supply[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.45']]">
			<sch:extends rule="r-pqrs-2.16.840.1.113883.10.20.24.3.45-errors-abstract"/>
		</sch:rule>
	</sch:pattern>
	<sch:pattern id="p-pqrs-2.16.840.1.113883.10.20.24.3.36-errors">
		<sch:rule id="r-pqrs-2.16.840.1.113883.10.20.24.3.36-errors-abstract" abstract="true">
			<sch:extends rule="r-pqrs-2.16.840.1.113883.10.20.24.3.104-errors-abstract"/>
		</sch:rule>
		<sch:rule id="r-pqrs-2.16.840.1.113883.10.20.24.3.36-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.36']]">
			<sch:extends rule="r-pqrs-2.16.840.1.113883.10.20.24.3.36-errors-abstract"/>
		</sch:rule>
	</sch:pattern>
	<sch:pattern id="p-pqrs-2.16.840.1.113883.10.20.24.3.35-errors">
		<sch:rule id="r-pqrs-2.16.840.1.113883.10.20.24.3.35-errors-abstract" abstract="true">
			<sch:extends rule="r-pqrs-2.16.840.1.113883.10.20.24.3.104-errors-abstract"/>
		</sch:rule>
		<sch:rule id="r-pqrs-2.16.840.1.113883.10.20.24.3.35-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.35']]">
			<sch:extends rule="r-pqrs-2.16.840.1.113883.10.20.24.3.35-errors-abstract"/>
		</sch:rule>
	</sch:pattern>
	<sch:pattern id="p-pqrs-2.16.840.1.113883.10.20.24.3.46-errors">
		<sch:rule id="r-pqrs-2.16.840.1.113883.10.20.24.3.46-errors-abstract" abstract="true">
			<sch:assert id="a-11367-24-3-46" test="not(count(cda:entryRelationship[@typeCode='RSON']/cda:observation[cda:templateId/@root='2.16.840.1.113883.10.20.24.3.88']/cda:value[@xsi:type='CD'])=1) or (count(cda:entryRelationship[@typeCode='RSON']/cda:observation/cda:value[@xsi:type='CD'][cda:isValidValueSetForQDMCategory(@sdtc:valueSet, @code, @codeSystem,'2.16.840.1.113883.10.20.24.3.46')])=1)">PQRS_10710: //procedure[templateId/@root='2.16.840.1.113883.10.20.24.3.46']/entryRelationship[@typeCode="RSON"]/observation[templateId/@root='2.16.840.1.113883.10.20.24.3.88']/value[xsi:type="CD"] ValueSet validation failed. The provided code, codeSystem, and valueSet are incompatible.</sch:assert>
			<sch:assert id="a-14092" test="not(count(cda:effectiveTime)=1) or (count(cda:effectiveTime)=1 and cda:isValidEffectiveTime(cda:effectiveTime))">PQRS_10705: //observation[templateId[@root='2.16.840.1.113883.10.20.24.3.46']]/effectiveTime Invalid date and/or time format.</sch:assert>
			<sch:assert id="a-14099" test="not(cda:participant/cda:participantRole/cda:playingEntity[count(cda:code)=1]) or (cda:participant/cda:participantRole/cda:playingEntity[count(cda:code[cda:isValidValueSetForQDMCategory(@sdtc:valueSet, @code, @codeSystem,'2.16.840.1.113883.10.20.24.3.46')])=1])">PQRS_10710: //observation[templateId[@root='2.16.840.1.113883.10.20.24.3.46']]/participant/participantRole/playingEntity/code ValueSet validation failed. The provided code, codeSystem, and valueSet are incompatible.</sch:assert>
			<sch:extends rule="r-pqrs-2.16.840.1.113883.10.20.22.4.7-errors-abstract"/>
		</sch:rule>
		<sch:rule id="r-pqrs-2.16.840.1.113883.10.20.24.3.46-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.46']]">
			<sch:extends rule="r-pqrs-2.16.840.1.113883.10.20.24.3.46-errors-abstract"/>
		</sch:rule>
	</sch:pattern>
	<sch:pattern id="p-pqrs-2.16.840.1.113883.10.20.24.3.43-errors">
		<sch:rule id="r-pqrs-2.16.840.1.113883.10.20.24.3.43-errors-abstract" abstract="true">
			<sch:extends rule="r-pqrs-2.16.840.1.113883.10.20.22.4.7-errors-abstract"/>
		</sch:rule>
		<sch:rule id="r-pqrs-2.16.840.1.113883.10.20.24.3.43-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.43']]">
			<sch:extends rule="r-pqrs-2.16.840.1.113883.10.20.24.3.43-errors-abstract"/>
		</sch:rule>
	</sch:pattern>
	<sch:pattern id="p-pqrs-2.16.840.1.113883.10.20.24.3.44-errors">
		<sch:rule id="r-pqrs-2.16.840.1.113883.10.20.24.3.44-errors-abstract" abstract="true">
			<sch:assert id="a-11367-24-3-44" test="not(count(cda:entryRelationship[@typeCode='RSON']/cda:observation[cda:templateId/@root='2.16.840.1.113883.10.20.24.3.88']/cda:value[@xsi:type='CD'])=1) or (count(cda:entryRelationship[@typeCode='RSON']/cda:observation/cda:value[@xsi:type='CD'][cda:isValidValueSetForQDMCategory(@sdtc:valueSet, @code, @codeSystem,'2.16.840.1.113883.10.20.24.3.44')])=1)">PQRS_10710: //observation[templateId/@root='2.16.840.1.113883.10.20.24.3.44']/entryRelationship[@typeCode="RSON"]/observation[templateId/@root='2.16.840.1.113883.10.20.24.3.88']/value[xsi:type="CD"] ValueSet validation failed. The provided code, codeSystem, and valueSet are incompatible.</sch:assert>
			<sch:assert id="a-14142" test="not(count(cda:effectiveTime)=1) or (count(cda:effectiveTime)=1 and cda:isValidEffectiveTime(cda:effectiveTime))">PQRS_10705: //observation[templateId/@root='2.16.840.1.113883.10.20.24.3.44']/effectiveTime - Invalid date and/or time format.</sch:assert>
			<sch:assert id="a-14148" test="not(cda:participant/cda:participantRole/cda:playingEntity[count(cda:code)=1]) or (cda:participant/cda:participantRole/cda:playingEntity[count(cda:code[cda:isValidValueSetForQDMCategory(@sdtc:valueSet, @code, @codeSystem,'2.16.840.1.113883.10.20.24.3.44')])=1])">PQRS_10710: //observation[templateId/@root='2.16.840.1.113883.10.20.24.3.44']/participant/
participantRole/playingEntity/code - ValueSet validation failed. The provided code, codeSystem, and valueSet are incompatible.</sch:assert>
			<sch:extends rule="r-pqrs-2.16.840.1.113883.10.20.22.4.7-errors-abstract"/>
		</sch:rule>
		<sch:rule id="r-pqrs-2.16.840.1.113883.10.20.24.3.44-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.44']]">
			<sch:extends rule="r-pqrs-2.16.840.1.113883.10.20.24.3.44-errors-abstract"/>
		</sch:rule>
	</sch:pattern>
	<sch:pattern id="p-pqrs-2.16.840.1.113883.10.20.24.3.12-errors">
		<sch:rule id="r-pqrs-2.16.840.1.113883.10.20.24.3.12-errors-abstract" abstract="true">
			<sch:assert id="a-14178" test="not(count(cda:effectiveTime)=1) or (count(cda:effectiveTime)=1 and cda:isValidEffectiveTime(cda:effectiveTime))">PQRS_10705: //organizer[templateId/@root='2.16.840.1.113883.10.20.24.3.12']/effectiveTime Invalid date and/or time format.</sch:assert>
			<sch:assert id="a-15247" test="not(cda:subject/cda:relatedSubject/cda:code[@code]) or (cda:subject/cda:relatedSubject/cda:code[cda:isVOCCodeValid(@sdtc:valueSet, @code, @codeSystem)])">PQRS_10710: //organizer[templateId/@root='2.16.840.1.113883.10.20.24.3.12']/subject/relatedSubject/code ValueSet validation failed. The provided code, codeSystem, and valueSet are incompatible.</sch:assert>
			<sch:assert id="a-15975_01" test="not(cda:subject/cda:relatedSubject/cda:subject/cda:administrativeGenderCode) or cda:subject/cda:relatedSubject/cda:subject/cda:administrativeGenderCode[@code and (cda:isVOCCodeValid('2.16.840.1.113883.1.11.1', @code, '2.16.840.1.113883.5.1') or cda:isValidValueSetForQDMCategory('2.16.840.1.113762.1.4.1', @code, '2.16.840.1.113883.18.2', '2.16.840.1.113883.10.20.24.3.12'))]">PQRS_10710: //organizer[templateId/@root='2.16.840.1.113883.10.20.24.3.12']/subject/relatedSubject/subject/administrativeGenderCode ValueSet validation failed. The provided code, codeSystem, and valueSet are incompatible.</sch:assert>
			<sch:extends rule="r-pqrs-2.16.840.1.113883.10.20.22.4.45-errors-abstract"/>
		</sch:rule>
		<sch:rule id="r-pqrs-2.16.840.1.113883.10.20.24.3.12-errors" context="cda:organizer[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.12']]">
			<sch:extends rule="r-pqrs-2.16.840.1.113883.10.20.24.3.12-errors-abstract"/>
		</sch:rule>
	</sch:pattern>
	<sch:pattern id="p-pqrs-2.16.840.1.113883.10.20.22.4.72-errors">
		<sch:rule id="r-pqrs-2.16.840.1.113883.10.20.22.4.72-errors-abstract" abstract="true">
    </sch:rule>
		<sch:rule id="r-pqrs-2.16.840.1.113883.10.20.22.4.72-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.72']]">
			<sch:extends rule="r-pqrs-2.16.840.1.113883.10.20.22.4.72-errors-abstract"/>
		</sch:rule>
	</sch:pattern>
	<sch:pattern id="p-pqrs-2.16.840.1.113883.10.20.22.4.80-errors">
		<sch:rule id="r-pqrs-2.16.840.1.113883.10.20.22.4.80-errors-abstract" abstract="true">
    </sch:rule>
		<sch:rule id="r-pqrs-2.16.840.1.113883.10.20.22.4.80-errors" context="cda:act[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.80']]">
			<sch:extends rule="r-pqrs-2.16.840.1.113883.10.20.22.4.80-errors-abstract"/>
		</sch:rule>
	</sch:pattern>
	<sch:pattern id="p-pqrs-2.16.840.1.113883.10.20.24.3.102-errors">
		<sch:rule id="r-pqrs-2.16.840.1.113883.10.20.24.3.102-errors-abstract" abstract="true">
    </sch:rule>
		<sch:rule id="r-pqrs-2.16.840.1.113883.10.20.24.3.102-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.102']]">
			<sch:extends rule="r-pqrs-2.16.840.1.113883.10.20.24.3.102-errors-abstract"/>
		</sch:rule>
	</sch:pattern>
	<sch:pattern id="p-pqrs-2.16.840.1.113883.10.20.24.3.101-errors">
		<sch:rule id="r-pqrs-2.16.840.1.113883.10.20.24.3.101-errors-abstract" abstract="true">
    </sch:rule>
		<sch:rule id="r-pqrs-2.16.840.1.113883.10.20.24.3.101-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.101']]">
			<sch:extends rule="r-pqrs-2.16.840.1.113883.10.20.24.3.101-errors-abstract"/>
		</sch:rule>
	</sch:pattern>
	<sch:pattern id="p-pqrs-2.16.840.1.113883.10.20.24.3.103-errors">
		<sch:rule id="r-pqrs-2.16.840.1.113883.10.20.24.3.103-errors-abstract" abstract="true">
			<sch:assert id="a-16541" test="not(count(cda:value[@xsi:type='CD'])=1) or (count(cda:value[@xsi:type='CD'][cda:isValidValueSetForQDMCategory(@sdtc:valueSet, @code, @codeSystem,'2.16.840.1.113883.10.20.24.3.103')])=1)">PQRS_10710: //observation[templateId/@root='2.16.840.1.113883.10.20.24.3.103']/value[@xsi:type='CD'] ValueSet validation failed. The provided code, codeSystem, and valueSet are incompatible.</sch:assert>
			<sch:assert id="a-16540" test="not(count(cda:effectiveTime)=1) or (count(cda:effectiveTime)=1 and cda:isValidEffectiveTime(cda:effectiveTime))">PQRS_10705: //observation[templateId/@root='2.16.840.1.113883.10.20.24.3.103']/effectiveTime Invalid date and/or time format.</sch:assert>
			<sch:assert id="a-11367-24-3-103" test="not(count(cda:entryRelationship[@typeCode='RSON']/cda:observation[cda:templateId/@root='2.16.840.1.113883.10.20.24.3.88']/cda:value[@xsi:type='CD'])=1) or (count(cda:entryRelationship[@typeCode='RSON']/cda:observation/cda:value[@xsi:type='CD'][cda:isValidValueSetForQDMCategory(@sdtc:valueSet, @code, @codeSystem,'2.16.840.1.113883.10.20.24.3.103')])=1)">PQRS_10710: //observation[templateId/@root='2.16.840.1.113883.10.20.24.3.103']/entryRelationship[@typeCode="RSON"]/observation[templateId/@root='2.16.840.1.113883.10.20.24.3.88']/value[xsi:type="CD"] ValueSet validation failed. The provided code, codeSystem, and valueSet are incompatible.</sch:assert>
		</sch:rule>
		<sch:rule id="r-pqrs-2.16.840.1.113883.10.20.24.3.103-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.103']]">
			<sch:extends rule="r-pqrs-2.16.840.1.113883.10.20.24.3.103-errors-abstract"/>
		</sch:rule>
	</sch:pattern>
	<sch:pattern id="p-pqrs-2.16.840.1.113883.10.20.24.3.105-errors">
		<sch:rule id="r-pqrs-2.16.840.1.113883.10.20.24.3.105-errors-abstract" abstract="true">
    </sch:rule>
		<sch:rule id="r-pqrs-2.16.840.1.113883.10.20.24.3.105-errors" context="cda:act[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.105']]">
			<sch:extends rule="r-pqrs-2.16.840.1.113883.10.20.24.3.105-errors-abstract"/>
		</sch:rule>
	</sch:pattern>
	<sch:pattern id="p-pqrs-2.16.840.1.113883.10.20.22.4.85-errors">
		<sch:rule id="r-pqrs-2.16.840.1.113883.10.20.22.4.85-errors-abstract" abstract="true">
			<sch:assert id="a-16563" test="not(cda:value[@xsi:type='CD'][@code]) or (count(cda:value[@xsi:type='CD'][cda:isValidValueSetForQDMCategory(@sdtc:valueSet, @code, @codeSystem,'2.16.840.1.113883.10.20.22.4.85')])=1)">PQRS_10710: observation[templateId/@root='2.16.840.1.113883.10.20.22.4.85']/value[xsi:type="CD"] ValueSet validation failed. The provided code, codeSystem, and valueSet are incompatible.</sch:assert>
			<sch:assert id="a-16565" test="not(cda:effectiveTime[count(cda:low)=1]) or (cda:effectiveTime[count(cda:low)=1] and cda:isValidDate(cda:effectiveTime/cda:low))">PQRS_10705: observation[templateId/@root='2.16.840.1.113883.10.20.22.4.85']/effectiveTime Invalid date and/or time format.</sch:assert>
		</sch:rule>
		<sch:rule id="r-pqrs-2.16.840.1.113883.10.20.22.4.85-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.85']]">
			<sch:extends rule="r-pqrs-2.16.840.1.113883.10.20.22.4.85-errors-abstract"/>
		</sch:rule>
	</sch:pattern>
	<sch:pattern id="p-pqrs-2.16.840.1.113883.10.20.22.4.86-errors">
		<sch:rule id="r-pqrs-2.16.840.1.113883.10.20.22.4.86-errors-abstract" abstract="true">
    </sch:rule>
		<sch:rule id="r-pqrs-2.16.840.1.113883.10.20.22.4.86-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.86']]">
			<sch:extends rule="r-pqrs-2.16.840.1.113883.10.20.22.4.86-errors-abstract"/>
		</sch:rule>
	</sch:pattern>
	<sch:pattern id="p-pqrs-2.16.840.1.113883.10.20.17.3.8-warnings">
		<sch:rule id="r-pqrs-2.16.840.1.113883.10.20.17.3.8-warnings-abstract" abstract="true">
    </sch:rule>
		<sch:rule id="r-pqrs-2.16.840.1.113883.10.20.17.3.8-warnings" context="cda:act[cda:templateId[@root='2.16.840.1.113883.10.20.17.3.8']]">
			<sch:extends rule="r-pqrs-2.16.840.1.113883.10.20.17.3.8-warnings-abstract"/>
		</sch:rule>
	</sch:pattern>
	<sch:pattern id="p-pqrs-2.16.840.1.113883.10.20.17.2.1-warnings">
		<sch:rule id="r-pqrs-2.16.840.1.113883.10.20.17.2.1-warnings-abstract" abstract="true">
    </sch:rule>
		<sch:rule id="r-pqrs-2.16.840.1.113883.10.20.17.2.1-warnings" context="cda:section[cda:templateId[@root='2.16.840.1.113883.10.20.17.2.1']]">
			<sch:extends rule="r-pqrs-2.16.840.1.113883.10.20.17.2.1-warnings-abstract"/>
		</sch:rule>
	</sch:pattern>
	<sch:pattern id="p-pqrs-2.16.840.1.113883.10.20.17.2.4-warnings">
		<sch:rule id="r-pqrs-2.16.840.1.113883.10.20.17.2.4-warnings-abstract" abstract="true">
    </sch:rule>
		<sch:rule id="r-pqrs-2.16.840.1.113883.10.20.17.2.4-warnings" context="cda:section[cda:templateId[@root='2.16.840.1.113883.10.20.17.2.4']]">
			<sch:extends rule="r-pqrs-2.16.840.1.113883.10.20.17.2.4-warnings-abstract"/>
		</sch:rule>
	</sch:pattern>
	<sch:pattern id="p-pqrs-2.16.840.1.113883.10.20.22.1.1-warnings">
		<sch:rule id="r-pqrs-2.16.840.1.113883.10.20.22.1.1-warnings-abstract" abstract="true">
    </sch:rule>
		<sch:rule id="r-pqrs-2.16.840.1.113883.10.20.22.1.1-warnings" context="cda:ClinicalDocument[cda:templateId[@root='2.16.840.1.113883.10.20.22.1.1']]">
			<sch:extends rule="r-pqrs-2.16.840.1.113883.10.20.22.1.1-warnings-abstract"/>
		</sch:rule>
	</sch:pattern>
	<sch:pattern id="p-pqrs-2.16.840.1.113883.10.20.22.4.16-warnings">
		<sch:rule id="r-pqrs-2.16.840.1.113883.10.20.22.4.16-warnings-abstract" abstract="true">
			<sch:assert id="a-7526a" test="not(cda:doseQuantity) or (string-length(cda:doseQuantity/@unit) &gt; 0)">The doseQuantity, if present, SHOULD contain zero or one [0..1] @unit, which SHALL be selected from ValueSet UCUM Units of Measure (case sensitive) 2.16.840.1.113883.1.11.12839 DYNAMIC (CONF:7526).</sch:assert>
		</sch:rule>
		<sch:rule id="r-pqrs-2.16.840.1.113883.10.20.22.4.16-warnings" context="cda:substanceAdministration[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.16']]">
			<sch:extends rule="r-pqrs-2.16.840.1.113883.10.20.22.4.16-warnings-abstract"/>
		</sch:rule>
	</sch:pattern>
	<sch:pattern id="p-pqrs-2.16.840.1.113883.10.20.22.4.2-warnings">
		<sch:rule id="r-pqrs-2.16.840.1.113883.10.20.22.4.2-warnings-abstract" abstract="true">
    </sch:rule>
		<sch:rule id="r-pqrs-2.16.840.1.113883.10.20.22.4.2-warnings" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.2']]">
			<sch:extends rule="r-pqrs-2.16.840.1.113883.10.20.22.4.2-warnings-abstract"/>
		</sch:rule>
	</sch:pattern>
	<sch:pattern id="p-pqrs-2.16.840.1.113883.10.20.22.4.28-warnings">
		<sch:rule id="r-pqrs-2.16.840.1.113883.10.20.22.4.28-warnings-abstract" abstract="true">
    </sch:rule>
		<sch:rule id="r-pqrs-2.16.840.1.113883.10.20.22.4.28-warnings" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.28']]">
			<sch:extends rule="r-pqrs-2.16.840.1.113883.10.20.22.4.28-warnings-abstract"/>
		</sch:rule>
	</sch:pattern>
	<sch:pattern id="p-pqrs-2.16.840.1.113883.10.20.22.4.9-warnings">
		<sch:rule id="r-pqrs-2.16.840.1.113883.10.20.22.4.9-warnings-abstract" abstract="true">
    </sch:rule>
		<sch:rule id="r-pqrs-2.16.840.1.113883.10.20.22.4.9-warnings" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.9']]">
			<sch:extends rule="r-pqrs-2.16.840.1.113883.10.20.22.4.9-warnings-abstract"/>
		</sch:rule>
	</sch:pattern>
	<sch:pattern id="p-pqrs-2.16.840.1.113883.10.20.22.4.8-warnings">
		<sch:rule id="r-pqrs-2.16.840.1.113883.10.20.22.4.8-warnings-abstract" abstract="true">
    </sch:rule>
		<sch:rule id="r-pqrs-2.16.840.1.113883.10.20.22.4.8-warnings" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.8']]">
			<sch:extends rule="r-pqrs-2.16.840.1.113883.10.20.22.4.8-warnings-abstract"/>
		</sch:rule>
	</sch:pattern>
	<sch:pattern id="p-pqrs-2.16.840.1.113883.10.20.22.4.6-warnings">
		<sch:rule id="r-pqrs-2.16.840.1.113883.10.20.22.4.6-warnings-abstract" abstract="true">
    </sch:rule>
		<sch:rule id="r-pqrs-2.16.840.1.113883.10.20.22.4.6-warnings" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.6']]">
			<sch:extends rule="r-pqrs-2.16.840.1.113883.10.20.22.4.6-warnings-abstract"/>
		</sch:rule>
	</sch:pattern>
	<sch:pattern id="p-pqrs-2.16.840.1.113883.10.20.22.4.25-warnings">
		<sch:rule id="r-pqrs-2.16.840.1.113883.10.20.22.4.25-warnings-abstract" abstract="true">
    </sch:rule>
		<sch:rule id="r-pqrs-2.16.840.1.113883.10.20.22.4.25-warnings" context="cda:criterion[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.25']]">
			<sch:extends rule="r-pqrs-2.16.840.1.113883.10.20.22.4.25-warnings-abstract"/>
		</sch:rule>
	</sch:pattern>
	<sch:pattern id="p-pqrs-2.16.840.1.113883.10.20.24.3.90-warnings">
		<!--Pattern is used in an implied relationship.-->
		<sch:rule id="r-pqrs-2.16.840.1.113883.10.20.24.3.90-warnings-abstract" abstract="true">
    </sch:rule>
		<sch:rule id="r-pqrs-2.16.840.1.113883.10.20.24.3.90-warnings" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.90']]">
			<sch:extends rule="r-pqrs-2.16.840.1.113883.10.20.24.3.90-warnings-abstract"/>
		</sch:rule>
	</sch:pattern>
	<sch:pattern id="p-pqrs-2.16.840.1.113883.10.20.22.4.7-warnings">
		<sch:rule id="r-pqrs-2.16.840.1.113883.10.20.22.4.7-warnings-abstract" abstract="true">
			<sch:extends rule="r-pqrs-2.16.840.1.113883.10.20.24.3.90-warnings-abstract"/>
		</sch:rule>
		<sch:rule id="r-pqrs-2.16.840.1.113883.10.20.22.4.7-warnings" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.7']]">
			<sch:extends rule="r-pqrs-2.16.840.1.113883.10.20.22.4.7-warnings-abstract"/>
		</sch:rule>
		<sch:rule id="r-pqrs-2.16.840.1.113883.10.20.22.4.7-7402-branch-7402-warnings-abstract" abstract="true">
    </sch:rule>
		<sch:rule id="r-pqrs-2.16.840.1.113883.10.20.22.4.7-7402-branch-7402-warnings" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.7']]/cda:participant[@typeCode='CSM'][cda:participantRole[@classCode='MANU'][cda:playingEntity[@classCode='MMAT'][cda:code]]]">
			<sch:extends rule="r-pqrs-2.16.840.1.113883.10.20.22.4.7-7402-branch-7402-warnings-abstract"/>
		</sch:rule>
	</sch:pattern>
	<sch:pattern id="p-pqrs-2.16.840.1.113883.10.20.22.4.20-warnings">
		<sch:rule id="r-pqrs-2.16.840.1.113883.10.20.22.4.20-warnings-abstract" abstract="true">
    </sch:rule>
		<sch:rule id="r-pqrs-2.16.840.1.113883.10.20.22.4.20-warnings" context="cda:act[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.20']]">
			<sch:extends rule="r-pqrs-2.16.840.1.113883.10.20.22.4.20-warnings-abstract"/>
		</sch:rule>
	</sch:pattern>
	<sch:pattern id="p-pqrs-2.16.840.1.113883.10.20.22.4.23-warnings">
		<sch:rule id="r-pqrs-2.16.840.1.113883.10.20.22.4.23-warnings-abstract" abstract="true">
    </sch:rule>
		<sch:rule id="r-pqrs-2.16.840.1.113883.10.20.22.4.23-warnings" context="cda:manufacturedProduct[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.23']]">
			<sch:extends rule="r-pqrs-2.16.840.1.113883.10.20.22.4.23-warnings-abstract"/>
		</sch:rule>
	</sch:pattern>
	<sch:pattern id="p-pqrs-2.16.840.1.113883.10.20.22.4.17-warnings">
		<sch:rule id="r-pqrs-2.16.840.1.113883.10.20.22.4.17-warnings-abstract" abstract="true">
    </sch:rule>
		<sch:rule id="r-pqrs-2.16.840.1.113883.10.20.22.4.17-warnings" context="cda:supply[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.17']]">
			<sch:extends rule="r-pqrs-2.16.840.1.113883.10.20.22.4.17-warnings-abstract"/>
		</sch:rule>
	</sch:pattern>
	<sch:pattern id="p-pqrs-2.16.840.1.113883.10.20.22.4.18-warnings">
		<sch:rule id="r-pqrs-2.16.840.1.113883.10.20.22.4.18-warnings-abstract" abstract="true">
    </sch:rule>
		<sch:rule id="r-pqrs-2.16.840.1.113883.10.20.22.4.18-warnings" context="cda:supply[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.18']]">
			<sch:extends rule="r-pqrs-2.16.840.1.113883.10.20.22.4.18-warnings-abstract"/>
		</sch:rule>
	</sch:pattern>
	<sch:pattern id="p-pqrs-2.16.840.1.113883.10.20.22.4.19-warnings">
		<sch:rule id="r-pqrs-2.16.840.1.113883.10.20.22.4.19-warnings-abstract" abstract="true">
    </sch:rule>
		<sch:rule id="r-pqrs-2.16.840.1.113883.10.20.22.4.19-warnings" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.19']]">
			<sch:extends rule="r-pqrs-2.16.840.1.113883.10.20.22.4.19-warnings-abstract"/>
		</sch:rule>
	</sch:pattern>
	<sch:pattern id="p-pqrs-2.16.840.1.113883.10.20.22.4.24-warnings">
		<sch:rule id="r-pqrs-2.16.840.1.113883.10.20.22.4.24-warnings-abstract" abstract="true">
    </sch:rule>
		<sch:rule id="r-pqrs-2.16.840.1.113883.10.20.22.4.24-warnings" context="cda:participantRole[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.24']]">
			<sch:extends rule="r-pqrs-2.16.840.1.113883.10.20.22.4.24-warnings-abstract"/>
		</sch:rule>
	</sch:pattern>
	<sch:pattern id="p-pqrs-2.16.840.1.113883.10.20.22.4.14-warnings">
		<sch:rule id="r-pqrs-2.16.840.1.113883.10.20.22.4.14-warnings-abstract" abstract="true">
    </sch:rule>
		<sch:rule id="r-pqrs-2.16.840.1.113883.10.20.22.4.14-warnings" context="cda:procedure[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.14']]">
			<sch:extends rule="r-pqrs-2.16.840.1.113883.10.20.22.4.14-warnings-abstract"/>
		</sch:rule>
		<sch:rule id="r-pqrs-2.16.840.1.113883.10.20.22.4.14-7718-branch-7718-warnings-abstract" abstract="true">
    </sch:rule>
		<sch:rule id="r-pqrs-2.16.840.1.113883.10.20.22.4.14-7718-branch-7718-warnings" context="cda:procedure[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.14']]/cda:performer[cda:assignedEntity[cda:id][cda:addr][cda:telecom]]">
			<sch:extends rule="r-pqrs-2.16.840.1.113883.10.20.22.4.14-7718-branch-7718-warnings-abstract"/>
		</sch:rule>
	</sch:pattern>
	<sch:pattern id="p-pqrs-2.16.840.1.113883.10.20.22.4.31-warnings">
		<sch:rule id="r-pqrs-2.16.840.1.113883.10.20.22.4.31-warnings-abstract" abstract="true">
    </sch:rule>
		<sch:rule id="r-pqrs-2.16.840.1.113883.10.20.22.4.31-warnings" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.31']]">
			<sch:extends rule="r-pqrs-2.16.840.1.113883.10.20.22.4.31-warnings-abstract"/>
		</sch:rule>
	</sch:pattern>
	<sch:pattern id="p-pqrs-2.16.840.1.113883.10.20.22.4.32-warnings">
		<sch:rule id="r-pqrs-2.16.840.1.113883.10.20.22.4.32-warnings-abstract" abstract="true">
    </sch:rule>
		<sch:rule id="r-pqrs-2.16.840.1.113883.10.20.22.4.32-warnings" context="cda:participantRole[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.32']]">
			<sch:extends rule="r-pqrs-2.16.840.1.113883.10.20.22.4.32-warnings-abstract"/>
		</sch:rule>
	</sch:pattern>
	<sch:pattern id="p-pqrs-2.16.840.1.113883.10.20.22.4.4-warnings">
		<sch:rule id="r-pqrs-2.16.840.1.113883.10.20.22.4.4-warnings-abstract" abstract="true">
    </sch:rule>
		<sch:rule id="r-pqrs-2.16.840.1.113883.10.20.22.4.4-warnings" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.4']]">
			<sch:extends rule="r-pqrs-2.16.840.1.113883.10.20.22.4.4-warnings-abstract"/>
		</sch:rule>
	</sch:pattern>
	<sch:pattern id="p-pqrs-2.16.840.1.113883.10.20.22.4.37-warnings">
		<sch:rule id="r-pqrs-2.16.840.1.113883.10.20.22.4.37-warnings-abstract" abstract="true">
    </sch:rule>
		<sch:rule id="r-pqrs-2.16.840.1.113883.10.20.22.4.37-warnings" context="cda:participantRole[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.37']]">
			<sch:extends rule="r-pqrs-2.16.840.1.113883.10.20.22.4.37-warnings-abstract"/>
		</sch:rule>
	</sch:pattern>
	<sch:pattern id="p-pqrs-2.16.840.1.113883.10.20.22.4.12-warnings">
		<sch:rule id="r-pqrs-2.16.840.1.113883.10.20.22.4.12-warnings-abstract" abstract="true">
    </sch:rule>
		<sch:rule id="r-pqrs-2.16.840.1.113883.10.20.22.4.12-warnings" context="cda:act[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.12']]">
			<sch:extends rule="r-pqrs-2.16.840.1.113883.10.20.22.4.12-warnings-abstract"/>
		</sch:rule>
	</sch:pattern>
	<sch:pattern id="p-pqrs-2.16.840.1.113883.10.20.22.4.13-warnings">
		<sch:rule id="r-pqrs-2.16.840.1.113883.10.20.22.4.13-warnings-abstract" abstract="true">
    </sch:rule>
		<sch:rule id="r-pqrs-2.16.840.1.113883.10.20.22.4.13-warnings" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.13']]">
			<sch:extends rule="r-pqrs-2.16.840.1.113883.10.20.22.4.13-warnings-abstract"/>
		</sch:rule>
	</sch:pattern>
	<sch:pattern id="p-pqrs-2.16.840.1.113883.10.20.22.4.39-warnings">
		<sch:rule id="r-pqrs-2.16.840.1.113883.10.20.22.4.39-warnings-abstract" abstract="true">
    </sch:rule>
		<sch:rule id="r-pqrs-2.16.840.1.113883.10.20.22.4.39-warnings" context="cda:act[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.39']]">
			<sch:extends rule="r-pqrs-2.16.840.1.113883.10.20.22.4.39-warnings-abstract"/>
		</sch:rule>
	</sch:pattern>
	<sch:pattern id="p-pqrs-2.16.840.1.113883.10.20.22.4.40-warnings">
		<sch:rule id="r-pqrs-2.16.840.1.113883.10.20.22.4.40-warnings-abstract" abstract="true">
    </sch:rule>
		<sch:rule id="r-pqrs-2.16.840.1.113883.10.20.22.4.40-warnings" context="cda:encounter[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.40']]">
			<sch:extends rule="r-pqrs-2.16.840.1.113883.10.20.22.4.40-warnings-abstract"/>
		</sch:rule>
	</sch:pattern>
	<sch:pattern id="p-pqrs-2.16.840.1.113883.10.20.22.4.41-warnings">
		<sch:rule id="r-pqrs-2.16.840.1.113883.10.20.22.4.41-warnings-abstract" abstract="true">
    </sch:rule>
		<sch:rule id="r-pqrs-2.16.840.1.113883.10.20.22.4.41-warnings" context="cda:procedure[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.41']]">
			<sch:extends rule="r-pqrs-2.16.840.1.113883.10.20.22.4.41-warnings-abstract"/>
		</sch:rule>
	</sch:pattern>
	<sch:pattern id="p-pqrs-2.16.840.1.113883.10.20.22.4.42-warnings">
		<sch:rule id="r-pqrs-2.16.840.1.113883.10.20.22.4.42-warnings-abstract" abstract="true">
    </sch:rule>
		<sch:rule id="r-pqrs-2.16.840.1.113883.10.20.22.4.42-warnings" context="cda:substanceAdministration[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.42']]">
			<sch:extends rule="r-pqrs-2.16.840.1.113883.10.20.22.4.42-warnings-abstract"/>
		</sch:rule>
	</sch:pattern>
	<sch:pattern id="p-pqrs-2.16.840.1.113883.10.20.22.4.43-warnings">
		<sch:rule id="r-pqrs-2.16.840.1.113883.10.20.22.4.43-warnings-abstract" abstract="true">
    </sch:rule>
		<sch:rule id="r-pqrs-2.16.840.1.113883.10.20.22.4.43-warnings" context="cda:supply[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.43']]">
			<sch:extends rule="r-pqrs-2.16.840.1.113883.10.20.22.4.43-warnings-abstract"/>
		</sch:rule>
	</sch:pattern>
	<sch:pattern id="p-pqrs-2.16.840.1.113883.10.20.22.4.44-warnings">
		<sch:rule id="r-pqrs-2.16.840.1.113883.10.20.22.4.44-warnings-abstract" abstract="true">
    </sch:rule>
		<sch:rule id="r-pqrs-2.16.840.1.113883.10.20.22.4.44-warnings" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.44']]">
			<sch:extends rule="r-pqrs-2.16.840.1.113883.10.20.22.4.44-warnings-abstract"/>
		</sch:rule>
	</sch:pattern>
	<sch:pattern id="p-pqrs-2.16.840.1.113883.10.20.22.4.46-warnings">
		<sch:rule id="r-pqrs-2.16.840.1.113883.10.20.22.4.46-warnings-abstract" abstract="true">
    </sch:rule>
		<sch:rule id="r-pqrs-2.16.840.1.113883.10.20.22.4.46-warnings" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.46']]">
			<sch:extends rule="r-pqrs-2.16.840.1.113883.10.20.22.4.46-warnings-abstract"/>
		</sch:rule>
	</sch:pattern>
	<sch:pattern id="p-pqrs-2.16.840.1.113883.10.20.22.4.45-warnings">
		<sch:rule id="r-pqrs-2.16.840.1.113883.10.20.22.4.45-warnings-abstract" abstract="true">
    </sch:rule>
		<sch:rule id="r-pqrs-2.16.840.1.113883.10.20.22.4.45-warnings" context="cda:organizer[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.45']]">
			<sch:extends rule="r-pqrs-2.16.840.1.113883.10.20.22.4.45-warnings-abstract"/>
		</sch:rule>
	</sch:pattern>
	<sch:pattern id="p-pqrs-2.16.840.1.113883.10.20.22.4.47-warnings">
		<sch:rule id="r-pqrs-2.16.840.1.113883.10.20.22.4.47-warnings-abstract" abstract="true">
    </sch:rule>
		<sch:rule id="r-pqrs-2.16.840.1.113883.10.20.22.4.47-warnings" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.47']]">
			<sch:extends rule="r-pqrs-2.16.840.1.113883.10.20.22.4.47-warnings-abstract"/>
		</sch:rule>
	</sch:pattern>
	<sch:pattern id="p-pqrs-2.16.840.1.113883.10.20.22.4.49-warnings">
		<sch:rule id="r-pqrs-2.16.840.1.113883.10.20.22.4.49-warnings-abstract" abstract="true">
    </sch:rule>
		<sch:rule id="r-pqrs-2.16.840.1.113883.10.20.22.4.49-warnings" context="cda:encounter[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.49']]">
			<sch:extends rule="r-pqrs-2.16.840.1.113883.10.20.22.4.49-warnings-abstract"/>
		</sch:rule>
	</sch:pattern>
	<sch:pattern id="p-pqrs-2.16.840.1.113883.10.20.22.4.50-warnings">
		<sch:rule id="r-pqrs-2.16.840.1.113883.10.20.22.4.50-warnings-abstract" abstract="true">
    </sch:rule>
		<sch:rule id="r-pqrs-2.16.840.1.113883.10.20.22.4.50-warnings" context="cda:supply[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.50']]">
			<sch:extends rule="r-pqrs-2.16.840.1.113883.10.20.22.4.50-warnings-abstract"/>
		</sch:rule>
	</sch:pattern>
	<sch:pattern id="p-pqrs-2.16.840.1.113883.10.20.22.4.54-warnings">
		<sch:rule id="r-pqrs-2.16.840.1.113883.10.20.22.4.54-warnings-abstract" abstract="true">
    </sch:rule>
		<sch:rule id="r-pqrs-2.16.840.1.113883.10.20.22.4.54-warnings" context="cda:manufacturedProduct[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.54']]">
			<sch:extends rule="r-pqrs-2.16.840.1.113883.10.20.22.4.54-warnings-abstract"/>
		</sch:rule>
	</sch:pattern>
	<sch:pattern id="p-pqrs-2.16.840.1.113883.10.20.22.4.5-warnings">
		<sch:rule id="r-pqrs-2.16.840.1.113883.10.20.22.4.5-warnings-abstract" abstract="true">
    </sch:rule>
		<sch:rule id="r-pqrs-2.16.840.1.113883.10.20.22.4.5-warnings" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.5']]">
			<sch:extends rule="r-pqrs-2.16.840.1.113883.10.20.22.4.5-warnings-abstract"/>
		</sch:rule>
	</sch:pattern>
	<sch:pattern id="p-pqrs-2.16.840.1.113883.10.20.24.3.104-warnings">
		<!--Pattern is used in an implied relationship.-->
		<sch:rule id="r-pqrs-2.16.840.1.113883.10.20.24.3.104-warnings-abstract" abstract="true">
    </sch:rule>
		<sch:rule id="r-pqrs-2.16.840.1.113883.10.20.24.3.104-warnings" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.104']]">
			<sch:extends rule="r-pqrs-2.16.840.1.113883.10.20.24.3.104-warnings-abstract"/>
		</sch:rule>
	</sch:pattern>
	<sch:pattern id="p-pqrs-2.16.840.1.113883.10.20.24.3.61-warnings">
		<sch:rule id="r-pqrs-2.16.840.1.113883.10.20.24.3.61-warnings-abstract" abstract="true">
			<sch:extends rule="r-pqrs-2.16.840.1.113883.10.20.24.3.104-warnings-abstract"/>
		</sch:rule>
		<sch:rule id="r-pqrs-2.16.840.1.113883.10.20.24.3.61-warnings" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.61']]">
			<sch:extends rule="r-pqrs-2.16.840.1.113883.10.20.24.3.61-warnings-abstract"/>
		</sch:rule>
	</sch:pattern>
	<sch:pattern id="p-pqrs-2.16.840.1.113883.10.20.24.3.65-warnings">
		<sch:rule id="r-pqrs-2.16.840.1.113883.10.20.24.3.65-warnings-abstract" abstract="true">
			<sch:extends rule="r-pqrs-2.16.840.1.113883.10.20.22.4.41-warnings-abstract"/>
		</sch:rule>
		<sch:rule id="r-pqrs-2.16.840.1.113883.10.20.24.3.65-warnings" context="cda:procedure[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.65']]">
			<sch:extends rule="r-pqrs-2.16.840.1.113883.10.20.24.3.65-warnings-abstract"/>
		</sch:rule>
	</sch:pattern>
	<sch:pattern id="p-pqrs-2.16.840.1.113883.10.20.24.3.83-warnings">
		<sch:rule id="r-pqrs-2.16.840.1.113883.10.20.24.3.83-warnings-abstract" abstract="true">
    </sch:rule>
		<sch:rule id="r-pqrs-2.16.840.1.113883.10.20.24.3.83-warnings" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.83']]">
			<sch:extends rule="r-pqrs-2.16.840.1.113883.10.20.24.3.83-warnings-abstract"/>
		</sch:rule>
	</sch:pattern>
	<sch:pattern id="p-pqrs-2.16.840.1.113883.10.20.24.3.84-warnings">
		<sch:rule id="r-pqrs-2.16.840.1.113883.10.20.24.3.84-warnings-abstract" abstract="true">
    </sch:rule>
		<sch:rule id="r-pqrs-2.16.840.1.113883.10.20.24.3.84-warnings" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.84']]">
			<sch:extends rule="r-pqrs-2.16.840.1.113883.10.20.24.3.84-warnings-abstract"/>
		</sch:rule>
	</sch:pattern>
	<sch:pattern id="p-pqrs-2.16.840.1.113883.10.20.24.3.85-warnings">
		<sch:rule id="r-pqrs-2.16.840.1.113883.10.20.24.3.85-warnings-abstract" abstract="true">
			<sch:extends rule="r-pqrs-2.16.840.1.113883.10.20.22.4.9-warnings-abstract"/>
		</sch:rule>
		<sch:rule id="r-pqrs-2.16.840.1.113883.10.20.24.3.85-warnings" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.85']]">
			<sch:extends rule="r-pqrs-2.16.840.1.113883.10.20.24.3.85-warnings-abstract"/>
		</sch:rule>
	</sch:pattern>
	<sch:pattern id="p-pqrs-2.16.840.1.113883.10.20.24.3.1-warnings">
		<sch:rule id="r-pqrs-2.16.840.1.113883.10.20.24.3.1-warnings-abstract" abstract="true">
			<sch:extends rule="r-pqrs-2.16.840.1.113883.10.20.22.4.44-warnings-abstract"/>
		</sch:rule>
		<sch:rule id="r-pqrs-2.16.840.1.113883.10.20.24.3.1-warnings" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.1']]">
			<sch:extends rule="r-pqrs-2.16.840.1.113883.10.20.24.3.1-warnings-abstract"/>
		</sch:rule>
	</sch:pattern>
	<sch:pattern id="p-pqrs-2.16.840.1.113883.10.20.24.3.63-warnings">
		<sch:rule id="r-pqrs-2.16.840.1.113883.10.20.24.3.63-warnings-abstract" abstract="true">
			<sch:extends rule="r-pqrs-2.16.840.1.113883.10.20.22.4.41-warnings-abstract"/>
		</sch:rule>
		<sch:rule id="r-pqrs-2.16.840.1.113883.10.20.24.3.63-warnings" context="cda:procedure[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.63']]">
			<sch:extends rule="r-pqrs-2.16.840.1.113883.10.20.24.3.63-warnings-abstract"/>
		</sch:rule>
	</sch:pattern>
	<sch:pattern id="p-pqrs-2.16.840.1.113883.10.20.24.3.66-warnings">
		<sch:rule id="r-pqrs-2.16.840.1.113883.10.20.24.3.66-warnings-abstract" abstract="true">
			<sch:extends rule="r-pqrs-2.16.840.1.113883.10.20.22.4.14-warnings-abstract"/>
		</sch:rule>
		<sch:rule id="r-pqrs-2.16.840.1.113883.10.20.24.3.66-warnings" context="cda:procedure[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.66']]">
			<sch:extends rule="r-pqrs-2.16.840.1.113883.10.20.24.3.66-warnings-abstract"/>
		</sch:rule>
	</sch:pattern>
	<sch:pattern id="p-pqrs-2.16.840.1.113883.10.20.24.3.2-warnings">
		<sch:rule id="r-pqrs-2.16.840.1.113883.10.20.24.3.2-warnings-abstract" abstract="true">
    </sch:rule>
		<sch:rule id="r-pqrs-2.16.840.1.113883.10.20.24.3.2-warnings" context="cda:act[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.2']]">
			<sch:extends rule="r-pqrs-2.16.840.1.113883.10.20.24.3.2-warnings-abstract"/>
		</sch:rule>
	</sch:pattern>
	<sch:pattern id="p-pqrs-2.16.840.1.113883.10.20.24.3.64-warnings">
		<sch:rule id="r-pqrs-2.16.840.1.113883.10.20.24.3.64-warnings-abstract" abstract="true">
			<sch:extends rule="r-pqrs-2.16.840.1.113883.10.20.22.4.14-warnings-abstract"/>
		</sch:rule>
		<sch:rule id="r-pqrs-2.16.840.1.113883.10.20.24.3.64-warnings" context="cda:procedure[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.64']]">
			<sch:extends rule="r-pqrs-2.16.840.1.113883.10.20.24.3.64-warnings-abstract"/>
		</sch:rule>
	</sch:pattern>
	<sch:pattern id="p-pqrs-2.16.840.1.113883.10.20.24.3.88-warnings">
		<sch:rule id="r-pqrs-2.16.840.1.113883.10.20.24.3.88-warnings-abstract" abstract="true">
    </sch:rule>
		<sch:rule id="r-pqrs-2.16.840.1.113883.10.20.24.3.88-warnings" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.88']]">
			<sch:extends rule="r-pqrs-2.16.840.1.113883.10.20.24.3.88-warnings-abstract"/>
		</sch:rule>
	</sch:pattern>
	<sch:pattern id="p-pqrs-2.16.840.1.113883.10.20.24.3.89-warnings">
		<sch:rule id="r-pqrs-2.16.840.1.113883.10.20.24.3.89-warnings-abstract" abstract="true">
    </sch:rule>
		<sch:rule id="r-pqrs-2.16.840.1.113883.10.20.24.3.89-warnings" context="cda:procedure[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.89']]">
			<sch:extends rule="r-pqrs-2.16.840.1.113883.10.20.24.3.89-warnings-abstract"/>
		</sch:rule>
	</sch:pattern>
	<sch:pattern id="p-pqrs-2.16.840.1.113883.10.20.24.3.62-warnings">
		<sch:rule id="r-pqrs-2.16.840.1.113883.10.20.24.3.62-warnings-abstract" abstract="true">
			<sch:extends rule="r-pqrs-2.16.840.1.113883.10.20.24.3.104-warnings-abstract"/>
		</sch:rule>
		<sch:rule id="r-pqrs-2.16.840.1.113883.10.20.24.3.62-warnings" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.62']]">
			<sch:extends rule="r-pqrs-2.16.840.1.113883.10.20.24.3.62-warnings-abstract"/>
		</sch:rule>
	</sch:pattern>
	<sch:pattern id="p-pqrs-2.16.840.1.113883.10.20.24.3.4-warnings">
		<sch:rule id="r-pqrs-2.16.840.1.113883.10.20.24.3.4-warnings-abstract" abstract="true">
    </sch:rule>
		<sch:rule id="r-pqrs-2.16.840.1.113883.10.20.24.3.4-warnings" context="cda:act[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.4']]">
			<sch:extends rule="r-pqrs-2.16.840.1.113883.10.20.24.3.4-warnings-abstract"/>
		</sch:rule>
	</sch:pattern>
	<sch:pattern id="p-pqrs-2.16.840.1.113883.10.20.24.3.82-warnings">
		<sch:rule id="r-pqrs-2.16.840.1.113883.10.20.24.3.82-warnings-abstract" abstract="true">
    </sch:rule>
		<sch:rule id="r-pqrs-2.16.840.1.113883.10.20.24.3.82-warnings" context="cda:participant[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.82']]">
			<sch:extends rule="r-pqrs-2.16.840.1.113883.10.20.24.3.82-warnings-abstract"/>
		</sch:rule>
	</sch:pattern>
	<sch:pattern id="p-pqrs-2.16.840.1.113883.10.20.24.3.87-warnings">
		<sch:rule id="r-pqrs-2.16.840.1.113883.10.20.24.3.87-warnings-abstract" abstract="true">
			<sch:extends rule="r-pqrs-2.16.840.1.113883.10.20.22.4.2-warnings-abstract"/>
		</sch:rule>
		<sch:rule id="r-pqrs-2.16.840.1.113883.10.20.24.3.87-warnings" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.87']]">
			<sch:extends rule="r-pqrs-2.16.840.1.113883.10.20.24.3.87-warnings-abstract"/>
		</sch:rule>
	</sch:pattern>
	<sch:pattern id="p-pqrs-2.16.840.1.113883.10.20.24.3.91-warnings">
		<sch:rule id="r-pqrs-2.16.840.1.113883.10.20.24.3.91-warnings-abstract" abstract="true">
    </sch:rule>
		<sch:rule id="r-pqrs-2.16.840.1.113883.10.20.24.3.91-warnings" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.91']]">
			<sch:extends rule="r-pqrs-2.16.840.1.113883.10.20.24.3.91-warnings-abstract"/>
		</sch:rule>
	</sch:pattern>
	<sch:pattern id="p-pqrs-2.16.840.1.113883.10.20.24.3.93-warnings">
		<sch:rule id="r-pqrs-2.16.840.1.113883.10.20.24.3.93-warnings-abstract" abstract="true">
    </sch:rule>
		<sch:rule id="r-pqrs-2.16.840.1.113883.10.20.24.3.93-warnings" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.93']]">
			<sch:extends rule="r-pqrs-2.16.840.1.113883.10.20.24.3.93-warnings-abstract"/>
		</sch:rule>
	</sch:pattern>
	<sch:pattern id="p-pqrs-2.16.840.1.113883.10.20.24.3.38-warnings">
		<sch:rule id="r-pqrs-2.16.840.1.113883.10.20.24.3.38-warnings-abstract" abstract="true">
    </sch:rule>
		<sch:rule id="r-pqrs-2.16.840.1.113883.10.20.24.3.38-warnings" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.38']]">
			<sch:extends rule="r-pqrs-2.16.840.1.113883.10.20.24.3.38-warnings-abstract"/>
		</sch:rule>
	</sch:pattern>
	<sch:pattern id="p-pqrs-2.16.840.1.113883.10.20.24.3.16-warnings">
		<sch:rule id="r-pqrs-2.16.840.1.113883.10.20.24.3.16-warnings-abstract" abstract="true">
			<sch:extends rule="r-pqrs-2.16.840.1.113883.10.20.24.3.104-warnings-abstract"/>
		</sch:rule>
		<sch:rule id="r-pqrs-2.16.840.1.113883.10.20.24.3.16-warnings" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.16']]">
			<sch:extends rule="r-pqrs-2.16.840.1.113883.10.20.24.3.16-warnings-abstract"/>
		</sch:rule>
	</sch:pattern>
	<sch:pattern id="p-pqrs-2.16.840.1.113883.10.20.24.3.40-warnings">
		<sch:rule id="r-pqrs-2.16.840.1.113883.10.20.24.3.40-warnings-abstract" abstract="true">
			<sch:extends rule="r-pqrs-2.16.840.1.113883.10.20.22.4.2-warnings-abstract"/>
		</sch:rule>
		<sch:rule id="r-pqrs-2.16.840.1.113883.10.20.24.3.40-warnings" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.40']]">
			<sch:extends rule="r-pqrs-2.16.840.1.113883.10.20.24.3.40-warnings-abstract"/>
		</sch:rule>
	</sch:pattern>
	<sch:pattern id="p-pqrs-2.16.840.1.113883.10.20.24.3.15-warnings">
		<sch:rule id="r-pqrs-2.16.840.1.113883.10.20.24.3.15-warnings-abstract" abstract="true">
			<sch:extends rule="r-pqrs-2.16.840.1.113883.10.20.24.3.104-warnings-abstract"/>
		</sch:rule>
		<sch:rule id="r-pqrs-2.16.840.1.113883.10.20.24.3.15-warnings" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.15']]">
			<sch:extends rule="r-pqrs-2.16.840.1.113883.10.20.24.3.15-warnings-abstract"/>
		</sch:rule>
	</sch:pattern>
	<sch:pattern id="p-pqrs-2.16.840.1.113883.10.20.24.3.39-warnings">
		<sch:rule id="r-pqrs-2.16.840.1.113883.10.20.24.3.39-warnings-abstract" abstract="true">
			<sch:extends rule="r-pqrs-2.16.840.1.113883.10.20.22.4.44-warnings-abstract"/>
		</sch:rule>
		<sch:rule id="r-pqrs-2.16.840.1.113883.10.20.24.3.39-warnings" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.39']]">
			<sch:extends rule="r-pqrs-2.16.840.1.113883.10.20.24.3.39-warnings-abstract"/>
		</sch:rule>
	</sch:pattern>
	<sch:pattern id="p-pqrs-2.16.840.1.113883.10.20.24.3.3-warnings">
		<sch:rule id="r-pqrs-2.16.840.1.113883.10.20.24.3.3-warnings-abstract" abstract="true">
    </sch:rule>
		<sch:rule id="r-pqrs-2.16.840.1.113883.10.20.24.3.3-warnings" context="cda:act[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.3']]">
			<sch:extends rule="r-pqrs-2.16.840.1.113883.10.20.24.3.3-warnings-abstract"/>
		</sch:rule>
	</sch:pattern>
	<sch:pattern id="p-pqrs-2.16.840.1.113883.10.20.24.3.23-warnings">
		<sch:rule id="r-pqrs-2.16.840.1.113883.10.20.24.3.23-warnings-abstract" abstract="true">
			<sch:extends rule="r-pqrs-2.16.840.1.113883.10.20.22.4.49-warnings-abstract"/>
		</sch:rule>
		<sch:rule id="r-pqrs-2.16.840.1.113883.10.20.24.3.23-warnings" context="cda:encounter[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.23']]">
			<sch:extends rule="r-pqrs-2.16.840.1.113883.10.20.24.3.23-warnings-abstract"/>
		</sch:rule>
	</sch:pattern>
	<sch:pattern id="p-pqrs-2.16.840.1.113883.10.20.24.3.21-warnings">
		<sch:rule id="r-pqrs-2.16.840.1.113883.10.20.24.3.21-warnings-abstract" abstract="true">
			<sch:extends rule="r-pqrs-2.16.840.1.113883.10.20.22.4.49-warnings-abstract"/>
		</sch:rule>
		<sch:rule id="r-pqrs-2.16.840.1.113883.10.20.24.3.21-warnings" context="cda:encounter[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.21']]">
			<sch:extends rule="r-pqrs-2.16.840.1.113883.10.20.24.3.21-warnings-abstract"/>
		</sch:rule>
	</sch:pattern>
	<sch:pattern id="p-pqrs-2.16.840.1.113883.10.20.24.3.24-warnings">
		<sch:rule id="r-pqrs-2.16.840.1.113883.10.20.24.3.24-warnings-abstract" abstract="true">
			<sch:extends rule="r-pqrs-2.16.840.1.113883.10.20.22.4.40-warnings-abstract"/>
		</sch:rule>
		<sch:rule id="r-pqrs-2.16.840.1.113883.10.20.24.3.24-warnings" context="cda:encounter[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.24']]">
			<sch:extends rule="r-pqrs-2.16.840.1.113883.10.20.24.3.24-warnings-abstract"/>
		</sch:rule>
	</sch:pattern>
	<sch:pattern id="p-pqrs-2.16.840.1.113883.10.20.24.3.22-warnings">
		<sch:rule id="r-pqrs-2.16.840.1.113883.10.20.24.3.22-warnings-abstract" abstract="true">
			<sch:extends rule="r-pqrs-2.16.840.1.113883.10.20.22.4.40-warnings-abstract"/>
		</sch:rule>
		<sch:rule id="r-pqrs-2.16.840.1.113883.10.20.24.3.22-warnings" context="cda:encounter[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.22']]">
			<sch:extends rule="r-pqrs-2.16.840.1.113883.10.20.24.3.22-warnings-abstract"/>
		</sch:rule>
	</sch:pattern>
	<sch:pattern id="p-pqrs-2.16.840.1.113883.10.20.24.3.37-warnings">
		<sch:rule id="r-pqrs-2.16.840.1.113883.10.20.24.3.37-warnings-abstract" abstract="true">
			<sch:extends rule="r-pqrs-2.16.840.1.113883.10.20.22.4.44-warnings-abstract"/>
		</sch:rule>
		<sch:rule id="r-pqrs-2.16.840.1.113883.10.20.24.3.37-warnings" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.37']]">
			<sch:extends rule="r-pqrs-2.16.840.1.113883.10.20.24.3.37-warnings-abstract"/>
		</sch:rule>
	</sch:pattern>
	<sch:pattern id="p-pqrs-2.16.840.1.113883.10.20.24.3.11-warnings">
		<sch:rule id="r-pqrs-2.16.840.1.113883.10.20.24.3.11-warnings-abstract" abstract="true">
			<sch:extends rule="r-pqrs-2.16.840.1.113883.10.20.22.4.4-warnings-abstract"/>
		</sch:rule>
		<sch:rule id="r-pqrs-2.16.840.1.113883.10.20.24.3.11-warnings" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.11']]">
			<sch:extends rule="r-pqrs-2.16.840.1.113883.10.20.24.3.11-warnings-abstract"/>
		</sch:rule>
	</sch:pattern>
	<sch:pattern id="p-pqrs-2.16.840.1.113883.10.20.24.3.13-warnings">
		<sch:rule id="r-pqrs-2.16.840.1.113883.10.20.24.3.13-warnings-abstract" abstract="true">
			<sch:extends rule="r-pqrs-2.16.840.1.113883.10.20.22.4.4-warnings-abstract"/>
		</sch:rule>
		<sch:rule id="r-pqrs-2.16.840.1.113883.10.20.24.3.13-warnings" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.13']]">
			<sch:extends rule="r-pqrs-2.16.840.1.113883.10.20.24.3.13-warnings-abstract"/>
		</sch:rule>
	</sch:pattern>
	<sch:pattern id="p-pqrs-2.16.840.1.113883.10.20.24.3.14-warnings">
		<sch:rule id="r-pqrs-2.16.840.1.113883.10.20.24.3.14-warnings-abstract" abstract="true">
			<sch:extends rule="r-pqrs-2.16.840.1.113883.10.20.22.4.4-warnings-abstract"/>
		</sch:rule>
		<sch:rule id="r-pqrs-2.16.840.1.113883.10.20.24.3.14-warnings" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.14']]">
			<sch:extends rule="r-pqrs-2.16.840.1.113883.10.20.24.3.14-warnings-abstract"/>
		</sch:rule>
	</sch:pattern>
	<sch:pattern id="p-pqrs-2.16.840.1.113883.10.20.24.3.41-warnings">
		<sch:rule id="r-pqrs-2.16.840.1.113883.10.20.24.3.41-warnings-abstract" abstract="true">
			<sch:extends rule="r-pqrs-2.16.840.1.113883.10.20.22.4.16-warnings-abstract"/>
		</sch:rule>
		<sch:rule id="r-pqrs-2.16.840.1.113883.10.20.24.3.41-warnings" context="cda:substanceAdministration[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.41']]">
			<sch:extends rule="r-pqrs-2.16.840.1.113883.10.20.24.3.41-warnings-abstract"/>
		</sch:rule>
	</sch:pattern>
	<sch:pattern id="p-pqrs-2.16.840.1.113883.10.20.24.3.5-warnings">
		<sch:rule id="r-pqrs-2.16.840.1.113883.10.20.24.3.5-warnings-abstract" abstract="true">
			<sch:extends rule="r-pqrs-2.16.840.1.113883.10.20.24.3.90-warnings-abstract"/>
		</sch:rule>
		<sch:rule id="r-pqrs-2.16.840.1.113883.10.20.24.3.5-warnings" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.5']]">
			<sch:extends rule="r-pqrs-2.16.840.1.113883.10.20.24.3.5-warnings-abstract"/>
		</sch:rule>
	</sch:pattern>
	<sch:pattern id="p-pqrs-2.16.840.1.113883.10.20.24.3.6-warnings">
		<sch:rule id="r-pqrs-2.16.840.1.113883.10.20.24.3.6-warnings-abstract" abstract="true">
			<sch:extends rule="r-pqrs-2.16.840.1.113883.10.20.24.3.90-warnings-abstract"/>
		</sch:rule>
		<sch:rule id="r-pqrs-2.16.840.1.113883.10.20.24.3.6-warnings" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.6']]">
			<sch:extends rule="r-pqrs-2.16.840.1.113883.10.20.24.3.6-warnings-abstract"/>
		</sch:rule>
	</sch:pattern>
	<sch:pattern id="p-pqrs-2.16.840.1.113883.10.20.24.3.8-warnings">
		<sch:rule id="r-pqrs-2.16.840.1.113883.10.20.24.3.8-warnings-abstract" abstract="true">
			<sch:extends rule="r-pqrs-2.16.840.1.113883.10.20.24.3.90-warnings-abstract"/>
		</sch:rule>
		<sch:rule id="r-pqrs-2.16.840.1.113883.10.20.24.3.8-warnings" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.8']]">
			<sch:extends rule="r-pqrs-2.16.840.1.113883.10.20.24.3.8-warnings-abstract"/>
		</sch:rule>
	</sch:pattern>
	<sch:pattern id="p-pqrs-2.16.840.1.113883.10.20.24.3.94-warnings">
		<sch:rule id="r-pqrs-2.16.840.1.113883.10.20.24.3.94-warnings-abstract" abstract="true">
			<sch:extends rule="r-pqrs-2.16.840.1.113883.10.20.22.4.6-warnings-abstract"/>
		</sch:rule>
		<sch:rule id="r-pqrs-2.16.840.1.113883.10.20.24.3.94-warnings" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.94']]">
			<sch:extends rule="r-pqrs-2.16.840.1.113883.10.20.24.3.94-warnings-abstract"/>
		</sch:rule>
	</sch:pattern>
	<sch:pattern id="p-pqrs-2.16.840.1.113883.10.20.24.3.95-warnings">
		<sch:rule id="r-pqrs-2.16.840.1.113883.10.20.24.3.95-warnings-abstract" abstract="true">
			<sch:extends rule="r-pqrs-2.16.840.1.113883.10.20.22.4.6-warnings-abstract"/>
		</sch:rule>
		<sch:rule id="r-pqrs-2.16.840.1.113883.10.20.24.3.95-warnings" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.95']]">
			<sch:extends rule="r-pqrs-2.16.840.1.113883.10.20.24.3.95-warnings-abstract"/>
		</sch:rule>
	</sch:pattern>
	<sch:pattern id="p-pqrs-2.16.840.1.113883.10.20.24.3.96-warnings">
		<sch:rule id="r-pqrs-2.16.840.1.113883.10.20.24.3.96-warnings-abstract" abstract="true">
			<sch:extends rule="r-pqrs-2.16.840.1.113883.10.20.22.4.6-warnings-abstract"/>
		</sch:rule>
		<sch:rule id="r-pqrs-2.16.840.1.113883.10.20.24.3.96-warnings" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.96']]">
			<sch:extends rule="r-pqrs-2.16.840.1.113883.10.20.24.3.96-warnings-abstract"/>
		</sch:rule>
	</sch:pattern>
	<sch:pattern id="p-pqrs-2.16.840.1.113883.10.20.24.3.76-warnings">
		<sch:rule id="r-pqrs-2.16.840.1.113883.10.20.24.3.76-warnings-abstract" abstract="true">
			<sch:extends rule="r-pqrs-2.16.840.1.113883.10.20.22.4.4-warnings-abstract"/>
		</sch:rule>
		<sch:rule id="r-pqrs-2.16.840.1.113883.10.20.24.3.76-warnings" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.76']]">
			<sch:extends rule="r-pqrs-2.16.840.1.113883.10.20.24.3.76-warnings-abstract"/>
		</sch:rule>
	</sch:pattern>
	<sch:pattern id="p-pqrs-2.16.840.1.113883.10.20.24.3.78-warnings">
		<sch:rule id="r-pqrs-2.16.840.1.113883.10.20.24.3.78-warnings-abstract" abstract="true">
			<sch:extends rule="r-pqrs-2.16.840.1.113883.10.20.22.4.4-warnings-abstract"/>
		</sch:rule>
		<sch:rule id="r-pqrs-2.16.840.1.113883.10.20.24.3.78-warnings" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.78']]">
			<sch:extends rule="r-pqrs-2.16.840.1.113883.10.20.24.3.78-warnings-abstract"/>
		</sch:rule>
	</sch:pattern>
	<sch:pattern id="p-pqrs-2.16.840.1.113883.10.20.24.3.79-warnings">
		<sch:rule id="r-pqrs-2.16.840.1.113883.10.20.24.3.79-warnings-abstract" abstract="true">
			<sch:extends rule="r-pqrs-2.16.840.1.113883.10.20.22.4.4-warnings-abstract"/>
		</sch:rule>
		<sch:rule id="r-pqrs-2.16.840.1.113883.10.20.24.3.79-warnings" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.79']]">
			<sch:extends rule="r-pqrs-2.16.840.1.113883.10.20.24.3.79-warnings-abstract"/>
		</sch:rule>
	</sch:pattern>
	<sch:pattern id="p-pqrs-2.16.840.1.113883.10.20.24.3.9-warnings">
		<sch:rule id="r-pqrs-2.16.840.1.113883.10.20.24.3.9-warnings-abstract" abstract="true">
			<sch:extends rule="r-pqrs-2.16.840.1.113883.10.20.22.4.43-warnings-abstract"/>
		</sch:rule>
		<sch:rule id="r-pqrs-2.16.840.1.113883.10.20.24.3.9-warnings" context="cda:supply[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.9']]">
			<sch:extends rule="r-pqrs-2.16.840.1.113883.10.20.24.3.9-warnings-abstract"/>
		</sch:rule>
	</sch:pattern>
	<sch:pattern id="p-pqrs-2.16.840.1.113883.10.20.24.3.10-warnings">
		<sch:rule id="r-pqrs-2.16.840.1.113883.10.20.24.3.10-warnings-abstract" abstract="true">
			<sch:extends rule="r-pqrs-2.16.840.1.113883.10.20.22.4.43-warnings-abstract"/>
		</sch:rule>
		<sch:rule id="r-pqrs-2.16.840.1.113883.10.20.24.3.10-warnings" context="cda:supply[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.10']]">
			<sch:extends rule="r-pqrs-2.16.840.1.113883.10.20.24.3.10-warnings-abstract"/>
		</sch:rule>
	</sch:pattern>
	<sch:pattern id="p-pqrs-2.16.840.1.113883.10.20.24.3.7-warnings">
		<sch:rule id="r-pqrs-2.16.840.1.113883.10.20.24.3.7-warnings-abstract" abstract="true">
			<sch:extends rule="r-pqrs-2.16.840.1.113883.10.20.22.4.14-warnings-abstract"/>
		</sch:rule>
		<sch:rule id="r-pqrs-2.16.840.1.113883.10.20.24.3.7-warnings" context="cda:procedure[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.7']]">
			<sch:extends rule="r-pqrs-2.16.840.1.113883.10.20.24.3.7-warnings-abstract"/>
		</sch:rule>
	</sch:pattern>
	<sch:pattern id="p-pqrs-2.16.840.1.113883.10.20.24.3.42-warnings">
		<sch:rule id="r-pqrs-2.16.840.1.113883.10.20.24.3.42-warnings-abstract" abstract="true">
    </sch:rule>
		<sch:rule id="r-pqrs-2.16.840.1.113883.10.20.24.3.42-warnings" context="cda:act[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.42']]">
			<sch:extends rule="r-pqrs-2.16.840.1.113883.10.20.24.3.42-warnings-abstract"/>
		</sch:rule>
	</sch:pattern>
	<sch:pattern id="p-pqrs-2.16.840.1.113883.10.20.24.3.48-warnings">
		<sch:rule id="r-pqrs-2.16.840.1.113883.10.20.24.3.48-warnings-abstract" abstract="true">
    </sch:rule>
		<sch:rule id="r-pqrs-2.16.840.1.113883.10.20.24.3.48-warnings" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.48']]">
			<sch:extends rule="r-pqrs-2.16.840.1.113883.10.20.24.3.48-warnings-abstract"/>
		</sch:rule>
	</sch:pattern>
	<sch:pattern id="p-pqrs-2.16.840.1.113883.10.20.24.3.67-warnings">
		<sch:rule id="r-pqrs-2.16.840.1.113883.10.20.24.3.67-warnings-abstract" abstract="true">
    </sch:rule>
		<sch:rule id="r-pqrs-2.16.840.1.113883.10.20.24.3.67-warnings" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.67']]">
			<sch:extends rule="r-pqrs-2.16.840.1.113883.10.20.24.3.67-warnings-abstract"/>
		</sch:rule>
	</sch:pattern>
	<sch:pattern id="p-pqrs-2.16.840.1.113883.10.20.22.4.69-warnings">
		<!--Pattern is used in an implied relationship.-->
		<sch:rule id="r-pqrs-2.16.840.1.113883.10.20.22.4.69-warnings-abstract" abstract="true">
    </sch:rule>
		<sch:rule id="r-pqrs-2.16.840.1.113883.10.20.22.4.69-warnings" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.69']]">
			<sch:extends rule="r-pqrs-2.16.840.1.113883.10.20.22.4.69-warnings-abstract"/>
		</sch:rule>
	</sch:pattern>
	<sch:pattern id="p-pqrs-2.16.840.1.113883.10.20.24.3.69-warnings">
		<sch:rule id="r-pqrs-2.16.840.1.113883.10.20.24.3.69-warnings-abstract" abstract="true">
			<sch:extends rule="r-pqrs-2.16.840.1.113883.10.20.22.4.69-warnings-abstract"/>
		</sch:rule>
		<sch:rule id="r-pqrs-2.16.840.1.113883.10.20.24.3.69-warnings" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.69']]">
			<sch:extends rule="r-pqrs-2.16.840.1.113883.10.20.24.3.69-warnings-abstract"/>
		</sch:rule>
	</sch:pattern>
	<sch:pattern id="p-pqrs-2.16.840.1.113883.10.20.22.4.79-warnings">
		<!--Pattern is used in an implied relationship.-->
		<sch:rule id="r-pqrs-2.16.840.1.113883.10.20.22.4.79-warnings-abstract" abstract="true">
    </sch:rule>
		<sch:rule id="r-pqrs-2.16.840.1.113883.10.20.22.4.79-warnings" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.79']]">
			<sch:extends rule="r-pqrs-2.16.840.1.113883.10.20.22.4.79-warnings-abstract"/>
		</sch:rule>
	</sch:pattern>
	<sch:pattern id="p-pqrs-2.16.840.1.113883.10.20.24.3.54-warnings">
		<sch:rule id="r-pqrs-2.16.840.1.113883.10.20.24.3.54-warnings-abstract" abstract="true">
			<sch:extends rule="r-pqrs-2.16.840.1.113883.10.20.22.4.79-warnings-abstract"/>
		</sch:rule>
		<sch:rule id="r-pqrs-2.16.840.1.113883.10.20.24.3.54-warnings" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.54']]">
			<sch:extends rule="r-pqrs-2.16.840.1.113883.10.20.24.3.54-warnings-abstract"/>
		</sch:rule>
	</sch:pattern>
	<sch:pattern id="p-pqrs-2.16.840.1.113883.10.20.24.3.51-warnings">
		<sch:rule id="r-pqrs-2.16.840.1.113883.10.20.24.3.51-warnings-abstract" abstract="true">
    </sch:rule>
		<sch:rule id="r-pqrs-2.16.840.1.113883.10.20.24.3.51-warnings" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.51']]">
			<sch:extends rule="r-pqrs-2.16.840.1.113883.10.20.24.3.51-warnings-abstract"/>
		</sch:rule>
	</sch:pattern>
	<sch:pattern id="p-pqrs-2.16.840.1.113883.10.20.24.3.55-warnings">
		<sch:rule id="r-pqrs-2.16.840.1.113883.10.20.24.3.55-warnings-abstract" abstract="true">
    </sch:rule>
		<sch:rule id="r-pqrs-2.16.840.1.113883.10.20.24.3.55-warnings" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.55']]">
			<sch:extends rule="r-pqrs-2.16.840.1.113883.10.20.24.3.55-warnings-abstract"/>
		</sch:rule>
	</sch:pattern>
	<sch:pattern id="p-pqrs-2.16.840.1.113883.10.20.24.3.47-warnings">
		<sch:rule id="r-pqrs-2.16.840.1.113883.10.20.24.3.47-warnings-abstract" abstract="true">
			<sch:assert id="a-12603" test="not(cda:doseQuantity) or (string-length(cda:doseQuantity/@unit) &gt; 0)">The doseQuantity, if present, SHOULD contain zero or one [0..1] @unit, which SHALL be selected from ValueSet UCUM Units of Measure (case sensitive) 2.16.840.1.113883.1.11.12839 DYNAMIC (CONF:12603).</sch:assert>
			<sch:extends rule="r-pqrs-2.16.840.1.113883.10.20.22.4.42-warnings-abstract"/>
		</sch:rule>
		<sch:rule id="r-pqrs-2.16.840.1.113883.10.20.24.3.47-warnings" context="cda:substanceAdministration[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.47']]">
			<sch:extends rule="r-pqrs-2.16.840.1.113883.10.20.24.3.47-warnings-abstract"/>
		</sch:rule>
	</sch:pattern>
	<sch:pattern id="p-pqrs-2.16.840.1.113883.10.20.24.3.59-warnings">
		<sch:rule id="r-pqrs-2.16.840.1.113883.10.20.24.3.59-warnings-abstract" abstract="true">
			<sch:extends rule="r-pqrs-2.16.840.1.113883.10.20.22.4.13-warnings-abstract"/>
		</sch:rule>
		<sch:rule id="r-pqrs-2.16.840.1.113883.10.20.24.3.59-warnings" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.59']]">
			<sch:extends rule="r-pqrs-2.16.840.1.113883.10.20.24.3.59-warnings-abstract"/>
		</sch:rule>
	</sch:pattern>
	<sch:pattern id="p-pqrs-2.16.840.1.113883.10.20.24.3.60-warnings">
		<sch:rule id="r-pqrs-2.16.840.1.113883.10.20.24.3.60-warnings-abstract" abstract="true">
			<sch:extends rule="r-pqrs-2.16.840.1.113883.10.20.22.4.44-warnings-abstract"/>
		</sch:rule>
		<sch:rule id="r-pqrs-2.16.840.1.113883.10.20.24.3.60-warnings" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.60']]">
			<sch:extends rule="r-pqrs-2.16.840.1.113883.10.20.24.3.60-warnings-abstract"/>
		</sch:rule>
	</sch:pattern>
	<sch:pattern id="p-pqrs-2.16.840.1.113883.10.20.24.3.58-warnings">
		<sch:rule id="r-pqrs-2.16.840.1.113883.10.20.24.3.58-warnings-abstract" abstract="true">
			<sch:extends rule="r-pqrs-2.16.840.1.113883.10.20.22.4.44-warnings-abstract"/>
		</sch:rule>
		<sch:rule id="r-pqrs-2.16.840.1.113883.10.20.24.3.58-warnings" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.58']]">
			<sch:extends rule="r-pqrs-2.16.840.1.113883.10.20.24.3.58-warnings-abstract"/>
		</sch:rule>
	</sch:pattern>
	<sch:pattern id="p-pqrs-2.16.840.1.113883.10.20.24.3.57-warnings">
		<sch:rule id="r-pqrs-2.16.840.1.113883.10.20.24.3.57-warnings-abstract" abstract="true">
			<sch:extends rule="r-pqrs-2.16.840.1.113883.10.20.22.4.2-warnings-abstract"/>
		</sch:rule>
		<sch:rule id="r-pqrs-2.16.840.1.113883.10.20.24.3.57-warnings" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.57']]">
			<sch:extends rule="r-pqrs-2.16.840.1.113883.10.20.24.3.57-warnings-abstract"/>
		</sch:rule>
	</sch:pattern>
	<sch:pattern id="p-pqrs-2.16.840.1.113883.10.20.24.3.26-warnings">
		<sch:rule id="r-pqrs-2.16.840.1.113883.10.20.24.3.26-warnings-abstract" abstract="true">
			<sch:extends rule="r-pqrs-2.16.840.1.113883.10.20.22.4.13-warnings-abstract"/>
		</sch:rule>
		<sch:rule id="r-pqrs-2.16.840.1.113883.10.20.24.3.26-warnings" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.26']]">
			<sch:extends rule="r-pqrs-2.16.840.1.113883.10.20.24.3.26-warnings-abstract"/>
		</sch:rule>
	</sch:pattern>
	<sch:pattern id="p-pqrs-2.16.840.1.113883.10.20.24.3.25-warnings">
		<sch:rule id="r-pqrs-2.16.840.1.113883.10.20.24.3.25-warnings-abstract" abstract="true">
			<sch:extends rule="r-pqrs-2.16.840.1.113883.10.20.22.4.44-warnings-abstract"/>
		</sch:rule>
		<sch:rule id="r-pqrs-2.16.840.1.113883.10.20.24.3.25-warnings" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.25']]">
			<sch:extends rule="r-pqrs-2.16.840.1.113883.10.20.24.3.25-warnings-abstract"/>
		</sch:rule>
	</sch:pattern>
	<sch:pattern id="p-pqrs-2.16.840.1.113883.10.20.24.2.1-warnings">
		<sch:rule id="r-pqrs-2.16.840.1.113883.10.20.24.2.1-warnings-abstract" abstract="true">
			<sch:extends rule="r-pqrs-2.16.840.1.113883.10.20.17.2.4-warnings-abstract"/>
		</sch:rule>
		<sch:rule id="r-pqrs-2.16.840.1.113883.10.20.24.2.1-warnings" context="cda:section[cda:templateId[@root='2.16.840.1.113883.10.20.24.2.1']]">
			<sch:extends rule="r-pqrs-2.16.840.1.113883.10.20.24.2.1-warnings-abstract"/>
		</sch:rule>
	</sch:pattern>
	<sch:pattern id="p-pqrs-2.16.840.1.113883.10.20.24.2.2-warnings">
		<sch:rule id="r-pqrs-2.16.840.1.113883.10.20.24.2.2-warnings-abstract" abstract="true">
    </sch:rule>
		<sch:rule id="r-pqrs-2.16.840.1.113883.10.20.24.2.2-warnings" context="cda:section[cda:templateId[@root='2.16.840.1.113883.10.20.24.2.2']]">
			<sch:extends rule="r-pqrs-2.16.840.1.113883.10.20.24.2.2-warnings-abstract"/>
		</sch:rule>
	</sch:pattern>
	<sch:pattern id="p-pqrs-2.16.840.1.113883.10.20.24.2.3-warnings">
		<sch:rule id="r-pqrs-2.16.840.1.113883.10.20.24.2.3-warnings-abstract" abstract="true">
			<sch:extends rule="r-pqrs-2.16.840.1.113883.10.20.24.2.2-warnings-abstract"/>
		</sch:rule>
		<sch:rule id="r-pqrs-2.16.840.1.113883.10.20.24.2.3-warnings" context="cda:section[cda:templateId[@root='2.16.840.1.113883.10.20.24.2.3']]">
			<sch:extends rule="r-pqrs-2.16.840.1.113883.10.20.24.2.3-warnings-abstract"/>
		</sch:rule>
	</sch:pattern>
	<sch:pattern id="p-pqrs-2.16.840.1.113883.10.20.24.3.98-warnings">
		<!--Pattern is used in an implied relationship.-->
		<sch:rule id="r-pqrs-2.16.840.1.113883.10.20.24.3.98-warnings-abstract" abstract="true">
    </sch:rule>
		<sch:rule id="r-pqrs-2.16.840.1.113883.10.20.24.3.98-warnings" context="cda:organizer[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.98']]">
			<sch:extends rule="r-pqrs-2.16.840.1.113883.10.20.24.3.98-warnings-abstract"/>
		</sch:rule>
		<sch:rule id="r-pqrs-2.16.840.1.113883.10.20.24.3.98-12982-branch-12982-warnings-abstract" abstract="true">
    </sch:rule>
		<sch:rule id="r-pqrs-2.16.840.1.113883.10.20.24.3.98-12982-branch-12982-warnings" context="cda:organizer[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.98']]/cda:reference[@typeCode='REFR'][cda:externalDocument]">
			<sch:extends rule="r-pqrs-2.16.840.1.113883.10.20.24.3.98-12982-branch-12982-warnings-abstract"/>
		</sch:rule>
	</sch:pattern>
	<sch:pattern id="p-pqrs-2.16.840.1.113883.10.20.24.3.97-warnings">
		<sch:rule id="r-pqrs-2.16.840.1.113883.10.20.24.3.97-warnings-abstract" abstract="true">
			<sch:extends rule="r-pqrs-2.16.840.1.113883.10.20.24.3.98-warnings-abstract"/>
		</sch:rule>
		<sch:rule id="r-pqrs-2.16.840.1.113883.10.20.24.3.97-warnings" context="cda:organizer[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.97']]">
			<sch:extends rule="r-pqrs-2.16.840.1.113883.10.20.24.3.97-warnings-abstract"/>
		</sch:rule>
		<sch:rule id="r-pqrs-2.16.840.1.113883.10.20.24.3.97-12808-branch-12808-warnings-abstract" abstract="true">
    </sch:rule>
		<sch:rule id="r-pqrs-2.16.840.1.113883.10.20.24.3.97-12808-branch-12808-warnings" context="cda:organizer[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.97']]/cda:reference[@typeCode='REFR']">
			<sch:extends rule="r-pqrs-2.16.840.1.113883.10.20.24.3.97-12808-branch-12808-warnings-abstract"/>
		</sch:rule>
	</sch:pattern>
	<sch:pattern id="p-pqrs-2.16.840.1.113883.10.20.24.3.27-warnings">
		<sch:rule id="r-pqrs-2.16.840.1.113883.10.20.24.3.27-warnings-abstract" abstract="true">
			<sch:extends rule="r-pqrs-2.16.840.1.113883.10.20.22.4.44-warnings-abstract"/>
		</sch:rule>
		<sch:rule id="r-pqrs-2.16.840.1.113883.10.20.24.3.27-warnings" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.27']]">
			<sch:extends rule="r-pqrs-2.16.840.1.113883.10.20.24.3.27-warnings-abstract"/>
		</sch:rule>
	</sch:pattern>
	<sch:pattern id="p-pqrs-2.16.840.1.113883.10.20.22.4.67-warnings">
		<!--Pattern is used in an implied relationship.-->
		<sch:rule id="r-pqrs-2.16.840.1.113883.10.20.22.4.67-warnings-abstract" abstract="true">
			<sch:extends rule="r-pqrs-2.16.840.1.113883.10.20.22.4.2-warnings-abstract"/>
		</sch:rule>
		<sch:rule id="r-pqrs-2.16.840.1.113883.10.20.22.4.67-warnings" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.67']]">
			<sch:extends rule="r-pqrs-2.16.840.1.113883.10.20.22.4.67-warnings-abstract"/>
		</sch:rule>
	</sch:pattern>
	<sch:pattern id="p-pqrs-2.16.840.1.113883.10.20.24.3.28-warnings">
		<sch:rule id="r-pqrs-2.16.840.1.113883.10.20.24.3.28-warnings-abstract" abstract="true">
			<sch:extends rule="r-pqrs-2.16.840.1.113883.10.20.22.4.67-warnings-abstract"/>
		</sch:rule>
		<sch:rule id="r-pqrs-2.16.840.1.113883.10.20.24.3.28-warnings" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.28']]">
			<sch:extends rule="r-pqrs-2.16.840.1.113883.10.20.24.3.28-warnings-abstract"/>
		</sch:rule>
	</sch:pattern>
	<sch:pattern id="p-pqrs-2.16.840.1.113883.10.20.24.3.77-warnings">
		<sch:rule id="r-pqrs-2.16.840.1.113883.10.20.24.3.77-warnings-abstract" abstract="true">
			<sch:extends rule="r-pqrs-2.16.840.1.113883.10.20.22.4.4-warnings-abstract"/>
		</sch:rule>
		<sch:rule id="r-pqrs-2.16.840.1.113883.10.20.24.3.77-warnings" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.77']]">
			<sch:extends rule="r-pqrs-2.16.840.1.113883.10.20.24.3.77-warnings-abstract"/>
		</sch:rule>
	</sch:pattern>
	<sch:pattern id="p-pqrs-2.16.840.1.113883.10.20.24.1.1-warnings">
		<sch:rule id="r-pqrs-2.16.840.1.113883.10.20.24.1.1-warnings-abstract" abstract="true">
			<sch:extends rule="r-pqrs-2.16.840.1.113883.10.20.22.1.1-warnings-abstract"/>
		</sch:rule>
		<sch:rule id="r-pqrs-2.16.840.1.113883.10.20.24.1.1-warnings" context="cda:ClinicalDocument[cda:templateId[@root='2.16.840.1.113883.10.20.24.1.1']]">
			<sch:extends rule="r-pqrs-2.16.840.1.113883.10.20.24.1.1-warnings-abstract"/>
		</sch:rule>
	</sch:pattern>
	<sch:pattern id="p-pqrs-2.16.840.1.113883.10.20.24.3.18-warnings">
		<sch:rule id="r-pqrs-2.16.840.1.113883.10.20.24.3.18-warnings-abstract" abstract="true">
			<sch:extends rule="r-pqrs-2.16.840.1.113883.10.20.22.4.13-warnings-abstract"/>
		</sch:rule>
		<sch:rule id="r-pqrs-2.16.840.1.113883.10.20.24.3.18-warnings" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.18']]">
			<sch:extends rule="r-pqrs-2.16.840.1.113883.10.20.24.3.18-warnings-abstract"/>
		</sch:rule>
	</sch:pattern>
	<sch:pattern id="p-pqrs-2.16.840.1.113883.10.20.24.1.2-warnings">
		<sch:rule id="r-pqrs-2.16.840.1.113883.10.20.24.1.2-warnings-abstract" abstract="true">
			<sch:assert id="a-CMS_0008" test="cda:recordTarget/cda:patientRole/cda:addr[count(cda:postalCode)=1]">SHOULD contain zero or one [0..1] postalCode (CONF:CMS_0008).</sch:assert>
			<sch:assert id="a-CMS_0009" test="cda:recordTarget/cda:patientRole/cda:addr[count(cda:country) =1]">SHOULD contain zero or one [0..1] country (CONF:CMS_0009).</sch:assert>
			<sch:assert id="a-7293" test="cda:recordTarget/cda:patientRole/cda:addr[count(cda:state)=1]">SHOULD contain zero or one [0..1] state (ValueSet: StateValueSet 2.16.840.1.113883.3.88.12.80.1 DYNAMIC) (CONF:7293).</sch:assert>
			<sch:extends rule="r-pqrs-2.16.840.1.113883.10.20.24.1.1-warnings-abstract"/>
		</sch:rule>
		<sch:rule id="r-pqrs-2.16.840.1.113883.10.20.24.1.2-warnings" context="cda:ClinicalDocument[cda:templateId[@root='2.16.840.1.113883.10.20.24.1.2']]">
			<sch:extends rule="r-pqrs-2.16.840.1.113883.10.20.24.1.2-warnings-abstract"/>
		</sch:rule>
		<sch:rule id="r-pqrs-2.16.840.1.113883.10.20.24.1.2-16579-branch-16579-warnings-abstract" abstract="true">
    </sch:rule>
		<sch:rule id="r-pqrs-2.16.840.1.113883.10.20.24.1.2-16579-branch-16579-warnings" context="cda:ClinicalDocument[cda:templateId[@root='2.16.840.1.113883.10.20.24.1.2']]/cda:documentationOf[cda:serviceEvent[@classCode='PCPR'][cda:performer[@typeCode='PRF'][cda:assignedEntity[cda:representedOrganization]]]]">
			<sch:extends rule="r-pqrs-2.16.840.1.113883.10.20.24.1.2-16579-branch-16579-warnings-abstract"/>
		</sch:rule>
	</sch:pattern>
	<sch:pattern id="p-pqrs-2.16.840.1.113883.10.20.24.3.81-warnings">
		<sch:rule id="r-pqrs-2.16.840.1.113883.10.20.24.3.81-warnings-abstract" abstract="true">
    </sch:rule>
		<sch:rule id="r-pqrs-2.16.840.1.113883.10.20.24.3.81-warnings" context="cda:participant[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.81']]">
			<sch:extends rule="r-pqrs-2.16.840.1.113883.10.20.24.3.81-warnings-abstract"/>
		</sch:rule>
	</sch:pattern>
	<sch:pattern id="p-pqrs-2.16.840.1.113883.10.20.24.3.100-warnings">
		<sch:rule id="r-pqrs-2.16.840.1.113883.10.20.24.3.100-warnings-abstract" abstract="true">
    </sch:rule>
		<sch:rule id="r-pqrs-2.16.840.1.113883.10.20.24.3.100-warnings" context="cda:participant[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.100']]">
			<sch:extends rule="r-pqrs-2.16.840.1.113883.10.20.24.3.100-warnings-abstract"/>
		</sch:rule>
	</sch:pattern>
	<sch:pattern id="p-pqrs-2.16.840.1.113883.10.20.24.3.19-warnings">
		<sch:rule id="r-pqrs-2.16.840.1.113883.10.20.24.3.19-warnings-abstract" abstract="true">
			<sch:extends rule="r-pqrs-2.16.840.1.113883.10.20.22.4.44-warnings-abstract"/>
		</sch:rule>
		<sch:rule id="r-pqrs-2.16.840.1.113883.10.20.24.3.19-warnings" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.19']]">
			<sch:extends rule="r-pqrs-2.16.840.1.113883.10.20.24.3.19-warnings-abstract"/>
		</sch:rule>
	</sch:pattern>
	<sch:pattern id="p-pqrs-2.16.840.1.113883.10.20.24.3.17-warnings">
		<sch:rule id="r-pqrs-2.16.840.1.113883.10.20.24.3.17-warnings-abstract" abstract="true">
			<sch:extends rule="r-pqrs-2.16.840.1.113883.10.20.22.4.44-warnings-abstract"/>
		</sch:rule>
		<sch:rule id="r-pqrs-2.16.840.1.113883.10.20.24.3.17-warnings" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.17']]">
			<sch:extends rule="r-pqrs-2.16.840.1.113883.10.20.24.3.17-warnings-abstract"/>
		</sch:rule>
	</sch:pattern>
	<sch:pattern id="p-pqrs-2.16.840.1.113883.10.20.24.3.29-warnings">
		<sch:rule id="r-pqrs-2.16.840.1.113883.10.20.24.3.29-warnings-abstract" abstract="true">
			<sch:extends rule="r-pqrs-2.16.840.1.113883.10.20.24.3.104-warnings-abstract"/>
		</sch:rule>
		<sch:rule id="r-pqrs-2.16.840.1.113883.10.20.24.3.29-warnings" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.29']]">
			<sch:extends rule="r-pqrs-2.16.840.1.113883.10.20.24.3.29-warnings-abstract"/>
		</sch:rule>
	</sch:pattern>
	<sch:pattern id="p-pqrs-2.16.840.1.113883.10.20.24.3.32-warnings">
		<sch:rule id="r-pqrs-2.16.840.1.113883.10.20.24.3.32-warnings-abstract" abstract="true">
			<sch:extends rule="r-pqrs-2.16.840.1.113883.10.20.22.4.12-warnings-abstract"/>
		</sch:rule>
		<sch:rule id="r-pqrs-2.16.840.1.113883.10.20.24.3.32-warnings" context="cda:act[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.32']]">
			<sch:extends rule="r-pqrs-2.16.840.1.113883.10.20.24.3.32-warnings-abstract"/>
		</sch:rule>
	</sch:pattern>
	<sch:pattern id="p-pqrs-2.16.840.1.113883.10.20.24.3.30-warnings">
		<sch:rule id="r-pqrs-2.16.840.1.113883.10.20.24.3.30-warnings-abstract" abstract="true">
			<sch:extends rule="r-pqrs-2.16.840.1.113883.10.20.24.3.104-warnings-abstract"/>
		</sch:rule>
		<sch:rule id="r-pqrs-2.16.840.1.113883.10.20.24.3.30-warnings" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.30']]">
			<sch:extends rule="r-pqrs-2.16.840.1.113883.10.20.24.3.30-warnings-abstract"/>
		</sch:rule>
	</sch:pattern>
	<sch:pattern id="p-pqrs-2.16.840.1.113883.10.20.24.3.34-warnings">
		<sch:rule id="r-pqrs-2.16.840.1.113883.10.20.24.3.34-warnings-abstract" abstract="true">
			<sch:extends rule="r-pqrs-2.16.840.1.113883.10.20.22.4.12-warnings-abstract"/>
		</sch:rule>
		<sch:rule id="r-pqrs-2.16.840.1.113883.10.20.24.3.34-warnings" context="cda:act[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.34']]">
			<sch:extends rule="r-pqrs-2.16.840.1.113883.10.20.24.3.34-warnings-abstract"/>
		</sch:rule>
	</sch:pattern>
	<sch:pattern id="p-pqrs-2.16.840.1.113883.10.20.24.3.31-warnings">
		<sch:rule id="r-pqrs-2.16.840.1.113883.10.20.24.3.31-warnings-abstract" abstract="true">
			<sch:extends rule="r-pqrs-2.16.840.1.113883.10.20.22.4.39-warnings-abstract"/>
		</sch:rule>
		<sch:rule id="r-pqrs-2.16.840.1.113883.10.20.24.3.31-warnings" context="cda:act[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.31']]">
			<sch:extends rule="r-pqrs-2.16.840.1.113883.10.20.24.3.31-warnings-abstract"/>
		</sch:rule>
	</sch:pattern>
	<sch:pattern id="p-pqrs-2.16.840.1.113883.10.20.24.3.75-warnings">
		<sch:rule id="r-pqrs-2.16.840.1.113883.10.20.24.3.75-warnings-abstract" abstract="true">
			<sch:extends rule="r-pqrs-2.16.840.1.113883.10.20.22.4.42-warnings-abstract"/>
		</sch:rule>
		<sch:rule id="r-pqrs-2.16.840.1.113883.10.20.24.3.75-warnings" context="cda:substanceAdministration[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.75']]">
			<sch:extends rule="r-pqrs-2.16.840.1.113883.10.20.24.3.75-warnings-abstract"/>
		</sch:rule>
	</sch:pattern>
	<sch:pattern id="p-pqrs-2.16.840.1.113883.10.20.24.3.33-warnings">
		<sch:rule id="r-pqrs-2.16.840.1.113883.10.20.24.3.33-warnings-abstract" abstract="true">
			<sch:extends rule="r-pqrs-2.16.840.1.113883.10.20.22.4.39-warnings-abstract"/>
		</sch:rule>
		<sch:rule id="r-pqrs-2.16.840.1.113883.10.20.24.3.33-warnings" context="cda:act[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.33']]">
			<sch:extends rule="r-pqrs-2.16.840.1.113883.10.20.24.3.33-warnings-abstract"/>
		</sch:rule>
	</sch:pattern>
	<sch:pattern id="p-pqrs-2.16.840.1.113883.10.20.24.3.20-warnings">
		<sch:rule id="r-pqrs-2.16.840.1.113883.10.20.24.3.20-warnings-abstract" abstract="true">
			<sch:extends rule="r-pqrs-2.16.840.1.113883.10.20.22.4.2-warnings-abstract"/>
		</sch:rule>
		<sch:rule id="r-pqrs-2.16.840.1.113883.10.20.24.3.20-warnings" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.20']]">
			<sch:extends rule="r-pqrs-2.16.840.1.113883.10.20.24.3.20-warnings-abstract"/>
		</sch:rule>
	</sch:pattern>
	<sch:pattern id="p-pqrs-2.16.840.1.113883.10.20.24.3.99-warnings">
		<sch:rule id="r-pqrs-2.16.840.1.113883.10.20.24.3.99-warnings-abstract" abstract="true">
			<sch:extends rule="r-pqrs-2.16.840.1.113883.10.20.22.4.43-warnings-abstract"/>
		</sch:rule>
		<sch:rule id="r-pqrs-2.16.840.1.113883.10.20.24.3.99-warnings" context="cda:supply[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.99']]">
			<sch:extends rule="r-pqrs-2.16.840.1.113883.10.20.24.3.99-warnings-abstract"/>
		</sch:rule>
	</sch:pattern>
	<sch:pattern id="p-pqrs-2.16.840.1.113883.10.20.24.3.45-warnings">
		<sch:rule id="r-pqrs-2.16.840.1.113883.10.20.24.3.45-warnings-abstract" abstract="true">
			<sch:extends rule="r-pqrs-2.16.840.1.113883.10.20.22.4.18-warnings-abstract"/>
		</sch:rule>
		<sch:rule id="r-pqrs-2.16.840.1.113883.10.20.24.3.45-warnings" context="cda:supply[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.45']]">
			<sch:extends rule="r-pqrs-2.16.840.1.113883.10.20.24.3.45-warnings-abstract"/>
		</sch:rule>
	</sch:pattern>
	<sch:pattern id="p-pqrs-2.16.840.1.113883.10.20.24.3.36-warnings">
		<sch:rule id="r-pqrs-2.16.840.1.113883.10.20.24.3.36-warnings-abstract" abstract="true">
			<sch:extends rule="r-pqrs-2.16.840.1.113883.10.20.24.3.104-warnings-abstract"/>
		</sch:rule>
		<sch:rule id="r-pqrs-2.16.840.1.113883.10.20.24.3.36-warnings" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.36']]">
			<sch:extends rule="r-pqrs-2.16.840.1.113883.10.20.24.3.36-warnings-abstract"/>
		</sch:rule>
	</sch:pattern>
	<sch:pattern id="p-pqrs-2.16.840.1.113883.10.20.24.3.35-warnings">
		<sch:rule id="r-pqrs-2.16.840.1.113883.10.20.24.3.35-warnings-abstract" abstract="true">
			<sch:extends rule="r-pqrs-2.16.840.1.113883.10.20.24.3.104-warnings-abstract"/>
		</sch:rule>
		<sch:rule id="r-pqrs-2.16.840.1.113883.10.20.24.3.35-warnings" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.35']]">
			<sch:extends rule="r-pqrs-2.16.840.1.113883.10.20.24.3.35-warnings-abstract"/>
		</sch:rule>
	</sch:pattern>
	<sch:pattern id="p-pqrs-2.16.840.1.113883.10.20.24.3.46-warnings">
		<sch:rule id="r-pqrs-2.16.840.1.113883.10.20.24.3.46-warnings-abstract" abstract="true">
			<sch:extends rule="r-pqrs-2.16.840.1.113883.10.20.22.4.7-warnings-abstract"/>
		</sch:rule>
		<sch:rule id="r-pqrs-2.16.840.1.113883.10.20.24.3.46-warnings" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.46']]">
			<sch:extends rule="r-pqrs-2.16.840.1.113883.10.20.24.3.46-warnings-abstract"/>
		</sch:rule>
	</sch:pattern>
	<sch:pattern id="p-pqrs-2.16.840.1.113883.10.20.24.3.43-warnings">
		<sch:rule id="r-pqrs-2.16.840.1.113883.10.20.24.3.43-warnings-abstract" abstract="true">
			<sch:extends rule="r-pqrs-2.16.840.1.113883.10.20.22.4.7-warnings-abstract"/>
		</sch:rule>
		<sch:rule id="r-pqrs-2.16.840.1.113883.10.20.24.3.43-warnings" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.43']]">
			<sch:extends rule="r-pqrs-2.16.840.1.113883.10.20.24.3.43-warnings-abstract"/>
		</sch:rule>
	</sch:pattern>
	<sch:pattern id="p-pqrs-2.16.840.1.113883.10.20.24.3.44-warnings">
		<sch:rule id="r-pqrs-2.16.840.1.113883.10.20.24.3.44-warnings-abstract" abstract="true">
			<sch:extends rule="r-pqrs-2.16.840.1.113883.10.20.22.4.7-warnings-abstract"/>
		</sch:rule>
		<sch:rule id="r-pqrs-2.16.840.1.113883.10.20.24.3.44-warnings" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.44']]">
			<sch:extends rule="r-pqrs-2.16.840.1.113883.10.20.24.3.44-warnings-abstract"/>
		</sch:rule>
	</sch:pattern>
	<sch:pattern id="p-pqrs-2.16.840.1.113883.10.20.24.3.12-warnings">
		<sch:rule id="r-pqrs-2.16.840.1.113883.10.20.24.3.12-warnings-abstract" abstract="true">
			<sch:extends rule="r-pqrs-2.16.840.1.113883.10.20.22.4.45-warnings-abstract"/>
		</sch:rule>
		<sch:rule id="r-pqrs-2.16.840.1.113883.10.20.24.3.12-warnings" context="cda:organizer[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.12']]">
			<sch:extends rule="r-pqrs-2.16.840.1.113883.10.20.24.3.12-warnings-abstract"/>
		</sch:rule>
	</sch:pattern>
	<sch:pattern id="p-pqrs-2.16.840.1.113883.10.20.22.4.72-warnings">
		<sch:rule id="r-pqrs-2.16.840.1.113883.10.20.22.4.72-warnings-abstract" abstract="true">
    </sch:rule>
		<sch:rule id="r-pqrs-2.16.840.1.113883.10.20.22.4.72-warnings" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.72']]">
			<sch:extends rule="r-pqrs-2.16.840.1.113883.10.20.22.4.72-warnings-abstract"/>
		</sch:rule>
	</sch:pattern>
	<sch:pattern id="p-pqrs-2.16.840.1.113883.10.20.22.4.80-warnings">
		<sch:rule id="r-pqrs-2.16.840.1.113883.10.20.22.4.80-warnings-abstract" abstract="true">
    </sch:rule>
		<sch:rule id="r-pqrs-2.16.840.1.113883.10.20.22.4.80-warnings" context="cda:act[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.80']]">
			<sch:extends rule="r-pqrs-2.16.840.1.113883.10.20.22.4.80-warnings-abstract"/>
		</sch:rule>
	</sch:pattern>
	<sch:pattern id="p-pqrs-2.16.840.1.113883.10.20.24.3.102-warnings">
		<sch:rule id="r-pqrs-2.16.840.1.113883.10.20.24.3.102-warnings-abstract" abstract="true">
    </sch:rule>
		<sch:rule id="r-pqrs-2.16.840.1.113883.10.20.24.3.102-warnings" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.102']]">
			<sch:extends rule="r-pqrs-2.16.840.1.113883.10.20.24.3.102-warnings-abstract"/>
		</sch:rule>
	</sch:pattern>
	<sch:pattern id="p-pqrs-2.16.840.1.113883.10.20.24.3.101-warnings">
		<sch:rule id="r-pqrs-2.16.840.1.113883.10.20.24.3.101-warnings-abstract" abstract="true">
    </sch:rule>
		<sch:rule id="r-pqrs-2.16.840.1.113883.10.20.24.3.101-warnings" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.101']]">
			<sch:extends rule="r-pqrs-2.16.840.1.113883.10.20.24.3.101-warnings-abstract"/>
		</sch:rule>
	</sch:pattern>
	<sch:pattern id="p-pqrs-2.16.840.1.113883.10.20.24.3.103-warnings">
		<sch:rule id="r-pqrs-2.16.840.1.113883.10.20.24.3.103-warnings-abstract" abstract="true">
    </sch:rule>
		<sch:rule id="r-pqrs-2.16.840.1.113883.10.20.24.3.103-warnings" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.103']]">
			<sch:extends rule="r-pqrs-2.16.840.1.113883.10.20.24.3.103-warnings-abstract"/>
		</sch:rule>
	</sch:pattern>
	<sch:pattern id="p-pqrs-2.16.840.1.113883.10.20.24.3.105-warnings">
		<sch:rule id="r-pqrs-2.16.840.1.113883.10.20.24.3.105-warnings-abstract" abstract="true">
    </sch:rule>
		<sch:rule id="r-pqrs-2.16.840.1.113883.10.20.24.3.105-warnings" context="cda:act[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.105']]">
			<sch:extends rule="r-pqrs-2.16.840.1.113883.10.20.24.3.105-warnings-abstract"/>
		</sch:rule>
	</sch:pattern>
	<sch:pattern id="p-pqrs-2.16.840.1.113883.10.20.22.4.85-warnings">
		<sch:rule id="r-pqrs-2.16.840.1.113883.10.20.22.4.85-warnings-abstract" abstract="true">
    </sch:rule>
		<sch:rule id="r-pqrs-2.16.840.1.113883.10.20.22.4.85-warnings" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.85']]">
			<sch:extends rule="r-pqrs-2.16.840.1.113883.10.20.22.4.85-warnings-abstract"/>
		</sch:rule>
	</sch:pattern>
	<sch:pattern id="p-pqrs-2.16.840.1.113883.10.20.22.4.86-warnings">
		<sch:rule id="r-pqrs-2.16.840.1.113883.10.20.22.4.86-warnings-abstract" abstract="true">
    </sch:rule>
		<sch:rule id="r-pqrs-2.16.840.1.113883.10.20.22.4.86-warnings" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.86']]">
			<sch:extends rule="r-pqrs-2.16.840.1.113883.10.20.22.4.86-warnings-abstract"/>
		</sch:rule>
	</sch:pattern>
	<sch:pattern id="p-pqrs-length-checking-validation-rules">
		<sch:rule id="r-pqrs-length-checking-clinical-document" context="cda:ClinicalDocument">
			<sch:assert test="cda:checkLength(cda:id[1]/@root, 64, 'Y')">PQRS_10711: /ClinicalDocument/id/@root value SHALL not exceed the maximum allowable length 64.</sch:assert>
			<sch:assert test="cda:checkLength(cda:id[1]/@extension, 50, 'N')">PQRS_10711: /ClinicalDocument/id/@extension value SHALL not exceed the maximum allowable length 50.</sch:assert>
			<sch:assert test="cda:checkLength(cda:setId[1]/@root, 64, 'N')">PQRS_10711: /ClinicalDocument/setId/@root value SHALL not exceed the maximum allowable length 64.</sch:assert>
			<sch:assert test="cda:checkLength(cda:setId[1]/@extension, 50, 'N')">PQRS_10711: /ClinicalDocument/setId/@extension value SHALL not exceed the maximum allowable length 50.</sch:assert>
		</sch:rule>
		<sch:rule id="r-pqrs-length-checking-patient-name" context="cda:ClinicalDocument/cda:recordTarget/cda:patientRole/cda:patient/cda:name">
			<sch:assert test="cda:checkLength(cda:given[1], 30, 'N')">PQRS_10711: /ClinicalDocument/recordTarget/patientRole/patient/name/given value SHALL not exceed the maximum allowable length 30.</sch:assert>
			<sch:assert test="cda:checkLength(cda:family[1], 30, 'N')">PQRS_10711: /ClinicalDocument/recordTarget/patientRole/patient/name/family value SHALL not exceed the maximum allowable length 30.</sch:assert>
		</sch:rule>
		<sch:rule context="cda:ClinicalDocument/cda:recordTarget/cda:patientRole">
			<sch:assert test="cda:checkLength(cda:id[not(@root='2.16.840.1.113883.4.572')][1]/@root, 64, 'N')">PQRS_10711: /ClinicalDocument/recordTarget/patientRole/id/@root value SHALL not exceed the maximum allowable length 64.</sch:assert>
			<sch:assert test="cda:checkLength(cda:id[not(@root='2.16.840.1.113883.4.572')][1]/@extension, 50, 'N')">PQRS_10711: /ClinicalDocument/recordTarget/patientRole/id/@extension value SHALL not exceed the maximum allowable length 50.</sch:assert>
		</sch:rule>
		<sch:rule context="cda:ClinicalDocument/cda:recordTarget/cda:patientRole/cda:addr">
			<sch:assert test="cda:checkLength(cda:streetAddressLine[1], 50, 'N')">PQRS_10711: /ClinicalDocument/recordTarget/patientRole/addr/streetAddressLine value SHALL not exceed the maximum allowable length 50.</sch:assert>
			<sch:assert test="cda:checkLength(cda:city[1], 40, 'N')">PQRS_10711: /ClinicalDocument/recordTarget/patientRole/addr/city value SHALL not exceed the maximum allowable length 40.</sch:assert>
			<sch:assert test="cda:checkLength(cda:postalCode[1], 10, 'N')">PQRS_10711: /ClinicalDocument/recordTarget/patientRole/addr/postalCode value SHALL not exceed the maximum allowable length 10.</sch:assert>
		</sch:rule>
		<sch:rule context="cda:ClinicalDocument[cda:templateId/@root='2.16.840.1.113883.10.20.24.1.2']/cda:documentationOf/cda:serviceEvent[@classCode='PCPR']/cda:performer[@typeCode='PRF']/cda:assignedEntity/cda:representedOrganization">
			<sch:assert test="cda:checkLength(cda:name[1], 50, 'N')">PQRS_10711: /ClinicalDocument[templateId/@root='2.16.840.1.113883.10.20.24.1.2']/documentationOf/serviceEvent[@classCode="PCPR"]/performer[@typeCode="PRF"]/assignedEntity/representedOrganization/name value SHALL not exceed the maximum allowable length 50.</sch:assert>
			<sch:assert test="cda:checkLength(cda:telecom[1]/@value, 128, 'N')">PQRS_10711: /ClinicalDocument[templateId/@root='2.16.840.1.113883.10.20.24.1.2']/documentationOf/serviceEvent[@classCode="PCPR"]/performer[@typeCode="PRF"]/assignedEntity/representedOrganization/telecom/@value value SHALL not exceed the maximum allowable length 128.</sch:assert>
		</sch:rule>
		<sch:rule context="cda:ClinicalDocument[cda:templateId/@root='2.16.840.1.113883.10.20.24.1.2']/cda:documentationOf/cda:serviceEvent[@classCode='PCPR']/cda:performer[@typeCode='PRF']/cda:assignedEntity/cda:representedOrganization/cda:addr">
			<sch:assert test="cda:checkLength(cda:streetAddressLine[1], 50, 'N')">PQRS_10711: /ClinicalDocument[templateId/@root='2.16.840.1.113883.10.20.24.1.2']/documentationOf/serviceEvent[@classCode="PCPR"]/performer[@typeCode="PRF"]/assignedEntity/representedOrganization/addr/streetAddressLine value SHALL not exceed the maximum allowable length 50.</sch:assert>
			<sch:assert test="cda:checkLength(cda:city[1], 40, 'N')">PQRS_10711: /ClinicalDocument[templateId/@root='2.16.840.1.113883.10.20.24.1.2']/documentationOf/serviceEvent[@classCode="PCPR"]/performer[@typeCode="PRF"]/assignedEntity/representedOrganization/addr/city value SHALL not exceed the maximum allowable length 40.</sch:assert>
			<sch:assert test="cda:checkLength(cda:state[1], 2, 'N')">PQRS_10711: /ClinicalDocument[templateId/@root='2.16.840.1.113883.10.20.24.1.2']/documentationOf/serviceEvent[@classCode="PCPR"]/performer[@typeCode="PRF"]/assignedEntity/representedOrganization/addr/state value SHALL not exceed the maximum allowable length 2.</sch:assert>
			<sch:assert test="cda:checkLength(cda:postalCode[1], 10, 'N')">PQRS_10711: /ClinicalDocument[templateId/@root='2.16.840.1.113883.10.20.24.1.2']/documentationOf/serviceEvent[@classCode="PCPR"]/performer[@typeCode="PRF"]/assignedEntity/representedOrganization/addr/postalCode value SHALL not exceed the maximum allowable length 10.</sch:assert>
		</sch:rule>
		<sch:rule context="cda:observation[cda:templateId/@root='2.16.840.1.113883.10.20.24.3.40']">
			<sch:assert test="cda:checkLength(cda:value/@unit, 32, 'N')">PQRS_10711: cda:observation[cda:templateId/@root='2.16.840.1.113883.10.20.24.3.40']/value/@unit value SHALL not exceed the maximum allowable length 32.</sch:assert>
		</sch:rule>
		<sch:rule context="cda:observation[cda:templateId/@root='2.16.840.1.113883.10.20.24.3.57']">
			<sch:assert test="cda:checkLength(cda:value/@unit, 32, 'N')">PQRS_10711: cda:observation[cda:templateId/@root='2.16.840.1.113883.10.20.24.3.57']/value/@unit value SHALL not exceed the maximum allowable length 32.</sch:assert>
		</sch:rule>
		<sch:rule context="cda:observation[cda:templateId/@root='2.16.840.1.113883.10.20.24.3.69']">
			<sch:assert test="cda:checkLength(cda:value/@unit, 32, 'N')">PQRS_10711: cda:observation[cda:templateId/@root='2.16.840.1.113883.10.20.24.3.69']/value/@unit value SHALL not exceed the maximum allowable length 32.</sch:assert>
		</sch:rule>
		<sch:rule context="cda:observation[cda:templateId/@root='2.16.840.1.113883.10.20.24.3.87']">
			<sch:assert test="cda:checkLength(cda:value/@unit, 32, 'N')">PQRS_10711: cda:observation[cda:templateId/@root='2.16.840.1.113883.10.20.24.3.87']/value/@unit value SHALL not exceed the maximum allowable length 32.</sch:assert>
		</sch:rule>
		<sch:rule context="cda:substanceAdministration[cda:templateId/@root='2.16.840.1.113883.10.20.22.4.16']">
			<sch:assert test="cda:checkLength(cda:doseQuantity/@unit, 32, 'N')">PQRS_10711: cda:substanceAdministration[cda:templateId/@root='2.16.840.1.113883.10.20.22.4.16']/doseQuantity/@unit value SHALL not exceed the maximum allowable length 32.</sch:assert>
		</sch:rule>
		<sch:rule context="cda:substanceAdministration[cda:templateId/@root='2.16.840.1.113883.10.20.24.3.47']">
			<sch:assert test="cda:checkLength(cda:doseQuantity/@unit, 32, 'N')">PQRS_10711: cda:substanceAdministration[cda:templateId/@root='2.16.840.1.113883.10.20.24.3.47']/doseQuantity/@unit value SHALL not exceed the maximum allowable length 32.</sch:assert>
		</sch:rule>
	</sch:pattern>
	<!-- 
  	DECC August 2014 Release changes, added function to validate the negation indicator
  	   1) Returns true if the type is not CD(No validation). 
  	   2) Validate the code by calling isValueSetValidate function if the type is CD and return value based on the validation from this function.
  -->
</sch:schema>

# Mapping di Metadati tra INI e GTW

Questo documento fornisce una mappatura dei metadati tra i sistemi Gateway ed INI evidenziando le fonti dei dati.

## Legenda delle Icone

| Icona             | Descrizione                                          |
|-------------------|------------------------------------------------------|
| :page_with_curl:  | Variabile dinamica proveniente da **Request body**   |
| :green_book:      | Variabile dinamica proveniente da **CDA**            |
| :key:             | Variabile dinamica proveniente da **JWT**            |
| :black_nib:       | Valore **statico**                                   |
| :pencil:          | Valore calcolato in maniera **dinamica** dal gateway | 

## Legenda delle colonne

| Display                           | Descrizione                                                                                                                                         |
|-----------------------------------|-----------------------------------------------------------------------------------------------------------------------------------------------------|
| Fonte                             | Indica la provenienza del dato(Request body, CDA, JWT, Statico, Calcolato in maniera dinamica) da dare al sistema Target(INI).                      |
| Identificatore di Trasformazione  | Indica l'elemento o la chiave che viene utilizzata per trasformare o associare i dati.                                                              |
| Esempio                           | Fornisce un esempio su come il dato può essere valorizzato. Nel caso di dato statico, la colonna riporta il valore esatto che il Gateway valorizza. |


## Tabella di Mapping
<h3>SAML</h3>
<table>
    <tr>
        <th colspan="3">Gateway</th>
        <th rowspan="2">INI</th>
    </tr>
    <tr>
        <th>Fonte</th>
        <th>Identificatore di Trasformazione</th>
        <th>Esempio</th>
    </tr>
    <tr>
        <td>:key:</td>
        <td><code>sub</code></td>
        <td>SSSMNN75B01F257L^^^&2.16.840.1.113883.2.9.4.3.2&ISO</td>
        <td><code>urn:oasis:names:tc:xacml:1.0:subject:subject-id</code></td>
    </tr>
    <tr>
        <td>:key:</td>
        <td><code>subject_organization_id</code></td>
        <td>120</td>
        <td><code>urn:oasis:names:tc:xspa:1.0:subject:organization-id</code></td>
    </tr>
    <tr>
        <td>:key:</td>
        <td><code>subject_organization</code></td>
        <td>Regione Lazio</td>
        <td><code>urn:oasis:names:tc:xspa:1.0:subject:organization</code></td>
    </tr>
    <tr>
        <td>:key:</td>
        <td><code>locality</code></td>
        <td>GTW^^^^^&2.16.840.1.113883.2.9.4.1.3&ISO^^^^GTW_STRUTTURA</td>
        <td><code>urn:oasis:names:tc:xspa:1.0:environment:locality</code></td>
    </tr>
    <tr>
        <td>:key:</td>
        <td><code>subject_role</code></td>
        <td>AAS</td>
        <td><code>urn:oasis:names:tc:xacml:2.0:subject:role</code></td>
    </tr>
    <tr>
        <td>:key:</td>
        <td><code>purpose_of_use</code></td>
        <td>TREATMENT</td>
        <td><code>urn:oasis:names:tc:xspa:1.0:subject:purposeofuse</code></td>
    </tr>
    <tr>
        <td>:key:</td>
        <td><code>resource_hl7_type</code></td>
        <td>('34105-7^^2.16.840.1.113883.6.1')</td>
        <td><code>urn:oasis:names:tc:xspa:1.0:resource:hl7:type</code></td>
    </tr>
    <tr>
        <td>:key:</td>
        <td><code>person_id</code></td>
        <td>ZCCSBT75C05I282D^^^&2.16.840.1.113883.2.9.4.3.2&ISO</td>
        <td><code>urn:oasis:names:tc:xacml:1.0:resource:resource-id</code></td>
    </tr>
    <tr>
        <td>:key:</td>
        <td><code>patient_consent</code></td>
        <td>true</td>
        <td><code>urn:oasis:names:tc:xspa:1.0:resource:patient:consent</code></td>
    </tr>
    <tr>
        <td>:key:</td>
        <td><code>action_id</code></td>
        <td>CREATE</td>
        <td><code>urn:oasis:names:tc:xacml:1.0:action:action-id</code></td>
    </tr>
    <tr>
        <td>:key:</td>
        <td><code>subject_application_id</code></td>
        <td>GTW_ID</td>
        <td><code>SubjectApplicationId</code></td>
    </tr>
    <tr>
        <td>:key:</td>
        <td><code>subject_application_vendor</code></td>
        <td>GTW_VENDOR</td>
        <td><code>SubjectApplicationVendor</code></td>
    </tr>
    <tr>
        <td>:key:</td>
        <td><code>subject_application_version</code></td>
        <td>GTW_VERSION</td>
        <td><code>SubjectApplicationVersion</code></td>
    </tr>
    <tr>
        <td>:black_nib:</td>
        <td></td>
        <td><strong>GTW_950</strong></td>
        <td><code>SubjectAuthenticator</code></td>
    </tr>
</table>
 
<h3>XDSDocumentEntry</h3>

<table>
    <tr>
        <th colspan="3">Gateway</th>
        <th rowspan="2">INI</th>
    </tr>
    <tr>
        <th>Fonte</th>
        <th>Logica di trasformazione</th>
        <th>Esempio</th>
    </tr>
    <tr>
        <td>:page_with_curl:</td>
        <td><code>tipologiaStruttura</code></td>
        <td>Ospedale</td>
        <td><code>healthcareFacilityTypeCode</code></td>
    </tr>
    <tr>
        <td>:green_book:</td> 
        <td>
            <table>
                <tr>
                    <td><code><strong>BASE PATH</strong>:ClinicalDocument &gt; recordTarget &gt; patientRole &gt; id</code>
                    </td>
                </tr>
                <tr>
                    <td><code><strong>COD FISCALE</strong>: BASE PATH@extension</code></td>
                </tr>
                <tr>
                    <td><code><strong>OID</strong>: BASE PATH@root</code></td>
                </tr>
            </table>
        </td> 
        <td>COD_FISCALE + "^^^&" + OID + "&ISO"</td>
        <td><code>patientId</code></td>
    </tr>
    <tr>
        <td>:black_nib:</td>
        <td></td>
        <td><strong>application/pdf+text/x-cda-r2+xml</strong></td>
        <td><code>mimeType</code></td>
    </tr>
    <tr>
        <td>:green_book:</td>
        <td>
            <table>
                <tr>
                    <td><code><strong>BASE PATH</strong>:ClinicalDocument &gt confidentialityCode</code></td>
                </tr>
            </table>
        </td>
        <td>
            <table>
                <tr>
                    <td>BASE PATH@code</td>
                    <td>BASE PATH@displayName</td>
                </tr>
            </table>
        </td>
        <td><code>confidentialityCode</code></td>
    </tr>
    <tr>
        <td>:page_with_curl:</td>
        <td><code>attiCliniciRegoleAccesso</code></td>
        <td>P99</td>
        <td><code>eventCodeList</code></td>
    </tr>
    <tr>
        <td>:page_with_curl:</td>
        <td><code>identificativoRep</code></td>
        <td>2.16.840.1.113883.2.9.2.120.4.5.111111</td>
        <td><code>repositoryUniqueId</code></td>
    </tr>
    <tr>
        <td>:page_with_curl:</td>
        <td><code>identificativoDoc</code></td>
        <td>2.16.840.1.113883.2.9.2.120.4.4^GTW_ID</td>
        <td><code>uniqueId</code></td>
    </tr>
    <tr>
        <td>:page_with_curl:</td>
        <td><code>tipoDocumentoLivAlto</code></td>
        <td>REF</td>
        <td><code>classCode</code></td>
    </tr>
    <tr>
        <td>:green_book:</td>
        <td>
            <table>
                <tr>
                    <td><code><strong>BASE PATH</strong>:ClinicalDocument &gt code</code></td>
                </tr>
            </table>
        </td>
        <td>
            <table>
                <tr>
                    <td>BASE PATH@code</td>
                    <td>BASE PATH@displayName</td>
                </tr>
            </table>
        </td>
        <td><code>typeCode</code></td>
    </tr>
    <tr>
        <td>:green_book:</td>
        <td>
            <table>
                <tr>
                    <td><code><strong>BASE PATH</strong>:ClinicalDocument &gt templateId</code></td>
                </tr>
            </table>
        </td>
        <td>BASEPATH@root</td>
        <td><code>formatCode</code></td>
    </tr>
    <tr>
        <td>:black_nib:</td>
        <td></td>
        <td><strong>urn:uuid:7edca82f-054d-47f2-a032-9b2a5b5186c1</strong></td>
        <td><code>entryUUID</code></td>
    </tr>
    <tr>
        <td>:green_book:</td>
        <td>
            <table>
                <tr>
                    <td><code><strong>BASE PATH</strong>:ClinicalDocument &gt effectiveTime</code></td>
                </tr>
            </table>
        </td>
        <td>BASE PATH@value</td>
        <td><code>creationTime</code></td>
    </tr>
    <tr>
        <td>:key:</td>
        <td><code>subject_role</code></td>
        <td>AAS</td>
        <td><code>authorRole</code></td>
    </tr>
    <tr>
        <td>:key:</td>
        <td><code>locality</code></td>
        <td>GTW_NAME^^^^^&2.16.840.1.113883.2.9.4.1.3&ISO^^^^GTW_STRUCTURE</td>
        <td><code>authorInstitution</code></td>
    </tr>
    <tr>
        <td>:green_book:</td>
        <td>
            <table>
                <tr>
                    <td><code><strong>BASE PATH</strong>:ClinicalDocument &gt author &gt assignedAuthor &gt id</code>
                    </td>
                </tr>
                <tr>
                    <td><code><strong>COD FISCALE</strong>: BASE PATH@extension</code></td>
                </tr>
                <tr>
                    <td><code><strong>OID</strong>: BASE PATH@root</code></td>
                </tr>
            </table>
        </td>
        <td>COD_FISCALE + "^^^^^^^^&" + OID + "&ISO"</td>
        <td><code>authorPerson</code></td>
    </tr>
    <tr>
        <td>:pencil:</td>
        <td></td>
        <td>SHA1 PDF</td>
        <td><code>hash</code></td>
    </tr>
    <tr>
        <td>:pencil:</td>
        <td></td>
        <td>Dimensione PDF in byte</td>
        <td><code>size</code></td>
    </tr>
    <tr>
        <td>:page_with_curl:</td>
        <td><code>assettoOrganizzativo</code></td>
        <td>AD_PSC001</td>
        <td><code>practiceSettingsCode</code></td>
    </tr>
    <tr>
        <td>:green_book:</td>
        <td>
            <table>
                <tr>
                    <td><code><strong>BASE PATH</strong>:ClinicalDocument &gt recordTarget &gt patientRole &gt id</code>
                    </td>
                </tr>
                <tr>
                    <td><code><strong>COD FISCALE</strong>: BASE PATH@extension</code></td>
                </tr>
                <tr>
                    <td><code><strong>OID</strong>: BASE PATH@root</code></td>
                </tr>
            </table>
        </td>
        <td>COD_FISCALE + "^^^&" + OID + "&ISO"</td>
        <td><code>sourcePatientId</code></td>
    </tr>
    <tr>
        <td>:black_nib:</td>
        <td></td>
        <td><strong>it-IT</strong></td>
        <td><code>languageCode</code></td>
    </tr>
    <tr>
        <td>:page_with_curl:</td>
        <td><code>dataInizioPrestazione</code></td>
        <td>20240326110012</td>
        <td><code>serviceStartTime</code></td>
    </tr>
    <tr>
        <td>:page_with_curl:</td>
        <td><code>dataFinePrestazione</code></td>
        <td>20240326110012</td>
        <td><code>serviceStopTime</code></td>
    </tr>
    <tr>
        <td>:black_nib:</td>
        <td></td>
        <td><strong>urn:oasis:names:tc:ebxml-regrep:StatusType:Approved</strong></td>
        <td><code>$XDSDocumentEntryStatus</code></td>
    </tr>
    <tr>
        <td>:green_book:</td>
        <td>
            <table>
                <tr>
                    <td><code><strong>BASE PATH</strong>:ClinicalDocument &gt inFulfillmentOf &gt order &gt id</code>
                    </td>
                </tr>
                <tr>
                    <td><code><strong>NRE: BASE PATH@extension</strong></code></td>
                    solo se la root eq 2.16.840.1.113883.2.9.4.3.9
                </tr> 
            </table>
        </td>
        <td>NRE +"^^^&2.16.840.1.113883.2.9.4.3.8"+&ISO^urn:ihe:iti:xds:2013:order</td>
        <td><code>referenceIdList</code></td>
    </tr>
    <tr>
        <td>:black_nib:</td>
        <td></td>
        <td><strong>CONS^^^&2.16.840.1.113883.2.9.3.3.6.1.7&ISO</strong></td>
        <td><code>urn:ita:2017:repository-type</code></td>
    </tr>
    <tr>
        <td>:black_nib:</td>
        <td></td>
        <td><strong>true^Documento firmato</strong></td>
        <td><code>documentSigned</code></td>
    </tr>
    <tr>
        <td>:page_with_curl:</td>
        <td><code>descriptions</code></td>
        <td>"019655^Bentelan^2.16.840.1.113883.2.9.6.1.5"</td>
        <td><code>description</code></td>
    </tr>
    <tr>
        <td>:page_with_curl:</td>
        <td><code>administrativeRequest</code></td>
        <td>SSN</td>
        <td><code>administrativeRequest</code></td>
    </tr>

</table>

<h3>XDSSubmissionSet</h3>

<table>
    <tr>
        <th colspan="3">Gateway</th>
        <th rowspan="2">INI</th>
    </tr>
    <tr>
        <th>Fonte</th>
        <th>Logica di trasformazione</th>
        <th>Esempio</th>
    </tr>
    <tr>
        <td>:pencil:</td>
        <td>2.16.840.1.113883.2.9.2.[subject_organization_id(campo del jwt epurato dagli zero iniziali)]</td>
        <td>2.16.840.1.113883.2.9.2.120</td>
        <td><code>sourceId</code></td>
    </tr>
    <tr>
        <td>:green_book:</td>
        <td>
            <table>
                <tr>
                    <td><code><strong>BASE PATH</strong>:ClinicalDocument &gt; recordTarget &gt; patientRole &gt; id</code>
                    </td>
                </tr>
                <tr>
                    <td><code><strong>COD FISCALE</strong>: BASE PATH@extension</code></td>
                </tr>
                <tr>
                    <td><code><strong>OID</strong>: BASE PATH@root</code></td>
                </tr>
            </table>
        </td>
        <td>COD_FISCALE + "^^^&" + OID + "&ISO"/td>
        <td><code>patientId</code></td>
    </tr>
    <tr>
        <td>:page_with_curl:</td>
        <td><code>tipoAttivitaClinica</code></td>
        <td>CON</td>
        <td><code>contentTypeCode</code></td>
    </tr>
    <tr>
        <td>:pencil:</td>
        <td>yyyyMMddHHmmss</td>
        <td>20241011152345</td>
        <td><code>submissionTime</code></td>
    </tr>
    <tr>
        <td>:page_with_curl:</td>
        <td><code>identificativoSottomissione</code></td>
        <td>2.16.840.1.113883.2.9.2.120.4.3.123456</td>
        <td><code>uniqueId</code></td>
    </tr>

</table>
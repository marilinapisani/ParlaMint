<?xml version='1.0' encoding='UTF-8'?>
<xsl:stylesheet 
    version="2.0" 
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform" >
    <xsl:output
        indent="yes"/>
    
    <xsl:variable name="speakers" as="element()*" select="/*/speakers/speaker"/>
    
    <xsl:template match="*[head]">
        <TEI xmlns="http://www.tei-c.org/ns/1.0" xml:lang="ca" xml:id="ParlaMint-ES-CT">
            <teiHeader>
                <fileDesc>
                    <titleStmt>
                        <title rend="main" xml:lang="ca"></title>
                        <title rend="main" xml:lang="en"></title>
                        <title rend="sub" xml:lang="ca"></title>
                        <title rend="sub" xml:lang="en"></title>
                        <meeting n="X" corresp="#PC" ana="#parla.session">num sessió</meeting>
                        <meeting n="X" corresp="#PC" ana="#parla.term #PC.">num legislatura</meeting>
                        <respStmt>
                            <persName>Iván Antiba Cartazo</persName>
                            <resp xml:lang="en">Data retrieval and conversion to XML</resp>
                        </respStmt>
                        <funder>
                            <orgName xml:lang="ca">Cap financiació  </orgName>
                            <orgName xml:lang="en">No funder</orgName>
                        </funder>
                    </titleStmt>
                    <editionStmt>
                        <edition>1.0</edition>
                    </editionStmt>
                    <extent><!--These numbers do not reflect the size of the sample!-->
                        <measure unit="speeches" quantity="0" xml:lang="ca">X intervencions</measure>
                        <measure unit="speeches" quantity="0" xml:lang="en">X speeches</measure>
                        <measure quantity="0" unit="words" xml:lang="ca">X paraules</measure>
                        <measure quantity="0" unit="words" xml:lang="en">X words</measure>
                    </extent>
                    <publicationStmt>
                        <publisher>
                            <orgName xml:lang="ca">Infraestructura d'investigació CLARIN</orgName>
                            <orgName xml:lang="en">CLARIN research infrastructure</orgName>
                            <ref target="https://www.clarin.eu/">www.clarin.eu</ref>
                        </publisher>
                        <idno rend="URI" subtype="handle">http://hdl.handle.net/11356/1388</idno>
                        <availability status="free">
                            <licence>http://creativecommons.org/licenses/by/4.0/</licence>
                            <p xml:lang="ca">Aquest treball es troba protegit per la llicència <ref target="https://creativecommons.org/licenses/by/4.0/">Atribució 4.0 Internacional</ref>.</p>
                            <p xml:lang="en">This work is licensed under the <ref target="http://creativecommons.org/licenses/by/4.0/">Creative Commons Attribution 4.0 International License</ref>.</p>
                        </availability>
                        <date when="2021">2021</date>
                    </publicationStmt>
                    <sourceDesc>
                        <bibl>
                            <title xml:lang="ca" rend="main">Parlament de Catalunya diaris de sessions de parlamentaries</title>
                            <title rend="main" xml:lang="en">Parliament of Catalonia daily sessions </title>
                            <idno rend="URI">https://www.parlament.cat/</idno>
                            <date from="2016-09-29" to="2016-09-29">2016-09-29 - 2016-09-29</date>
                        </bibl>
                    </sourceDesc>
                </fileDesc>
                <encodingDesc>
                    <projectDesc>
                        <p xml:lang="ca">
                            <ref target="https://www.clarin.eu/content/parlamint">ParlaMint</ref>
                        </p>
                        <p xml:lang="en">
                            <ref target="https://www.clarin.eu/content/parlamint">ParlaMint</ref> is a project that aims to (1) create a multilingual set of comparable corpora of parliamentary proceedings uniformly encoded according to the <ref target="https://github.com/clarin-eric/parla-clarin">Parla-CLARIN recommendations</ref> and covering the COVID-19 pandemic from November 2019 as well as the earlier period from 2015 to serve as a reference corpus; (2) process the corpora linguistically to add Universal Dependencies syntactic structures and Named Entity annotation; (3) make the corpora available through concordancers and Parlameter; and (4) build use cases in Political Sciences and Digital Humanities based on the corpus data.</p>
                    </projectDesc>
                    <tagsDecl><!--These numbers do not reflect the size of the sample!-->
                        <namespace name="http://www.tei-c.org/ns/1.0">
                            <tagUsage gi="body" occurs="0"/>
                            <tagUsage gi="pb" occurs="0"/>
                            <tagUsage gi="div" occurs="0"/>
                            <tagUsage gi="head" occurs="0"/>
                            <tagUsage gi="note" occurs="0"/>
                            <tagUsage gi="u" occurs="0"/>
                            <tagUsage gi="seg" occurs="0"/>
                        </namespace>
                    </tagsDecl>
                </encodingDesc>
                <profileDesc>
                    <settingDesc>
                        <setting>
                            <name rend="address">Parc de la Ciutadella, s/n 08003</name>
                            <name rend="city">Barcelona</name>
                            <name rend="country" key="ES">Spain</name>
                            <date from="2015-10-26" to="2020-12-18">26.10.2015 - 18.12.2020</date>
                        </setting>
                    </settingDesc>
               </profileDesc>
           </teiHeader>
           <text ana="#reference">
            <body>
              <div type="debate section">
                <xsl:for-each-group select="p" group-starting-with="p[@rend='Speaker']">
                <xsl:variable name="speakerName" select="current-group()[1]/text()"/>
                <xsl:variable name="speakerDbRecord" select="$speakers[@name=$speakerName]"/>
                <xsl:variable name="posSpeaker" select="position()"/>
                <u xml:id="ParlaMint-ES-CT.u{$posSpeaker}"
                    who="#{$speakerDbRecord/@xml:id}"
                    ana="#{$speakerDbRecord/@role}">
                    <xsl:for-each select="current-group()[ position() gt 1]">
                        <xsl:variable name="posText" select="position() - 1"/>
                        <seg xml:id="ParlaMint-ES-CT.u.{$posSpeaker}.{$posText}"><xsl:value-of select="."/></seg>
                    </xsl:for-each>
                </u>
                </xsl:for-each-group>
            </div>
          </body>
        </text>
      </TEI>
    </xsl:template>
    
</xsl:stylesheet>
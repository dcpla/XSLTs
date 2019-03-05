<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet 
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
    xmlns:oai_dc="http://www.openarchives.org/OAI/2.0/oai_dc/" 
    xmlns:dc="http://purl.org/dc/elements/1.1/" 
    xmlns:dcterms="http://purl.org/dc/terms/" 
    xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" exclude-result-prefixes="xs" version="2.0">
    <xsl:output method="xml" indent="yes" name="xml"/>
    
    <xsl:template match="//oai_dc:dc">
        <qualifieddc xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
            xmlns:dc="http://purl.org/dc/elements/1.1/" xmlns:dcterms="http://purl.org/dc/terms/"
            xmlns:marcrel="http://www.loc.gov/marc.relators/"
            xsi:schemaLocation="http://www.loc.gov/marc.relators/ 
            http://imlsdcc2.grainger.illinois.edu/registry/marcrel.xsd"
            xsi:noNamespaceSchemaLocation="http://dublincore.org/schemas/xmls/qdc/2008/02/11/qualifieddc.xsd">
            <xsl:for-each select="dc:date">
                    <xsl:analyze-string select="." regex="(\d+&#47;\d+&#47;\d{{4}})">
                        <xsl:matching-substring>
                            <xsl:element name="dcterms:created">
                                <xsl:value-of select="substring(.,7,4)"/>-<xsl:value-of select="substring(.,4,2)"/>-<xsl:value-of select="substring(.,1,2)"/>
                            </xsl:element>
                        </xsl:matching-substring>
                        <xsl:non-matching-substring>
                            <dc:date><xsl:value-of select="."/></dc:date>
                        </xsl:non-matching-substring>
                    </xsl:analyze-string>
            </xsl:for-each>
            <xsl:apply-templates select="//dc:coverage"/>
            <xsl:for-each select="dc:type">
                <xsl:apply-templates select="//dc:type"/>
            </xsl:for-each>
        </qualifieddc>
    </xsl:template>
    
    <xsl:template match="//dc:coverage">
        
        <xsl:analyze-string select="." regex="(\d{{4}}-\d{{4}}|\d{{4}})">
            <xsl:matching-substring>
                <xsl:element name="dcterms:temporal">
                    <xsl:value-of select="."/>
                </xsl:element>
            </xsl:matching-substring>
            <xsl:non-matching-substring>
                <xsl:element name="dcterms:spatial">
                    <xsl:value-of select="."/>
                </xsl:element>
            </xsl:non-matching-substring>
        </xsl:analyze-string>      
        
    </xsl:template>
    <xsl:template match="//dc:type">
        <xsl:analyze-string select="." regex="([I][m][a][g][e])">
            <xsl:matching-substring>
                <xsl:element name="dc:type"><xsl:value-of select="substring(.,1,5)"/></xsl:element>
            </xsl:matching-substring>
            <xsl:non-matching-substring>
                <xsl:element name="dc:format"><xsl:value-of select="."/></xsl:element>
            </xsl:non-matching-substring>
        </xsl:analyze-string>
    </xsl:template>
</xsl:stylesheet>

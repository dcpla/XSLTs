<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:oai_dc="http://www.openarchives.org/OAI/2.0/oai_dc/"xmlns:dc="http://purl.org/dc/elements/1.1/" xmlns:dcterms="http://purl.org/dc/terms/" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"xmlns:xs="http://www.w3.org/2001/XMLSchema" exclude-result-prefixes="xs" version="2.0">
<xsl:output method="xml" indent="yes" name="xml"/>
<xsl:attribute-set name="type">
<xsl:attribute name="xsi:type">dcterms:DCMIType</xsl:attribute>
</xsl:attribute-set>
<xsl:template match="//oai_dc:dc">
<qualifieddc xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:dc="http://purl.org/dc/elements/1.1/" xmlns:dcterms="http://purl.org/dc/terms/"xmlns:marcrel="http://www.loc.gov/marc.relators/" xsi:schemaLocation="http://www.loc.gov/marc.relators/ http://imlsdcc2.grainger.illinois.edu/registry/marcrel.xsd"xsi:noNamespaceSchemaLocation="http://dublincore.org/schemas/xmls/qdc/2008/02/11/qualifieddc.xsd">
<dc:title>
<xsl:value-of select="dc:title"/>
</dc:title>
<xsl:for-each select="dc:creator">
<xsl:apply-templates select="//dc:creator"/>
</xsl:for-each>
<xsl:element name="dcterms:created">
name=1817-1935; start=1817-01-01; end=1935-12-31; scheme=W3C-DTF;
</xsl:element>
<xsl:for-each select="dc:description">
<dc:description>
<xsl:value-of select="."/>
</dc:description>
</xsl:for-each>
<dc:rights>
<xsl:value-of select="dc:rights"/>
</dc:rights>
<xsl:for-each select="dc:type[position()=1]">
<dc:type>
<xsl:value-of select="."/>
</dc:type>
</xsl:for-each>
<xsl:for-each select="dc:type[position()=2]">
<dc:type xsi:type="dcterms:DCMIType">
<xsl:value-of select="."/>
</dc:type>
</xsl:for-each>
<dc:publisher>
<xsl:value-of select="dc:publisher"/>
</dc:publisher>
<xsl:for-each select="dc:format">
<dc:format>
<xsl:value-of select="."/>
</dc:format>
</xsl:for-each>
<xsl:for-each select="dc:identifier">
<dc:identifier>
<xsl:value-of select="."/>
</dc:identifier>
</xsl:for-each>
<xsl:for-each select="dc:contributor">
<dc:contributor>
<xsl:value-of select="."/>
</dc:contributor>
</xsl:for-each>
<xsl:for-each select="dc:coverage">
<dcterms:spatial>
<xsl:value-of select="."/>
</dcterms:spatial>
</xsl:for-each>
</qualifieddc>
</xsl:template>
<xsl:template match="//dc:creator">
<xsl:analyze-string select="." regex="([-]{{1}})">
<xsl:matching-substring>
<xsl:element name="dc:creator">Unknown</xsl:element>
</xsl:matching-substring>
<xsl:non-matching-substring>
<dc:creator>
<xsl:value-of select="."/>
</dc:creator>
</xsl:non-matching-substring>
</xsl:analyze-string>
</xsl:template>
</xsl:stylesheet>

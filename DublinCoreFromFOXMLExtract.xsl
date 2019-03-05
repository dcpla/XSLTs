<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:dc="http://purl.org/dc/elements/1.1/"xmlns:oai_dc="http://www.openarchives.org/OAI/2.0/oai_dc/" xmlns:audit="info:fedora/fedora-system:def/audit#"xmlns:premis="http://www.loc.gov/standards/premis/v1" xmlns:foxml="info:fedora/fedora-system:def/foxml#" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"exclude-result-prefixes="xs dc oai_dc audit premis foxml xsi" version="2" xsi:schemaLocation="info:fedora/fedora-system:def/foxml# http://www.fedora.info/definitions/1/0/foxml1-1.xsd">
<xsl:output method="xml" indent="yes" name="xml"/>
<xsl:template match="/">
<xsl:apply-templates select="foxml:digitalObject/foxml:datastream[position()=2]/foxml:datastreamVersion[last()]/foxml:xmlContent"/>
</xsl:template>
<xsl:template match="foxml:xmlContent">
<metadata>
<xsl:copy-of select="oai_dc:dc"/>
</metadata>
</xsl:template>
</xsl:stylesheet>

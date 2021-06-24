<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:template match="/*">
      <soapenv:Body xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/">{<xsl:apply-templates select="*"/>}</soapenv:Body>
    </xsl:template>
    
    <xsl:template match="*">
        "<xsl:value-of select="local-name()"/>" : <xsl:call-template name="Properties"/>
    </xsl:template>

    <xsl:template match="*" mode="ArrayElement">
        <xsl:call-template name="Properties"/>
    </xsl:template>

    <xsl:template name="Properties">
        <xsl:variable name="childName" select="local-name(*[1])"/>
        <xsl:choose>
            <xsl:when test="not(*|@*)">"<xsl:value-of select="."/>"</xsl:when>
            <xsl:when test="ends-with(local-name(),'List')"> [ <xsl:apply-templates select="*" mode="ArrayElement"/>]</xsl:when>
            <xsl:when test="count(*[local-name()=$childName]) > 1">{ "<xsl:value-of select="$childName"/>" :[<xsl:apply-templates select="*" mode="ArrayElement"/>] }</xsl:when>
            <xsl:otherwise>{
                <xsl:apply-templates select="@*"/>
                <xsl:apply-templates select="*"/>
            }</xsl:otherwise>
        </xsl:choose>
        <xsl:if test="following-sibling::*">,</xsl:if>
    </xsl:template>
    
    <xsl:template match="@*">"<xsl:value-of select="local-name()"/>" : "<xsl:value-of select="."/>",
    </xsl:template>
</xsl:stylesheet>

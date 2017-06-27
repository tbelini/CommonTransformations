<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                 xmlns:DateTimeFunctions="http://www.oracle.com/XSL/Transform/java/br.com.smiles.osb.functions.DateTimeFunctions">
  <xsl:template match="/">
  <OutputDate>
    <xsl:choose>
       <xsl:when test="string-length(/DateTimeConverter/TimeZoneOutput)>0">
         <xsl:value-of select="DateTimeFunctions:dateTimeToTimeZone(/DateTimeConverter/DateTimeInput,/DateTimeConverter/TimeZoneOutput)"/>
       </xsl:when>
       <xsl:otherwise>
          <xsl:value-of select="DateTimeFunctions:dateTimeToLocalZone(/DateTimeConverter/DateTimeInput)"/>
       </xsl:otherwise>
    </xsl:choose>
  </OutputDate>
  </xsl:template>
</xsl:stylesheet>

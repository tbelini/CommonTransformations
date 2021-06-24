<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:decimal-format name="eu" decimal-separator=',' grouping-separator='.' />
  <xsl:template match="/">
  <number>
    <xsl:value-of select="format-number(number(/formatNumber/number), /formatNumber/format, 'eu')"/>
  </number>
  </xsl:template>
</xsl:stylesheet>
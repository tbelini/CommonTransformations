<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:b64="http://www.oracle.com/XSL/Transform/java/oracle.soa.common.util.Base64Encoder" exclude-result-prefixes=" b64 ">
  <xsl:template match="/">
  <text>
    <xsl:value-of select="b64:encode(/Base64Text)"/>
  </text>
  </xsl:template>
</xsl:stylesheet>
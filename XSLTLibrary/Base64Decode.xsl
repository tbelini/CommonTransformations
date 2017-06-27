<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:b64="http://www.oracle.com/XSL/Transform/java/weblogic.apache.xerces.impl.dv.util.Base64">
  <xsl:template match="/">
  <text>
    <xsl:value-of select="b64:decode(/Base64Text)"/>
  </text>
  </xsl:template>
</xsl:stylesheet>

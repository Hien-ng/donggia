<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl">
  <xsl:output method="html" indent="yes"/>

  <xsl:template match="/">
    <xsl:if test="count(/ZoneList/Zone) > 0">
      <h2 class="postname">
        <xsl:value-of select="/ZoneList/Title" disable-output-escaping="yes"></xsl:value-of>
      </h2>
      <div class="content">
        <div class="select-product">
          <label for="">
            <xsl:value-of select="/ZoneList/ModuleTitle" disable-output-escaping="yes"></xsl:value-of>
          </label>
          <select class="select-menu" onchange="javascript:location.href = this.value;">
            <xsl:apply-templates select="/ZoneList/Zone"></xsl:apply-templates>
          </select>
        </div>
      </div>
    </xsl:if>
  </xsl:template>

  <xsl:template match="Zone">
    <xsl:if test="count(Zone) > 0">
      <ul class="nav">
        <xsl:apply-templates select="Zone" mode="Child"></xsl:apply-templates>
      </ul>
    </xsl:if>
  </xsl:template>

  <xsl:template match="Zone" mode="Child">
    <option>
      <xsl:attribute name="value">
        <xsl:value-of select="Url"></xsl:value-of>
      </xsl:attribute>
      <xsl:if test="IsActive='true'">
        <xsl:attribute name="selected">
          <xsl:text>selected</xsl:text>
        </xsl:attribute>
      </xsl:if>
      <xsl:value-of select="Title" disable-output-escaping="yes"></xsl:value-of>
    </option>
  </xsl:template>

</xsl:stylesheet>
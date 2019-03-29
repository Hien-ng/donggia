<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl">
  <xsl:output method="html" indent="yes"/>

  <xsl:template match="/">
    <table cellspacing="0" cellpadding="0" width="99%" border="0">
      <tr>
        <td>
          <xsl:if test="/FileList/MoveUpUrl != ''">
            <a>
              <xsl:attribute name="href">
                <xsl:value-of select="/FileList/MoveUpUrl"></xsl:value-of>
              </xsl:attribute>
              <img alt="Lên 1 cấp" src="/Data/SiteImages/arrow_up.png" />
            </a>
          </xsl:if>
          <span class="foldername">
            <xsl:value-of select="/FileList/CurrentDirectory"></xsl:value-of>
          </span>
        </td>
      </tr>
      <tr>
        <td>
          <table cellspacing="0">
            <thead>
              <tr>
                <th>
                  <xsl:value-of select="/FileList/FileNameText"></xsl:value-of>
                </th>
                <th>
                  <xsl:value-of select="/FileList/SizeText"></xsl:value-of>
                </th>
                <th>
                  <xsl:value-of select="/FileList/DownloadCountText"></xsl:value-of>
                </th>
                <th>
                  <xsl:value-of select="/FileList/ModifiedOnText"></xsl:value-of>
                </th>
                <th>
                  <xsl:value-of select="/FileList/UploadedByText"></xsl:value-of>
                </th>
                <th></th>
              </tr>
            </thead>
            <tbody>
              <xsl:apply-templates select="/FileList/File"></xsl:apply-templates>
            </tbody>
          </table>
        </td>
      </tr>
      <tr>
        <td>
          <xsl:value-of select="/FileList/Counter"></xsl:value-of>
          <xsl:text> </xsl:text>
          <xsl:value-of select="/FileList/ObjectsText"></xsl:value-of>
        </td>
      </tr>
    </table>
  </xsl:template>
  <xsl:template match="File">
    <tr>
      <td>
        <img alt="">
          <xsl:attribute name="src">
            <xsl:value-of select="ImageTypeUrl"></xsl:value-of>
          </xsl:attribute>
        </img>
        <a>
          <xsl:attribute name="title">
            <xsl:value-of select="Title"></xsl:value-of>
          </xsl:attribute>
          <xsl:attribute name="href">
            <xsl:value-of select="Url"></xsl:value-of>
          </xsl:attribute>
          <xsl:value-of select="Title"></xsl:value-of>
        </a>
      </td>
      <td>
        <xsl:value-of select="Size"></xsl:value-of>
      </td>
      <td>
        <xsl:value-of select="DownloadCount"></xsl:value-of>
      </td>
      <td>
        <xsl:value-of select="ModifiedDate"></xsl:value-of>
        <xsl:text> </xsl:text>
        <xsl:value-of select="ModifiedTime"></xsl:value-of>
      </td>
      <td>
        <xsl:value-of select="UserName"></xsl:value-of>
      </td>
      <td>
        <xsl:value-of select="EditLink" disable-output-escaping="yes"></xsl:value-of>
        <xsl:if test="DownloadUrl != ''">
          <a target="_blank">
            <xsl:attribute name="title">
              <xsl:value-of select="Title"></xsl:value-of>
            </xsl:attribute>
            <xsl:attribute name="href">
              <xsl:value-of select="DownloadUrl"></xsl:value-of>
            </xsl:attribute>
            <img alt="Download" src="/Data/SiteImages/Download.gif" />
          </a>
        </xsl:if>
      </td>
    </tr>
  </xsl:template>
</xsl:stylesheet>
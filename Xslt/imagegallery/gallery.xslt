<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl">
  <xsl:output method="html" indent="yes"/>

  <xsl:template match="/">
    <!--<xsl:value-of select="/GalleryList/PageTitle"></xsl:value-of>
        <xsl:value-of select="/GalleryList/ThumbnailWidth"></xsl:value-of>
        <xsl:value-of select="/GalleryList/ThumbnailHeight"></xsl:value-of>
        <xsl:value-of select="/GalleryList/WebImageWidth"></xsl:value-of>
        <xsl:value-of select="/GalleryList/WebImageHeight"></xsl:value-of>
      -->
    <div class="row">
      <div class="col-md-12">
        <div id="filter">
          <xsl:apply-templates select="/GalleryList/Album"></xsl:apply-templates>
        </div>
      </div>
    </div>
  </xsl:template>

  <xsl:template match="Album">
    <div class="mix mrb30">
      <div class="box effect2">
        <a>
          <xsl:attribute name="data-lightbox">
            <xsl:text>group</xsl:text>
            <xsl:value-of select="AlbumID"></xsl:value-of>
          </xsl:attribute>
          <xsl:attribute name="href">
            <xsl:value-of select="ImageUrl"></xsl:value-of>
          </xsl:attribute>
          <figure>
            <img>
              <xsl:attribute name="src">
                <xsl:value-of select="Image/ImageUrl"></xsl:value-of>
              </xsl:attribute>
              <xsl:attribute name="alt">
                <xsl:value-of select="Image/Title" disable-output-escaping="yes"></xsl:value-of>
              </xsl:attribute>
            </img>
            <figcaption>
              <h6>
                <xsl:value-of select="Title" disable-output-escaping="yes"></xsl:value-of>
              </h6>
            </figcaption>
          </figure>
        </a>
      </div>
      <xsl:apply-templates select="Image" mode="ImageByAlbum"></xsl:apply-templates>
    </div>
  </xsl:template>
  <xsl:template match="Image" mode="ImageByAlbum">
    <xsl:if test="position() > 1">
      <a>
        <xsl:attribute name="data-lightbox">
          <xsl:text>group</xsl:text>
          <xsl:value-of select="AlbumID"></xsl:value-of>
        </xsl:attribute>
        <xsl:attribute name="href">
          <xsl:value-of select="ImageUrl"></xsl:value-of>
        </xsl:attribute>
        <xsl:attribute name="title">
          <xsl:value-of select="Title" disable-output-escaping="yes"></xsl:value-of>
        </xsl:attribute>
      </a>
    </xsl:if>
  </xsl:template>

</xsl:stylesheet>
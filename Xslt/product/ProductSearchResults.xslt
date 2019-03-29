<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl">
  <xsl:output method="html" indent="yes"/>

  <xsl:template match="/">
    <xsl:choose>
      <xsl:when test="count(/ProductList/Product)>0">
        <section>
          <div class="searchsummary clearfix">
            <xsl:value-of select="/ProductList/SearchSumary" disable-output-escaping="yes"></xsl:value-of>
          </div>
          <section class="product-page clearfix">
            <div class="row flex flex-wrap">
              <xsl:apply-templates select="/ProductList/Product"></xsl:apply-templates>
            </div>
          </section>
        </section>
      </xsl:when>
      <xsl:otherwise>
        <div class="noresults">
          <xsl:value-of select="/ProductList/NoResults" disable-output-escaping="yes"></xsl:value-of>
        </div>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>

  <xsl:template match="Product">
    <div class="col-xs-12 col-sm-6 col-md-4 col-lg-4 col-xl-3">
      <div class="product-col">
        <figure>
          <a class="product-img">
            <xsl:attribute name="href">
              <xsl:value-of select="Url"></xsl:value-of>
            </xsl:attribute>
            <xsl:attribute name="target">
              <xsl:value-of select="Target"></xsl:value-of>
            </xsl:attribute>
            <xsl:attribute name="title">
              <xsl:value-of select="Title"></xsl:value-of>
            </xsl:attribute>
            <img>
              <xsl:attribute name="src">
                <xsl:value-of select="ImageUrl"></xsl:value-of>
              </xsl:attribute>
              <xsl:attribute name="alt">
                <xsl:value-of select="Title"></xsl:value-of>
              </xsl:attribute>
            </img>
          </a>
          <figcaption>
            <div class="product-name">
              <a class="btn-detail">
                <xsl:attribute name="href">
                  <xsl:value-of select="Url"></xsl:value-of>
                </xsl:attribute>
                <xsl:attribute name="title">
                  <xsl:value-of select="Title"></xsl:value-of>
                </xsl:attribute>
                <xsl:value-of select="Title"></xsl:value-of>
              </a>
              <xsl:value-of select="EditLink" disable-output-escaping="yes"></xsl:value-of>
            </div>
            <div class="product-price">
              <xsl:if test="OldPrice != ''">
                <div class="old">
                  <xsl:value-of select="OldPrice"></xsl:value-of>
                </div>
              </xsl:if>
              <xsl:if test="Price != ''">
                <div class="new">
                  <xsl:value-of select="Price"></xsl:value-of>
                </div>
              </xsl:if>
            </div>
            <a class="buy" onclick="AjaxCart.addproducttocart_catalog(this);return false;">
              <xsl:attribute name="data-productid">
                <xsl:value-of select="ProductId"></xsl:value-of>
              </xsl:attribute>
              <span>
                <xsl:text>Mua hàng</xsl:text>
              </span>
              <i class="fa fa-shopping-bag" aria-hidden="true"></i>
            </a>
          </figcaption>
        </figure>
      </div>
    </div>
  </xsl:template>
</xsl:stylesheet>
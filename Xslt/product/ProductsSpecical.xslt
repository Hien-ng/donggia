<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl">
  <xsl:output method="html" indent="yes"/>

  <xsl:template match="/">
    <section class="container">
      <h2 class="headtitle">
        <xsl:value-of select="/ProductList/ModuleTitle"></xsl:value-of>
      </h2>
      <div id="tabct3">
        <div class="slide-wrap">
          <div class="control">
            <div id="prev3" class="product-prev">
              <i class="fa fa-angle-left" aria-hidden="true"></i>
            </div>
            <div id="next3" class="product-next">
              <i class="fa fa-angle-right" aria-hidden="true"></i>
            </div>
          </div>
          <div id="product-slide2" class="hproduct-slide">
            <xsl:apply-templates select="/ProductList/Product"></xsl:apply-templates>
          </div>
        </div>
      </div>
    </section>
  </xsl:template>

  <xsl:template match="Product">
    <div class="item">
      <div class="product-col">
        <xsl:choose>
          <xsl:when test="floor(ShowOption div 1) mod 2 = 1">
            <div class="promotion op1">
              <span>
                <xsl:value-of select="/ProductDetail/NewText"></xsl:value-of>
              </span>
            </div>
          </xsl:when>
          <xsl:when test="floor(ShowOption div 2) mod 2 = 1">
            <span class="promotion op2">
              <xsl:value-of select="/ProductDetail/SaleText"></xsl:value-of>
            </span>
          </xsl:when>
        </xsl:choose>
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
                <xsl:value-of select="Code"></xsl:value-of>
              </a>
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
                <xsl:value-of select="/ProductList/BuyText"></xsl:value-of>
              </span>
              <i class="fa fa-shopping-bag" aria-hidden="true"></i>
            </a>
          </figcaption>
        </figure>
      </div>
    </div>
  </xsl:template>
</xsl:stylesheet>
<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl">
  <xsl:output method="html" indent="yes"/>

  <xsl:template match="/">
    <section class="container">
      <div class="row flex flex-wrap">
        <section class="col-xs-12 col-md-6 col-lg-6">
          <div class="product-slide-wrap clearfix">
            <section class="slide-wrap">
              <div class="control">
                <div class="img-prev"></div>
                <div class="img-next"></div>
              </div>
              <xsl:if test="count(/ProductDetail/ProductImages)>0">
                <div class="product-slide clearfix">
                  <xsl:apply-templates select="/ProductDetail/ProductImages" mode="BigImages"></xsl:apply-templates>
                </div>
              </xsl:if>
            </section>
            <section class="nav-wrap">
              <div class="nav-slide" id="gal1">
                <xsl:apply-templates select="/ProductDetail/ProductImages" mode="SmallImages"></xsl:apply-templates>
              </div>
            </section>
          </div>
        </section>
        <section class="col-xs-12 col-md-6 col-lg-6">
          <div class="product-detail clearfix">
            <h1 class="product-name">
              <xsl:value-of select="/ProductDetail/Title"></xsl:value-of>
              <xsl:value-of select="/ProductDetail/EditLink" disable-output-escaping="yes"></xsl:value-of>
            </h1>
            <div class="product-price">
              <xsl:value-of select="/ProductDetail/PriceText"></xsl:value-of>
              <xsl:text> </xsl:text>
              <xsl:if test="/ProductDetail/OldPrice != ''">
                <div class="old">
                  <xsl:value-of select="/ProductDetail/OldPrice"></xsl:value-of>
                </div>
              </xsl:if>
              <xsl:if test="/ProductDetail/Price != ''">
                <div class="new">
                  <xsl:value-of select="/ProductDetail/Price"></xsl:value-of>
                </div>
              </xsl:if>
            </div>
            <section class="product-overview clearfix">
              <ul role="tablist" class="nav nav-tabs">
                <li class="nav-item">
                  <a data-toggle="tab" href="#tab1" role="tab" class="nav-link active">
                    <xsl:value-of select="/ProductDetail/DescriptionText"></xsl:value-of>
                  </a>
                </li>
                <!--<li class="nav-item">
                  <a data-toggle="tab" href="#tab2" role="tab" class="nav-link">
                    <xsl:value-of select="/ProductDetail/MaterialText"></xsl:value-of>
                  </a>
                </li>-->
              </ul>
              <div class="tab-content">
                <div id="tab1" role="tabpanel" class="tab-pane fade in active">
                  <div class="content">
                    <xsl:value-of select="/ProductDetail/FullContent" disable-output-escaping="yes"></xsl:value-of>
                    <xsl:if test="/ProductDetail/SubTitle!=''">
                      <p>
                        <strong>
                          <xsl:text>Chất liệu: </xsl:text>
                        </strong>
                        <xsl:value-of select="/ProductDetail/SubTitle" disable-output-escaping="yes"></xsl:value-of>
                      </p>
                    </xsl:if>
                  </div>
                </div>
                <!--<div id="tab2" role="tabpanel" class="tab-pane fade">
                  <div class="content">
                    <xsl:value-of select="/ProductDetail/FullContent" disable-output-escaping="yes"></xsl:value-of>
                  </div>
                </div>-->
              </div>
            </section>
            <xsl:apply-templates select="/ProductDetail/ProductProperties"></xsl:apply-templates>
            <div class="product-amount">
              <strong>Số lượng</strong>
              <div class="input-number">
                <div class="btn-spin btn-dec">-</div>
                <div class="btn-spin btn-inc">+</div>
                <input value="1">
                  <xsl:attribute name="name">
                    <xsl:text>addtocart_</xsl:text>
                    <xsl:value-of select="/ProductDetail/ProductId" disable-output-escaping="yes"></xsl:value-of>
                    <xsl:text>.EnteredQuantity</xsl:text>
                  </xsl:attribute>
                </input>
              </div>
            </div>
            <div class="btn-addtocart" onclick="AjaxCart.addproducttocart_details(this); return false;">
              <xsl:attribute name="data-productid">
                <xsl:value-of select="/ProductDetail/ProductId"></xsl:value-of>
              </xsl:attribute>
              <xsl:text>Thêm vào giỏ hàng</xsl:text>
            </div>
          </div>
        </section>
        <section class="col-xs-12">
          <xsl:if test="count(/ProductDetail/ProductOther)>0">
            <div class="related-product cleafix">
              <div class="headtitle">
                <xsl:value-of select="/ProductDetail/ProductRelatedText"></xsl:value-of>
              </div>
              <div class="slide-wrap">
                <div class="control">
                  <div class="related-prev"></div>
                  <div class="related-next"></div>
                </div>
                <div class="related-slide">
                  <xsl:apply-templates select="/ProductDetail/ProductOther"></xsl:apply-templates>
                </div>
              </div>
            </div>
          </xsl:if>
          <xsl:if test="count(/ProductDetail/ProductRelated)>0">
            <section class="other-product cleafix">
              <div class="headtitle">
                <xsl:value-of select="/ProductDetail/YouLikeText"></xsl:value-of>
              </div>
              <div class="slide-wrap">
                <div class="control">
                  <div class="other-prev"></div>
                  <div class="other-next"></div>
                </div>
                <div class="other-slide">
                  <xsl:apply-templates select="/ProductDetail/ProductRelated"></xsl:apply-templates>
                </div>
              </div>
            </section>
          </xsl:if>
        </section>
      </div>
    </section>
  </xsl:template>

  <xsl:template match="ProductProperties">
    <xsl:if test="FieldId=4">
      <div class="product-size">
        <strong>
          <xsl:value-of select="Title"></xsl:value-of>
        </strong>
        <select>
          <xsl:attribute name="name">
            <xsl:text>product_attribute_</xsl:text>
            <xsl:value-of select="/ProductDetail/ProductId"></xsl:value-of>
            <xsl:text>_</xsl:text>
            <xsl:value-of select="FieldId"></xsl:value-of>
          </xsl:attribute>
          <xsl:apply-templates select="Options"></xsl:apply-templates>
        </select>
        <a href="/cham-soc-khach-hang/huong-dan-chon-size/so-mi-tay-ngan-kieu-body" class="viewsize">Hướng dẫn chọn size</a>
      </div>
    </xsl:if>
  </xsl:template>

  <xsl:template match="Options">
    <option>
      <xsl:attribute name="value">
        <xsl:value-of select="OptionId"></xsl:value-of>
      </xsl:attribute>
      <xsl:value-of select="Title"></xsl:value-of>
    </option>
  </xsl:template>

  <xsl:template match="ProductImages" mode="BigImages">
    <div class="item">
      <a class="product-img fancybox">
        <xsl:attribute name="href">
          <xsl:value-of select="ImageUrl"></xsl:value-of>
        </xsl:attribute>
        <xsl:attribute name="title">
          <xsl:value-of select="Title"></xsl:value-of>
        </xsl:attribute>
        <img id="img_01">
          <xsl:attribute name="src">
            <xsl:value-of select="ImageUrl" disable-output-escaping="yes"></xsl:value-of>
          </xsl:attribute>
          <xsl:attribute name="data-zoom-image">
            <xsl:value-of select="ImageUrl" disable-output-escaping="yes"></xsl:value-of>
          </xsl:attribute>
          <xsl:attribute name="alt">
            <xsl:value-of select="Title"></xsl:value-of>
          </xsl:attribute>
        </img>
      </a>
    </div>
  </xsl:template>
  <xsl:template match="ProductImages" mode="SmallImages">
    <div class="item">
      <div class="product-img">
        <img>
          <xsl:attribute name="src">
            <xsl:value-of select="ImageUrl"></xsl:value-of>
          </xsl:attribute>
          <xsl:attribute name="alt">
            <xsl:value-of select="Title"></xsl:value-of>
          </xsl:attribute>
        </img>
      </div>
    </div>
  </xsl:template>
  <xsl:template match="ProductOther">
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
                <xsl:value-of select="/ProductDetail/BuyText"></xsl:value-of>
              </span>
              <i class="fa fa-shopping-bag" aria-hidden="true"></i>
            </a>
          </figcaption>
        </figure>
      </div>
    </div>
  </xsl:template>
  <xsl:template match="ProductRelated">
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
                <xsl:value-of select="/ProductDetail/BuyText"></xsl:value-of>
              </span>
              <i class="fa fa-shopping-bag" aria-hidden="true"></i>
            </a>
          </figcaption>
        </figure>
      </div>
    </div>
  </xsl:template>

</xsl:stylesheet>
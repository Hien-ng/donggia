<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl">
  <xsl:output method="html" indent="yes"/>

  <xsl:template match="/">
    <xsl:if test="count(/ShoppingCart/CartItem)>0">
      <div class="carttitle">
          Để dành mua sau (<xsl:value-of select="/ShoppingCart/TotalProducts"></xsl:value-of> sản phẩm)
        </div>
      <section class="cart-page clearfix">
        <table class="carttable">
          <thead>
            <tr>
              <th>
                <xsl:value-of select="/ShoppingCart/ProductText"></xsl:value-of>
              </th>
              <th>
                <xsl:value-of select="/ShoppingCart/PriceText"></xsl:value-of>
              </th>
              <th>
                <xsl:value-of select="/ShoppingCart/ItemTotalText"></xsl:value-of>
              </th>
            </tr>
          </thead>
          <tbody>
            <xsl:apply-templates select="/ShoppingCart/CartItem"></xsl:apply-templates>
          </tbody>
        </table>
      </section>
    </xsl:if>
  </xsl:template>

  <xsl:template match="CartItem">
    <tr>
      <td class="product">
        <a class="productimg">
          <xsl:attribute name="href">
            <xsl:value-of select="Url"></xsl:value-of>
          </xsl:attribute>
          <img>
            <xsl:attribute name="src">
              <xsl:value-of select="ThumbnailUrl"></xsl:value-of>
            </xsl:attribute>
            <xsl:attribute name="alt">
              <xsl:value-of select="Title"></xsl:value-of>
            </xsl:attribute>
          </img>
        </a>
        <div class="productdetail">
          <h3 class="productname">
            <a>
              <xsl:attribute name="href">
                <xsl:value-of select="Url"></xsl:value-of>
              </xsl:attribute>
              <xsl:value-of select="Title" disable-output-escaping="yes"></xsl:value-of>
            </a>
          </h3>
          <xsl:apply-templates select="Attributes"></xsl:apply-templates>
          <div class="removeproduct">
            <a href="#" onclick="AjaxCart.removefromwishlist(this);return false;">
              <xsl:attribute name="data-itemguid">
                <xsl:value-of select="ItemGuid"></xsl:value-of>
              </xsl:attribute>
              <xsl:text>Xóa</xsl:text>
            </a>
            <a href="#" onclick="AjaxCart.wishlisttocart(this);return false;">
              <xsl:attribute name="data-itemguid">
                <xsl:value-of select="ItemGuid"></xsl:value-of>
              </xsl:attribute>
              <xsl:text>Thêm vào giỏ hàng</xsl:text>
            </a>
          </div>
        </div>
      </td>
      <td class="price">
        <div class="new">
          <xsl:value-of select="OriginalPrice"></xsl:value-of>
        </div>
      </td>
      <td class="total">
        <div class="amount">
          <xsl:value-of select="ItemSubTotal"></xsl:value-of>
        </div>
      </td>
    </tr>
  </xsl:template>

  <xsl:template match="Quantities">
    <option>
      <xsl:attribute name="value">
        <xsl:value-of select="Quantity"></xsl:value-of>
      </xsl:attribute>
      <xsl:value-of select="Quantity"></xsl:value-of>
    </option>
  </xsl:template>

  <xsl:template match="Attributes">
    <div class="productsize">
      <xsl:value-of select="Title"></xsl:value-of>
      <xsl:text>: </xsl:text>
      <strong>
        <xsl:apply-templates select="Options"></xsl:apply-templates>
      </strong>
    </div>
  </xsl:template>

  <xsl:template match="Options">
    <xsl:if test="IsActive='true'">
      <xsl:value-of select="Title"></xsl:value-of>
    </xsl:if>
  </xsl:template>

</xsl:stylesheet>
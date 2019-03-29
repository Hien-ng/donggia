<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl">
  <xsl:output method="html" indent="yes"/>

  <xsl:template match="/">
    <section class="cart-page clearfix">
      <xsl:choose>
        <xsl:when test="count(/ShoppingCart/CartItem)=0">
          <h1 class="producttitle">
            <i class="fa fa-cart-arrow-down"></i>
            <xsl:text> </xsl:text>
            <xsl:value-of select="/ShoppingCart/CartEmptyText"></xsl:value-of>
          </h1>
          <section class="cart-button clearfix">
            <a href="/" class="btn-back">
              <xsl:value-of select="/ShoppingCart/BackText"></xsl:value-of>
            </a>
          </section>
        </xsl:when>
        <xsl:otherwise>
          <div class="carttitle">
            <xsl:value-of select="/ShoppingCart/YourCartText"></xsl:value-of>
            (<strong>
              <xsl:value-of select="/ShoppingCart/TotalProducts"></xsl:value-of>
              <xsl:text> </xsl:text>
            </strong> <xsl:value-of select="/ShoppingCart/ProductText"></xsl:value-of>)
          </div>
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
                  <xsl:value-of select="/ShoppingCart/QuantityText"></xsl:value-of>
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
          <div class="row flex flex-wrap">
            <div class="col-xs-6 gifts">
              <xsl:if test="/ShoppingCart/HasGift='true'">
                <h3>Quà tặng:</h3>
                <xsl:apply-templates select="/ShoppingCart/CartItem" mode="Gifts"></xsl:apply-templates>
              </xsl:if>
            </div>
            <div class="col-xs-6">
              <div class="totalamount">
                <xsl:text>Tạm tính: </xsl:text>
                <strong>
                  <xsl:value-of select="/ShoppingCart/SubTotal"></xsl:value-of>
                </strong>
              </div>
              <div class="totalamount">
                <xsl:text>Giảm giá: </xsl:text>
                <strong>
                  <xsl:value-of select="/ShoppingCart/DiscountTotal"></xsl:value-of>
                </strong>
              </div>
              <div class="totalamount">
                <xsl:value-of select="/ShoppingCart/TotalText"></xsl:value-of>
                <xsl:text>: </xsl:text>
                <strong>
                  <xsl:value-of select="/ShoppingCart/Total"></xsl:value-of>
                </strong>
              </div>
            </div>
          </div>
          <div class="clearfix">
            <xsl:if test="/ShoppingCart/ContinueShoppingUrl!=''">
              <a class="btn-back pull-left">
                <xsl:attribute name="href">
                  <xsl:value-of select="/ShoppingCart/ContinueShoppingUrl"></xsl:value-of>
                </xsl:attribute>
                Tiếp tục mua sắm
              </a>
            </xsl:if>
            <button class="hvr-sweep-to-right btn-continue btn-pay" id="checkout" name="checkout">
              <xsl:attribute name="onclick">
                <xsl:text>setLocation('</xsl:text>
                <xsl:value-of select="/ShoppingCart/CheckoutUrl"></xsl:value-of>
                <xsl:text>');return false;</xsl:text>
              </xsl:attribute>
              <xsl:value-of select="/ShoppingCart/CheckoutProcessText"></xsl:value-of>
            </button>
          </div>
        </xsl:otherwise>
      </xsl:choose>
    </section>
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
            <a href="#" onclick="AjaxCart.removefromcart(this);return false;">
              <xsl:attribute name="data-itemguid">
                <xsl:value-of select="ItemGuid"></xsl:value-of>
              </xsl:attribute>
              <xsl:text>Bỏ sản phẩm</xsl:text>
              <!--<xsl:value-of select="/ShoppingCart/RemoveText"></xsl:value-of>-->
            </a>
            <a class="loveit" href="#" onclick="AjaxCart.carttowishlist(this);return false;">
              <xsl:attribute name="data-itemguid">
                <xsl:value-of select="ItemGuid"></xsl:value-of>
              </xsl:attribute>
              <i class="fa fa-heart" aria-hidden="true"></i>
              <xsl:text> </xsl:text>
              <xsl:text>Để dành mua sau</xsl:text>
            </a>
          </div>
        </div>
      </td>
      <td class="price">
        <!--<xsl:if test="DiscountPercentage !=''">
          <div class="old">
            <xsl:value-of select="OriginalPrice"></xsl:value-of>
          </div>
        </xsl:if>-->
        <div class="new">
          <xsl:value-of select="OriginalPrice"></xsl:value-of>
        </div>
        <!--<xsl:if test="DiscountPercentage !=''">
          <div class="sale">
            <xsl:text>Giảm: </xsl:text>
            <xsl:value-of select="DiscountPercentage"></xsl:value-of>
          </div>
        </xsl:if>-->
      </td>
      <td class="amount">
        <div class="input-number">
          <div class="btn-spin btn-dec">-</div>
          <input type="text" maxlength="10" class="qty-input" onchange="AjaxCart.updatecart();return false;">
            <xsl:attribute name="name">
              <xsl:text>itemquantity</xsl:text>
              <xsl:value-of select="ItemGuid"></xsl:value-of>
            </xsl:attribute>
            <xsl:attribute name="value">
              <xsl:value-of select="Quantity"></xsl:value-of>
            </xsl:attribute>
          </input>
          <div class="btn-spin btn-inc">+</div>
        </div>
      </td>
      <td class="total">
        <div class="amount">
          <xsl:value-of select="ItemSubTotal"></xsl:value-of>
        </div>
      </td>
    </tr>
  </xsl:template>

  <xsl:template match="CartItem" mode="Gifts">
    <xsl:if test="GiftDescription!=''">
      <div class="row flex flex-wrap">
        <xsl:value-of select="GiftDescription" disable-output-escaping="yes"></xsl:value-of>
      </div>
    </xsl:if>
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
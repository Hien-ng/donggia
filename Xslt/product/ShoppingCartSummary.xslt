<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl">
  <xsl:output method="html" indent="yes"/>

  <xsl:template match="/">
    <xsl:if test="/ShoppingCart/Address != ''">
      <section class="order-summary clearfix">
        <div class="order-title clearfix">
          <h3 class="title">
            <xsl:value-of select="/ShoppingCart/AddressText"></xsl:value-of>
          </h3>
          <a class="btn-edit">
            <xsl:attribute name="href">
              <xsl:text>/checkoutaddress</xsl:text>
            </xsl:attribute>
            <xsl:value-of select="/ShoppingCart/ChangeText"></xsl:value-of>
          </a>
        </div>
        <div class="table-responsive table-wrap clearfix">
          <table class="table order-table">
            <tbody>
              <tr class="billing-name">
                <td colspan="2">
                  <xsl:value-of select="/ShoppingCart/LastName"></xsl:value-of>
                  <xsl:value-of select="/ShoppingCart/FirstName"></xsl:value-of>
                </td>
              </tr>
              <tr class="billing-phone">
                <td>
                  <span>
                    <xsl:text>Số điện thoại:</xsl:text>
                  </span>
                </td>
                <td>
                  <xsl:value-of select="/ShoppingCart/Phone"></xsl:value-of>
                </td>
              </tr>
              <tr class="billing-address">
                <td>
                  <span>
                    <xsl:text>Địa chỉ:</xsl:text>
                  </span>
                </td>
                <td>
                  <xsl:value-of select="/ShoppingCart/Address"></xsl:value-of>
                </td>
              </tr>
            </tbody>
          </table>
        </div>
      </section>
    </xsl:if>
    <section class="minicart clearfix">
      <div class="carttitle">
        <xsl:value-of select="/ShoppingCart/CartText"></xsl:value-of>
        <xsl:text> (</xsl:text>
        <strong>
          <xsl:value-of select="/ShoppingCart/TotalProducts"></xsl:value-of>
        </strong>
        <xsl:text> </xsl:text>
        <xsl:value-of select="/ShoppingCart/ProductText"></xsl:value-of>
        <xsl:text>)</xsl:text>
      </div>
      <a class="btn-edit">
        <xsl:attribute name="href">
          <xsl:value-of select="/ShoppingCart/CartPageUrl"></xsl:value-of>
        </xsl:attribute>
        <xsl:value-of select="/ShoppingCart/ChangeText"></xsl:value-of>
      </a>
      <div class="carttable clearfix">
        <xsl:apply-templates select="/ShoppingCart/CartItem"></xsl:apply-templates>
        <section class="group">
          <div class="label">
            <xsl:text>Tạm tính</xsl:text>
          </div>
          <div class="value">
            <xsl:value-of select="/ShoppingCart/SubTotal"></xsl:value-of>
          </div>
        </section>
        <section class="group">
          <div class="label">
            <xsl:text>Giảm giá</xsl:text>
          </div>
          <div class="value discount-total">
            <xsl:value-of select="/ShoppingCart/DiscountTotal"></xsl:value-of>
          </div>
        </section>
        <section class="group">
          <div class="label">
            <xsl:value-of select="/ShoppingCart/ShippingTotalText"></xsl:value-of>
          </div>
          <div class="value shipping-total">
            <xsl:value-of select="/ShoppingCart/ShippingTotal"></xsl:value-of>
          </div>
        </section>
        <section class="group">
          <div class="label">
            <xsl:value-of select="/ShoppingCart/TotalText"></xsl:value-of>
          </div>
          <div class="value order-total">
            <xsl:value-of select="/ShoppingCart/Total"></xsl:value-of>
          </div>
        </section>
        <xsl:if test="/ShoppingCart/CouponIsAvailable='true'">
          <div class="coupon-code">
            <xsl:choose>
              <xsl:when test="/ShoppingCart/CouponCode!=''">
                <div class="discount-total coupon-input">
                  <div class="summary-total">
                    <span class="title">Mã sử dụng:</span>
                    <div class="form-group">
                      <div class="btn-remove">
                        <input type="button" onclick="AjaxCart.removecoupon();return false;" value="Xóa" runat="server" />
                      </div>
                      <strong>
                        <xsl:value-of select="/ShoppingCart/CouponCode"></xsl:value-of>
                      </strong>
                    </div>
                  </div>
                </div>
              </xsl:when>
              <xsl:otherwise>
                <div class="coupon-input">
                  <span class="title">Mã khuyến mãi:</span>
                  <div class="form-group">
                    <input type="text" id="couponCode" autocomplete="off" max-length="20"></input>
                    <input type="button" onclick="AjaxCart.applycoupon();return false;" class="apply-btn" value="Áp dụng" runat="server" />
                  </div>
                  <div class="coupon-result coupon-note">
                    [Nhập <strong>mã ưu đãi</strong> (nếu có), và bấm "<strong>Áp dụng</strong>"]
                  </div>
                  <xsl:if test="/ShoppingCart/CouponApplyResult!=''">
                    <span class="coupon-result">
                      <xsl:value-of select="/ShoppingCart/CouponApplyResult"></xsl:value-of>
                    </span>
                  </xsl:if>
                  <span class="coupon-apply-error"></span>
                </div>
              </xsl:otherwise>
            </xsl:choose>
          </div>
        </xsl:if>

        <xsl:if test="/ShoppingCart/PointIsAvailable='true'">
          <section class="group spending-points">
            <div class="label">
              Điểm sử dụng:
            </div>
            <div id="spendingPointsLabel" class="value">
              <xsl:value-of select="/ShoppingCart/SpendingPoints"></xsl:value-of>
            </div>
            <div id="pointSlider" data-min="0" data-step="10">
              <xsl:attribute name="data-max">
                <xsl:value-of select="/ShoppingCart/TotalPoints"></xsl:value-of>
              </xsl:attribute>
              <xsl:attribute name="data-value">
                <xsl:value-of select="/ShoppingCart/SpendingPoints"></xsl:value-of>
              </xsl:attribute>
            </div>
            <div class="clearfix">
              <input id="spendingPoints" name="spendingPoints" type="hidden">
                <xsl:attribute name="value">
                  <xsl:value-of select="/ShoppingCart/SpendingPoints"></xsl:value-of>
                </xsl:attribute>
              </input>
              <span class="pull-left">0</span>
              <span class="pull-right">
                <xsl:value-of select="/ShoppingCart/TotalPoints"></xsl:value-of>
              </span>
            </div>
          </section>
        </xsl:if>

      </div>
    </section>
  </xsl:template>

  <xsl:template match="CartItem">
    <div class="group clearfix">
      <div class="product clearfix">
        <div class="productimg">
          <img>
            <xsl:attribute name="src">
              <xsl:value-of select="ThumbnailUrl"></xsl:value-of>
            </xsl:attribute>
            <xsl:attribute name="alt">
              <xsl:value-of select="Title"></xsl:value-of>
            </xsl:attribute>
          </img>
        </div>
        <div class="productdetail">
          <h3 class="productname">
            <xsl:value-of select="Title" disable-output-escaping="yes"></xsl:value-of>
          </h3>
        </div>
      </div>
      <div class="amount">
        <div class="price">
          <xsl:value-of select="Price"></xsl:value-of>
        </div>
        <div class="count">
          <xsl:text>x </xsl:text>
          <xsl:value-of select="Quantity"></xsl:value-of>
        </div>
        <div class="total">
          <xsl:value-of select="ItemTotal"></xsl:value-of>
        </div>
      </div>
    </div>
  </xsl:template>

</xsl:stylesheet>
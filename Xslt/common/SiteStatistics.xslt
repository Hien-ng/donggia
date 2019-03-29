<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl">
  <xsl:output method="html" indent="yes"/>

  <xsl:template match="/">
    <h2 class="module-title">
      <xsl:value-of select="/Statistics/ModuleTitle"></xsl:value-of>
    </h2>
    <div>
      <ul class="userstats">
        <li>
          <img src="/Data/SiteImages/uoGroup2.gif" />
          <xsl:value-of select="/Statistics/PeopleOnlineLabel"></xsl:value-of>
        </li>
        <li>
          <ul class="userstats">
            <li>
              <img src="/Data/SiteImages/uoVisitors.gif" />
              <xsl:value-of select="/Statistics/VisitorsOnlineLabel"></xsl:value-of>
              <xsl:value-of select="/Statistics/VisitorsOnline"></xsl:value-of>
            </li>
            <li>
              <img src="/Data/SiteImages/uoMembers.gif" />
              <xsl:value-of select="/Statistics/MembersOnlineLabel"></xsl:value-of>
              <xsl:value-of select="/Statistics/MembersOnline"></xsl:value-of>
            </li>
            <li>
              <img src="/Data/SiteImages/uoTotal.gif" />
              <xsl:value-of select="/Statistics/TotalOnlineLabel"></xsl:value-of>
              <xsl:value-of select="/Statistics/TotalOnline"></xsl:value-of>
            </li>
          </ul>
        </li>
      </ul>
    </div>
    
    <div>
      <ul class="userstats">
        <li>
          <img src="/Data/SiteImages/uoGroup1.gif" />
          <xsl:value-of select="/Statistics/MembershipLabel"></xsl:value-of>
        </li>
        <li>
          <ul class="userstats">
            <li>
              <img src="/Data/SiteImages/uoNewToday.gif" />
              <xsl:value-of select="/Statistics/NewUsersTodayLabel"></xsl:value-of>
              <xsl:value-of select="/Statistics/NewUsersToday"></xsl:value-of>
            </li>
            <li>
              <img src="/Data/SiteImages/uoNewYesterday.gif" />
              <xsl:value-of select="/Statistics/NewUsersYesterdayLabel"></xsl:value-of>
              <xsl:value-of select="/Statistics/NewUsersYesterday"></xsl:value-of>
            </li>
            <li>
              <img src="/Data/SiteImages/uoOverall.gif" />
              <xsl:value-of select="/Statistics/TotalUsersLabel"></xsl:value-of>
              <xsl:value-of select="/Statistics/TotalUsers"></xsl:value-of>
            </li>
            <li>
              <img src="/Data/SiteImages/uoLatest.gif" />
              <xsl:value-of select="/Statistics/NewestUserLabel"></xsl:value-of>
              <br />
              <xsl:text>  </xsl:text>
              <xsl:value-of select="/Statistics/NewestUser"></xsl:value-of>
            </li>
          </ul>
        </li>
      </ul>
    </div>

    <!--<xsl:if test="IsAuthenticated = 'true'">
      <div>
        <ul class="userstats">
          <li>
            <xsl:value-of select="/Statistics/OnlineMembersLabel"></xsl:value-of>
          </li>
          <li>
            <ul class="userstats">
              <xsl:apply-templates select="/Statistics/OnlineMember"></xsl:apply-templates>
            </ul>
          </li>
        </ul>
      </div>
    </xsl:if>-->
  </xsl:template>

  <xsl:template match="OnlineMember">
    
  </xsl:template>
</xsl:stylesheet>
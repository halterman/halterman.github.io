<?xml version='1.0'?> 
<xsl:stylesheet 
 xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
 xmlns:fo="http://www.w3.org/1999/XSL/Format"
 version="1.0"> 

<xsl:import
 href="/usr/share/xml/docbook/stylesheet/docbook-xsl/fo/fop.xsl"/> 

<xsl:param name="section.autolabel" select="1"/> 
<xsl:param name="section.label.includes.component.label" select="1"/> 
<xsl:param name="admon.graphics" select="1"/>
<xsl:param name="admon.graphics.path" select="'../images/'"/>
<xsl:param name="admon.graphics.extension" select="'.svg'"/>
<xsl:param name="profile.arch" select="'pdf'"/>

<!--
<xsl:param name="symbol.font.family">Symbol,ZapfDingbats</xsl:param>
-->

<xsl:param name="orderedlist.label.width">1.2em</xsl:param>

<xsl:attribute-set name="section.title.level1.properties">
  <xsl:attribute name="border-left">1.0pt solid black</xsl:attribute>
  <xsl:attribute name="border-top">1.0pt solid black</xsl:attribute>
  <xsl:attribute name="padding">8pt</xsl:attribute>
</xsl:attribute-set>

<xsl:attribute-set name="figure.properties">
  <xsl:attribute name="border-bottom">1.0pt solid black</xsl:attribute>
  <xsl:attribute name="border-top">1.0pt solid black</xsl:attribute>
</xsl:attribute-set>


<xsl:attribute-set name="example.properties">
  <!--
  <xsl:attribute name="background-color">#FFFFCC</xsl:attribute>
  -->
  <xsl:attribute name="background-color">#eeeeee</xsl:attribute>
  <xsl:attribute name="padding">0.2in</xsl:attribute>
  <xsl:attribute name="keep-together.within-column">"auto"</xsl:attribute>
</xsl:attribute-set>

<!--
<xsl:param name="shade.verbatim" select="1" />
    <xsl:attribute-set name="shade.verbatim.style">
        <xsl:attribute name="padding-top">3pt</xsl:attribute>
        <xsl:attribute name="padding-bottom">3pt</xsl:attribute>
        <xsl:attribute name="padding-left">3pt</xsl:attribute>
        <xsl:attribute name="background-color">#FFFFCC</xsl:attribute>
    </xsl:attribute-set>
-->

<xsl:attribute-set name="admonition.properties">
  <xsl:attribute name="border-left">0.5pt solid black</xsl:attribute>
  <xsl:attribute name="border-top">0.5pt solid black</xsl:attribute>
  <xsl:attribute name="border-bottom">0.5pt solid black</xsl:attribute>
  <xsl:attribute name="border-right">0.5pt solid black</xsl:attribute>
  <xsl:attribute name="background-color">#EEEEFF</xsl:attribute>
  <xsl:attribute name="padding">0.1in</xsl:attribute>
</xsl:attribute-set>

<xsl:attribute-set name="orderedlist.label.properties">
  <xsl:attribute name="text-align">right</xsl:attribute>
</xsl:attribute-set>

<xsl:attribute-set name="list.block.properties">
  <xsl:attribute name="provisional-label-separation">0.8em</xsl:attribute>
  <xsl:attribute name="provisional-distance-between-starts">1.5em</xsl:attribute>
</xsl:attribute-set>

<!--
<xsl:attribute-set name="table.table.properties">
  <xsl:attribute name="width">100%</xsl:attribute>
  <xsl:attribute name="table-layout">fixed</xsl:attribute>
</xsl:attribute-set>
-->

<xsl:param name="local.l10n.xml" select="document('')"/> 
<l:i18n xmlns:l="http://docbook.sourceforge.net/xmlns/l10n/1.0"> 
  <l:l10n language="en"> 
    <l:context name="xref-number-and-title"> 
      <l:template name="appendix" text="Appendix %n"/> 
      <l:template name="chapter" text="Chapter %n"/> 
      <l:template name="table" text="Table %n"/> 
      <l:template name="sect1" text="Section %n"/> 
      <l:template name="example" text="Example %n"/> 
      <l:template name="figure" text="Figure %n"/> 
    </l:context>    
  </l:l10n>
</l:i18n>

<!--
<xsl:template match="processing-instruction('hard-pagebreak')">
   <block break-after='page'/>
</xsl:template>
-->


<xsl:param name="header.rule" select="0"/>
<xsl:template name="header.content">
  <xsl:param name="pageclass" select="''"/>
  <xsl:param name="sequence" select="''"/>
  <xsl:param name="position" select="''"/>
  <xsl:param name="gentext-key" select="''"/>
</xsl:template>

<xsl:attribute-set name="footer.content.properties">
  <!--
  <xsl:attribute name="font-style">italic</xsl:attribute>
  -->
  <xsl:attribute name="font-size">9pt</xsl:attribute>
  <xsl:attribute name="font-family">
    <xsl:value-of select="$body.fontset"/>
  </xsl:attribute>
  <xsl:attribute name="margin-left">
    <xsl:value-of select="$title.margin.left"/>
  </xsl:attribute>
</xsl:attribute-set>


<xsl:template name="footer.content">
  <xsl:param name="pageclass" select="''"/>
  <xsl:param name="sequence" select="''"/>
  <xsl:param name="position" select="''"/>
  <xsl:param name="gentext-key" select="''"/>
  <fo:block>
    <xsl:choose>
      <xsl:when test="$pageclass = 'titlepage'">
        <!--no footer on title pages-->
      </xsl:when>
      <xsl:otherwise>       <!--Not a title page-->
        <xsl:choose>
          <xsl:when test="$double.sided = 0">   <!-- Single-sided -->
            <xsl:choose>
              <xsl:when test="$position = 'left'">
                <xsl:apply-templates select="." mode="titleabbrev.markup"/>
              </xsl:when>
              <xsl:when test="$position = 'center'">
                <fo:page-number/>
              </xsl:when>
              <xsl:when test="$position = 'right'">
                <xsl:attribute name="color">red</xsl:attribute>
                <xsl:attribute name="font-style">italic</xsl:attribute>
                <!-- <xsl:text>Version 0.0.2 2009-09-15</xsl:text> -->
                <xsl:text>Version 0.9.5 2019-02-17</xsl:text>
              </xsl:when>
            </xsl:choose>
          </xsl:when>       <!-- Single-sided -->
          <xsl:otherwise>   <!--Double-sided--> 
            <xsl:choose>
              <xsl:when test="$position = 'left'">
                <xsl:choose>
                  <xsl:when test="$sequence = 'even' or
                                  $sequence = 'blank'">
                    <fo:page-number/>
                  </xsl:when>
                  <xsl:otherwise> <!-- left/odd -->
                    <xsl:attribute name="color">red</xsl:attribute>
                    <xsl:attribute name="font-style">italic</xsl:attribute>
                    <!-- <xsl:text>Version 0.0.2 2009-09-15</xsl:text> -->
                    <xsl:text>Version 0.9.5 2019-09-17</xsl:text>
                  </xsl:otherwise>
                </xsl:choose>
              </xsl:when>
              <xsl:when test="$position = 'center'">
                <xsl:apply-templates select="." mode="titleabbrev.markup"/>
              </xsl:when>
              <xsl:when test="$position = 'right'">
                <xsl:choose>
                  <xsl:when test="$sequence = 'even' or
                                  $sequence = 'blank'">
                    <xsl:attribute name="color">red</xsl:attribute>
                    <xsl:attribute name="font-style">italic</xsl:attribute>
                    <!-- <xsl:text>Version 0.0.2 2009-09-15</xsl:text> -->
                    <xsl:text>Version 0.9.5 2019-02-17</xsl:text>
                  </xsl:when>
                  <xsl:otherwise> <!-- left/odd -->
                    <fo:page-number/>
                  </xsl:otherwise>
                </xsl:choose>
              </xsl:when>
            </xsl:choose>
          </xsl:otherwise>  <!-- Double-sided -->
        </xsl:choose>
      </xsl:otherwise>      <!--Not a title page-->
    </xsl:choose>
  </fo:block>
</xsl:template>



</xsl:stylesheet>  

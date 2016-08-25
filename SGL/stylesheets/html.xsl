<?xml version='1.0'?> 
<xsl:stylesheet 
 xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0"> 

<xsl:import
 href="/usr/share/sgml/docbook/xsl-stylesheets/xhtml/chunk.xsl"/> 

<!--    VERY OLD
<xsl:import
 href="/usr/share/docbook-xsl/xhtml/chunk.xsl"/> 
<xsl:import
 href="c:\cygwin\usr\share\docbook-xsl\xhtml\chunk.xsl"/> 
 -->

<xsl:param name="html.stylesheet" select="'../stylesheets/sgl.css'"/> 
<xsl:param name="section.autolabel" select="1"/> 
<xsl:param name="section.label.includes.component.label" select="1"/> 
<xsl:param name="section.autolabel.max.depth" select="1"/> 
<xsl:param name="toc.section.depth" select="1"/> 
<xsl:param name="admon.graphics" select="1"/>
<xsl:param name="admon.graphics.path" select="'../images/'"/>
<xsl:param name="profile.arch" select="'html'"/>

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
<xsl:template match="screen[@status = 'output']" mode="class.value">
  <xsl:value-of select="'screen-output'"/>
</xsl:template>
-->

<xsl:template name="user.header.content">
    <!--
    <xsl:apply-templates select="//copyright[1]"
                         mode="titlepage.mode"/> -->
    <!--
    <i>Copyright</i> &#160; &#169; <i>2009 Richard L.
    Halterman</i>&#160;&#160;&#160;
    <font color="red">[Version 0.3 Sept. 18, 2009]</font>
    <hr/>
    -->
</xsl:template>

<xsl:template name="user.footer.content">
    <!--
    <xsl:apply-templates select="//copyright[1]"
                         mode="titlepage.mode"/> -->
    <hr/>
        <table border="0" width="100%">
        <tr><td width="40%" align="left">
    <i>Copyright</i> <font>&#160; &#169;</font>  <i>2014 Richard L.
    Halterman</i></td>
        <td width="20%" align="center">
    <font color="red">Version 0.7.5</font></td>
        <td width="40%" align="right">
    <font color="red">November  4, 2014</font></td></tr>
        </table>
    
</xsl:template>


<xsl:param name="postnuke.document.footer"></xsl:param>
	<xsl:template name="user.footer.navigation">
	<div id="customfooter">
        <a href="http://creativecommons.org/licenses/by-sa/3.0/us/">
            <img alt="Creative Commons License" border="0" 
        src="http://i.creativecommons.org/l/by-sa/3.0/us/88x31.png" />
        </a>
	This work is licensed under a 
        <a href="http://creativecommons.org/licenses/by-sa/3.0/us/">
        Creative Commons License</a>.
	</div>
	</xsl:template>


<xsl:param name="suppress.header.navigation" select="1"></xsl:param>

<xsl:param name="chunk.tocs.and.lots" select="1"></xsl:param>

<xsl:param name="table.borders.with.css" select="1"></xsl:param>


</xsl:stylesheet>  

<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <!--xsl:template говорит о том, что тут будет замена. match показывает, к какой части документа это применимо-->
  <xsl:template match="/">
    <table>
      <thead>
        <tr>
          <th>subsequences</th>
        </tr>
      </thead>
      <xsl:for-each select="objects/object">
        <xsl:variable name="counter" select="position()"/>
        <tbody>
          <tr>
            <th>
              <!--Извлекаем значение из XML-тега-->
              <xsl:value-of select="subsequence"></xsl:value-of>
            </th>
          </tr>
        </tbody>
      </xsl:for-each>
    </table>

    <h3>Maximum length rising subsequence:</h3>
    <xsl:for-each select="objects/object">
      <xsl:variable name="counter" select="position()"/>
      <xsl:value-of select="max"></xsl:value-of>
    </xsl:for-each>
  </xsl:template>
</xsl:stylesheet>

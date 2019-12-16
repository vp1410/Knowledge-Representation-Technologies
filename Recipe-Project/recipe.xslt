<?xml version="1.0"?>
<xsl:stylesheet version="1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:template match="/">
        <html>
            <link rel="stylesheet" type="text/css" href="recipe.css"/>
            <body>
				<xsl:for-each select="/Recipes/recipe">
                    <div class="rname">
                        <xsl:value-of select="rname" />
                    </div>
                    <div>
                        <xsl:value-of select="chef" />
                    </div>
                    <img>
                        <xsl:attribute name="src">
                            <xsl:value-of select="photo" />
                        </xsl:attribute>
                    </img>
					<div class = "servings">
                        <xsl:value-of select="servings/heading"/>
					</div>
					<div class="count">
                        <xsl:value-of select = "servings/count"/>
                    </div>
					<div class ="ingredients">
                    <xsl:value-of select="ingredients/heading" />
					</div>
                    <ul>
                        <xsl:for-each select="ingredients/component/list">
                            <li>
                                <xsl:value-of select="text()" />
                            </li>
                        </xsl:for-each>
                    </ul>
                    <div class="procedure">
                        <xsl:value-of select="instruction/procedure" />
                    </div>
                    <ul>
                        <xsl:for-each select="instruction/steps/step">
                            <li>
                                <xsl:value-of select="text()" />
                            </li>
                        </xsl:for-each>
                    </ul>
                    <div class="hints">
                        <xsl:value-of select="hints/heading"/>
					</div>	
					
                        <xsl:value-of select = "hints/content"/>
                    
                </xsl:for-each>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>
<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:tei="http://www.tei-c.org/ns/1.0"
    xpath-default-namespace="http://www.tei-c.org/ns/1.0" exclude-result-prefixes="xs tei"
    version="2.0">
    <xsl:output method="html" indent="yes" encoding="UTF-8"/>
    <xsl:preserve-space elements="*"/>
    <xsl:template match="/">
        <!-- RÈGLES DE SORTIE -->
        <xsl:variable name="witfile">
            <xsl:value-of select="replace(base-uri(XML-TEI-ms69-2), '.xml', '')"/>
            <!-- récupération du nom et du chemin du fichier courant -->
        </xsl:variable>
        <xsl:variable name="pathHome">
            <xsl:value-of select="concat($witfile,'home','.html')"/>
            <!-- variable pour le contenu de home.html  -->
        </xsl:variable>
        <xsl:variable name="informations">
            <xsl:value-of select="concat($witfile,'informations','.html')"/>
            <!-- variable pour le contenu de informations.html  -->
        </xsl:variable>
        <xsl:variable name="transcription">
            <xsl:value-of select="concat($witfile,'transcription','.html')"/>
            <!-- variable pour le contenu de transcription.html  -->
        </xsl:variable>
        <xsl:variable name="facsimile">
            <xsl:value-of select="concat($witfile,'facsimile','.html')"/>
            <!-- variable pour le contenu de facsimilé.html  -->
        </xsl:variable>
        <xsl:variable name="index">
            <xsl:value-of select="concat($witfile,'index','.html')"/>
            <!-- variable pour le contenu de index.html  -->
        </xsl:variable>
        
        <!-- VARIABLES CONTENANT LES PARTIES COMMUNES À TOUTES LES PAGES -->
        
        <!-- variable <head> -->
        <xsl:variable name="head">
            <head>
                <meta name="viewport" http-equiv="Content-Type" content="text/html; charset=UTF-8, width=device-width, initial-scale=1, shrink-to-fit=no"/>
                <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous"/>
                <link rel="stylesheet" href="style.css"/>
                <title>La guerre du Péloponnèse</title>
                <link rel="icon" href="../img/favicon.jpg" type="image/jpg"/>
                <meta name="description" content="Édition numérique des 4 premiers folios du manuscrit grec de La guerre du Péloponnèse Plut. 69.2 de la Biblioteca Medicea Laurenziana"/>
            </head>
        </xsl:variable>
        
        <!-- variable navbar -->
        <xsl:variable name="navheader">
            <header>
                <nav class="navbar navbar-expand-md navbar-light bg-light">
                    <a class="navbar-brand" href="{$pathHome}">Accueil</a>
                    <ul class="navbar-nav mr-auto">
                        <li class="nav-item">
                            <a class="nav-link" href="{$informations}">Informations</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="{$transcription}">Transcription</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="{$facsimile}">Facsimilé</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="{$index}">Index</a>
                        </li>
                    </ul>                    
                </nav>
            </header>
        </xsl:variable>
        
        <!-- variable <footer> -->
        <xsl:variable name="footer">
            <footer class="bg-light" position="absolute">
                <div class="container-fluid">
                    <div class="row pt-4 px-4"><p>CC BY</p><br/><p>© <xsl:value-of select="//respStmt/persName"/> 2023</p></div>
                    <div class="row px-4"><p class="credit-footer">Site local développé en avril 2023 dans le cadre des enseignements du <a href="http://www.chartes.psl.eu/fr/cursus/master-technologies-numeriques-appliquees-histoire" target="_blank">Master &#171; Technologies numériques appliquées à l'histoire &#187;</a> de l'École nationale des chartes.</p></div>
                </div>
            </footer>
            <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
            <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
            <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>
        </xsl:variable>
        
        <!-- ÉCRITURE DES PAGES DU SITE -->
        <!-- PAGE D'ACCUEIL -->
        <xsl:result-document href="{$pathHome}" method="html" indent="yes">
            <xsl:text disable-output-escaping='yes'>&lt;!DOCTYPE html&gt;</xsl:text>
            <html lang="fr">
                <xsl:copy-of select="$head"/>
                <body>
                    <xsl:copy-of select="$navheader"/>
                    <div class="container-fluid">
                        <!-- image du codex à gauche, texte aligné au centre à droite -->
                        <div class="row media"> 
                            <div class="col-sm-6 px-5 py-4 align-self-center">
                                <div>
                                    <h3 style="text-indent: 5%;">Édition paléographique de <xsl:value-of select="//msDesc//msName"/></h3>
                                    <p>Cet espace est dédié à l'édition des folios <xsl:value-of select="//sourceDesc/msContents//locus/@from"/> et <xsl:value-of select="//sourceDesc/msContents//locus/@to"/> du manuscrit grec <xsl:value-of select="//sourceDesc//msIdentifier/idno"/> de la <xsl:value-of select="//sourceDesc//msIdentifier/institution"/>. Ce manuscrit contient le texte de <xsl:value-of select="replace(//sourceDesc//biblStruct[@xml:id='Romilly1953']/monogr/title[@level='m'],'La','la')"/> par <xsl:value-of select="//sourceDesc//msContents//author"/>.</p>
                                    <p><xsl:text>Les 4 premier folios du manuscrit que nous nous proposons de transcrire et de traduire ont été rédigés par un copiste </xsl:text><xsl:value-of select="replace(//sourceDesc//msItem[@xml:id='Deuxième-main']//persName,'Anonyme','anonyme')"/><xsl:text> au début du XIII siècle.</xsl:text></p>
                                </div>
                            </div>
                            <div class="col-sm-6 media-body align-self-center"><img src="../img/Piatto anteriore.png" alt="BLM ms Plut. 69.2" class="img"/></div>
                        </div>
                    </div>
                    <xsl:copy-of select="$footer"/>
                </body>
            </html>
        </xsl:result-document>
        
        <!-- PAGE DE PRÉSENTATION DU MANUSCRIT -->
        <xsl:result-document href="{$informations}" method="html" indent="yes">
            <xsl:text disable-output-escaping='yes'>&lt;!DOCTYPE html&gt;</xsl:text>
            <html lang="fr">
                <xsl:copy-of select="$head"/>
                <body>
                    <xsl:copy-of select="$navheader"/>
                    <div class="container-fluid">
                        <div class="row"><div class="col-sm-7 px-5 separator"></div></div>
                        <div class="row">   
                            <div class="col-md-9 mt-5 mb-2 px-2 offset-2 infos">
                                <p><strong><xsl:value-of select="//institution"/>, <xsl:value-of select="//collection"/> Cote : <xsl:value-of select="//msIdentifier/idno"/></strong><br/>
                                <a><xsl:attribute name="href"><xsl:value-of select=".//msIdentifier//note[@type='Diktyon']"/></xsl:attribute>Voir la fiche du manuscrit sur la base Pinakes</a><br/>
                                <strong>Incipit : </strong><i><xsl:value-of select="//sourceDesc//msItem/incipit[@xml:lang='grc']"/></i>...(<i><xsl:value-of select="//sourceDesc//msItem/incipit[@xml:lang='fr']"/></i>...)<br/>
                                <strong>Explicit : </strong><i>...<xsl:value-of select="//sourceDesc//msItem/explicit[@xml:lang='grc']"/></i>(<i>...<xsl:value-of select="//sourceDesc//msItem/explicit[@xml:lang='fr']"/></i>).<br/>
                                <strong>Colophon : </strong><xsl:value-of select="//sourceDesc//msItem/colophon"/>.<br/>
                                <strong>Datation : </strong><xsl:value-of select="//sourceDesc//head/origDate"/>.<br/>
                                <strong>Langue : </strong><xsl:value-of select="//sourceDesc//msItem/msItem[@xml:id='Deuxième-main']/textLang"/>.</p>
                            </div>
                            <div class="row">
                                <div class="col-md-9 my-3 px-2 offset-2 infos">
                                <h3>Description matérielle</h3>
                                    <p><strong>Supports : </strong><xsl:value-of select="//physDesc//support"/>.</p>
                                    <p><strong>Dimensions : </strong><xsl:value-of select="//extent/width[@unit]"/>mm<xsl:text> x </xsl:text><xsl:value-of select="//extent/height[@unit]"/>mm.</p>
                                    <p><strong>Foliotation : </strong>
                                        <xsl:for-each select="//foliation/p">
                                            <xsl:value-of select="."/><xsl:text> </xsl:text>
                                        </xsl:for-each>
                                    </p>
                                    <p><strong>État de conservation : </strong><xsl:value-of select="//condition"/></p>                                    
                                        <p>
                                            <strong>Nombre de colonnes par folio : </strong><xsl:value-of select="//layout/@columns"/><br/>
                                            <strong>Nombre de lignes par colonne : </strong><xsl:text></xsl:text><xsl:value-of select="//layout/@writtenLines"/><br/>
                                            <strong>Description de la mise en page : </strong>
                                                <xsl:for-each select="//layoutDesc/layout/p">
                                                    <xsl:value-of select="."/><br/>
                                                </xsl:for-each>                                            
                                        </p>
                                    <p>
                                            <xsl:choose>
                                                <xsl:when test="count([@hands]) > 1">
                                                    <p><strong>Écritures : </strong> </p>
                                                    <p>
                                                    <xsl:for-each select="//physDesc/handNote">
                                                        <xsl:value-of select="./p"/><br/>
                                                    </xsl:for-each>
                                                    <xsl:for-each select="//scriptDesc/ScriptNote[@script='min-bouleutée']/p">
                                                        <xsl:value-of select="translate(.,'Minuscule bouleutée','La minuscule bouleutée est')"/>
                                                        <!--                                                            <xsl:if test="position()!= last()"> ;</xsl:if>
                                                            <xsl:if test="position() = last()">.</xsl:if>-->
                                                    </xsl:for-each>
                                                    <xsl:for-each select="//scriptDesc/ScriptNote[@script='Beta-Gamma']/p">
                                                        <xsl:value-of select="replace(.,'Écriture Beta-Gamma','L&amp;apos;écriture Bêta-Gamma est')"/>                                                      
                                                        <!--                                                            <xsl:if test="position()!= last()"> ;</xsl:if>
                                                            <xsl:if test="position() = last()">.</xsl:if>-->
                                                    </xsl:for-each>
                                                    </p>
                                                </xsl:when>
                                                <xsl:otherwise>
                                                    <p><strong>Écriture : </strong> </p>
                                                    <p>
                                                    <xsl:value-of select="//handNote/p"/><br/>
                                                    <xsl:for-each select="//scriptNote/p">
                                                        <xsl:value-of select="."/><br/>
                                                    </xsl:for-each>
                                                    </p>
                                                </xsl:otherwise>
                                            </xsl:choose>
                                    </p>
                              </div>
                            </div>
                            
                            <div class="row">                                
                                <div class="col-md-9 my-3 px-2 offset-2 infos">                                    
                                    <h3>Reliure et histoire du manuscrit</h3>
                                    <p><strong>Reliure : </strong><br/>
                                        <xsl:for-each select="//bindingDesc//decoNote">
                                            <xsl:value-of select="."/><br/>
                                        </xsl:for-each>
                                    </p>
                                    <p><strong>Histoire du manuscrit : </strong></p>
                                    <p>
                                        <xsl:value-of select="replace(//origin/p,'Manuscrit','Le manuscrit')"/><br/>
                                        <xsl:for-each select="//history/provenance">
                                            <xsl:value-of select="./p"/><br/>
                                        </xsl:for-each>
                                        <xsl:for-each select="//history/acquisition/p">
                                            <xsl:value-of select="."/>
                                        </xsl:for-each>
                                    </p>
                                </div>
                            </div>
                            
                            <div class="row">
                                <div class="col-md-9 my-3 px-2 offset-2 infos">                                    
                                    <h3>Indications bibliographiques</h3>
                                    <p>
                                        <ol>
                                        <xsl:for-each select="//biblStruct">
                                            <li>
                                                <p>
                                                <!-- S'il n'y a que le nom, comme pour Thucydide mettre seulement le nom, pour le reste, suivre avec le prénom-->
                                                <xsl:choose>
                                                    <xsl:when test=".//persName/forename">
                                                        <xsl:value-of select=".//persName/forename"/>
                                                        <xsl:text> </xsl:text>
                                                        <xsl:value-of select=".//persName/surname"/>
                                                        <xsl:text>, </xsl:text>
                                                    </xsl:when>
                                                    <xsl:otherwise>
                                                        <xsl:value-of select=".//persName/surname"/><xsl:text>, </xsl:text>
                                                    </xsl:otherwise>
                                                </xsl:choose>
                                                <!-- Si c'est un article de journal ou de revue -->
                                                <xsl:choose>
                                                    <xsl:when test=".//title[@level='a']">
                                                        <xsl:text>&#171; </xsl:text>
                                                        <xsl:value-of select=".//title[@level='a']"/>
                                                        <xsl:text> &#187;</xsl:text>
                                                        <xsl:text> dans </xsl:text>                                                                                             
                                                        <xsl:choose>
                                                            <!-- Pour l'article de D. Speranzi issu d'actes de colloque + collection -->
                                                            <xsl:when test=".//series">
                                                                <u><xsl:value-of select=".//title[@level='m']"/></u>
                                                                <xsl:text>, </xsl:text><xsl:value-of select=".//monogr/author"/><xsl:text> (dir.), </xsl:text>
                                                                <xsl:value-of select=".//imprint/pubPlace"/><xsl:text>, </xsl:text>
                                                                <xsl:value-of select=".//imprint/date"/><xsl:text> (</xsl:text>
                                                                <xsl:value-of select=".//series/title[@level='s']"/><xsl:text> </xsl:text>
                                                                <xsl:value-of select=".//series/biblScope[@unit='volume']"/><xsl:text>), </xsl:text>
                                                            </xsl:when>
                                                            <!-- Pour les autres articles-->
                                                            <xsl:otherwise>
                                                                <u><xsl:value-of select=".//title[@level='j']"/></u>
                                                                <xsl:if test=".//monogr/biblScope[@unit='volume']">
                                                                    <xsl:text>, </xsl:text>           
                                                                    <xsl:text>t. </xsl:text><xsl:value-of select=".//biblScope[@unit='volume']"/>
                                                                </xsl:if>
                                                                <xsl:text>, </xsl:text><xsl:value-of select=".//date"/>
                                                            </xsl:otherwise>
                                                        </xsl:choose>
                                                        <!-- Pour suivre la norme bibliographique de l'ENC, extent encode les pages extrêmes, ensuite passage particulier contenu dans biblScope -->
                                                        <xsl:if test="extent"><xsl:text>, pp. </xsl:text>
                                                        <xsl:value-of select=".//extent"/>
                                                        <xsl:text>, </xsl:text><xsl:value-of select=".//biblScope[@unit='page']"/>
                                                        <xsl:text>.</xsl:text><br/></xsl:if>
                                                    </xsl:when>
                                                    <!-- Pour la source Thucydide -->
                                                    <xsl:otherwise>
                                                        <xsl:value-of select=".//title[@level='m']"/><xsl:text>, éd. </xsl:text>
                                                        <xsl:value-of select=".//respStmt//forename"/><xsl:text> </xsl:text>
                                                        <xsl:value-of select=".//respStmt//surname"/><xsl:text>, </xsl:text>
                                                        <xsl:value-of select=".//pubPlace"/><xsl:text>, </xsl:text>
                                                        <xsl:value-of select=".//imprint/date"/><xsl:text>, </xsl:text>
                                                        <xsl:value-of select=".//extent"/><br/>
                                                    </xsl:otherwise>
                                                </xsl:choose>
                                                <!--                                            <xsl:choose>
                                                <xsl:when test=".//idno[@type='ISSN']">
                                                    <xsl:text>(ISSN </xsl:text>
                                                    <xsl:value-of select=".//idno[@type='ISSN']"/>
                                                    <xsl:text>), </xsl:text>
                                                </xsl:when>
                                                                                                        <xsl:when test=".//idno[@type='ISBN']">
                                                            <xsl:text>(ISBN </xsl:text>
                                                            <xsl:value-of select=".//idno[@type='ISBN']"/>
                                                            <xsl:text>), </xsl:text>
                                                        </xsl:when>
                                                <xsl:otherwise>
                                                    <xsl:text>(</xsl:text>
                                                    <xsl:value-of select=".//idno"/>
                                                    <xsl:text>), </xsl:text>
                                                </xsl:otherwise>
                                            </xsl:choose>-->
                                                </p>
                                            </li>
                                        </xsl:for-each>
                                        </ol>
                                    </p>
                                </div>
                            </div>
                        </div>
                    </div>
                    <xsl:copy-of select="$footer"/>
                </body>
            </html>
        </xsl:result-document>
        
        <!-- PAGE DU TEXTE TRANSCRIS -->
        <xsl:result-document href="{$transcription}" method="html" indent="yes">
            <xsl:text disable-output-escaping='yes'>&lt;!DOCTYPE html&gt;</xsl:text>
            <html lang="fr">
                <xsl:copy-of select="$head"/>
                <body>
                    <xsl:copy-of select="$navheader"/>
                    <div class="container-fluid">
                        <div class="row mx-4 my-4 transc">
                            <div class="col-md-4 offset-4 transc"></div>
                            <h4>Transcription fac-similaire</h4>
                            <p>
                                <xsl:for-each select="descendant::body//p[@xml:lang='grc']"><xsl:apply-templates select="." mode="transc"/></xsl:for-each>
                            </p>
                            <div class="col-md-4 transc"></div>
                            <h4>Traduction</h4>
                            <p>
                                <xsl:for-each select="descendant::body//p[@xml:lang='fr']"><xsl:apply-templates select="."/></xsl:for-each>
                            </p>
                        </div>
                    </div>
                    <xsl:copy-of select="$footer"/>
                </body>
            </html>
        </xsl:result-document>
        
        <!-- PAGE DES FACSIMILÉS -->
        <xsl:result-document href="{$facsimile}" method="html" indent="yes">
            <xsl:text disable-output-escaping='yes'>&lt;!DOCTYPE html&gt;</xsl:text>
            <html lang="fr">
                <xsl:copy-of select="$head"/>
                <body>
                    <xsl:copy-of select="$navheader"/>
                    <div class="container-fluid">
                        <div class="row mt-4">
                            <div class="col-md-4"><h3>Folio 002r</h3><hr/><img src="../img/002r.png" alt="Folio 002r"/></div>
                            <div class="col-md-4 float-end"><h3>Folio 002v</h3><hr/><img src="../img/002v.png" alt="Folio 002v"/></div>
                        </div>
                        <div class="row mt-4">
                            <div class="col-md-4"><h3>Folio 003r</h3><hr/><img src="../img/003r.png" alt="Folio 003r"/></div>
                            <div class="col-md-4 float-end"><h3>Folio 003v</h3><hr/><img src="../img/003v.png" alt="Folio 003v"/></div>
                        </div>
                    </div>
                    <xsl:copy-of select="$footer"/>
                </body>                
            </html>
        </xsl:result-document>
        
        <!-- PAGE DES INDEX -->
        <xsl:result-document href="{$index}" method="html" indent="yes">
            <xsl:text disable-output-escaping='yes'>&lt;!DOCTYPE html&gt;</xsl:text>
            <html lang="fr">
                <xsl:copy-of select="$head"/>
                <body>
                    <xsl:copy-of select="$navheader"/>
                    <div class="container-fluid">
                        <div class="row my-4">
                            <h2 class="offset-3">Index des noms</h2>
                            <div class="col-md-9 offset-2">
                                <xsl:for-each-group select="//listPerson/person" group-by="@xml:id">
                                    <h5 class="index_grec">
                                        <xsl:for-each select="./persName">
                                            <!-- Noms et dates -->
                                            <xsl:value-of select="./surname"/><xsl:if test="following::birth"><xsl:text> (</xsl:text><xsl:value-of select="following::birth"/><xsl:text> </xsl:text></xsl:if><xsl:if test="following::death"><xsl:value-of select="following::death"/><xsl:text>)</xsl:text></xsl:if>
                                            <xsl:if test="preceding::addName/@patronym"><xsl:value-of select="preceding::addName/@patronym"/></xsl:if><xsl:if test="following-sibling::addName/@demonym"><xsl:text>, </xsl:text><xsl:value-of select="following-sibling::addName/@demonym"/></xsl:if>
                                            <xsl:if test="position()!=last()">, 
                                            </xsl:if>
                                        </xsl:for-each>
                                    </h5>
                                    <!-- Description de la personne -->
                                    
                                    <xsl:if test="affiliation"><p><xsl:text>Affiliation : </xsl:text><xsl:value-of select="./affiliation"/><xsl:text>.</xsl:text></p><br/></xsl:if>
                                        <xsl:value-of select="./occuptation"/>
                                        <xsl:value-of select="./note"/>
                                    
                                    <!-- Récupération de chaque mention et de son numéro de ligne -->
                                    <p class="index_grec">
                                        <xsl:for-each-group select="//seg//persName[@ref=current()/concat('#', @xml:id)]" group-by=".">
                                            <xsl:apply-templates mode="transc"/>
                                            <!-- Numérotation-->
                                            <xsl:text> (l. </xsl:text>
                                            <xsl:for-each select="current-group()">
                                                <xsl:value-of select="replace(ancestor::seg/@facs, '#l', '')"/>
                                                <xsl:if test="position()!=last()">, </xsl:if>
                                            </xsl:for-each>
                                            <xsl:text>)</xsl:text>
                                            <xsl:if test="position()!=last()">, </xsl:if>
                                            <xsl:if test="position()=last()">.<br/></xsl:if>
                                        </xsl:for-each-group>
                                    </p>
                                </xsl:for-each-group>
                            </div>
                            <div class="row my-4">
                                <h2 class="offset-3">Index des lieux</h2>
                                <div class="col-md-9 offset-2">
                                    <xsl:for-each-group select="//listPlace/place" group-by="@xml:id">
                                        <h5 class="index_grec">
                                            <xsl:for-each select="./placeName">
                                                <xsl:value-of select="."/>
                                                <xsl:if test="position()!=last()">, 
                                                </xsl:if>
                                            </xsl:for-each>
                                        </h5>
                                        <!-- Description du lieux -->
                                        <p>
                                            <xsl:value-of select="./note"/>
                                        </p>
                                        <!-- Mention du placeName -->
                                        <p class="index_grec">
                                            <xsl:for-each-group select="//seg//placeName[@ref=current()/concat('#', @xml:id)]" group-by=".">
                                                <xsl:apply-templates mode="transc"/>
                                                <!-- Numérotation -->
                                                <xsl:text> (l. </xsl:text>
                                                <xsl:for-each select="current-group()">
                                                    <xsl:value-of select="replace(ancestor::seg/@facs, '#l', '')"/>
                                                    <xsl:if test="position()!=last()">, </xsl:if>
                                                </xsl:for-each>
                                                <xsl:text>)</xsl:text>
                                                <xsl:if test="position()!=last()">, </xsl:if>
                                                <xsl:if test="position()=last()">.<br/></xsl:if>
                                            </xsl:for-each-group>
                                        </p>
                                    </xsl:for-each-group>
                                  </div>
                               </div>
                            <div class="row my-4">
                                <h2 class="offset-3">Index des peuples</h2>
                                <div class="col-md-9 offset-2">
                                    <xsl:for-each-group select="//listOrg/org" group-by="@xml:id">
                                        <h5 class="index_grec">
                                            <xsl:for-each select="./orgName">
                                                <xsl:value-of select="./name"/>
                                                <xsl:if test="addName"><xsl:text>, </xsl:text><xsl:value-of select="./addName"/></xsl:if>
                                                <xsl:if test="position()!=last()">, 
                                                </xsl:if>
                                            </xsl:for-each>
                                        </h5>
                                        <!-- Description du peuple -->
                                        <p>
                                            <xsl:value-of select="./note"/>
                                        </p>
                                        <!-- Mention du orgName -->
                                        <p class="index_grec">
                                            <xsl:for-each-group select="//seg//orgName[@ref=current()/concat('#', @xml:id)]" group-by=".">
                                                <xsl:apply-templates mode="transc"/>
                                                <!-- Numérotation -->
                                                <xsl:text> (l. </xsl:text>
                                                <xsl:for-each select="current-group()">
                                                    <xsl:value-of select="replace(ancestor::seg/@facs, '#l', '')"/>
                                                    <xsl:if test="position()!=last()">, </xsl:if>
                                                </xsl:for-each>
                                                <xsl:text>)</xsl:text>
                                                <xsl:if test="position()!=last()">, </xsl:if>
                                                <xsl:if test="position()=last()">.<br/></xsl:if>
                                            </xsl:for-each-group>
                                        </p>
                                    </xsl:for-each-group>
                                   </div>
                                </div>
                            </div>
                        </div>
                    <xsl:copy-of select="$footer"/>
                </body>
            </html>
        </xsl:result-document>
    </xsl:template>
    
    <!-- RÈGLES POUR LE TEXTE -->
    <xsl:template match="//body//p" mode="#all">
        <!-- match uniquement sur les <p> du <body> -->
        <xsl:element name="p">
            <xsl:attribute name="style">
                <xsl:text>line-height: 2; text-indent: 10%;</xsl:text>
            </xsl:attribute>       
            <xsl:apply-templates mode="#current"/>
        </xsl:element>
    </xsl:template>

    <!-- règle pour le texte transcris : uniquement la valeur de <ex> et <sic> des <choice> étant donné que certaines abréviations et ligatures ne peuvent pas être représentées sous Unicode -->
    <xsl:template match="choice" mode="transc">
        <xsl:value-of select="expan/ex/text() | sic/text() | expan/text()"/>
    </xsl:template>
</xsl:stylesheet>

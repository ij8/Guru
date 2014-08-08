<!-- *** QLMS GURU *** -->

<!-- *** START OF STYLESHEET *** -->

<!-- **********************************************************************
XSL to format the search output for Google Search Appliance
     ********************************************************************** -->
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">

  <!-- **********************************************************************
include customer-onebox.xsl, which is auto-generated from the customer's
set of OneBox Module definitions, and in turn invokes either the default
OneBox template, or the customer's:
********************************************************************** -->
  <xsl:include href="customer-onebox.xsl"/>

  <xsl:output method="html"/>

  <!-- **********************************************************************
Logo setup (can be customized)
    - whether to show logo: 0 for FALSE, 1 (or non-zero) for TRUE
     - logo url
     - logo size: '' for default image size
     ********************************************************************** -->
  <xsl:variable name="show_logo">0</xsl:variable>
  <xsl:variable name="logo_url"></xsl:variable>
  <xsl:variable name="logo_width">157</xsl:variable>
  <xsl:variable name="logo_height">156</xsl:variable>

  <!-- **********************************************************************
Global Style variables (can be customized): '' for using browser's default
     ********************************************************************** -->

  <xsl:variable name="global_font">arial,sans-serif</xsl:variable>
  <xsl:variable name="global_font_size"></xsl:variable>
  <xsl:variable name="global_bg_color">#ffffff</xsl:variable>
  <xsl:variable name="global_text_color">#000000</xsl:variable>
  <xsl:variable name="global_link_color">#1a0dab</xsl:variable>
  <xsl:variable name="global_vlink_color">#551a8b</xsl:variable>
  <xsl:variable name="global_alink_color">#ff0000</xsl:variable>

  <!-- **********************************************************************
Result page components (can be customized)
     - whether to show a component: 0 for FALSE, non-zero (e.g., 1) for TRUE
     - text and style
     ********************************************************************** -->

  <!-- *** choose result page header: '', 'provided', 'mine', or 'both' *** -->
  <xsl:variable name="choose_result_page_header">mine</xsl:variable>

  <!-- *** customize provided result page header *** -->
  <xsl:variable name="show_swr_link">0</xsl:variable>
  <xsl:variable name="swr_search_anchor_text">Search Within Results</xsl:variable>
  <xsl:variable name="show_result_page_adv_link">0</xsl:variable>
  <xsl:variable name="adv_search_anchor_text">Advanced Search</xsl:variable>
  <xsl:variable name="show_result_page_help_link">0</xsl:variable>
  <xsl:variable name="search_help_anchor_text">Search Tips</xsl:variable>
  <xsl:variable name="show_alerts_link">0</xsl:variable>
  <xsl:variable name="alerts_anchor_text">Alerts</xsl:variable>

  <!-- *** search boxes *** -->
  <xsl:variable name="show_top_search_box">1</xsl:variable>
  <xsl:variable name="show_bottom_search_box">1</xsl:variable>
  <xsl:variable name="search_box_size">32</xsl:variable>

  <!-- *** choose search button type: 'text' or 'image' *** -->
  <xsl:variable name="choose_search_button">text</xsl:variable>
  <xsl:variable name="search_button_text">Search Guru</xsl:variable>
  <xsl:variable name="search_button_image_url"></xsl:variable>
  <xsl:variable name="search_collections_xslt">1</xsl:variable>

  <!-- *** search info bars *** -->
  <xsl:variable name="show_search_info">1</xsl:variable>

  <!-- *** choose separation bar: 'ltblue', 'blue', 'line', 'nothing' *** -->
  <xsl:variable name="choose_sep_bar">ltblue</xsl:variable>
  <xsl:variable name="sep_bar_std_text">Search</xsl:variable>
  <xsl:variable name="sep_bar_adv_text">Advanced Search</xsl:variable>
  <xsl:variable name="sep_bar_error_text">Error</xsl:variable>

  <!-- *** navigation bars: '', 'google', 'link', or 'simple'*** -->
  <xsl:variable name="show_top_navigation">0</xsl:variable>
  <xsl:variable name="choose_bottom_navigation">link</xsl:variable>
  <xsl:variable name="my_nav_align">right</xsl:variable>
  <xsl:variable name="my_nav_size">-1</xsl:variable>
  <xsl:variable name="my_nav_color">#6f6f6f</xsl:variable>

  <!-- *** sort by date/relevance *** -->
  <xsl:variable name="show_sort_by">0</xsl:variable>

  <!-- *** spelling suggestions *** -->
  <xsl:variable name="show_spelling">1</xsl:variable>
  <xsl:variable name="spelling_text">Did you mean:</xsl:variable>
  <xsl:variable name="spelling_text_color">#cc0000</xsl:variable>

  <!-- *** synonyms suggestions *** -->
  <xsl:variable name="show_synonyms">1</xsl:variable>
  <xsl:variable name="synonyms_text">You could also try:</xsl:variable>
  <xsl:variable name="synonyms_text_color">#cc0000</xsl:variable>

  <!-- *** keymatch suggestions *** -->
  <xsl:variable name="show_keymatch">1</xsl:variable>
  <xsl:variable name="keymatch_text">Suggested Result</xsl:variable>
  <xsl:variable name="keymatch_text_color">#2255aa</xsl:variable>
  <xsl:variable name="keymatch_bg_color">#ffffff</xsl:variable>

  <!-- *** Google Desktop integration *** -->
  <xsl:variable name="egds_show_search_tabs">0</xsl:variable>
  <xsl:variable name="egds_appliance_tab_label">Appliance</xsl:variable>
  <xsl:variable name="egds_show_desktop_results">1</xsl:variable>

  <!-- *** onebox information *** -->
  <xsl:variable name="show_onebox">1</xsl:variable>

  <!-- *** analytics information *** -->
  <xsl:variable name="analytics_account"></xsl:variable>

  <!-- *** NEW MBA/Amaze U Sidebar Element *** -->
  <xsl:variable name="show_mbaamaze">0</xsl:variable>

  <!-- *** In-Young's Custom Sidebar Element *** -->
  <xsl:variable name="show_customsb">0</xsl:variable>


  <!-- *** Sidebar for holding elements that can load data asynchronously *** -->
  <!-- *** Note from In-Young: This is the show_sidebar variable which is automatically 
  set to on or off depending on conditions in the when test. If you want to go back to the 
  default settings, set show_dyanmic_navigation = 1 and set show_res_clusters to 1 *** -->
  <xsl:variable name="show_sidebar">
    <xsl:choose>
      <!-- Expert Search - enable sidebar if expert search widget view is
         configured. -->
      <xsl:when test="($show_customsb = '1' or $show_res_clusters = '1' or
                     $show_mbaamaze = '1') and /GSP/Q != ''">
        <xsl:value-of select="'1'"/>
      </xsl:when>
      <xsl:otherwise>
        <xsl:value-of select="'0'"/>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:variable>

  <!-- *** NEW Product Update Sidebar Element *** -->
  <xsl:variable name="show_productup">0</xsl:variable>

  <!-- *** NEW Helpful Links Sidebar Element *** -->
  <xsl:variable name="show_helplinks">1</xsl:variable>
  <xsl:variable name="show_contacts">1</xsl:variable>

  <!-- *** NEW Collection Filter Sidebar Element *** -->
  <xsl:variable name="show_collection_filters">0</xsl:variable>

  <!-- *** IN-YOUNG'S NEW VARIABLE (to show stuff on left sidebar) *** -->
  <xsl:variable name="show_sidebar_l">
    <xsl:choose>
      <xsl:when test="($show_productup = '1' or $show_helplinks = '1' or 
                     $show_collection_filters = '1') and /GSP/Q != ''">
        <xsl:value-of select="'1'"/>
      </xsl:when>
      <xsl:otherwise>
        <xsl:value-of select="'0'"/>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:variable>

  <!-- *** Dictionary Results *** -->
  <xsl:variable name="show_dictionary_results">1</xsl:variable>

  <!-- *** Collection Filter Links *** -->
  <xsl:variable name="show_collection_filter_links">1</xsl:variable>

  <!-- *** Topic Numbers *** -->
  <xsl:variable name="hide_topicnumbers">1</xsl:variable>

  <!-- **********************************************************************
Result elements (can be customized)
     - whether to show an element ('1' for yes, '0' for no)
     - font/size/color ('' for using style of the context)
     ********************************************************************** -->

  <!-- *** result title and snippet *** -->
  <xsl:variable name="show_res_title">1</xsl:variable>
  <xsl:variable name="res_title_color">#1a0dab</xsl:variable>
  <xsl:variable name="res_title_size"></xsl:variable>
  <xsl:variable name="show_res_snippet">1</xsl:variable>
  <xsl:variable name="res_snippet_size">80%</xsl:variable>

  <!-- *** keyword match (in title or snippet) *** -->
  <xsl:variable name="res_keyword_color"></xsl:variable>
  <xsl:variable name="res_keyword_size"></xsl:variable>
  <xsl:variable name="res_keyword_format">b</xsl:variable>
  <!-- 'b' for bold -->

  <!-- *** link URL *** -->
  <xsl:variable name="show_res_url">1</xsl:variable>
  <xsl:variable name="res_url_color">#006621</xsl:variable>
  <xsl:variable name="res_url_size">-1</xsl:variable>
  <xsl:variable name="truncate_result_urls">1</xsl:variable>
  <xsl:variable name="truncate_result_url_length">100</xsl:variable>

  <!-- *** misc elements *** -->
  <xsl:variable name="show_meta_tags">0</xsl:variable>
  <xsl:variable name="show_res_size">1</xsl:variable>
  <xsl:variable name="show_res_date">1</xsl:variable>
  <xsl:variable name="show_res_cache">1</xsl:variable>

  <!-- *** used in result cache link, similar pages link, and description *** -->
  <xsl:variable name="faint_color">#7777cc</xsl:variable>

  <!-- *** show secure results radio button *** -->
  <xsl:variable name="show_secure_radio">0</xsl:variable>

  <!-- **********************************************************************
Other variables (can be customized)
     ********************************************************************** -->

  <!-- *** page title *** -->
  <xsl:variable name="front_page_title">Search Home</xsl:variable>
  <xsl:variable name="result_page_title">Search Results</xsl:variable>
  <xsl:variable name="adv_page_title">Advanced Search</xsl:variable>
  <xsl:variable name="error_page_title">Error</xsl:variable>
  <xsl:variable name="swr_page_title">Search Within Results</xsl:variable>

  <!-- *** choose adv_search page header: '', 'provided', 'mine', or 'both' *** -->
  <xsl:variable name="choose_adv_search_page_header">both</xsl:variable>

  <!-- *** cached page header text *** -->
  <xsl:variable name="cached_page_header_text">This is the cached copy of</xsl:variable>

  <!-- *** error message text *** -->
  <xsl:variable name="server_error_msg_text">A server error has occurred.</xsl:variable>
  <xsl:variable name="server_error_des_text">Check server response code in details.</xsl:variable>
  <xsl:variable name="xml_error_msg_text">Unknown XML result type.</xsl:variable>
  <xsl:variable name="xml_error_des_text">View page source to see the offending XML.</xsl:variable>

  <!-- *** advanced search page panel background color *** -->
  <xsl:variable name="adv_search_panel_bgcolor">#cbdced</xsl:variable>

  <!-- *** dyanmic result cluster options *** -->
  <xsl:variable name="show_res_clusters">0</xsl:variable>
  <xsl:variable name="res_cluster_position">right</xsl:variable>

  <!-- **********************************************************************
My global page header/footer (can be customized)
     ********************************************************************** -->
  <xsl:template name="my_page_header">
    <div id="QL" style="display:inline-block; min-width:800px;">
      <a href="https://portal.qlmortgageservices.com/guru" style="float:left; max-width: 388px; min-width: 240px; width: 25%; height:62px; margin-top:10px; ">
        <img src="https://portal.qlmortgageservices.com/guru/images/Banner-QLMS-GURU.png" alt="LOGO" style="border:none; height:62px;"/>
      </a>
      <xsl:call-template name="result_page_header"/>

      <img src="https://portal.qlmortgageservices.com/guru/images/Banner-color-bar.png" alt="color bar" style="height:8px; width:100%; min-width:754px;"/>
    </div>
  </xsl:template>

  <xsl:template name="my_page_footer">
    <span style="width:100%; background-image:url('https://portal.qlmortgageservices.com/guru/images/Banner-Textured-Banner.png');" class="p">
      <xsl:text disable-output-escaping="yes">         &lt;div class="footer" style="height: 68px; background-image:url('https://portal.qlmortgageservices.com/guru/images/Banner-Textured-Banner.png'); "&gt;
         &lt;body&gt;
         &lt;img style="float:top; display:block; width:100%; min-width:754px; height:8px;" src="https://portal.qlmortgageservices.com/guru/images/Banner-color-bar.png" alt="color bar" /&gt;
         &lt;div align="center"&gt;
         &lt;img style="height:35px; border:none; float:right; padding-top:2px;" alt="PLAB" src="https://portal.qlmortgageservices.com/guru/images/QL-black-logo.jpg" border="0" &gt;
         &lt;div style="text-align:center; font-size: 10px; width:600px"&gt;
         &amp;#169; &lt;span id="year"&gt;&lt;/span&gt; Quicken Loans Inc. All Rights Reserved. Confidential and Proprietary. Any unauthorized dissemination is strictly
         prohibited. Programs, rates, terms and conditions are subject to change without notice. 
         &lt;/div&gt;
         &lt;/div&gt;
         &lt;/body&gt;
         &lt;/div&gt;</xsl:text>
    </span>
    <xsl:apply-templates select="TraceNode"/>
  </xsl:template>


  <!-- **********************************************************************
Logo template (can be customized)
     ********************************************************************** -->
  <xsl:template name="logo">
    <a href="{$home_url}">
      <img src="{$logo_url}"
      width="{$logo_width}" height="{$logo_height}"
      alt="Go to Google Home" border="0" />
    </a>
  </xsl:template>


  <!-- **********************************************************************
Search result page header (can be customized): logo and search box
     ********************************************************************** -->
  <xsl:template name="result_page_header">
    <div style="width:500px; display:inline-block;">
      <xsl:if test="$show_logo != '0'">
        <span style="background-image:url('https://portal.qlmortgageservices.com/guru/images/Banner-Textured-Banner.png'); background-repeat:repeat-x; background-size: contain;">
          <xsl:call-template name="logo"/>
        </span>
      </xsl:if>
      <xsl:if test="$show_top_search_box != '0'">
        <xsl:call-template name="search_box">
          <xsl:with-param name="type" select="'std_top'"/>
        </xsl:call-template>
        <xsl:if test="$show_collection_filter_links='1'">
          <xsl:call-template name="collection_links"/>
        </xsl:if>
      </xsl:if>
      <xsl:if test="/GSP/CT">
        <span>
          <xsl:call-template name="stopwords"/>
        </span>
      </xsl:if>

    </div>
  </xsl:template>

  <xsl:template name="result_page_footer">
    <div style="width:500px; display:inline-block;">
      <xsl:if test="$show_top_search_box != '0'">
        <xsl:call-template name="search_box">
          <xsl:with-param name="type" select="'std_top'"/>
        </xsl:call-template>
      </xsl:if>
      <xsl:if test="/GSP/CT">
        <span>
          <xsl:call-template name="stopwords"/>
        </span>
      </xsl:if>
    </div>
  </xsl:template>


  <!-- **********************************************************************
Search within results page header (can be customized): logo and search box
     ********************************************************************** -->
  <xsl:template name="swr_page_header">
    <table border="0" cellpadding="0" cellspacing="0">
      <xsl:if test="$show_logo != '0'">
        <tr>
          <td rowspan="3" valign="top">
            <xsl:call-template name="logo"/>
            <xsl:call-template name="nbsp3"/>
          </td>
        </tr>
      </xsl:if>
      <xsl:if test="$show_top_search_box != '0'">
        <tr>
          <td valign="middle">
            <xsl:call-template name="search_box">
              <xsl:with-param name="type" select="'swr'"/>
            </xsl:call-template>
          </td>
        </tr>
      </xsl:if>
    </table>
  </xsl:template>


  <!-- **********************************************************************
Home search page header (can be customized): logo and search box
     ********************************************************************** -->
  <xsl:template name="home_page_header">
    <table border="0" cellpadding="0" cellspacing="0">
      <xsl:if test="$show_logo != '0'">
        <tr>
          <td rowspan="3" valign="top">
            <xsl:call-template name="logo"/>
            <xsl:call-template name="nbsp3"/>
          </td>
        </tr>
      </xsl:if>
      <xsl:if test="$show_top_search_box != '0'">
        <tr>
          <td valign="middle">
            <xsl:call-template name="search_box">
              <xsl:with-param name="type" select="'home'"/>
            </xsl:call-template>
          </td>
        </tr>
      </xsl:if>
    </table>
  </xsl:template>


  <!-- **********************************************************************
Separation bar variables (used in advanced search header and result page)
     ********************************************************************** -->
  <xsl:variable name="sep_bar_border_color">
    <xsl:choose>
      <xsl:when test="$choose_sep_bar = 'ltblue'">#3366cc</xsl:when>
      <xsl:when test="$choose_sep_bar = 'blue'">#3366cc</xsl:when>
      <xsl:otherwise>
        <xsl:value-of select="$global_bg_color"/>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:variable>

  <xsl:variable name="sep_bar_bg_color">
    #f4f4f4
  </xsl:variable>

  <xsl:variable name="sep_bar_text_color">
    <xsl:choose>
      <xsl:when test="$choose_sep_bar = 'ltblue'">#000000</xsl:when>
      <xsl:when test="$choose_sep_bar = 'blue'">#ffffff</xsl:when>
      <xsl:otherwise>
        <xsl:value-of select="$global_text_color"/>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:variable>

  <!-- **********************************************************************
Advanced search page header HTML (can be customized)
     ********************************************************************** -->
  <xsl:template name="advanced_search_header">
    <table border="0" cellpadding="0" cellspacing="0">

      <tr>

        <td valign="top">
          <xsl:if test="$show_logo != '0'">
            <xsl:call-template name="logo"/>
          </xsl:if>
        </td>
      </tr>
    </table>
  </xsl:template>


  <!-- **********************************************************************
Cached page header (can be customized)
     ********************************************************************** -->
  <xsl:template name="cached_page_header">
    <xsl:param name="cached_page_url"/>
    <xsl:variable name="stripped_url" select="substring-after($cached_page_url,
                                                            '://')"/>
    <table border="1" width="100%">
      <tr>
        <td>
          <table border="1" width="100%" cellpadding="10" cellspacing="0"
            bgcolor="{$global_bg_color}" color="{$global_bg_color}">
            <tr>
              <td>
                <font face="{$global_font}" color="{$global_text_color}" size="-1">
                  <xsl:value-of select="$cached_page_header_text"/>
                  <xsl:call-template name="nbsp"/>
                  <xsl:choose>
                    <xsl:when test="starts-with($cached_page_url,
                                          $db_url_protocol)">
                      <a href="{concat('/db/',$stripped_url)}">
                        <font color="{$global_link_color}">
                          <xsl:value-of select="$cached_page_url"/>
                        </font>
                      </a>.<br/>
                    </xsl:when>
                    <xsl:when test="starts-with($cached_page_url,
                                          $nfs_url_protocol)">
                      <a href="{concat('/nfs/',$stripped_url)}">
                        <font color="{$global_link_color}">
                          <xsl:value-of select="$cached_page_url"/>
                        </font>
                      </a>.<br/>
                    </xsl:when>
                    <xsl:when test="starts-with($cached_page_url,
                                          $smb_url_protocol)">
                      <a href="{concat('/smb/',$stripped_url)}">
                        <font color="{$global_link_color}">
                          <xsl:value-of select="$cached_page_url"/>
                        </font>
                      </a>.<br/>
                    </xsl:when>
                    <xsl:when test="starts-with($cached_page_url,
                                          $unc_url_protocol)">
                      <xsl:variable name="display_url">
                        <xsl:call-template name="convert_unc">
                          <xsl:with-param name="string" select="$stripped_url"/>
                        </xsl:call-template>
                      </xsl:variable>
                      <a href="{concat('file://',$stripped_url)}">
                        <font color="{$global_link_color}">
                          <xsl:value-of select="$display_url"/>
                        </font>
                      </a>.<br/>
                    </xsl:when>
                    <xsl:otherwise>
                      <a href="{$cached_page_url}">
                        <font color="{$global_link_color}">
                          <xsl:value-of select="$cached_page_url"/>
                        </font>
                      </a>.<br/>
                    </xsl:otherwise>
                  </xsl:choose>
                </font>
              </td>
            </tr>
          </table>
        </td>
      </tr>
    </table>
    <hr/>
  </xsl:template>


  <!-- **********************************************************************
"Search Within Results" search input page (can be customized)
     ********************************************************************** -->
  <xsl:template name="swr_search">
    <xsl:call-template name="doc_type"/>
    <html>
      <xsl:call-template name="langHeadStart"/>
      <title>
        <xsl:value-of select="$swr_page_title"/>
      </title>
      <xsl:call-template name="style2"/>
      <xsl:call-template name="langHeadEnd"/>

      <body dir="ltr">
        <div style="min-width:800px;">
          <xsl:call-template name="analytics"/>

          <xsl:call-template name="my_page_header"/>
          <xsl:call-template name="swr_page_header"/>
          <hr/>
          <xsl:call-template name="copyright"/>
          <xsl:call-template name="my_page_footer"/>
        </div>
      </body>
    </html>
  </xsl:template>


  <!-- **********************************************************************
"Front door" search input page (can be customized)
     ********************************************************************** -->
  <xsl:template name="front_door">
    <xsl:call-template name="doc_type"/>
    <html>
      <xsl:call-template name="langHeadStart"/>
      <title>
        <xsl:value-of select="$front_page_title"/>
      </title>
      <xsl:call-template name="style2"/>
      <xsl:call-template name="langHeadEnd"/>

      <body dir="ltr" min-width="800px">
        <xsl:call-template name="analytics"/>

        <xsl:call-template name="my_page_header"/>
        <xsl:call-template name="home_page_header"/>
        <hr/>
        <xsl:call-template name="copyright"/>
        <xsl:call-template name="my_page_footer"/>

      </body>
    </html>
  </xsl:template>


  <!-- **********************************************************************
Empty result set (can be customized)
     ********************************************************************** -->
  <xsl:template name="no_RES">
    <xsl:param name="query"/>

    <!-- *** Output Google Desktop results (if enabled and any available) *** -->
    <xsl:if test="$egds_show_desktop_results != '0'">
      <xsl:call-template name="desktop_results"/>
    </xsl:if>

    <span class="p">
      <br/>
      Your search - <b>
        <xsl:value-of select="$query"/>
      </b> - did not match any documents.
      <br/>
      No pages were found containing <b>
        "<xsl:value-of select="$query"/>"
      </b>.
      <br/>
      <br/>
      Suggestions:
      <ul>
        <li>Make sure all words are spelled correctly.</li>
        <li>Try different keywords.</li>
        <xsl:if test="/GSP/PARAM[(@name='access') and(@value='a')]">
          <li>Make sure your security credentials are correct.</li>
        </xsl:if>
        <li>Try more general keywords.</li>
      </ul>
    </span>

  </xsl:template>


  <!-- *** IN-YOUNG'S CUSTOMIZED STYLESHEET (so I don't mess with defaults) ***-->

  <xsl:template name="style2">
    <style type="text/css">
      <xsl:comment>
        input[type=submit] {
        margin: 0px 0px 10px 10px
        border-radius: 5px;
        border: 0;
        height:25px;
        font-family: Tahoma;
        background: #f4f4f4;
        cursor:pointer;
        }
        adv-search-button{
        background:none!important;
        border:none;
        padding:0!important;
        /*border is optional*/
        border-bottom:1px solid #444;
        cursor:pointer;
        }
        #submit-clicked {
        background: #B9B8B8
        }
        #dictionary-container {
        /*border-bottom: 1px solid #f4f4f4;*/
        background: #f4f4f4;
        margin: 20px 20px 20px 0px;
        position: relative;
        max-width: 480px;
        }
        .dictionary-header {
        font-size: large;
        font-weight: normal;
        padding: 20px 10px 20px 10px;
        }
        .dictionary-body {
        font-size: small;
        font-weight: normal;
        padding: 0px 10px 20px 30px;
        }
        .form-container {
        margin: 0px 10px 10px 0px;
        height: 25px;
        display: inline-block;
        max-width: 100px;
        float:left;
        }

        /** THIS IS THE CSS FOR FONT AWESOME ICONS IE7 **/
        .icon-large{font-size:1.3333333333333333em;margin-top:-4px;padding-top:3px;margin-bottom:-4px;padding-bottom:3px;vertical-align:middle;}
        .nav [class^="icon-"],.nav [class*=" icon-"]{vertical-align:inherit;margin-top:-4px;padding-top:3px;margin-bottom:-4px;padding-bottom:3px;}.nav [class^="icon-"].icon-large,.nav [class*=" icon-"].icon-large{vertical-align:-25%;}
        .nav-pills [class^="icon-"].icon-large,.nav-tabs [class^="icon-"].icon-large,.nav-pills [class*=" icon-"].icon-large,.nav-tabs [class*=" icon-"].icon-large{line-height:.75em;margin-top:-7px;padding-top:5px;margin-bottom:-5px;padding-bottom:4px;}
        .btn [class^="icon-"].pull-left,.btn [class*=" icon-"].pull-left,.btn [class^="icon-"].pull-right,.btn [class*=" icon-"].pull-right{vertical-align:inherit;}
        .btn [class^="icon-"].icon-large,.btn [class*=" icon-"].icon-large{margin-top:-0.5em;}
        a [class^="icon-"],a [class*=" icon-"]{cursor:pointer;}
        .icon-glass{*zoom:expression( this.runtimeStyle['zoom'] = '1', this.innerHTML = '&#xf000;');}
        .icon-music{*zoom:expression( this.runtimeStyle['zoom'] = '1', this.innerHTML = '&#xf001;');}
        .icon-search{*zoom:expression( this.runtimeStyle['zoom'] = '1', this.innerHTML = '&#xf002;');}
        .icon-envelope-alt{*zoom:expression( this.runtimeStyle['zoom'] = '1', this.innerHTML = '&#xf003;');}
        .icon-heart{*zoom:expression( this.runtimeStyle['zoom'] = '1', this.innerHTML = '&#xf004;');}
        .icon-star{*zoom:expression( this.runtimeStyle['zoom'] = '1', this.innerHTML = '&#xf005;');}
        .icon-star-empty{*zoom:expression( this.runtimeStyle['zoom'] = '1', this.innerHTML = '&#xf006;');}
        .icon-user{*zoom:expression( this.runtimeStyle['zoom'] = '1', this.innerHTML = '&#xf007;');}
        .icon-film{*zoom:expression( this.runtimeStyle['zoom'] = '1', this.innerHTML = '&#xf008;');}
        .icon-th-large{*zoom:expression( this.runtimeStyle['zoom'] = '1', this.innerHTML = '&#xf009;');}
        .icon-th{*zoom:expression( this.runtimeStyle['zoom'] = '1', this.innerHTML = '&#xf00a;');}
        .icon-th-list{*zoom:expression( this.runtimeStyle['zoom'] = '1', this.innerHTML = '&#xf00b;');}
        .icon-ok{*zoom:expression( this.runtimeStyle['zoom'] = '1', this.innerHTML = '&#xf00c;');}
        .icon-remove{*zoom:expression( this.runtimeStyle['zoom'] = '1', this.innerHTML = '&#xf00d;');}
        .icon-zoom-in{*zoom:expression( this.runtimeStyle['zoom'] = '1', this.innerHTML = '&#xf00e;');}
        .icon-zoom-out{*zoom:expression( this.runtimeStyle['zoom'] = '1', this.innerHTML = '&#xf010;');}
        .icon-off{*zoom:expression( this.runtimeStyle['zoom'] = '1', this.innerHTML = '&#xf011;');}
        .icon-power-off{*zoom:expression( this.runtimeStyle['zoom'] = '1', this.innerHTML = '&#xf011;');}
        .icon-signal{*zoom:expression( this.runtimeStyle['zoom'] = '1', this.innerHTML = '&#xf012;');}
        .icon-cog{*zoom:expression( this.runtimeStyle['zoom'] = '1', this.innerHTML = '&#xf013;');}
        .icon-gear{*zoom:expression( this.runtimeStyle['zoom'] = '1', this.innerHTML = '&#xf013;');}
        .icon-trash{*zoom:expression( this.runtimeStyle['zoom'] = '1', this.innerHTML = '&#xf014;');}
        .icon-home{*zoom:expression( this.runtimeStyle['zoom'] = '1', this.innerHTML = '&#xf015;');}
        .icon-file-alt{*zoom:expression( this.runtimeStyle['zoom'] = '1', this.innerHTML = '&#xf016;');}
        .icon-time{*zoom:expression( this.runtimeStyle['zoom'] = '1', this.innerHTML = '&#xf017;');}
        .icon-road{*zoom:expression( this.runtimeStyle['zoom'] = '1', this.innerHTML = '&#xf018;');}
        .icon-download-alt{*zoom:expression( this.runtimeStyle['zoom'] = '1', this.innerHTML = '&#xf019;');}
        .icon-download{*zoom:expression( this.runtimeStyle['zoom'] = '1', this.innerHTML = '&#xf01a;');}
        .icon-upload{*zoom:expression( this.runtimeStyle['zoom'] = '1', this.innerHTML = '&#xf01b;');}
        .icon-inbox{*zoom:expression( this.runtimeStyle['zoom'] = '1', this.innerHTML = '&#xf01c;');}
        .icon-play-circle{*zoom:expression( this.runtimeStyle['zoom'] = '1', this.innerHTML = '&#xf01d;');}
        .icon-repeat{*zoom:expression( this.runtimeStyle['zoom'] = '1', this.innerHTML = '&#xf01e;');}
        .icon-rotate-right{*zoom:expression( this.runtimeStyle['zoom'] = '1', this.innerHTML = '&#xf01e;');}
        .icon-refresh{*zoom:expression( this.runtimeStyle['zoom'] = '1', this.innerHTML = '&#xf021;');}
        .icon-list-alt{*zoom:expression( this.runtimeStyle['zoom'] = '1', this.innerHTML = '&#xf022;');}
        .icon-lock{*zoom:expression( this.runtimeStyle['zoom'] = '1', this.innerHTML = '&#xf023;');}
        .icon-flag{*zoom:expression( this.runtimeStyle['zoom'] = '1', this.innerHTML = '&#xf024;');}
        .icon-headphones{*zoom:expression( this.runtimeStyle['zoom'] = '1', this.innerHTML = '&#xf025;');}
        .icon-volume-off{*zoom:expression( this.runtimeStyle['zoom'] = '1', this.innerHTML = '&#xf026;');}
        .icon-volume-down{*zoom:expression( this.runtimeStyle['zoom'] = '1', this.innerHTML = '&#xf027;');}
        .icon-volume-up{*zoom:expression( this.runtimeStyle['zoom'] = '1', this.innerHTML = '&#xf028;');}
        .icon-qrcode{*zoom:expression( this.runtimeStyle['zoom'] = '1', this.innerHTML = '&#xf029;');}
        .icon-barcode{*zoom:expression( this.runtimeStyle['zoom'] = '1', this.innerHTML = '&#xf02a;');}
        .icon-tag{*zoom:expression( this.runtimeStyle['zoom'] = '1', this.innerHTML = '&#xf02b;');}
        .icon-tags{*zoom:expression( this.runtimeStyle['zoom'] = '1', this.innerHTML = '&#xf02c;');}
        .icon-book{*zoom:expression( this.runtimeStyle['zoom'] = '1', this.innerHTML = '&#xf02d;');}
        .icon-bookmark{*zoom:expression( this.runtimeStyle['zoom'] = '1', this.innerHTML = '&#xf02e;');}
        .icon-print{*zoom:expression( this.runtimeStyle['zoom'] = '1', this.innerHTML = '&#xf02f;');}
        .icon-camera{*zoom:expression( this.runtimeStyle['zoom'] = '1', this.innerHTML = '&#xf030;');}
        .icon-font{*zoom:expression( this.runtimeStyle['zoom'] = '1', this.innerHTML = '&#xf031;');}
        .icon-bold{*zoom:expression( this.runtimeStyle['zoom'] = '1', this.innerHTML = '&#xf032;');}
        .icon-italic{*zoom:expression( this.runtimeStyle['zoom'] = '1', this.innerHTML = '&#xf033;');}
        .icon-text-height{*zoom:expression( this.runtimeStyle['zoom'] = '1', this.innerHTML = '&#xf034;');}
        .icon-text-width{*zoom:expression( this.runtimeStyle['zoom'] = '1', this.innerHTML = '&#xf035;');}
        .icon-align-left{*zoom:expression( this.runtimeStyle['zoom'] = '1', this.innerHTML = '&#xf036;');}
        .icon-align-center{*zoom:expression( this.runtimeStyle['zoom'] = '1', this.innerHTML = '&#xf037;');}
        .icon-align-right{*zoom:expression( this.runtimeStyle['zoom'] = '1', this.innerHTML = '&#xf038;');}
        .icon-align-justify{*zoom:expression( this.runtimeStyle['zoom'] = '1', this.innerHTML = '&#xf039;');}
        .icon-list{*zoom:expression( this.runtimeStyle['zoom'] = '1', this.innerHTML = '&#xf03a;');}
        .icon-indent-left{*zoom:expression( this.runtimeStyle['zoom'] = '1', this.innerHTML = '&#xf03b;');}
        .icon-indent-right{*zoom:expression( this.runtimeStyle['zoom'] = '1', this.innerHTML = '&#xf03c;');}
        .icon-facetime-video{*zoom:expression( this.runtimeStyle['zoom'] = '1', this.innerHTML = '&#xf03d;');}
        .icon-picture{*zoom:expression( this.runtimeStyle['zoom'] = '1', this.innerHTML = '&#xf03e;');}
        .icon-pencil{*zoom:expression( this.runtimeStyle['zoom'] = '1', this.innerHTML = '&#xf040;');}
        .icon-map-marker{*zoom:expression( this.runtimeStyle['zoom'] = '1', this.innerHTML = '&#xf041;');}
        .icon-adjust{*zoom:expression( this.runtimeStyle['zoom'] = '1', this.innerHTML = '&#xf042;');}
        .icon-tint{*zoom:expression( this.runtimeStyle['zoom'] = '1', this.innerHTML = '&#xf043;');}
        .icon-edit{*zoom:expression( this.runtimeStyle['zoom'] = '1', this.innerHTML = '&#xf044;');}
        .icon-share{*zoom:expression( this.runtimeStyle['zoom'] = '1', this.innerHTML = '&#xf045;');}
        .icon-check{*zoom:expression( this.runtimeStyle['zoom'] = '1', this.innerHTML = '&#xf046;');}
        .icon-move{*zoom:expression( this.runtimeStyle['zoom'] = '1', this.innerHTML = '&#xf047;');}
        .icon-step-backward{*zoom:expression( this.runtimeStyle['zoom'] = '1', this.innerHTML = '&#xf048;');}
        .icon-fast-backward{*zoom:expression( this.runtimeStyle['zoom'] = '1', this.innerHTML = '&#xf049;');}
        .icon-backward{*zoom:expression( this.runtimeStyle['zoom'] = '1', this.innerHTML = '&#xf04a;');}
        .icon-play{*zoom:expression( this.runtimeStyle['zoom'] = '1', this.innerHTML = '&#xf04b;');}
        .icon-pause{*zoom:expression( this.runtimeStyle['zoom'] = '1', this.innerHTML = '&#xf04c;');}
        .icon-stop{*zoom:expression( this.runtimeStyle['zoom'] = '1', this.innerHTML = '&#xf04d;');}
        .icon-forward{*zoom:expression( this.runtimeStyle['zoom'] = '1', this.innerHTML = '&#xf04e;');}
        .icon-fast-forward{*zoom:expression( this.runtimeStyle['zoom'] = '1', this.innerHTML = '&#xf050;');}
        .icon-step-forward{*zoom:expression( this.runtimeStyle['zoom'] = '1', this.innerHTML = '&#xf051;');}
        .icon-eject{*zoom:expression( this.runtimeStyle['zoom'] = '1', this.innerHTML = '&#xf052;');}
        .icon-chevron-left{*zoom:expression( this.runtimeStyle['zoom'] = '1', this.innerHTML = '&#xf053;');}
        .icon-chevron-right{*zoom:expression( this.runtimeStyle['zoom'] = '1', this.innerHTML = '&#xf054;');}
        .icon-plus-sign{*zoom:expression( this.runtimeStyle['zoom'] = '1', this.innerHTML = '&#xf055;');}
        .icon-minus-sign{*zoom:expression( this.runtimeStyle['zoom'] = '1', this.innerHTML = '&#xf056;');}
        .icon-remove-sign{*zoom:expression( this.runtimeStyle['zoom'] = '1', this.innerHTML = '&#xf057;');}
        .icon-ok-sign{*zoom:expression( this.runtimeStyle['zoom'] = '1', this.innerHTML = '&#xf058;');}
        .icon-question-sign{*zoom:expression( this.runtimeStyle['zoom'] = '1', this.innerHTML = '&#xf059;');}
        .icon-info-sign{*zoom:expression( this.runtimeStyle['zoom'] = '1', this.innerHTML = '&#xf05a;');}
        .icon-screenshot{*zoom:expression( this.runtimeStyle['zoom'] = '1', this.innerHTML = '&#xf05b;');}
        .icon-remove-circle{*zoom:expression( this.runtimeStyle['zoom'] = '1', this.innerHTML = '&#xf05c;');}
        .icon-ok-circle{*zoom:expression( this.runtimeStyle['zoom'] = '1', this.innerHTML = '&#xf05d;');}
        .icon-ban-circle{*zoom:expression( this.runtimeStyle['zoom'] = '1', this.innerHTML = '&#xf05e;');}
        .icon-arrow-left{*zoom:expression( this.runtimeStyle['zoom'] = '1', this.innerHTML = '&#xf060;');}
        .icon-arrow-right{*zoom:expression( this.runtimeStyle['zoom'] = '1', this.innerHTML = '&#xf061;');}
        .icon-arrow-up{*zoom:expression( this.runtimeStyle['zoom'] = '1', this.innerHTML = '&#xf062;');}
        .icon-arrow-down{*zoom:expression( this.runtimeStyle['zoom'] = '1', this.innerHTML = '&#xf063;');}
        .icon-share-alt{*zoom:expression( this.runtimeStyle['zoom'] = '1', this.innerHTML = '&#xf064;');}
        .icon-mail-forward{*zoom:expression( this.runtimeStyle['zoom'] = '1', this.innerHTML = '&#xf064;');}
        .icon-resize-full{*zoom:expression( this.runtimeStyle['zoom'] = '1', this.innerHTML = '&#xf065;');}
        .icon-resize-small{*zoom:expression( this.runtimeStyle['zoom'] = '1', this.innerHTML = '&#xf066;');}
        .icon-plus{*zoom:expression( this.runtimeStyle['zoom'] = '1', this.innerHTML = '&#xf067;');}
        .icon-minus{*zoom:expression( this.runtimeStyle['zoom'] = '1', this.innerHTML = '&#xf068;');}
        .icon-asterisk{*zoom:expression( this.runtimeStyle['zoom'] = '1', this.innerHTML = '&#xf069;');}
        .icon-exclamation-sign{*zoom:expression( this.runtimeStyle['zoom'] = '1', this.innerHTML = '&#xf06a;');}
        .icon-gift{*zoom:expression( this.runtimeStyle['zoom'] = '1', this.innerHTML = '&#xf06b;');}
        .icon-leaf{*zoom:expression( this.runtimeStyle['zoom'] = '1', this.innerHTML = '&#xf06c;');}
        .icon-fire{*zoom:expression( this.runtimeStyle['zoom'] = '1', this.innerHTML = '&#xf06d;');}
        .icon-eye-open{*zoom:expression( this.runtimeStyle['zoom'] = '1', this.innerHTML = '&#xf06e;');}
        .icon-eye-close{*zoom:expression( this.runtimeStyle['zoom'] = '1', this.innerHTML = '&#xf070;');}
        .icon-warning-sign{*zoom:expression( this.runtimeStyle['zoom'] = '1', this.innerHTML = '&#xf071;');}
        .icon-plane{*zoom:expression( this.runtimeStyle['zoom'] = '1', this.innerHTML = '&#xf072;');}
        .icon-calendar{*zoom:expression( this.runtimeStyle['zoom'] = '1', this.innerHTML = '&#xf073;');}
        .icon-random{*zoom:expression( this.runtimeStyle['zoom'] = '1', this.innerHTML = '&#xf074;');}
        .icon-comment{*zoom:expression( this.runtimeStyle['zoom'] = '1', this.innerHTML = '&#xf075;');}
        .icon-magnet{*zoom:expression( this.runtimeStyle['zoom'] = '1', this.innerHTML = '&#xf076;');}
        .icon-chevron-up{*zoom:expression( this.runtimeStyle['zoom'] = '1', this.innerHTML = '&#xf077;');}
        .icon-chevron-down{*zoom:expression( this.runtimeStyle['zoom'] = '1', this.innerHTML = '&#xf078;');}
        .icon-retweet{*zoom:expression( this.runtimeStyle['zoom'] = '1', this.innerHTML = '&#xf079;');}
        .icon-shopping-cart{*zoom:expression( this.runtimeStyle['zoom'] = '1', this.innerHTML = '&#xf07a;');}
        .icon-folder-close{*zoom:expression( this.runtimeStyle['zoom'] = '1', this.innerHTML = '&#xf07b;');}
        .icon-folder-open{*zoom:expression( this.runtimeStyle['zoom'] = '1', this.innerHTML = '&#xf07c;');}
        .icon-resize-vertical{*zoom:expression( this.runtimeStyle['zoom'] = '1', this.innerHTML = '&#xf07d;');}
        .icon-resize-horizontal{*zoom:expression( this.runtimeStyle['zoom'] = '1', this.innerHTML = '&#xf07e;');}
        .icon-bar-chart{*zoom:expression( this.runtimeStyle['zoom'] = '1', this.innerHTML = '&#xf080;');}
        .icon-twitter-sign{*zoom:expression( this.runtimeStyle['zoom'] = '1', this.innerHTML = '&#xf081;');}
        .icon-facebook-sign{*zoom:expression( this.runtimeStyle['zoom'] = '1', this.innerHTML = '&#xf082;');}
        .icon-camera-retro{*zoom:expression( this.runtimeStyle['zoom'] = '1', this.innerHTML = '&#xf083;');}
        .icon-key{*zoom:expression( this.runtimeStyle['zoom'] = '1', this.innerHTML = '&#xf084;');}
        .icon-cogs{*zoom:expression( this.runtimeStyle['zoom'] = '1', this.innerHTML = '&#xf085;');}
        .icon-gears{*zoom:expression( this.runtimeStyle['zoom'] = '1', this.innerHTML = '&#xf085;');}
        .icon-comments{*zoom:expression( this.runtimeStyle['zoom'] = '1', this.innerHTML = '&#xf086;');}
        .icon-thumbs-up-alt{*zoom:expression( this.runtimeStyle['zoom'] = '1', this.innerHTML = '&#xf087;');}
        .icon-thumbs-down-alt{*zoom:expression( this.runtimeStyle['zoom'] = '1', this.innerHTML = '&#xf088;');}
        .icon-star-half{*zoom:expression( this.runtimeStyle['zoom'] = '1', this.innerHTML = '&#xf089;');}
        .icon-heart-empty{*zoom:expression( this.runtimeStyle['zoom'] = '1', this.innerHTML = '&#xf08a;');}
        .icon-signout{*zoom:expression( this.runtimeStyle['zoom'] = '1', this.innerHTML = '&#xf08b;');}
        .icon-linkedin-sign{*zoom:expression( this.runtimeStyle['zoom'] = '1', this.innerHTML = '&#xf08c;');}
        .icon-pushpin{*zoom:expression( this.runtimeStyle['zoom'] = '1', this.innerHTML = '&#xf08d;');}
        .icon-external-link{*zoom:expression( this.runtimeStyle['zoom'] = '1', this.innerHTML = '&#xf08e;');}
        .icon-signin{*zoom:expression( this.runtimeStyle['zoom'] = '1', this.innerHTML = '&#xf090;');}
        .icon-trophy{*zoom:expression( this.runtimeStyle['zoom'] = '1', this.innerHTML = '&#xf091;');}
        .icon-github-sign{*zoom:expression( this.runtimeStyle['zoom'] = '1', this.innerHTML = '&#xf092;');}
        .icon-upload-alt{*zoom:expression( this.runtimeStyle['zoom'] = '1', this.innerHTML = '&#xf093;');}
        .icon-lemon{*zoom:expression( this.runtimeStyle['zoom'] = '1', this.innerHTML = '&#xf094;');}
        .icon-phone{*zoom:expression( this.runtimeStyle['zoom'] = '1', this.innerHTML = '&#xf095;');}
        .icon-check-empty{*zoom:expression( this.runtimeStyle['zoom'] = '1', this.innerHTML = '&#xf096;');}
        .icon-unchecked{*zoom:expression( this.runtimeStyle['zoom'] = '1', this.innerHTML = '&#xf096;');}
        .icon-bookmark-empty{*zoom:expression( this.runtimeStyle['zoom'] = '1', this.innerHTML = '&#xf097;');}
        .icon-phone-sign{*zoom:expression( this.runtimeStyle['zoom'] = '1', this.innerHTML = '&#xf098;');}
        .icon-twitter{*zoom:expression( this.runtimeStyle['zoom'] = '1', this.innerHTML = '&#xf099;');}
        .icon-facebook{*zoom:expression( this.runtimeStyle['zoom'] = '1', this.innerHTML = '&#xf09a;');}
        .icon-github{*zoom:expression( this.runtimeStyle['zoom'] = '1', this.innerHTML = '&#xf09b;');}
        .icon-unlock{*zoom:expression( this.runtimeStyle['zoom'] = '1', this.innerHTML = '&#xf09c;');}
        .icon-credit-card{*zoom:expression( this.runtimeStyle['zoom'] = '1', this.innerHTML = '&#xf09d;');}
        .icon-rss{*zoom:expression( this.runtimeStyle['zoom'] = '1', this.innerHTML = '&#xf09e;');}
        .icon-hdd{*zoom:expression( this.runtimeStyle['zoom'] = '1', this.innerHTML = '&#xf0a0;');}
        .icon-bullhorn{*zoom:expression( this.runtimeStyle['zoom'] = '1', this.innerHTML = '&#xf0a1;');}
        .icon-bell{*zoom:expression( this.runtimeStyle['zoom'] = '1', this.innerHTML = '&#xf0a2;');}
        .icon-certificate{*zoom:expression( this.runtimeStyle['zoom'] = '1', this.innerHTML = '&#xf0a3;');}
        .icon-hand-right{*zoom:expression( this.runtimeStyle['zoom'] = '1', this.innerHTML = '&#xf0a4;');}
        .icon-hand-left{*zoom:expression( this.runtimeStyle['zoom'] = '1', this.innerHTML = '&#xf0a5;');}
        .icon-hand-up{*zoom:expression( this.runtimeStyle['zoom'] = '1', this.innerHTML = '&#xf0a6;');}
        .icon-hand-down{*zoom:expression( this.runtimeStyle['zoom'] = '1', this.innerHTML = '&#xf0a7;');}
        .icon-circle-arrow-left{*zoom:expression( this.runtimeStyle['zoom'] = '1', this.innerHTML = '&#xf0a8;');}
        .icon-circle-arrow-right{*zoom:expression( this.runtimeStyle['zoom'] = '1', this.innerHTML = '&#xf0a9;');}
        .icon-circle-arrow-up{*zoom:expression( this.runtimeStyle['zoom'] = '1', this.innerHTML = '&#xf0aa;');}
        .icon-circle-arrow-down{*zoom:expression( this.runtimeStyle['zoom'] = '1', this.innerHTML = '&#xf0ab;');}
        .icon-globe{*zoom:expression( this.runtimeStyle['zoom'] = '1', this.innerHTML = '&#xf0ac;');}
        .icon-wrench{*zoom:expression( this.runtimeStyle['zoom'] = '1', this.innerHTML = '&#xf0ad;');}
        .icon-tasks{*zoom:expression( this.runtimeStyle['zoom'] = '1', this.innerHTML = '&#xf0ae;');}
        .icon-filter{*zoom:expression( this.runtimeStyle['zoom'] = '1', this.innerHTML = '&#xf0b0;');}
        .icon-briefcase{*zoom:expression( this.runtimeStyle['zoom'] = '1', this.innerHTML = '&#xf0b1;');}
        .icon-fullscreen{*zoom:expression( this.runtimeStyle['zoom'] = '1', this.innerHTML = '&#xf0b2;');}
        .icon-group{*zoom:expression( this.runtimeStyle['zoom'] = '1', this.innerHTML = '&#xf0c0;');}
        .icon-link{*zoom:expression( this.runtimeStyle['zoom'] = '1', this.innerHTML = '&#xf0c1;');}
        .icon-cloud{*zoom:expression( this.runtimeStyle['zoom'] = '1', this.innerHTML = '&#xf0c2;');}
        .icon-beaker{*zoom:expression( this.runtimeStyle['zoom'] = '1', this.innerHTML = '&#xf0c3;');}
        .icon-cut{*zoom:expression( this.runtimeStyle['zoom'] = '1', this.innerHTML = '&#xf0c4;');}
        .icon-copy{*zoom:expression( this.runtimeStyle['zoom'] = '1', this.innerHTML = '&#xf0c5;');}
        .icon-paper-clip{*zoom:expression( this.runtimeStyle['zoom'] = '1', this.innerHTML = '&#xf0c6;');}
        .icon-paperclip{*zoom:expression( this.runtimeStyle['zoom'] = '1', this.innerHTML = '&#xf0c6;');}
        .icon-save{*zoom:expression( this.runtimeStyle['zoom'] = '1', this.innerHTML = '&#xf0c7;');}
        .icon-sign-blank{*zoom:expression( this.runtimeStyle['zoom'] = '1', this.innerHTML = '&#xf0c8;');}
        .icon-reorder{*zoom:expression( this.runtimeStyle['zoom'] = '1', this.innerHTML = '&#xf0c9;');}
        .icon-list-ul{*zoom:expression( this.runtimeStyle['zoom'] = '1', this.innerHTML = '&#xf0ca;');}
        .icon-list-ol{*zoom:expression( this.runtimeStyle['zoom'] = '1', this.innerHTML = '&#xf0cb;');}
        .icon-strikethrough{*zoom:expression( this.runtimeStyle['zoom'] = '1', this.innerHTML = '&#xf0cc;');}
        .icon-underline{*zoom:expression( this.runtimeStyle['zoom'] = '1', this.innerHTML = '&#xf0cd;');}
        .icon-table{*zoom:expression( this.runtimeStyle['zoom'] = '1', this.innerHTML = '&#xf0ce;');}
        .icon-magic{*zoom:expression( this.runtimeStyle['zoom'] = '1', this.innerHTML = '&#xf0d0;');}
        .icon-truck{*zoom:expression( this.runtimeStyle['zoom'] = '1', this.innerHTML = '&#xf0d1;');}
        .icon-pinterest{*zoom:expression( this.runtimeStyle['zoom'] = '1', this.innerHTML = '&#xf0d2;');}
        .icon-pinterest-sign{*zoom:expression( this.runtimeStyle['zoom'] = '1', this.innerHTML = '&#xf0d3;');}
        .icon-google-plus-sign{*zoom:expression( this.runtimeStyle['zoom'] = '1', this.innerHTML = '&#xf0d4;');}
        .icon-google-plus{*zoom:expression( this.runtimeStyle['zoom'] = '1', this.innerHTML = '&#xf0d5;');}
        .icon-money{*zoom:expression( this.runtimeStyle['zoom'] = '1', this.innerHTML = '&#xf0d6;');}
        .icon-caret-down{*zoom:expression( this.runtimeStyle['zoom'] = '1', this.innerHTML = '&#xf0d7;');}
        .icon-caret-up{*zoom:expression( this.runtimeStyle['zoom'] = '1', this.innerHTML = '&#xf0d8;');}
        .icon-caret-left{*zoom:expression( this.runtimeStyle['zoom'] = '1', this.innerHTML = '&#xf0d9;');}
        .icon-caret-right{*zoom:expression( this.runtimeStyle['zoom'] = '1', this.innerHTML = '&#xf0da;');}
        .icon-columns{*zoom:expression( this.runtimeStyle['zoom'] = '1', this.innerHTML = '&#xf0db;');}
        .icon-sort{*zoom:expression( this.runtimeStyle['zoom'] = '1', this.innerHTML = '&#xf0dc;');}
        .icon-sort-down{*zoom:expression( this.runtimeStyle['zoom'] = '1', this.innerHTML = '&#xf0dd;');}
        .icon-sort-up{*zoom:expression( this.runtimeStyle['zoom'] = '1', this.innerHTML = '&#xf0de;');}
        .icon-envelope{*zoom:expression( this.runtimeStyle['zoom'] = '1', this.innerHTML = '&#xf0e0;');}
        .icon-linkedin{*zoom:expression( this.runtimeStyle['zoom'] = '1', this.innerHTML = '&#xf0e1;');}
        .icon-undo{*zoom:expression( this.runtimeStyle['zoom'] = '1', this.innerHTML = '&#xf0e2;');}
        .icon-rotate-left{*zoom:expression( this.runtimeStyle['zoom'] = '1', this.innerHTML = '&#xf0e2;');}
        .icon-legal{*zoom:expression( this.runtimeStyle['zoom'] = '1', this.innerHTML = '&#xf0e3;');}
        .icon-dashboard{*zoom:expression( this.runtimeStyle['zoom'] = '1', this.innerHTML = '&#xf0e4;');}
        .icon-comment-alt{*zoom:expression( this.runtimeStyle['zoom'] = '1', this.innerHTML = '&#xf0e5;');}
        .icon-comments-alt{*zoom:expression( this.runtimeStyle['zoom'] = '1', this.innerHTML = '&#xf0e6;');}
        .icon-bolt{*zoom:expression( this.runtimeStyle['zoom'] = '1', this.innerHTML = '&#xf0e7;');}
        .icon-sitemap{*zoom:expression( this.runtimeStyle['zoom'] = '1', this.innerHTML = '&#xf0e8;');}
        .icon-umbrella{*zoom:expression( this.runtimeStyle['zoom'] = '1', this.innerHTML = '&#xf0e9;');}
        .icon-paste{*zoom:expression( this.runtimeStyle['zoom'] = '1', this.innerHTML = '&#xf0ea;');}
        .icon-lightbulb{*zoom:expression( this.runtimeStyle['zoom'] = '1', this.innerHTML = '&#xf0eb;');}
        .icon-exchange{*zoom:expression( this.runtimeStyle['zoom'] = '1', this.innerHTML = '&#xf0ec;');}
        .icon-cloud-download{*zoom:expression( this.runtimeStyle['zoom'] = '1', this.innerHTML = '&#xf0ed;');}
        .icon-cloud-upload{*zoom:expression( this.runtimeStyle['zoom'] = '1', this.innerHTML = '&#xf0ee;');}
        .icon-user-md{*zoom:expression( this.runtimeStyle['zoom'] = '1', this.innerHTML = '&#xf0f0;');}
        .icon-stethoscope{*zoom:expression( this.runtimeStyle['zoom'] = '1', this.innerHTML = '&#xf0f1;');}
        .icon-suitcase{*zoom:expression( this.runtimeStyle['zoom'] = '1', this.innerHTML = '&#xf0f2;');}
        .icon-bell-alt{*zoom:expression( this.runtimeStyle['zoom'] = '1', this.innerHTML = '&#xf0f3;');}
        .icon-coffee{*zoom:expression( this.runtimeStyle['zoom'] = '1', this.innerHTML = '&#xf0f4;');}
        .icon-food{*zoom:expression( this.runtimeStyle['zoom'] = '1', this.innerHTML = '&#xf0f5;');}
        .icon-file-text-alt{*zoom:expression( this.runtimeStyle['zoom'] = '1', this.innerHTML = '&#xf0f6;');}
        .icon-building{*zoom:expression( this.runtimeStyle['zoom'] = '1', this.innerHTML = '&#xf0f7;');}
        .icon-hospital{*zoom:expression( this.runtimeStyle['zoom'] = '1', this.innerHTML = '&#xf0f8;');}
        .icon-ambulance{*zoom:expression( this.runtimeStyle['zoom'] = '1', this.innerHTML = '&#xf0f9;');}
        .icon-medkit{*zoom:expression( this.runtimeStyle['zoom'] = '1', this.innerHTML = '&#xf0fa;');}
        .icon-fighter-jet{*zoom:expression( this.runtimeStyle['zoom'] = '1', this.innerHTML = '&#xf0fb;');}
        .icon-beer{*zoom:expression( this.runtimeStyle['zoom'] = '1', this.innerHTML = '&#xf0fc;');}
        .icon-h-sign{*zoom:expression( this.runtimeStyle['zoom'] = '1', this.innerHTML = '&#xf0fd;');}
        .icon-plus-sign-alt{*zoom:expression( this.runtimeStyle['zoom'] = '1', this.innerHTML = '&#xf0fe;');}
        .icon-double-angle-left{*zoom:expression( this.runtimeStyle['zoom'] = '1', this.innerHTML = '&#xf100;');}
        .icon-double-angle-right{*zoom:expression( this.runtimeStyle['zoom'] = '1', this.innerHTML = '&#xf101;');}
        .icon-double-angle-up{*zoom:expression( this.runtimeStyle['zoom'] = '1', this.innerHTML = '&#xf102;');}
        .icon-double-angle-down{*zoom:expression( this.runtimeStyle['zoom'] = '1', this.innerHTML = '&#xf103;');}
        .icon-angle-left{*zoom:expression( this.runtimeStyle['zoom'] = '1', this.innerHTML = '&#xf104;');}
        .icon-angle-right{*zoom:expression( this.runtimeStyle['zoom'] = '1', this.innerHTML = '&#xf105;');}
        .icon-angle-up{*zoom:expression( this.runtimeStyle['zoom'] = '1', this.innerHTML = '&#xf106;');}
        .icon-angle-down{*zoom:expression( this.runtimeStyle['zoom'] = '1', this.innerHTML = '&#xf107;');}
        .icon-desktop{*zoom:expression( this.runtimeStyle['zoom'] = '1', this.innerHTML = '&#xf108;');}
        .icon-laptop{*zoom:expression( this.runtimeStyle['zoom'] = '1', this.innerHTML = '&#xf109;');}
        .icon-tablet{*zoom:expression( this.runtimeStyle['zoom'] = '1', this.innerHTML = '&#xf10a;');}
        .icon-mobile-phone{*zoom:expression( this.runtimeStyle['zoom'] = '1', this.innerHTML = '&#xf10b;');}
        .icon-circle-blank{*zoom:expression( this.runtimeStyle['zoom'] = '1', this.innerHTML = '&#xf10c;');}
        .icon-quote-left{*zoom:expression( this.runtimeStyle['zoom'] = '1', this.innerHTML = '&#xf10d;');}
        .icon-quote-right{*zoom:expression( this.runtimeStyle['zoom'] = '1', this.innerHTML = '&#xf10e;');}
        .icon-spinner{*zoom:expression( this.runtimeStyle['zoom'] = '1', this.innerHTML = '&#xf110;');}
        .icon-circle{*zoom:expression( this.runtimeStyle['zoom'] = '1', this.innerHTML = '&#xf111;');}
        .icon-reply{*zoom:expression( this.runtimeStyle['zoom'] = '1', this.innerHTML = '&#xf112;');}
        .icon-mail-reply{*zoom:expression( this.runtimeStyle['zoom'] = '1', this.innerHTML = '&#xf112;');}
        .icon-github-alt{*zoom:expression( this.runtimeStyle['zoom'] = '1', this.innerHTML = '&#xf113;');}
        .icon-folder-close-alt{*zoom:expression( this.runtimeStyle['zoom'] = '1', this.innerHTML = '&#xf114;');}
        .icon-folder-open-alt{*zoom:expression( this.runtimeStyle['zoom'] = '1', this.innerHTML = '&#xf115;');}
        .icon-expand-alt{*zoom:expression( this.runtimeStyle['zoom'] = '1', this.innerHTML = '&#xf116;');}
        .icon-collapse-alt{*zoom:expression( this.runtimeStyle['zoom'] = '1', this.innerHTML = '&#xf117;');}
        .icon-smile{*zoom:expression( this.runtimeStyle['zoom'] = '1', this.innerHTML = '&#xf118;');}
        .icon-frown{*zoom:expression( this.runtimeStyle['zoom'] = '1', this.innerHTML = '&#xf119;');}
        .icon-meh{*zoom:expression( this.runtimeStyle['zoom'] = '1', this.innerHTML = '&#xf11a;');}
        .icon-gamepad{*zoom:expression( this.runtimeStyle['zoom'] = '1', this.innerHTML = '&#xf11b;');}
        .icon-keyboard{*zoom:expression( this.runtimeStyle['zoom'] = '1', this.innerHTML = '&#xf11c;');}
        .icon-flag-alt{*zoom:expression( this.runtimeStyle['zoom'] = '1', this.innerHTML = '&#xf11d;');}
        .icon-flag-checkered{*zoom:expression( this.runtimeStyle['zoom'] = '1', this.innerHTML = '&#xf11e;');}
        .icon-terminal{*zoom:expression( this.runtimeStyle['zoom'] = '1', this.innerHTML = '&#xf120;');}
        .icon-code{*zoom:expression( this.runtimeStyle['zoom'] = '1', this.innerHTML = '&#xf121;');}
        .icon-reply-all{*zoom:expression( this.runtimeStyle['zoom'] = '1', this.innerHTML = '&#xf122;');}
        .icon-mail-reply-all{*zoom:expression( this.runtimeStyle['zoom'] = '1', this.innerHTML = '&#xf122;');}
        .icon-star-half-empty{*zoom:expression( this.runtimeStyle['zoom'] = '1', this.innerHTML = '&#xf123;');}
        .icon-star-half-full{*zoom:expression( this.runtimeStyle['zoom'] = '1', this.innerHTML = '&#xf123;');}
        .icon-location-arrow{*zoom:expression( this.runtimeStyle['zoom'] = '1', this.innerHTML = '&#xf124;');}
        .icon-crop{*zoom:expression( this.runtimeStyle['zoom'] = '1', this.innerHTML = '&#xf125;');}
        .icon-code-fork{*zoom:expression( this.runtimeStyle['zoom'] = '1', this.innerHTML = '&#xf126;');}
        .icon-unlink{*zoom:expression( this.runtimeStyle['zoom'] = '1', this.innerHTML = '&#xf127;');}
        .icon-question{*zoom:expression( this.runtimeStyle['zoom'] = '1', this.innerHTML = '&#xf128;');}
        .icon-info{*zoom:expression( this.runtimeStyle['zoom'] = '1', this.innerHTML = '&#xf129;');}
        .icon-exclamation{*zoom:expression( this.runtimeStyle['zoom'] = '1', this.innerHTML = '&#xf12a;');}
        .icon-superscript{*zoom:expression( this.runtimeStyle['zoom'] = '1', this.innerHTML = '&#xf12b;');}
        .icon-subscript{*zoom:expression( this.runtimeStyle['zoom'] = '1', this.innerHTML = '&#xf12c;');}
        .icon-eraser{*zoom:expression( this.runtimeStyle['zoom'] = '1', this.innerHTML = '&#xf12d;');}
        .icon-puzzle-piece{*zoom:expression( this.runtimeStyle['zoom'] = '1', this.innerHTML = '&#xf12e;');}
        .icon-microphone{*zoom:expression( this.runtimeStyle['zoom'] = '1', this.innerHTML = '&#xf130;');}
        .icon-microphone-off{*zoom:expression( this.runtimeStyle['zoom'] = '1', this.innerHTML = '&#xf131;');}
        .icon-shield{*zoom:expression( this.runtimeStyle['zoom'] = '1', this.innerHTML = '&#xf132;');}
        .icon-calendar-empty{*zoom:expression( this.runtimeStyle['zoom'] = '1', this.innerHTML = '&#xf133;');}
        .icon-fire-extinguisher{*zoom:expression( this.runtimeStyle['zoom'] = '1', this.innerHTML = '&#xf134;');}
        .icon-rocket{*zoom:expression( this.runtimeStyle['zoom'] = '1', this.innerHTML = '&#xf135;');}
        .icon-maxcdn{*zoom:expression( this.runtimeStyle['zoom'] = '1', this.innerHTML = '&#xf136;');}
        .icon-chevron-sign-left{*zoom:expression( this.runtimeStyle['zoom'] = '1', this.innerHTML = '&#xf137;');}
        .icon-chevron-sign-right{*zoom:expression( this.runtimeStyle['zoom'] = '1', this.innerHTML = '&#xf138;');}
        .icon-chevron-sign-up{*zoom:expression( this.runtimeStyle['zoom'] = '1', this.innerHTML = '&#xf139;');}
        .icon-chevron-sign-down{*zoom:expression( this.runtimeStyle['zoom'] = '1', this.innerHTML = '&#xf13a;');}
        .icon-html5{*zoom:expression( this.runtimeStyle['zoom'] = '1', this.innerHTML = '&#xf13b;');}
        .icon-css3{*zoom:expression( this.runtimeStyle['zoom'] = '1', this.innerHTML = '&#xf13c;');}
        .icon-anchor{*zoom:expression( this.runtimeStyle['zoom'] = '1', this.innerHTML = '&#xf13d;');}
        .icon-unlock-alt{*zoom:expression( this.runtimeStyle['zoom'] = '1', this.innerHTML = '&#xf13e;');}
        .icon-bullseye{*zoom:expression( this.runtimeStyle['zoom'] = '1', this.innerHTML = '&#xf140;');}
        .icon-ellipsis-horizontal{*zoom:expression( this.runtimeStyle['zoom'] = '1', this.innerHTML = '&#xf141;');}
        .icon-ellipsis-vertical{*zoom:expression( this.runtimeStyle['zoom'] = '1', this.innerHTML = '&#xf142;');}
        .icon-rss-sign{*zoom:expression( this.runtimeStyle['zoom'] = '1', this.innerHTML = '&#xf143;');}
        .icon-play-sign{*zoom:expression( this.runtimeStyle['zoom'] = '1', this.innerHTML = '&#xf144;');}
        .icon-ticket{*zoom:expression( this.runtimeStyle['zoom'] = '1', this.innerHTML = '&#xf145;');}
        .icon-minus-sign-alt{*zoom:expression( this.runtimeStyle['zoom'] = '1', this.innerHTML = '&#xf146;');}
        .icon-check-minus{*zoom:expression( this.runtimeStyle['zoom'] = '1', this.innerHTML = '&#xf147;');}
        .icon-level-up{*zoom:expression( this.runtimeStyle['zoom'] = '1', this.innerHTML = '&#xf148;');}
        .icon-level-down{*zoom:expression( this.runtimeStyle['zoom'] = '1', this.innerHTML = '&#xf149;');}
        .icon-check-sign{*zoom:expression( this.runtimeStyle['zoom'] = '1', this.innerHTML = '&#xf14a;');}
        .icon-edit-sign{*zoom:expression( this.runtimeStyle['zoom'] = '1', this.innerHTML = '&#xf14b;');}
        .icon-external-link-sign{*zoom:expression( this.runtimeStyle['zoom'] = '1', this.innerHTML = '&#xf14c;');}
        .icon-share-sign{*zoom:expression( this.runtimeStyle['zoom'] = '1', this.innerHTML = '&#xf14d;');}
        .icon-compass{*zoom:expression( this.runtimeStyle['zoom'] = '1', this.innerHTML = '&#xf14e;');}
        .icon-collapse{*zoom:expression( this.runtimeStyle['zoom'] = '1', this.innerHTML = '&#xf150;');}
        .icon-collapse-top{*zoom:expression( this.runtimeStyle['zoom'] = '1', this.innerHTML = '&#xf151;');}
        .icon-expand{*zoom:expression( this.runtimeStyle['zoom'] = '1', this.innerHTML = '&#xf152;');}
        .icon-eur{*zoom:expression( this.runtimeStyle['zoom'] = '1', this.innerHTML = '&#xf153;');}
        .icon-euro{*zoom:expression( this.runtimeStyle['zoom'] = '1', this.innerHTML = '&#xf153;');}
        .icon-gbp{*zoom:expression( this.runtimeStyle['zoom'] = '1', this.innerHTML = '&#xf154;');}
        .icon-usd{*zoom:expression( this.runtimeStyle['zoom'] = '1', this.innerHTML = '&#xf155;');}
        .icon-dollar{*zoom:expression( this.runtimeStyle['zoom'] = '1', this.innerHTML = '&#xf155;');}
        .icon-inr{*zoom:expression( this.runtimeStyle['zoom'] = '1', this.innerHTML = '&#xf156;');}
        .icon-rupee{*zoom:expression( this.runtimeStyle['zoom'] = '1', this.innerHTML = '&#xf156;');}
        .icon-jpy{*zoom:expression( this.runtimeStyle['zoom'] = '1', this.innerHTML = '&#xf157;');}
        .icon-yen{*zoom:expression( this.runtimeStyle['zoom'] = '1', this.innerHTML = '&#xf157;');}
        .icon-cny{*zoom:expression( this.runtimeStyle['zoom'] = '1', this.innerHTML = '&#xf158;');}
        .icon-renminbi{*zoom:expression( this.runtimeStyle['zoom'] = '1', this.innerHTML = '&#xf158;');}
        .icon-krw{*zoom:expression( this.runtimeStyle['zoom'] = '1', this.innerHTML = '&#xf159;');}
        .icon-won{*zoom:expression( this.runtimeStyle['zoom'] = '1', this.innerHTML = '&#xf159;');}
        .icon-btc{*zoom:expression( this.runtimeStyle['zoom'] = '1', this.innerHTML = '&#xf15a;');}
        .icon-bitcoin{*zoom:expression( this.runtimeStyle['zoom'] = '1', this.innerHTML = '&#xf15a;');}
        .icon-file{*zoom:expression( this.runtimeStyle['zoom'] = '1', this.innerHTML = '&#xf15b;');}
        .icon-file-text{*zoom:expression( this.runtimeStyle['zoom'] = '1', this.innerHTML = '&#xf15c;');}
        .icon-sort-by-alphabet{*zoom:expression( this.runtimeStyle['zoom'] = '1', this.innerHTML = '&#xf15d;');}
        .icon-sort-by-alphabet-alt{*zoom:expression( this.runtimeStyle['zoom'] = '1', this.innerHTML = '&#xf15e;');}
        .icon-sort-by-attributes{*zoom:expression( this.runtimeStyle['zoom'] = '1', this.innerHTML = '&#xf160;');}
        .icon-sort-by-attributes-alt{*zoom:expression( this.runtimeStyle['zoom'] = '1', this.innerHTML = '&#xf161;');}
        .icon-sort-by-order{*zoom:expression( this.runtimeStyle['zoom'] = '1', this.innerHTML = '&#xf162;');}
        .icon-sort-by-order-alt{*zoom:expression( this.runtimeStyle['zoom'] = '1', this.innerHTML = '&#xf163;');}
        .icon-thumbs-up{*zoom:expression( this.runtimeStyle['zoom'] = '1', this.innerHTML = '&#xf164;');}
        .icon-thumbs-down{*zoom:expression( this.runtimeStyle['zoom'] = '1', this.innerHTML = '&#xf165;');}
        .icon-youtube-sign{*zoom:expression( this.runtimeStyle['zoom'] = '1', this.innerHTML = '&#xf166;');}
        .icon-youtube{*zoom:expression( this.runtimeStyle['zoom'] = '1', this.innerHTML = '&#xf167;');}
        .icon-xing{*zoom:expression( this.runtimeStyle['zoom'] = '1', this.innerHTML = '&#xf168;');}
        .icon-xing-sign{*zoom:expression( this.runtimeStyle['zoom'] = '1', this.innerHTML = '&#xf169;');}
        .icon-youtube-play{*zoom:expression( this.runtimeStyle['zoom'] = '1', this.innerHTML = '&#xf16a;');}
        .icon-dropbox{*zoom:expression( this.runtimeStyle['zoom'] = '1', this.innerHTML = '&#xf16b;');}
        .icon-stackexchange{*zoom:expression( this.runtimeStyle['zoom'] = '1', this.innerHTML = '&#xf16c;');}
        .icon-instagram{*zoom:expression( this.runtimeStyle['zoom'] = '1', this.innerHTML = '&#xf16d;');}
        .icon-flickr{*zoom:expression( this.runtimeStyle['zoom'] = '1', this.innerHTML = '&#xf16e;');}
        .icon-adn{*zoom:expression( this.runtimeStyle['zoom'] = '1', this.innerHTML = '&#xf170;');}
        .icon-bitbucket{*zoom:expression( this.runtimeStyle['zoom'] = '1', this.innerHTML = '&#xf171;');}
        .icon-bitbucket-sign{*zoom:expression( this.runtimeStyle['zoom'] = '1', this.innerHTML = '&#xf172;');}
        .icon-tumblr{*zoom:expression( this.runtimeStyle['zoom'] = '1', this.innerHTML = '&#xf173;');}
        .icon-tumblr-sign{*zoom:expression( this.runtimeStyle['zoom'] = '1', this.innerHTML = '&#xf174;');}
        .icon-long-arrow-down{*zoom:expression( this.runtimeStyle['zoom'] = '1', this.innerHTML = '&#xf175;');}
        .icon-long-arrow-up{*zoom:expression( this.runtimeStyle['zoom'] = '1', this.innerHTML = '&#xf176;');}
        .icon-long-arrow-left{*zoom:expression( this.runtimeStyle['zoom'] = '1', this.innerHTML = '&#xf177;');}
        .icon-long-arrow-right{*zoom:expression( this.runtimeStyle['zoom'] = '1', this.innerHTML = '&#xf178;');}
        .icon-apple{*zoom:expression( this.runtimeStyle['zoom'] = '1', this.innerHTML = '&#xf179;');}
        .icon-windows{*zoom:expression( this.runtimeStyle['zoom'] = '1', this.innerHTML = '&#xf17a;');}
        .icon-android{*zoom:expression( this.runtimeStyle['zoom'] = '1', this.innerHTML = '&#xf17b;');}
        .icon-linux{*zoom:expression( this.runtimeStyle['zoom'] = '1', this.innerHTML = '&#xf17c;');}
        .icon-dribbble{*zoom:expression( this.runtimeStyle['zoom'] = '1', this.innerHTML = '&#xf17d;');}
        .icon-skype{*zoom:expression( this.runtimeStyle['zoom'] = '1', this.innerHTML = '&#xf17e;');}
        .icon-foursquare{*zoom:expression( this.runtimeStyle['zoom'] = '1', this.innerHTML = '&#xf180;');}
        .icon-trello{*zoom:expression( this.runtimeStyle['zoom'] = '1', this.innerHTML = '&#xf181;');}
        .icon-female{*zoom:expression( this.runtimeStyle['zoom'] = '1', this.innerHTML = '&#xf182;');}
        .icon-male{*zoom:expression( this.runtimeStyle['zoom'] = '1', this.innerHTML = '&#xf183;');}
        .icon-gittip{*zoom:expression( this.runtimeStyle['zoom'] = '1', this.innerHTML = '&#xf184;');}
        .icon-sun{*zoom:expression( this.runtimeStyle['zoom'] = '1', this.innerHTML = '&#xf185;');}
        .icon-moon{*zoom:expression( this.runtimeStyle['zoom'] = '1', this.innerHTML = '&#xf186;');}
        .icon-archive{*zoom:expression( this.runtimeStyle['zoom'] = '1', this.innerHTML = '&#xf187;');}
        .icon-bug{*zoom:expression( this.runtimeStyle['zoom'] = '1', this.innerHTML = '&#xf188;');}
        .icon-vk{*zoom:expression( this.runtimeStyle['zoom'] = '1', this.innerHTML = '&#xf189;');}
        .icon-weibo{*zoom:expression( this.runtimeStyle['zoom'] = '1', this.innerHTML = '&#xf18a;');}
        .icon-renren{*zoom:expression( this.runtimeStyle['zoom'] = '1', this.innerHTML = '&#xf18b;');}

        body,td,div,.p,a,.d,.s{font-family:<xsl:value-of select="$global_font"/>}
        body,td,div,.p,a,.d{font-size: <xsl:value-of select="$global_font_size"/>}
        body,div,td,.p,.s{color:<xsl:value-of select="$global_text_color"/>}
        body,.d,.p,.s{background-color:<xsl:value-of select="$global_bg_color"/>}
        .s{font-size: <xsl:value-of select="$res_snippet_size"/>}
        .g{margin-top: 15px; margin-bottom: 15px;}
        .s td{width:34em; margin-top: 3px;}
        .l{font-size: <xsl:value-of select="$res_title_size"/>}
        .l{color: <xsl:value-of select="$res_title_color"/>}
        a:link,.w,.w a:link{color:<xsl:value-of select="$global_link_color"/>}
        .f,.f:link,.f a:link{color:<xsl:value-of select="$faint_color"/>}
        a:visited,.f a:visited{color:<xsl:value-of select="$global_vlink_color"/>}
        a:active,.f a:active{color:<xsl:value-of select="$global_alink_color"/>}
        a {text-decoration: none;}
        a:hover {text-decoration: underline}
        .t{color:<xsl:value-of select="$sep_bar_text_color"/>}
        .t{background-color:<xsl:value-of select="$sep_bar_bg_color"/>}
        .z{display:none}
        .i,.i:link{color:#a90a08}
        .a,.a:link{color:<xsl:value-of select="$res_url_color"/>}
        div.n {margin-top: 1ex}
        .n a{font-size: 10pt; color:<xsl:value-of select="$global_text_color"/>}
        .n .i{font-size: 10pt; font-weight:bold}
        .q a:visited,.q a:link,.q a:active,.q {color:#1a0dab;}
        .b,.b a{font-size: 10pt; color:#1a0dab; font-weight:bold}
        .d{margin-right:1em; margin-left:1em;}
        div.oneboxResults {margin-top: 1em;}
        .r {font-size:18px;}
        <xsl:if test="$show_res_clusters = '1'">
          div#clustering ul {list-style: none; margin: 0; padding: 0;}
          div#clustering li {margin-left: 2em; text-indent: -2em;}
          div#clustering #cluster_status {color: #666666;}
        </xsl:if>
        .bottom-search-box {
        width:100%;
        background-color:#f4f4f4;
        height:70px;
        /*
        border-bottom: 1px solid <xsl:value-of select="$sep_bar_border_color"/>;
        border-top: 1px solid <xsl:value-of select="$sep_bar_border_color"/>;
        background-color: <xsl:value-of select="$sep_bar_bg_color"/>;
        */
        }
        .sidebar-element  {
        max-width:300px;
        min-width:200px;
        }
        /** Common CSS for sidebar elements. */
        #sidebar{
        margin: 20px;
        }
        .sb-r {
        width: 45%;
        }
        .sb-r-alt {
        padding-top: 5px;
        margin: 20px;
        width: 100%;
        }
        .sb-r-lbl,
        .sb-r-lbl-apps {
        color: #676767;
        font-size: small;
        font-weight: normal;
        margin: 0 0 10px 10px;
        text-align: left;
        }
        .sb-r-border {
        border-left: 1px solid #C9D7F1;
        }
        .sb-r-ld-msg-c {
        margin-bottom: 30px;
        }
        .sb-r-ld-msg {
        background-color: #3366CC;
        color: #FFF;
        font-size: 13px;
        padding: 2px;
        }
        .sb-r-res {
        font-size: 13px;
        margin-bottom: 10px;
        margin-left: 10px;
        }
        /** Common CSS for sidebar elements. */
        #sidebar_l{
        margin: 20px;
        }
        .sb-l {
        width: 45%;
        }
        .sb-l-alt {
        margin: 20px;
        width: 100%;
        }
        .sb-l-lbl,
        .sb-l-lbl-apps {
        color: #676767;
        font-size: small;
        font-weight: normal;
        margin: 0 0 10px 10px;
        text-align: left;
        }
        .sb-l-border {
        border-left: 1px solid #C9D7F1;
        }
        .sb-l-ld-msg-c {
        margin-bottom: 30px;
        }
        .sb-l-ld-msg {
        background-color: #3366CC;
        color: #FFF;
        font-size: 13px;
        padding: 2px;
        }
        .sb-l-res {
        font-size: 13px;
        margin-bottom: 10px;
        margin-left: 25px;
        }
        .sp-header:hover{
        color: darkgray;
        }
        .sp-header {
        color: #676767;
        text-decoration: none;
        }
        /**Headers*/
        .productup-header, .helplinks-header,
        .collection-header,
        .cluster-header, .training-header {
        font-size: large;
        font-weight: normal;
        margin: 0 0 10px 10px;
        text-align: center;
        background-color: #f4f4f4;
        }
        /**Bodies*/
        .productup-body, .helplinks-body,
        .collection-body, .cluster-body,
        .training-body {
        font-size: small;
        font-weight: normal;
        margin: 0 0 10px 10px;
        }
        .productup-header {
        /*Old Pink*/
        /*background-color: rgb(252, 217, 226);*/
        background-color: #f4f4f4;
        }
        .productup-body {
        /*Old Pink*/
        /*
        border-left: 1px solid rgb(252, 217, 226);
        border-right: 1px solid rgb(252, 217, 226);
        border-bottom: 1px solid rgb(252, 217, 226);
        */
        border-left: 1px solid #f4f4f4;
        border-right: 1px solid #f4f4f4;
        border-bottom: 1px solid #f4f4f4;
        }
        .helplinks-header {
        /*background-color:#e5ecf9;*/
        /*background-color: rgb(155,177,217);*/
        }
        .helplinks-body{
        /*
        border-left: 1px solid #e5ecf9;
        border-right: 1px solid #e5ecf9;
        border-bottom: 1px solid #e5ecf9;

        border-left: 1px solid rgb(155,177,217);
        border-right: 1px solid rgb(155,177,217);
        border-bottom: 1px solid rgb(155,177,217);*/

        border-left: 1px solid #f4f4f4;
        border-right: 1px solid #f4f4f4;
        border-bottom: 1px solid #f4f4f4;

        }
        .collection-header{
        background-color: rgb(229, 237, 173);
        }
        .collection-body{
        border-left: 1px solid rgb(229, 237, 173);
        border-right: 1px solid rgb(229, 237, 173);
        border-bottom: 1px solid rgb(229, 237, 173);
        }
        .cluster-header {
        /*background-color: rgb(252, 218, 175);
        background-color: rgb(155,177,217);*/
        background-color: #f4f4f4;
        }
        .cluster-body {
        /*
        border-left: 1px solid rgb(252, 218, 175);
        border-right: 1px solid rgb(252, 218, 175);
        border-bottom: 1px solid rgb(252, 218, 175);

        border-left: 1px solid rgb(155,177,217);
        border-right: 1px solid rgb(155,177,217);
        border-bottom: 1px solid rgb(155,177,217);
        */

        border-left: 1px solid #f4f4f4;
        border-right: 1px solid #f4f4f4;
        border-bottom: 1px solid #f4f4f4;


        }
        .training-header {
        background-color:rgb(248, 234, 255);
        }
        .training-body {
        border-left: 1px solid rgb(248, 234, 255);
        border-right: 1px solid rgb(248, 234, 255);
        border-bottom: 1px solid rgb(248, 234, 255);
        }
        #QL {
        background-image: url("https://portal.qlmortgageservices.com/guru/images/Banner-Textured-Banner.png");
        }
        .
        #QL a,img{
        border:0px;
        }
        #search-row{
        width:600px;
        height:50px;
        margin-top:10px;
        }
        #search-row-top{
        width:600px;
        height:50px;
        }
        .search-btn{
        background-color:  #2980b9;
        color:white;
        border: 0px;
        height: 31px;
        width: 75px;
        margin-left: 0px;
        cursor: pointer;
        float:left;
        }
        #top-search-box{
        padding:0;
        margin:0;
        width: 450px;
        height: 27px;
        padding-left: 5px;
        border: 2px solid lightgray;
        border-right:0px;
        }
        .new-header{
        background-image: url("https://portal.qlmortgageservices.com/guru/images/Banner-Textured-Banner.png");
        .margin-top-sm{
        margin-top:10px;
        }
        .pull-left{
        float:left;
        }
        .pull-right{
        float:right;
        }
        .left-spacing{
        max-width: 388px;
        min-width: 240px;
        width: 25%;
        height: 50px;
        float: left;
        }
      </xsl:comment>
    </style>
  </xsl:template>

  <!-- **********************************************************************
URL variables (do not customize)
     ********************************************************************** -->
  <!-- *** if this is a test search (help variable)-->
  <xsl:variable name="is_test_search"
    select="/GSP/PARAM[@name='testSearch']/@value"/>

  <!-- *** if this is a search within results search *** -->
  <xsl:variable name="swrnum">
    <xsl:choose>
      <xsl:when test="/GSP/PARAM[(@name='swrnum') and (@value!='')]">
        <xsl:value-of select="/GSP/PARAM[@name='swrnum']/@value"/>
      </xsl:when>
      <xsl:otherwise>
        <xsl:value-of select="0"/>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:variable>

  <!-- *** help_url: search tip URL (html file) *** -->
  <xsl:variable name="help_url">/user_help.html</xsl:variable>

  <!-- *** alerts_url: Alerts URL (html file) *** -->
  <xsl:variable name="alerts_url">/alerts</xsl:variable>

  <!-- *** base_url: collection info *** -->
  <xsl:variable name="base_url">
    <xsl:for-each
      select="/GSP/PARAM[@name = 'client' or

                     @name = 'site' or
                     @name = 'num' or
                     @name = 'output' or
                     @name = 'proxystylesheet' or
                     @name = 'access' or
                     @name = 'lr' or
                     @name = 'ie']">
      <xsl:value-of select="@name"/>=<xsl:value-of select="@original_value"/>
      <xsl:if test="position() != last()">&amp;</xsl:if>
    </xsl:for-each>
  </xsl:variable>

  <!-- *** home_url: search? + collection info + &proxycustom=<HOME/> *** -->
  <xsl:variable name="home_url">
    search?<xsl:value-of select="$base_url"
  />&amp;proxycustom=&lt;HOME/&gt;
  </xsl:variable>


  <!-- *** synonym_url: does not include q, as_q, and start elements *** -->
  <xsl:variable name="synonym_url">
    <xsl:for-each
  select="/GSP/PARAM[(@name != 'q') and
                     (@name != 'as_q') and
                     (@name != 'swrnum') and

                             (@name != 'ie') and
                     (@name != 'start') and
                     (@name != 'epoch' or $is_test_search != '') and
                     not(starts-with(@name, 'metabased_'))]">
      <xsl:value-of select="@name"/>
      <xsl:text>=</xsl:text>
      <xsl:value-of select="@original_value"/>
      <xsl:if test="position() != last()">
        <xsl:text disable-output-escaping="yes">&amp;</xsl:text>
      </xsl:if>
    </xsl:for-each>
  </xsl:variable>

  <!-- *** search_url *** -->
  <xsl:variable name="search_url">
    <xsl:for-each select="/GSP/PARAM[(@name != 'start') and
                                   (@name != 'swrnum') and
                     (@name != 'epoch' or $is_test_search != '') and
                     not(starts-with(@name, 'metabased_'))]">
      <xsl:value-of select="@name"/>
      <xsl:text>=</xsl:text>
      <xsl:value-of select="@original_value"/>
      <xsl:if test="position() != last()">
        <xsl:text disable-output-escaping="yes">&amp;</xsl:text>
      </xsl:if>
    </xsl:for-each>
  </xsl:variable>

  <!-- *** search_url_escaped: safe for inclusion in javascript *** -->
  <xsl:variable name="search_url_escaped">
    <xsl:call-template name="replace_string">
      <xsl:with-param name="find" select='"&apos;"'/>
      <xsl:with-param name="replace" select="'&amp;apos;'"/>
      <xsl:with-param name="string" select="$search_url"/>
    </xsl:call-template>
  </xsl:variable>

  <!-- *** filter_url: everything except resetting "filter=" *** -->
  <xsl:variable name="filter_url">
    search?<xsl:for-each
  select="/GSP/PARAM[(@name != 'filter') and
                     (@name != 'epoch' or $is_test_search != '') and
                     not(starts-with(@name, 'metabased_'))]">
      <xsl:value-of select="@name"/>
      <xsl:text>=</xsl:text>
      <xsl:value-of select="@original_value"/>
      <xsl:if test="position() != last()">
        <xsl:text disable-output-escaping="yes">&amp;</xsl:text>
      </xsl:if>
    </xsl:for-each>
    <xsl:text disable-output-escaping='yes'>&amp;filter=</xsl:text>
  </xsl:variable>

  <!-- *** adv_search_url: search? + $search_url + as_q=$q *** -->
  <xsl:variable name="adv_search_url">
    search?<xsl:value-of
  select="$search_url"/>&amp;proxycustom=&lt;ADVANCED/&gt;
  </xsl:variable>

  <!-- *** db_url_protocol: googledb:// *** -->
  <xsl:variable name="db_url_protocol">googledb://</xsl:variable>

  <!-- *** googleconnector_protocol: googleconnector:// *** -->
  <xsl:variable name="googleconnector_protocol">googleconnector://</xsl:variable>

  <!-- *** nfs_url_protocol: nfs:// *** -->
  <xsl:variable name="nfs_url_protocol">nfs://</xsl:variable>

  <!-- *** smb_url_protocol: smb:// *** -->
  <xsl:variable name="smb_url_protocol">smb://</xsl:variable>

  <!-- *** unc_url_protocol: unc:// *** -->
  <xsl:variable name="unc_url_protocol">unc://</xsl:variable>

  <!-- *** swr_search_url: search? + $search_url + as_q=$q *** -->
  <xsl:variable name="swr_search_url">
    search?<xsl:value-of
  select="$search_url"/>&amp;swrnum=<xsl:value-of select="/GSP/RES/M"/>
  </xsl:variable>

  <!-- *** analytics_script_url: http://www.google-analytics.com/urchin.js *** -->
  <xsl:variable
  name="analytics_script_url">http://www.google-analytics.com/urchin.js</xsl:variable>

  <!-- **********************************************************************
Search Parameters (do not customize)
     ********************************************************************** -->

  <!-- *** num_results: actual num_results per page *** -->
  <xsl:variable name="num_results">
    <xsl:choose>
      <xsl:when test="/GSP/PARAM[(@name='num') and (@value!='')]">
        <xsl:value-of select="/GSP/PARAM[@name='num']/@value"/>
      </xsl:when>
      <xsl:otherwise>
        <xsl:value-of select="10"/>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:variable>

  <!-- *** form_params: parameters carried by the search input form *** -->
  <xsl:template name="form_params">
    <xsl:for-each
      select="PARAM[@name != 'q' and
                  @name != 'ie' and
                  not(contains(@name, 'as_')) and
                  @name != 'btnG' and
                  @name != 'btnI' and
                  @name != 'site' and
                  @name != 'filter' and
                  @name != 'swrnum' and
                  @name != 'start' and
                  @name != 'access' and
                  @name != 'ip' and
                  (@name != 'epoch' or $is_test_search != '') and
                  not(starts-with(@name ,'metabased_'))]">
      <input type="hidden" name="{@name}" value="{@value}" />

      <xsl:if test="@name = 'oe'">
        <input type="hidden" name="ie" value="{@value}" />
      </xsl:if>
      <xsl:text>
    </xsl:text>
    </xsl:for-each>
    <xsl:if test="$search_collections_xslt = '' and PARAM[@name='site']">
      <input type="hidden" name="site" value="{PARAM[@name='site']/@value}"/>
    </xsl:if>
    <input type="hidden" name="filter" value="0" />
  </xsl:template>

  <!-- *** space_normalized_query: q = /GSP/Q *** -->
  <xsl:variable name="qval">
    <xsl:value-of select="/GSP/Q"/>
  </xsl:variable>

  <xsl:variable name="space_normalized_query">
    <xsl:value-of select="normalize-space($qval)"
      disable-output-escaping="yes"/>
  </xsl:variable>

  <!-- *** stripped_search_query: q, as_q, ... for cache highlight *** -->
  <xsl:variable name="stripped_search_query">
    <xsl:for-each
  select="/GSP/PARAM[(@name = 'q') or
                     (@name = 'as_q') or
                     (@name = 'as_oq') or
                     (@name = 'as_epq')]">
      <xsl:value-of select="@original_value"
  />
      <xsl:if test="position() != last()"
    >
        <xsl:text disable-output-escaping="yes">+</xsl:text
     >
      </xsl:if>
    </xsl:for-each>
  </xsl:variable>

  <xsl:variable name="access">
    <xsl:choose>
      <xsl:when test="/GSP/PARAM[(@name='access') and ((@value='s') or (@value='a'))]">
        <xsl:value-of select="/GSP/PARAM[@name='access']/@original_value"/>
      </xsl:when>
      <xsl:otherwise>p</xsl:otherwise>
    </xsl:choose>
  </xsl:variable>

  <xsl:template name="doc_type">
    <xsl:text disable-output-escaping="yes">
&lt;!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
  "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"&gt;
</xsl:text>
  </xsl:template>
  
  <!-- **********************************************************************
Figure out what kind of page this is (do not customize)
     ********************************************************************** -->
  <xsl:template match="GSP">
    <xsl:choose>
      <xsl:when test="Q">
        <xsl:choose>
          <xsl:when test="$swrnum != 0">
            <xsl:call-template name="swr_search"/>
          </xsl:when>
          <xsl:otherwise>
            <xsl:call-template name="search_results"/>
          </xsl:otherwise>
        </xsl:choose>
      </xsl:when>
      <xsl:when test="CACHE">
        <xsl:choose>
          <xsl:when test="$show_res_cache!='0'">
            <xsl:call-template name="cached_page"/>
          </xsl:when>
          <xsl:otherwise>
            <xsl:call-template name="no_RES"/>
          </xsl:otherwise>
        </xsl:choose>
      </xsl:when>
      <xsl:when test="CUSTOM/HOME">
        <xsl:call-template name="front_door"/>
      </xsl:when>
      <xsl:when test="CUSTOM/ADVANCED">
        <xsl:call-template name="advanced_search"/>
      </xsl:when>
      <xsl:when test="ERROR">
        <xsl:call-template name="error_page">
          <xsl:with-param name="errorMessage" select="$server_error_msg_text"/>
          <xsl:with-param name="errorDescription" select="$server_error_des_text"/>
        </xsl:call-template>
      </xsl:when>
      <xsl:otherwise>
        <xsl:call-template name="error_page">
          <xsl:with-param name="errorMessage" select="$xml_error_msg_text"/>
          <xsl:with-param name="errorDescription" select="$xml_error_des_text"/>
        </xsl:call-template>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>

  <!-- **********************************************************************
Cached page (do not customize)
     ********************************************************************** -->
  <xsl:template name="cached_page">
    <xsl:variable name="cached_page_url" select="CACHE/CACHE_URL"/>
    <xsl:variable name="cached_page_html" select="CACHE/CACHE_HTML"/>

    <!-- *** decide whether to load html page or pdf file *** -->
    <xsl:if test="'.pdf' != substring($cached_page_url,
              1 + string-length($cached_page_url) - string-length('.pdf')) and
              not(starts-with($cached_page_url, $db_url_protocol)) and
              not(starts-with($cached_page_url, $nfs_url_protocol)) and
              not(starts-with($cached_page_url, $smb_url_protocol)) and
              not(starts-with($cached_page_url, $unc_url_protocol))">
      <base href="{$cached_page_url}"/>
    </xsl:if>

    <!-- *** display cache page header *** -->
    <xsl:call-template name="cached_page_header">
      <xsl:with-param name="cached_page_url" select="$cached_page_url"/>
    </xsl:call-template>

    <!-- *** display cached contents *** -->
    <xsl:value-of select="$cached_page_html" disable-output-escaping="yes"/>
  </xsl:template>

  <xsl:template name="escape_quot">
    <xsl:param name="string"/>
    <xsl:call-template name="replace_string">
      <xsl:with-param name="find" select="'&quot;'"/>
      <xsl:with-param name="replace" select="'&amp;quot;'"/>
      <xsl:with-param name="string" select="$string"/>
    </xsl:call-template>
  </xsl:template>

  <!-- **********************************************************************
Advanced search page (do not customize)
     ********************************************************************** -->
  <xsl:template name="advanced_search">

    <xsl:variable name="html_escaped_as_q">
      <xsl:call-template name="escape_quot">
        <xsl:with-param name="string" select="/GSP/PARAM[@name='q']/@value"/>
      </xsl:call-template>
      <xsl:value-of select="' '"/>
      <xsl:call-template name="escape_quot">
        <xsl:with-param name="string" select="/GSP/PARAM[@name='as_q']/@value"/>
      </xsl:call-template>
    </xsl:variable>

    <xsl:variable name="html_escaped_as_epq">
      <xsl:call-template name="escape_quot">
        <xsl:with-param name="string" select="/GSP/PARAM[@name='as_epq']/@value"/>
      </xsl:call-template>
    </xsl:variable>

    <xsl:variable name="html_escaped_as_oq">
      <xsl:call-template name="escape_quot">
        <xsl:with-param name="string" select="/GSP/PARAM[@name='as_oq']/@value"/>
      </xsl:call-template>
    </xsl:variable>

    <xsl:variable name="html_escaped_as_eq">
      <xsl:call-template name="escape_quot">
        <xsl:with-param name="string" select="/GSP/PARAM[@name='as_eq']/@value"/>
      </xsl:call-template>
    </xsl:variable>

    <html>
      <xsl:call-template name="langHeadStart"/>
      <title>
        <xsl:value-of select="$adv_page_title"/>
      </title>
      <xsl:call-template name="style2"/>

      <!-- script type="text/javascript" -->
      <script>
        <xsl:comment>
          function setFocus() {
          document.f.as_q.focus(); }
          function esc(x){
          x = escape(x).replace(/\+/g, "%2b");
          if (x.substring(0,2)=="\%u") x="";
          return x;
          }
          function collecturl(target, custom) {
          var p = new Array();var i = 0;var url="";var z = document.f;
          if (z.as_q.value.length) {p[i++] = 'as_q=' + esc(z.as_q.value);}
          if (z.as_epq.value.length) {p[i++] = 'as_epq=' + esc(z.as_epq.value);}
          if (z.as_oq.value.length) {p[i++] = 'as_oq=' + esc(z.as_oq.value);}
          if (z.as_eq.value.length) {p[i++] = 'as_eq=' + esc(z.as_eq.value);}
          if (z.as_sitesearch.value.length)
          {p[i++]='as_sitesearch='+esc(z.as_sitesearch.value);}
          if (z.as_lq.value.length) {p[i++] = 'as_lq=' + esc(z.as_lq.value);}
          if (z.as_occt.options[z.as_occt.selectedIndex].value.length)
          {p[i++]='as_occt='+esc(z.as_occt.options[z.as_occt.selectedIndex].value);}
          if (z.as_dt.options[z.as_dt.selectedIndex].value.length)
          {p[i++]='as_dt='+esc(z.as_dt.options[z.as_dt.selectedIndex].value);}
          if (z.lr.options[z.lr.selectedIndex].value != '') {p[i++] = 'lr=' +
          z.lr.options[z.lr.selectedIndex].value;}
          if (z.num.options[z.num.selectedIndex].value != '10')
          {p[i++] = 'num=' + z.num.options[z.num.selectedIndex].value;}
          if (z.sort.options[z.sort.selectedIndex].value != '')
          {p[i++] = 'sort=' + z.sort.options[z.sort.selectedIndex].value;}
          if (typeof(z.client) != 'undefined')
          {p[i++] = 'client=' + esc(z.client.value);}
          if (typeof(z.site) != 'undefined')
          {p[i++] = 'site=' + esc(z.site.value);}
          if (typeof(z.output) != 'undefined')
          {p[i++] = 'output=' + esc(z.output.value);}
          if (typeof(z.proxystylesheet) != 'undefined')
          {p[i++] = 'proxystylesheet=' + esc(z.proxystylesheet.value);}
          if (typeof(z.ie) != 'undefined')
          {p[i++] = 'ie=' + esc(z.ie.value);}
          if (typeof(z.oe) != 'undefined')
          {p[i++] = 'oe=' + esc(z.oe.value);}

          if (typeof(z.access) != 'undefined')
          {p[i++] = 'access=' + a;}
          if (custom != '')
          {p[i++] = 'proxycustom=' + '&lt;ADVANCED/&gt;';}
          if (p.length &gt; 0) {
          url = p[0];
          for (var j = 1; j &lt; p.length; j++) { url += "&amp;" + p[j]; }}
          location.href = target + '?' + url;
          }
          //
        </xsl:comment>
      </script>

      <xsl:call-template name="langHeadEnd"/>

      <body onload="setFocus()" dir="ltr" min-width="800px">
        <xsl:call-template name="analytics"/>

        <!-- *** Customer's own advanced search page header *** -->
        <xsl:if test="$choose_adv_search_page_header = 'mine' or
                    $choose_adv_search_page_header = 'both'">
          <xsl:call-template name="my_page_header"/>
        </xsl:if>

        <!--====Advanced Search Header======-->
        <xsl:if test="$choose_adv_search_page_header = 'provided' or
                    $choose_adv_search_page_header = 'both'">
          <xsl:call-template name="advanced_search_header"/>
        </xsl:if>

        <!--<xsl:call-template name="top_sep_bar">
          <xsl:with-param name="text" select="$sep_bar_adv_text"/>
          <xsl:with-param name="show_info" select="0"/>
          <xsl:with-param name="time" select="0"/>
        </xsl:call-template>-->
        <xsl:call-template name="result_stats">
          <xsl:with-param name="time" select="0"/>
        </xsl:call-template>


        <!--====Carry over Search Parameters======-->
        <form method="get" action="search" name="f">
          <xsl:if test="PARAM[@name='client']">
            <input type="hidden" name="client"
              value="{PARAM[@name='client']/@value}" />
          </xsl:if>
          <!--==== site is carried over in the drop down if the menu is used =====-->
          <xsl:if test="$search_collections_xslt = '' and PARAM[@name='site']">
            <input type="hidden" name="site" value="{PARAM[@name='site']/@value}"/>
          </xsl:if>
          <xsl:if test="PARAM[@name='output']">
            <input type="hidden" name="output"
              value="{PARAM[@name='output']/@value}" />
          </xsl:if>
          <xsl:if test="PARAM[@name='proxystylesheet']">
            <input type="hidden" name="proxystylesheet"
              value="{PARAM[@name='proxystylesheet']/@value}" />
          </xsl:if>
          <xsl:if test="PARAM[@name='ie']">
            <input type="hidden" name="ie"
              value="{PARAM[@name='ie']/@value}" />
          </xsl:if>
          <xsl:if test="PARAM[@name='oe']">
            <input type="hidden" name="oe"
              value="{PARAM[@name='oe']/@value}" />
          </xsl:if>
          <xsl:if test="PARAM[@name='hl']">
            <input type="hidden" name="hl"
              value="{PARAM[@name='hl']/@value}" />
          </xsl:if>
          <xsl:if test="PARAM[@name='getfields']">
            <input type="hidden" name="getfields"
              value="{PARAM[@name='getfields']/@value}" />
          </xsl:if>
          <xsl:if test="PARAM[@name='requiredfields']">
            <input type="hidden" name="requiredfields"
              value="{PARAM[@name='requiredfields']/@value}" />
          </xsl:if>
          <xsl:if test="PARAM[@name='partialfields']">
            <input type="hidden" name="partialfields"
              value="{PARAM[@name='partialfields']/@value}" />
          </xsl:if>

          <!--====Advanced Search Options======-->

          <table cellspacing="0" cellpadding="3" border="0" width="100%">
            <tr bgcolor="{$adv_search_panel_bgcolor}">
              <td>
                <table width="100%" cellspacing="0" cellpadding="0" border="0">
                  <tr bgcolor="{$adv_search_panel_bgcolor}">
                    <td>
                      <table width="100%" cellspacing="0" cellpadding="2"
                      border="0">
                        <tr>
                          <td valign="top" width="15%">
                            <font size="-1">
                              <br />
                              <b>Find results</b>
                            </font>
                          </td>

                          <td width="85%">
                            <table width="100%" cellpadding="2"
                            border="0" cellspacing="0">
                              <tr>
                                <td>
                                  <font size="-1">
                                    with <b>all</b> of the words
                                  </font>
                                </td>

                                <td>
                                  <xsl:text disable-output-escaping="yes">
                             &lt;input type=&quot;text&quot;
                             name=&quot;as_q&quot;
                             size=&quot;25&quot; value=&quot;</xsl:text>
                                  <xsl:value-of disable-output-escaping="yes"
                                   select="$html_escaped_as_q"/>
                                  <xsl:text disable-output-escaping="yes">&quot;&gt;</xsl:text>

                                  <script type="text/javascript">
                                    <xsl:comment>
                                      document.f.as_q.focus();
                                      //
                                    </xsl:comment>
                                  </script>
                                </td>

                                <td valign="top" rowspan="4">
                                  <font size="-1">
                                    <select name="num">
                                      <xsl:choose>
                                        <xsl:when test="PARAM[(@name='num') and (@value!='10')]">
                                          <option value="10">10 results</option>
                                        </xsl:when>
                                        <xsl:otherwise>
                                          <option value="10" selected="selected">10 results</option>
                                        </xsl:otherwise>
                                      </xsl:choose>
                                      <xsl:choose>
                                        <xsl:when test="PARAM[(@name='num') and (@value='20')]">
                                          <option value="20" selected="selected">20 results</option>
                                        </xsl:when>
                                        <xsl:otherwise>
                                          <option value="20">20 results</option>
                                        </xsl:otherwise>
                                      </xsl:choose>
                                      <xsl:choose>
                                        <xsl:when test="PARAM[(@name='num') and (@value='30')]">
                                          <option value="30" selected="selected">30 results</option>
                                        </xsl:when>
                                        <xsl:otherwise>
                                          <option value="30">30 results</option>
                                        </xsl:otherwise>
                                      </xsl:choose>
                                      <xsl:choose>
                                        <xsl:when test="PARAM[(@name='num') and (@value='50')]">
                                          <option value="50" selected="selected">50 results</option>
                                        </xsl:when>
                                        <xsl:otherwise>
                                          <option value="50">50 results</option>
                                        </xsl:otherwise>
                                      </xsl:choose>
                                      <xsl:choose>
                                        <xsl:when test="PARAM[(@name='num') and (@value='100')]">
                                          <option value="100" selected="selected">100 results</option>
                                        </xsl:when>
                                        <xsl:otherwise>
                                          <option value="100">100 results</option>
                                        </xsl:otherwise>
                                      </xsl:choose>
                                    </select>
                                  </font>
                                </td>
                                <xsl:call-template name="collection_menu"/>
                                <td>
                                  <font size="-1">
                                    <input type="submit" name="btnG"
                                      value="{$search_button_text}" />
                                  </font>
                                </td>
                              </tr>

                              <tr>
                                <td nowrap="nowrap">
                                  <font size="-1">
                                    with the <b>exact phrase</b>
                                  </font>
                                </td>

                                <td>
                                  <xsl:text disable-output-escaping="yes">

                             &lt;input type=&quot;text&quot;
                             name=&quot;as_epq&quot;
                             size=&quot;25&quot; value=&quot;</xsl:text>
                                  <xsl:value-of disable-output-escaping="yes"
                                   select="$html_escaped_as_epq"/>
                                  <xsl:text disable-output-escaping="yes">&quot;&gt;</xsl:text>
                                </td>
                              </tr>

                              <tr>
                                <td nowrap="nowrap">
                                  <font size="-1">
                                    with <b>at least one</b> of the words
                                  </font>
                                </td>

                                <td>
                                  <xsl:text disable-output-escaping="yes">

                             &lt;input type=&quot;text&quot;
                             name=&quot;as_oq&quot;
                             size=&quot;25&quot; value=&quot;</xsl:text>
                                  <xsl:value-of disable-output-escaping="yes"
                                   select="$html_escaped_as_oq"/>
                                  <xsl:text disable-output-escaping="yes">&quot;&gt;</xsl:text>
                                </td>
                              </tr>

                              <tr>
                                <td nowrap="nowrap">
                                  <font size="-1">
                                    <b>without</b> the words
                                  </font>
                                </td>

                                <td>
                                  <xsl:text disable-output-escaping="yes">

                             &lt;input type=&quot;text&quot;
                             name=&quot;as_eq&quot;
                             size=&quot;25&quot; value=&quot;</xsl:text>
                                  <xsl:value-of disable-output-escaping="yes"
                                   select="$html_escaped_as_eq"/>
                                  <xsl:text disable-output-escaping="yes">&quot;&gt;</xsl:text>
                                </td>
                              </tr>
                            </table>
                          </td>
                        </tr>
                      </table>
                    </td>
                  </tr>

                  <tr bgcolor="{$global_bg_color}">
                    <td>
                      <table width="100%" cellspacing="0"
                      cellpadding="2" border="0">
                        <tr>
                          <td width="15%">
                            <font size="-1">
                              <b>Language</b>
                            </font>
                          </td>

                          <td width="40%">
                            <font size="-1">Return pages written in</font>
                          </td>

                          <td>
                            <font size="-1">



                              <xsl:choose>
                                <xsl:when test="PARAM[(@name='oe') and (@value!='')]">
                                  <xsl:text disable-output-escaping="yes">&lt;select name=&quot;lr&quot;&gt;</xsl:text>
                                </xsl:when>
                                <xsl:otherwise>
                                  <xsl:text disable-output-escaping="yes">&lt;select name=&quot;lr&quot; onchange=&quot;javascript:collecturl('search', 'adv');&quot;&gt;</xsl:text>
                                </xsl:otherwise>
                              </xsl:choose>

                              <option value="">any language</option>

                              <xsl:choose>
                                <xsl:when test="PARAM[(@name='lr') and (@value='lang_ar')]">
                                  <option value="lang_ar"
                                    selected="selected">Arabic</option>
                                </xsl:when>
                                <xsl:otherwise>
                                  <option value="lang_ar">Arabic</option>
                                </xsl:otherwise>
                              </xsl:choose>

                              <xsl:choose>
                                <xsl:when test="PARAM[(@name='lr') and (@value='lang_zh-CN')]">
                                  <option value="lang_zh-CN"
                                    selected="selected">Chinese (Simplified)</option>
                                </xsl:when>
                                <xsl:otherwise>
                                  <option value="lang_zh-CN">Chinese (Simplified)</option>
                                </xsl:otherwise>
                              </xsl:choose>

                              <xsl:choose>
                                <xsl:when test="PARAM[(@name='lr') and (@value='lang_zh-TW')]">
                                  <option value="lang_zh-TW"
                                    selected="selected">Chinese (Traditional)</option>
                                </xsl:when>
                                <xsl:otherwise>
                                  <option value="lang_zh-TW">Chinese (Traditional)</option>
                                </xsl:otherwise>
                              </xsl:choose>

                              <xsl:choose>
                                <xsl:when test="PARAM[(@name='lr') and (@value='lang_cs')]">
                                  <option value="lang_cs" selected="selected">Czech</option>
                                </xsl:when>
                                <xsl:otherwise>
                                  <option value="lang_cs">Czech</option>
                                </xsl:otherwise>
                              </xsl:choose>

                              <xsl:choose>
                                <xsl:when test="PARAM[(@name='lr') and (@value='lang_da')]">
                                  <option value="lang_da" selected="selected">Danish</option>
                                </xsl:when>
                                <xsl:otherwise>
                                  <option value="lang_da">Danish</option>
                                </xsl:otherwise>
                              </xsl:choose>

                              <xsl:choose>
                                <xsl:when test="PARAM[(@name='lr') and (@value='lang_nl')]">
                                  <option value="lang_nl" selected="selected">Dutch</option>
                                </xsl:when>
                                <xsl:otherwise>
                                  <option value="lang_nl">Dutch</option>
                                </xsl:otherwise>
                              </xsl:choose>

                              <xsl:choose>
                                <xsl:when test="PARAM[(@name='lr') and (@value='lang_en')]">
                                  <option value="lang_en" selected="selected">English</option>
                                </xsl:when>
                                <xsl:otherwise>
                                  <option value="lang_en">English</option>
                                </xsl:otherwise>
                              </xsl:choose>

                              <xsl:choose>
                                <xsl:when test="PARAM[(@name='lr') and (@value='lang_et')]">
                                  <option value="lang_et" selected="selected">Estonian</option>
                                </xsl:when>
                                <xsl:otherwise>
                                  <option value="lang_et">Estonian</option>
                                </xsl:otherwise>
                              </xsl:choose>

                              <xsl:choose>
                                <xsl:when test="PARAM[(@name='lr') and (@value='lang_fi')]">
                                  <option value="lang_fi" selected="selected">Finnish</option>
                                </xsl:when>
                                <xsl:otherwise>
                                  <option value="lang_fi">Finnish</option>
                                </xsl:otherwise>
                              </xsl:choose>

                              <xsl:choose>
                                <xsl:when test="PARAM[(@name='lr') and (@value='lang_fr')]">
                                  <option value="lang_fr" selected="selected">French</option>
                                </xsl:when>
                                <xsl:otherwise>
                                  <option value="lang_fr">French</option>
                                </xsl:otherwise>
                              </xsl:choose>

                              <xsl:choose>
                                <xsl:when test="PARAM[(@name='lr') and (@value='lang_de')]">
                                  <option value="lang_de" selected="selected">German</option>
                                </xsl:when>
                                <xsl:otherwise>
                                  <option value="lang_de">German</option>
                                </xsl:otherwise>
                              </xsl:choose>

                              <xsl:choose>
                                <xsl:when test="PARAM[(@name='lr') and (@value='lang_el')]">
                                  <option value="lang_el" selected="selected">Greek</option>
                                </xsl:when>
                                <xsl:otherwise>
                                  <option value="lang_el">Greek</option>
                                </xsl:otherwise>
                              </xsl:choose>

                              <xsl:choose>
                                <xsl:when test="PARAM[(@name='lr') and (@value='lang_iw')]">
                                  <option value="lang_iw" selected="selected">Hebrew</option>
                                </xsl:when>
                                <xsl:otherwise>
                                  <option value="lang_iw">Hebrew</option>
                                </xsl:otherwise>
                              </xsl:choose>

                              <xsl:choose>
                                <xsl:when test="PARAM[(@name='lr') and (@value='lang_hu')]">
                                  <option value="lang_hu" selected="selected">Hungarian</option>
                                </xsl:when>
                                <xsl:otherwise>
                                  <option value="lang_hu">Hungarian</option>
                                </xsl:otherwise>
                              </xsl:choose>

                              <xsl:choose>
                                <xsl:when test="PARAM[(@name='lr') and (@value='lang_is')]">
                                  <option value="lang_is" selected="selected">Icelandic</option>
                                </xsl:when>
                                <xsl:otherwise>
                                  <option value="lang_is">Icelandic</option>
                                </xsl:otherwise>
                              </xsl:choose>

                              <xsl:choose>
                                <xsl:when test="PARAM[(@name='lr') and (@value='lang_it')]">
                                  <option value="lang_it" selected="selected">Italian</option>
                                </xsl:when>
                                <xsl:otherwise>
                                  <option value="lang_it">Italian</option>
                                </xsl:otherwise>
                              </xsl:choose>

                              <xsl:choose>
                                <xsl:when test="PARAM[(@name='lr') and (@value='lang_ja')]">
                                  <option value="lang_ja" selected="selected">Japanese</option>
                                </xsl:when>
                                <xsl:otherwise>
                                  <option value="lang_ja">Japanese</option>
                                </xsl:otherwise>
                              </xsl:choose>

                              <xsl:choose>
                                <xsl:when test="PARAM[(@name='lr') and (@value='lang_ko')]">
                                  <option value="lang_ko" selected="selected">Korean</option>
                                </xsl:when>
                                <xsl:otherwise>
                                  <option value="lang_ko">Korean</option>
                                </xsl:otherwise>
                              </xsl:choose>

                              <xsl:choose>
                                <xsl:when test="PARAM[(@name='lr') and (@value='lang_lv')]">
                                  <option value="lang_lv" selected="selected">Latvian</option>
                                </xsl:when>
                                <xsl:otherwise>
                                  <option value="lang_lv">Latvian</option>
                                </xsl:otherwise>
                              </xsl:choose>

                              <xsl:choose>
                                <xsl:when test="PARAM[(@name='lr') and (@value='lang_lt')]">
                                  <option value="lang_lt" selected="selected">Lithuanian</option>
                                </xsl:when>
                                <xsl:otherwise>
                                  <option value="lang_lt">Lithuanian</option>
                                </xsl:otherwise>
                              </xsl:choose>

                              <xsl:choose>
                                <xsl:when test="PARAM[(@name='lr') and (@value='lang_no')]">
                                  <option value="lang_no" selected="selected">Norwegian</option>
                                </xsl:when>
                                <xsl:otherwise>
                                  <option value="lang_no">Norwegian</option>
                                </xsl:otherwise>
                              </xsl:choose>

                              <xsl:choose>
                                <xsl:when test="PARAM[(@name='lr') and (@value='lang_pl')]">
                                  <option value="lang_pl" selected="selected">Polish</option>
                                </xsl:when>
                                <xsl:otherwise>
                                  <option value="lang_pl">Polish</option>
                                </xsl:otherwise>
                              </xsl:choose>

                              <xsl:choose>
                                <xsl:when test="PARAM[(@name='lr') and (@value='lang_pt')]">
                                  <option value="lang_pt" selected="selected">Portuguese</option>
                                </xsl:when>
                                <xsl:otherwise>
                                  <option value="lang_pt">Portuguese</option>
                                </xsl:otherwise>
                              </xsl:choose>

                              <xsl:choose>
                                <xsl:when test="PARAM[(@name='lr') and (@value='lang_ro')]">
                                  <option value="lang_ro" selected="selected">Romanian</option>
                                </xsl:when>
                                <xsl:otherwise>
                                  <option value="lang_ro">Romanian</option>
                                </xsl:otherwise>
                              </xsl:choose>

                              <xsl:choose>
                                <xsl:when test="PARAM[(@name='lr') and (@value='lang_ru')]">
                                  <option value="lang_ru" selected="selected">Russian</option>
                                </xsl:when>
                                <xsl:otherwise>
                                  <option value="lang_ru">Russian</option>
                                </xsl:otherwise>
                              </xsl:choose>

                              <xsl:choose>
                                <xsl:when test="PARAM[(@name='lr') and (@value='lang_es')]">
                                  <option value="lang_es" selected="selected">Spanish</option>
                                </xsl:when>
                                <xsl:otherwise>
                                  <option value="lang_es">Spanish</option>
                                </xsl:otherwise>
                              </xsl:choose>

                              <xsl:choose>
                                <xsl:when test="PARAM[(@name='lr') and (@value='lang_sv')]">
                                  <option value="lang_sv" selected="selected">Swedish</option>
                                </xsl:when>
                                <xsl:otherwise>
                                  <option value="lang_sv">Swedish</option>
                                </xsl:otherwise>
                              </xsl:choose>
                              <xsl:text disable-output-escaping="yes">&lt;/select&gt;</xsl:text>
                            </font>
                          </td>
                        </tr>
                      </table>
                    </td>
                  </tr>

                  <tr bgcolor="{$global_bg_color}">
                    <td>
                      <table width="100%" cellpadding="2"
                      cellspacing="0" border="0">
                        <tr>
                          <td width="15%">
                            <font size="-1">
                              <b>File Format</b>
                            </font>
                          </td>

                          <td width="40%" nowrap="nowrap">
                            <font size="-1">
                              <select name="as_ft">
                                <xsl:choose>
                                  <xsl:when test="PARAM[(@name='as_ft') and (@value='i')]">
                                    <option value="i" selected="selected">Only</option>
                                  </xsl:when>
                                  <xsl:otherwise>
                                    <option value="i">Only</option>
                                  </xsl:otherwise>
                                </xsl:choose>
                                <xsl:choose>
                                  <xsl:when test="PARAM[(@name='as_ft') and (@value='e')]">
                                    <option value="e" selected="selected">Don't</option>
                                  </xsl:when>
                                  <xsl:otherwise>
                                    <option value="e">Don't</option>
                                  </xsl:otherwise>
                                </xsl:choose>
                              </select>return results of the file format
                            </font>
                          </td>

                          <td>
                            <font size="-1">
                              <select name="as_filetype">
                                <xsl:choose>
                                  <xsl:when test="PARAM[(@name='as_filetype') and (@value!='')]">
                                    <option value="">any format</option>
                                  </xsl:when>
                                  <xsl:otherwise>
                                    <option value="" selected="selected">any format</option>
                                  </xsl:otherwise>
                                </xsl:choose>
                                <xsl:choose>
                                  <xsl:when test="PARAM[(@name='as_filetype') and (@value='pdf')]">
                                    <option value="pdf" selected="selected">Adobe Acrobat PDF (.pdf)</option>
                                  </xsl:when>
                                  <xsl:otherwise>
                                    <option value="pdf">Adobe Acrobat PDF (.pdf)</option>
                                  </xsl:otherwise>
                                </xsl:choose>
                                <xsl:choose>
                                  <xsl:when test="PARAM[(@name='as_filetype') and (@value='ps')]">
                                    <option value="ps" selected="selected">Adobe Postscript (.ps)</option>
                                  </xsl:when>
                                  <xsl:otherwise>
                                    <option value="ps">Adobe Postscript (.ps)</option>
                                  </xsl:otherwise>
                                </xsl:choose>
                                <xsl:choose>
                                  <xsl:when test="PARAM[(@name='as_filetype') and (@value='doc')]">
                                    <option value="doc" selected="selected">Microsoft Word (.doc)</option>
                                  </xsl:when>
                                  <xsl:otherwise>
                                    <option value="doc">Microsoft Word (.doc)</option>
                                  </xsl:otherwise>
                                </xsl:choose>
                                <xsl:choose>
                                  <xsl:when test="PARAM[(@name='as_filetype') and (@value='xls')]">
                                    <option value="xls" selected="selected">Microsoft Excel (.xls)</option>
                                  </xsl:when>
                                  <xsl:otherwise>
                                    <option value="xls">Microsoft Excel (.xls)</option>
                                  </xsl:otherwise>
                                </xsl:choose>
                                <xsl:choose>
                                  <xsl:when test="PARAM[(@name='as_filetype') and (@value='ppt')]">
                                    <option value="ppt" selected="selected">Microsoft Powerpoint (.ppt)</option>
                                  </xsl:when>
                                  <xsl:otherwise>
                                    <option value="ppt">Microsoft Powerpoint (.ppt)</option>
                                  </xsl:otherwise>
                                </xsl:choose>
                                <xsl:choose>
                                  <xsl:when test="PARAM[(@name='as_filetype') and (@value='rtf')]">
                                    <option value="rtf" selected="selected">Rich Text Format (.rtf)</option>
                                  </xsl:when>
                                  <xsl:otherwise>
                                    <option value="rtf">Rich Text Format (.rtf)</option>
                                  </xsl:otherwise>
                                </xsl:choose>
                              </select>
                            </font>
                          </td>
                        </tr>
                      </table>
                    </td>
                  </tr>

                  <tr bgcolor="{$global_bg_color}">
                    <td>
                      <table width="100%" cellspacing="0"
                      cellpadding="2" border="0">
                        <tr>
                          <td width="15%">
                            <font size="-1">
                              <b>Occurrences</b>
                            </font>
                          </td>

                          <td nowrap="nowrap" width="40%">
                            <font size="-1">Return results where my terms occur</font>
                          </td>

                          <td>
                            <font size="-1">
                              <select
          name="as_occt">
                                <xsl:choose>
                                  <xsl:when test="PARAM[(@name='as_occt') and (@value!='any')]">
                                    <option value="any"> anywhere in the page </option>
                                  </xsl:when>
                                  <xsl:otherwise>
                                    <option value="any" selected="selected">
                                      anywhere in the page
                                    </option>
                                  </xsl:otherwise>
                                </xsl:choose>
                                <xsl:choose>
                                  <xsl:when test="PARAM[(@name='as_occt') and (@value='title')]">
                                    <option value="title" selected="selected">in the title of the page</option>
                                  </xsl:when>
                                  <xsl:otherwise>
                                    <option value="title">in the title of the page</option>
                                  </xsl:otherwise>
                                </xsl:choose>
                                <xsl:choose>
                                  <xsl:when test="PARAM[(@name='as_occt') and (@value='url')]">
                                    <option value="url" selected="selected">in the URL of the page</option>
                                  </xsl:when>
                                  <xsl:otherwise>
                                    <option value="url">in the URL of the page</option>
                                  </xsl:otherwise>
                                </xsl:choose>
                              </select>
                            </font>
                          </td>
                        </tr>
                      </table>
                    </td>
                  </tr>

                  <tr bgcolor="{$global_bg_color}">
                    <td>
                      <table width="100%" cellpadding="2"
                      cellspacing="0" border="0">
                        <tr>
                          <td width="15%">
                            <font size="-1">
                              <b>Domain</b>
                            </font>
                          </td>

                          <td width="40%" nowrap="nowrap">
                            <font size="-1">
                              <select
                      name="as_dt">
                                <xsl:choose>
                                  <xsl:when test="PARAM[(@name='as_dt') and (@value='i')]">
                                    <option value="i" selected="selected">Only</option>
                                  </xsl:when>
                                  <xsl:otherwise>
                                    <option value="i">Only</option>
                                  </xsl:otherwise>
                                </xsl:choose>
                                <xsl:choose>
                                  <xsl:when test="PARAM[(@name='as_dt') and (@value='e')]">
                                    <option value="e" selected="selected">Don't</option>
                                  </xsl:when>
                                  <xsl:otherwise>
                                    <option value="e">Don't</option>
                                  </xsl:otherwise>
                                </xsl:choose>
                              </select>return results from the site or domain
                            </font>
                          </td>

                          <td>
                            <table cellpadding="0" cellspacing="0"
                            border="0">
                              <tr>
                                <td>
                                  <xsl:choose>
                                    <xsl:when test="PARAM[@name='as_sitesearch']">
                                      <input type="text" size="25"
                                      value="{PARAM[@name='as_sitesearch']/@value}"
                                      name="as_sitesearch" />
                                    </xsl:when>
                                    <xsl:otherwise>
                                      <input type="text" size="25" value="" name="as_sitesearch" />
                                    </xsl:otherwise>
                                  </xsl:choose>
                                </td>
                              </tr>

                              <tr>
                                <td valign="top" nowrap="nowrap">
                                  <font size="-1">
                                    <i>e.g. google.com, .org</i>
                                  </font>
                                </td>
                              </tr>
                            </table>
                          </td>
                        </tr>

                        <!-- Sort by Date feature -->
                        <tr>
                          <td width="15%">
                            <font size="-1">
                              <b>Sort</b>
                            </font>
                          </td>

                          <td colspan="2" nowrap="nowrap">
                            <font size="-1">
                              <select
                      name="sort">
                                <xsl:choose>
                                  <xsl:when test="PARAM[(@name='sort') and (@value='')]">
                                    <option value="" selected="selected">Sort by relevance</option>
                                  </xsl:when>
                                  <xsl:otherwise>
                                    <option value="">Sort by relevance</option>
                                  </xsl:otherwise>
                                </xsl:choose>
                                <xsl:choose>
                                  <xsl:when test="PARAM[(@name='sort') and (@value='date:D:S:d1')]">
                                    <option value="date:D:S:d1" selected="selected">Sort by date</option>
                                  </xsl:when>
                                  <xsl:otherwise>
                                    <option value="date:D:S:d1">Sort by date</option>
                                  </xsl:otherwise>
                                </xsl:choose>
                              </select>
                            </font>
                          </td>
                        </tr>
                        <!-- Secure Search feature -->
                        <xsl:if test="$show_secure_radio != '0'">

                          <tr>
                            <td width="15%">
                              <font size="-1">
                                <b>Security</b>
                              </font>
                            </td>

                            <td colspan="2" nowrap="nowrap">
                              <font size="-1">
                                <xsl:choose>
                                  <xsl:when test="$access='p'">
                                    <label>
                                      <input type="radio" name="access" value="p" checked="checked" />Search public content only
                                    </label>
                                  </xsl:when>
                                  <xsl:otherwise>
                                    <label>
                                      <input type="radio" name="access" value="p"/>Search public content only
                                    </label>
                                  </xsl:otherwise>
                                </xsl:choose>
                                <xsl:choose>
                                  <xsl:when test="$access='a'">
                                    <label>
                                      <input type="radio" name="access" value="a" checked="checked" />Search public and secure content (login required)
                                    </label>
                                  </xsl:when>
                                  <xsl:otherwise>
                                    <label>
                                      <input type="radio" name="access" value="a"/>Search public and secure content (login required)
                                    </label>
                                  </xsl:otherwise>
                                </xsl:choose>
                              </font>
                            </td>
                          </tr>
                        </xsl:if>
                      </table>
                    </td>
                  </tr>

                </table>
              </td>
            </tr>
          </table>
          <br />
          <br />

          <!--====Page-Specific Search======-->
          <table cellpadding="6" cellspacing="0" border="0">
            <tr>
              <td>
                <b>Page-Specific Search</b>
              </td>
            </tr>
          </table>

          <table cellspacing="0" cellpadding="3" border="0" width="100%">
            <tr bgcolor="{$adv_search_panel_bgcolor}">
              <td>
                <table width="100%" cellpadding="0" cellspacing="0"
                border="0">
                  <tr bgcolor="{$adv_search_panel_bgcolor}">
                    <td>

                      <table width="100%" cellpadding="2"
                      cellspacing="0" border="0">
                        <form method="get" action="search" name="h">

                          <tr bgcolor="{$global_bg_color}">
                            <td width="15%">
                              <font size="-1">
                                <b>Links</b>
                              </font>
                            </td>

                            <td width="40%" nowrap="nowrap">
                              <font size="-1">Find pages that link to the page</font>
                            </td>

                            <td nowrap="nowrap">
                              <xsl:choose>
                                <xsl:when test="PARAM[@name='as_lq']">
                                  <input type="text" size="30"
                                   value="{PARAM[@name='as_lq']/@value}"
                                           name="as_lq" />
                                </xsl:when>
                                <xsl:otherwise>
                                  <input type="text" size="30" value="" name="as_lq" />
                                </xsl:otherwise>
                              </xsl:choose>
                              <font size="-1">
                                <input type="submit" name="btnG" value="{$search_button_text}" />
                              </font>
                            </td>
                          </tr>
                        </form>
                      </table>
                    </td>
                  </tr>
                </table>
              </td>
            </tr>
          </table>

          <xsl:call-template name="copyright"/>

        </form>

        <!-- *** Customer's own advanced search page footer *** -->
        <xsl:call-template name="my_page_footer"/>

      </body>
    </html>
  </xsl:template>

  <!-- **********************************************************************
Resend query with filter=p to disable path_filtering
if there is only one result cluster (do not customize)
     ********************************************************************** -->
  <xsl:template name="redirect_if_few_results">
    <xsl:variable name="count" select="count(/GSP/RES/R)"/>
    <xsl:variable name="start" select="/GSP/RES/@SN"/>
    <xsl:variable name="filterall"
      select="count(/GSP/PARAM[@name='filter']) = 0"/>
    <xsl:variable name="filter" select="/GSP/PARAM[@name='filter']/@value"/>

  </xsl:template>

  <!-- **********************************************************************
Search results (do not customize)
     ********************************************************************** -->
  <xsl:template name="search_results">
    <xsl:call-template name="doc_type"/>
    <html>

      <!-- *** HTML header and style *** -->
      <xsl:call-template name="langHeadStart"/>
      <xsl:call-template name="redirect_if_few_results"/>
      <title>
        <xsl:value-of select="$result_page_title"/>:
        <xsl:value-of select="$space_normalized_query"/>
      </title>
      <xsl:call-template name="style2"/>
      <script type="text/javascript">
        <xsl:comment>
          function resetForms() {
          for (var i = 0; i &lt; document.forms.length; i++ ) {
          document.forms[i].reset();
          }
          }
          //
          function displayNoRes() {
          //if (!isLeftResultPresent()) {
          document.getElementById('no-results').style.display = '';
          //}
          }
          /**
          * Checks if the organic results on the left side are present or not.
          */
          function isLeftResultPresent() {
          var leftResContainer = document.getElementById(
          LEFT_SIDE_RES_CONTAINER).getElementsByClassName('left-side-container')[0];
          return leftResContainer.childNodes.length != 0 ? true : false;
          }

          var DICTIONARY_CONTAINER = 'dictionary-container';
          var DICTIONARY_TERM = 'dictionary-term';
          var DICTIONARY_DEFINITION = 'dictionary-definition';

          /** USING JSONP **/
          function readJson(data) {
          var allTerms = data.GuruDictionary;
          var numTerms = 0;
          for(var td in allTerms) {
          if(allTerms.hasOwnProperty(td)){
          numTerms++;
          }
          }

          for(i = 0; i &lt; numTerms; i++) {
          var termdef = allTerms[i];
          var term = termdef.term;
          if(term.toLowerCase() == &quot;<xsl:value-of select="$space_normalized_query"/>&quot;.toLowerCase())  {
          var definition = termdef.definition;
          document.getElementById(DICTIONARY_CONTAINER).style.display = '';
          document.getElementById(DICTIONARY_TERM).innerHTML = term;
          document.getElementById(DICTIONARY_DEFINITION).innerHTML = definition;
          document.getElementById(DICTIONARY_TERM).style.display = '';
          document.getElementById(DICTIONARY_DEFINITION).style.display = '';
          }
          }
          }

          var script = document.createElement('script');
          script.src = 'https://guru.mi.corp.rockfin.com/dictionary/GuruDictionary.json';

          document.getElementsByTagName('head')[0].appendChild(script);

          window.onload = readJson(script);

          function readProductupJson(data)  {
          var updateList = data.ProductUpdates;
          var index = 0;
          var count = 0;
          while(count &lt; 5)  {
          var update = updateList[index];
          if(update.product != "Charles Schwab")  {
          var newUpdate = document.createElement("div");
          newUpdate.className = "sb-l-res";
          var dateNode = document.createTextNode(update.date + " ");
          newUpdate.appendChild(dateNode);
          var linkElement = document.createElement("a");
          linkElement.href = update.link;
          linkElement.innerHTML = update.info;
          newUpdate.appendChild(linkElement);
          var container = document.getElementById("productup-body");
          container.appendChild(newUpdate);
          count++;
          }
          index++;
          }
          }

          var productupScript = document.createElement('script');
          productupScript.src = 'http://ij8.github.io/Tests/ProductUpdateTest/productupdates.json';

          document.getElementsByTagName('head')[0].appendChild(productupScript);

          window.onload = readProductupJson(productupScript);

        </xsl:comment>
      </script>
      <xsl:call-template name="langHeadEnd"/>

      <xsl:choose>
        <xsl:when test="$show_res_clusters = '1'">
          <script language='javascript' src='common.js'></script>
          <script language='javascript' src='xmlhttp.js'></script>
          <script language='javascript' src='uri.js'></script>
          <script language='javascript' src='cluster.js'></script>

          <body onLoad="resetForms(); cs_loadClusters('{$search_url_escaped}', cs_drawClusters);" dir="ltr" min-width="800px">
            <xsl:call-template name="search_results_body"/>
          </body>
        </xsl:when>
        <xsl:otherwise>
          <body onLoad="resetForms()" dir="ltr" minwidth="800px">
            <xsl:call-template name="search_results_body"/>
          </body>
        </xsl:otherwise>
      </xsl:choose>

    </html>
  </xsl:template>

  <xsl:template name="search_results_body">
    <xsl:call-template name="analytics"/>

    <!-- *** Customer's own result page header *** -->
    <xsl:if test="$choose_result_page_header = 'mine' or
                $choose_result_page_header = 'both'">
      <xsl:call-template name="my_page_header"/>
    </xsl:if>

    <!-- *** Result page header *** -->
    <xsl:if test="$choose_result_page_header = 'provided' or
                $choose_result_page_header = 'both'">
      <xsl:call-template name="result_page_header" />
    </xsl:if>

    <!-- *** Top separation bar *** -->
    <xsl:if test="Q != ''">
      <xsl:call-template name="result_stats">
        <xsl:with-param name="time" select="TM"/>
      </xsl:call-template>
    </xsl:if>

    <!-- *** Handle results (if any) *** -->
    <xsl:choose>
      <xsl:when test="$show_sidebar = '1'">
        <xsl:call-template name="results">
          <xsl:with-param name="query" select="Q"/>
          <xsl:with-param name="time" select="TM"/>
        </xsl:call-template>

        <!-- Generates the no results message container. Display this container
             when there are no results on both left side organic results
             container and sidebar. -->
        <div id="no-results" style="display: none;">
          <xsl:call-template name="no_RES">
            <xsl:with-param name="query" select="Q"/>
          </xsl:call-template>
        </div>
      </xsl:when>
      <xsl:when test="RES or GM or Spelling or Synonyms or CT or /GSP/ENTOBRESULTS">
        <xsl:call-template name="results">
          <xsl:with-param name="query" select="Q"/>
          <xsl:with-param name="time" select="TM"/>
        </xsl:call-template>
      </xsl:when>
      <xsl:when test="Q=''">
      </xsl:when>
      <xsl:otherwise>
        <xsl:call-template name="results">
          <xsl:with-param name="query" select="Q"/>
          <xsl:with-param name="time" select="TM"/>
        </xsl:call-template>
        <script type="text/javascript">
          displayNoRes();
        </script>
      </xsl:otherwise>
    </xsl:choose>

    <div style="float:left; width:100%">
      <!-- *** Google footer *** -->
      <xsl:call-template name="copyright"/>

      <!-- *** Customer's own result page footer *** -->
      <xsl:call-template name="my_page_footer"/>
    </div>

    <!-- *** HTML footer *** -->
  </xsl:template>


  <!-- **********************************************************************
  Collection menu beside the search box
     ********************************************************************** -->
  <xsl:template name="collection_menu">
    <xsl:if test="$search_collections_xslt != ''">
      <td valign="middle">

        <select name="site">
          <xsl:choose>
            <xsl:when test="PARAM[(@name='site') and (@value='All')]">
              <option value="All" selected="selected">All</option>
            </xsl:when>
            <xsl:otherwise>
              <option value="All">All</option>
            </xsl:otherwise>
          </xsl:choose>
          <xsl:choose>
            <xsl:when test="PARAM[(@name='site') and (@value='Agency')]">
              <option value="Agency" selected="selected">Agency</option>
            </xsl:when>
            <xsl:otherwise>
              <option value="Agency">Agency</option>
            </xsl:otherwise>
          </xsl:choose>
          <xsl:choose>
            <xsl:when test="PARAM[(@name='site') and (@value='FHA')]">
              <option value="FHA" selected="selected">FHA</option>
            </xsl:when>
            <xsl:otherwise>
              <option value="FHA">FHA</option>
            </xsl:otherwise>
          </xsl:choose>
          <xsl:choose>
            <xsl:when test="PARAM[(@name='site') and (@value='FICOFHA')]">
              <option value="FICOFHA" selected="selected">FHA-FICO</option>
            </xsl:when>
            <xsl:otherwise>
              <option value="FICOFHA">FHA-FICO</option>
            </xsl:otherwise>
          </xsl:choose>
          <xsl:choose>
            <xsl:when test="PARAM[(@name='site') and (@value='Jumbo')]">
              <option value="Jumbo" selected="selected">Jumbo</option>
            </xsl:when>
            <xsl:otherwise>
              <option value="Jumbo">Jumbo</option>
            </xsl:otherwise>
          </xsl:choose>
          <xsl:choose>
            <xsl:when test="PARAM[(@name='site') and (@value='Purchase')]">
              <option value="Purchase" selected="selected">Purchase</option>
            </xsl:when>
            <xsl:otherwise>
              <option value="Purchase">Purchase</option>
            </xsl:otherwise>
          </xsl:choose>
          <xsl:choose>
            <xsl:when test="PARAM[(@name='site') and (@value='VA')]">
              <option value="VA" selected="selected">VA</option>
            </xsl:when>
            <xsl:otherwise>
              <option value="VA">VA</option>
            </xsl:otherwise>
          </xsl:choose>
        </select>

      </td>
    </xsl:if>
  </xsl:template>

  <!-- **********************************************************************
  Search box input form (Types: std_top, std_bottom, home, swr)
     ********************************************************************** -->
  <xsl:template name="search_box">
    <xsl:param name="type"/>
    <link rel="stylesheet"
     href="//maxcdn.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css"
     type="text/css">
    </link>
    <link href="//netdna.bootstrapcdn.com/font-awesome/3.2.1/css/font-awesome.css" rel="stylesheet" type="text/css">
    </link>
    <form name="gs" method="GET" action="search" style="margin-bottom: 0em;">
      <xsl:choose>
        <xsl:when test="($type = 'std_top')">
          <xsl:text disable-output-escaping="yes">&lt;div id="search-row-top"&gt;</xsl:text>
        </xsl:when>
        <xsl:otherwise>
          <xsl:text disable-output-escaping="yes">&lt;div id="search-row"&gt;</xsl:text>
        </xsl:otherwise>
      </xsl:choose>
      <xsl:if test="($egds_show_search_tabs != '0') and (($type = 'home') or ($type = 'std_top'))">
        <div>
          <xsl:call-template name="desktop_tab"/>
        </div>
      </xsl:if>
      <xsl:if test="($type = 'swr')">
        <div>
          <p>
            There were about <b>
              <xsl:value-of select="RES/M"/>
            </b> results for <b>
              <xsl:value-of select="$space_normalized_query"/>
            </b>.
            <br/>
            Use the search box below to search within these results.
          </p>
        </div>
      </xsl:if>
      <div style="display:block;">
        <div>
          <div class="pull-left">
            <xsl:choose>
              <xsl:when test="($type = 'swr')">
                <input type="text" name="as_q" size="{$search_box_size}" maxlength="256" value=""/>
                <input type="hidden" name="q" value="{$qval}"/>
              </xsl:when>
              <xsl:otherwise>
                <table style="margin-top: 8px" cellpadding="0" cellspacing="0" border="0">
                  <tr>
                    <td>
                      <input id="top-search-box" type="text" name="q" size="{$search_box_size}" maxlength="256" value="{$space_normalized_query}" autocomplete="on" onkeyup="ss_handleKey(event)"/>
                    </td>
                    <td>
                      <button class="search-btn" type="submit">
                        <i class="icon-search"></i>
                      </button>
                    </td>
                  </tr>
                  <tr>
                    <td>
                      <table cellpadding="0" cellspacing="0" class="ss-gac-m" style="width: 365px; visibility: hidden;" id="search_suggest"></table>
                    </td>
                  </tr>
                </table>
              </xsl:otherwise>
            </xsl:choose>
          </div>

          <div class="pull-right" style="height:50px;">
            <xsl:if test="(/GSP/RES/M > 0) and ($show_swr_link != '0') and ($type = 'std_bottom')">
              <xsl:call-template name="nbsp"/>
              <xsl:call-template name="nbsp"/>
              <a href="{$swr_search_url}">
                <xsl:value-of select="$swr_search_anchor_text"/>
              </a>
              <br/>
            </xsl:if>
            <xsl:if test="$show_result_page_adv_link != '0'">
              <xsl:call-template name="nbsp"/>
              <xsl:call-template name="nbsp"/>
              <a href="{$adv_search_url}">
                <xsl:value-of select="$adv_search_anchor_text"/>
              </a>
              <br/>
            </xsl:if>
            <xsl:if test="$show_alerts_link != '0'">
              <xsl:call-template name="nbsp"/>
              <xsl:call-template name="nbsp"/>
              <a href="{$alerts_url}">
                <xsl:value-of select="$alerts_anchor_text"/>
              </a>
              <br/>
            </xsl:if>
            <xsl:if test="$show_result_page_help_link != '0'">
              <xsl:call-template name="nbsp"/>
              <xsl:call-template name="nbsp"/>
              <a href="{$help_url}">
                <xsl:value-of select="$search_help_anchor_text"/>
              </a>
            </xsl:if>
            <br/>
          </div>
        </div>
        <xsl:if test="$show_secure_radio != '0'">
          <input type="hidden" name="access" value="a"></input>
        </xsl:if>
      </div>
      <input type="hidden" name="site" value="{PARAM[@name='site']/@value}"/>
      <xsl:text disable-output-escaping="yes">&lt;/div&gt;</xsl:text>
      <xsl:call-template name="form_params"/>
    </form>
  </xsl:template>


  <!-- **********************************************************************
  Bottom search box (do not customized)
     ********************************************************************** -->
  <xsl:template name="bottom_search_box">
    <br clear="all"/>
    <br/>

    <!--<div class="bottom-search-box" style="display: inline-block;">
      <table width="100%" height="100%" border="0" cellpadding="0" cellspacing="0">
        <tr>
          <table class="left-spacing" style="width: 25%; height: 100%; max-width: 388px; min-width: 240px;"/>
          <td>
            <xsl:call-template name="search_box">
              <xsl:with-param name="type" select="'std_bottom'"/>
            </xsl:call-template>
          </td>
        </tr>
      </table>
    </div>-->
    <span class="bottom-search-box" style="display:inline-block; min-width:800px;">
      <div class="left-spacing" style="float:left; max-width: 388px; min-width: 240px; width: 25%; height:100%"></div>
      <div class="pull-left" style="width:500px; display:inline-block; height: 70px; vertical-align:center;">
        <xsl:call-template name="search_box">
          <xsl:with-param name="type" select="'std_bottom'"/>
        </xsl:call-template>
      </div>
    </span>
  </xsl:template>


  <!-- **********************************************************************
Sort-by criteria: sort by date/relevance
     ********************************************************************** -->
  <xsl:template name="sort_by">
    <xsl:variable name="sort_by_url">
      <xsl:for-each
    select="/GSP/PARAM[(@name != 'sort') and
                       (@name != 'start') and
                       (@name != 'epoch' or $is_test_search != '') and
                       not(starts-with(@name, 'metabased_'))]">
        <xsl:value-of select="@name"/>
        <xsl:text>=</xsl:text>
        <xsl:value-of select="@original_value"/>
        <xsl:if test="position() != last()">
          <xsl:text disable-output-escaping="yes">&amp;</xsl:text>
        </xsl:if>
      </xsl:for-each>
    </xsl:variable>

    <xsl:variable name="sort_by_relevance_url">
      <xsl:value-of select="$sort_by_url"
      />&amp;sort=date%3AD%3AL%3Ad1
    </xsl:variable>

    <xsl:variable name="sort_by_date_url">
      <xsl:value-of select="$sort_by_url"
      />&amp;sort=date%3AD%3AS%3Ad1
    </xsl:variable>

    <table>
      <tr valign='top'>
        <td>
          <span class="s">
            <xsl:choose>
              <xsl:when test="/GSP/PARAM[@name = 'sort' and starts-with(@value,'date:D:S')]">
                <font color="{$global_text_color}">
                  <xsl:text>Sort by date / </xsl:text>
                </font>
                <a href="search?{$sort_by_relevance_url}">Sort by relevance</a>
              </xsl:when>
              <xsl:when test="/GSP/PARAM[@name = 'sort' and starts-with(@value,'date:A:S')]">
                <font color="{$global_text_color}">
                  <xsl:text>Sort by date / </xsl:text>
                </font>
                <a href="search?{$sort_by_relevance_url}">Sort by relevance</a>
              </xsl:when>
              <xsl:otherwise>
                <a href="search?{$sort_by_date_url}">Sort by date</a>
                <font color="{$global_text_color}">
                  <xsl:text> / Sort by relevance</xsl:text>
                </font>
              </xsl:otherwise>
            </xsl:choose>
          </span>
        </td>
      </tr>
    </table>
  </xsl:template>

  <!-- **********************************************************************
Output all results
     ********************************************************************** -->
  <xsl:template name="results">
    <xsl:param name="query"/>
    <xsl:param name="time"/>

    <link rel="stylesheet"
 href="//maxcdn.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css"
 type="text/css">
    </link>
    <link href="//netdna.bootstrapcdn.com/font-awesome/3.2.1/css/font-awesome.css" rel="stylesheet" type="text/css">
    </link>

    <!-- *** Add top navigation/sort-by bar *** -->
    <xsl:if test="($show_top_navigation != '0') or ($show_sort_by != '0')">
      <xsl:if test="RES">
        <!-- there might be onebox results but no RES  -->
        <table width="100%">
          <tr>
            <xsl:if test="$show_top_navigation != '0'">
              <td align="left">
                <xsl:call-template name="google_navigation">
                  <xsl:with-param name="prev" select="RES/NB/PU"/>
                  <xsl:with-param name="next" select="RES/NB/NU"/>
                  <xsl:with-param name="view_begin" select="RES/@SN"/>
                  <xsl:with-param name="view_end" select="RES/@EN"/>
                  <xsl:with-param name="guess" select="RES/M"/>
                  <xsl:with-param name="navigation_style" select="'top'"/>
                </xsl:call-template>
              </td>
            </xsl:if>
            <xsl:if test="$show_sort_by != '0'">
              <td align="right">
                <xsl:call-template name="sort_by"/>
              </td>
            </xsl:if>
          </tr>
        </table>
      </xsl:if>
    </xsl:if>

    <!-- *** The widths of the main containers (left-side-container and sidebar-container)
        depend on the presence of the sidebar-l-container *** -->
    <div style="max-width:1550px">
      <div id="are_there_results" style="display: none;">No</div>
      <table cellpadding="0" cellspacing="0" width="100%" style="min-width: 800px;">
        <tr>
          <!-- *** CONDITIONAL FORMATTING PARTY FOR LEFT SIDEBAR *** -->
          <xsl:if test="$show_sidebar_l = '1'">
            <td id="sidebar-l-container" width="25%" max-width="300px" min-width="200px" valign="top">
              <div id="sidebar_l">

                <!-- Product Updates -->
                <xsl:if test="$show_productup='1'">
                  <xsl:call-template name="productup_sidebar"/>
                </xsl:if>

                <!-- Helpful Links -->
                <xsl:if test="$show_helplinks='1'">
                  <xsl:call-template name="helplinks_sidebar"/>
                </xsl:if>

                <!-- *** Collection Filter *** -->
                <xsl:if test="$show_collection_filters='1'">
                  <xsl:call-template name="collection_sidebar"/>
                </xsl:if>
              </div>
            </td>
          </xsl:if>

          <!-- Display organic results on the left side. -->
          <!-- *** CONDITIONAL FORMATTING PARTY FOR RESULTS *** -->
          <xsl:if test="$show_sidebar_l = '0' and $show_sidebar = '0'">
            <xsl:text disable-output-escaping="yes">&lt;td id=&quot;left-side-container&quot; width=&quot;100%&quot; valign=&quot;top&quot; style=&quot;max-width:525px&quot;&gt;</xsl:text>
          </xsl:if>
          <xsl:if test="$show_sidebar_l = '0' and $show_sidebar = '1'">
            <xsl:text disable-output-escaping="yes">&lt;td id=&quot;left-side-container&quot; width=&quot;35%&quot; valign=&quot;top&quot;&gt;</xsl:text>
          </xsl:if>
          <xsl:if test="$show_sidebar_l = '1' and $show_sidebar = '0'">
            <xsl:text disable-output-escaping="yes">&lt;td id=&quot;left-side-container&quot; width=&quot;75%&quot; valign=&quot;top&quot;&gt;</xsl:text>
          </xsl:if>
          <xsl:if test="$show_sidebar_l = '1' and $show_sidebar = '1'">
            <xsl:text disable-output-escaping="yes">&lt;td id=&quot;left-side-container&quot; width=&quot;35%&quot; valign=&quot;top&quot;&gt;</xsl:text>
          </xsl:if>

          <!-- Display Dictionary Results if they exist -->
          <xsl:if test="$show_dictionary_results = '1'">
            <xsl:call-template name="dictionary_results"/>
          </xsl:if>

          <!-- for keymatch results -->
          <xsl:if test="$show_keymatch != '0'">
            <xsl:apply-templates select="/GSP/GM"/>
          </xsl:if>
          
          <xsl:apply-templates select="RES/R">
            <xsl:with-param name="query" select="$query"/>
          </xsl:apply-templates>

          <div id="no-results" style="display: none;">
            <xsl:call-template name="no_RES">
              <xsl:with-param name="query" select="Q"/>
            </xsl:call-template>
          </div>

          <xsl:text disable-output-escaping="yes">&lt;/td&gt;</xsl:text>

          <!-- Display sidebar containing the enabled sidebar elements. -->
          <!-- *** CONDITIONAL FORMATTING PARTY FOR RIGHT SIDEBAR *** -->
          <xsl:if test="$show_sidebar = '1'">
            <xsl:if test="$show_sidebar_l = '0'">
              <xsl:text disable-output-escaping="yes">&lt;td id=&quot;sidebar-container&quot; class=&quot;sb-r&quot; width=&quot;75%&quot; valign=&quot;top&quot;&gt;</xsl:text>
            </xsl:if>
            <xsl:if test="$show_sidebar_l = '1'">
              <xsl:text disable-output-escaping="yes">&lt;td id=&quot;sidebar-container&quot; class=&quot;sb-r&quot; width=&quot;40%&quot; valign=&quot;top&quot;&gt;</xsl:text>
            </xsl:if>

            <div id="sidebar">

              <!-- *** NEW Result Cluster Sidebar Element *** -->
              <xsl:if test="$show_res_clusters='1'">
                <xsl:call-template name="cluster_results"/>
              </xsl:if>

              <!-- *** Onebox Result Sidebar Element *** -->
              <!-- *** Handle OneBox results, if any ***-->
              <xsl:if test="$show_onebox='1' and $show_mbaamaze='1' and count(/GSP/ENTOBRESULTS) &gt; 0">
                <xsl:call-template name="training_sidebar"/>
              </xsl:if>

              <!-- *** In-Young's Custom Sidebar Element *** -->
              <xsl:if test="$show_customsb='1'">
                <div id="custom_results_container" class="sidebar-element">
                  <div id="loading-customsb-results" class="sb-r-ld-msg-c" style="display: none;">
                    <span class="sb-r-lbl">Loading In-Young's Custom results...</span>
                  </div>
                  <div id="customsb-msg" class="sb-r-lbl" style="display: none;" >
                    In-Young's Custom Sidebar
                  </div>
                  <div id="customsb-section" class="sb-r-res" style="display:none">
                    This is a custom static message
                  </div>
                  <div id="customsb-counttest" class="sb-r-res" style="display:none">
                    0
                  </div>
                </div>
              </xsl:if>
            </div>
          </xsl:if>
          <xsl:text disable-output-escaping="yes">&lt;/td&gt;</xsl:text>
        </tr>
      </table>
    </div>
    <!-- *** Filter note (if needed) *** -->
    <xsl:if test="(RES/FI) and (not(RES/NB/NU))">
      <p>
        <i>
          In order to show you the most relevant results,    we have omitted some entries very similar to the <xsl:value-of select="RES/@EN"/> already    displayed.<br/>If you like, you can <a href="{$filter_url}0">    repeat the search with the omitted results included</a>.
        </i>
      </p>
    </xsl:if>

    <!-- *** Add bottom navigation *** -->
    <div style="min-width:800px;">
      <div class="left-spacing" style="max-width: 388px; min-width: 240px; width: 25%; height: 50px; float: left;"></div>
      <div class="pull-left">
        <xsl:variable name="nav_style">
          <xsl:choose>
            <xsl:when test="($access='s') or ($access='a')">simple</xsl:when>
            <xsl:otherwise>
              <xsl:value-of select="$choose_bottom_navigation"/>
            </xsl:otherwise>
          </xsl:choose>
        </xsl:variable>

        <xsl:call-template name="google_navigation">
          <xsl:with-param name="prev" select="RES/NB/PU"/>
          <xsl:with-param name="next" select="RES/NB/NU"/>
          <xsl:with-param name="view_begin" select="RES/@SN"/>
          <xsl:with-param name="view_end" select="RES/@EN"/>
          <xsl:with-param name="guess" select="RES/M"/>
          <xsl:with-param name="navigation_style" select="$nav_style"/>
        </xsl:call-template>
      </div>
    </div>
    <!-- *** Bottom search box *** -->
    <xsl:if test="$show_bottom_search_box != '0'">
      <xsl:call-template name="bottom_search_box"/>
    </xsl:if>

  </xsl:template>

  <!-- ***************************************
  Templates for Custom Sidebar Elements
  *****************************************-->

  <!-- Product Updates -->
  <xsl:template name="productup_sidebar">
    <div id="productup_container_l" class="sidebar-element">
      <div id="productup-hdr" class="productup-header">
        Product Updates
      </div>
      <!-- *** Content populated by JS *** -->
      <div id="productup-body" class="productup-body"></div>
    </div>
  </xsl:template>

  <!-- Helpful Links -->
  <xsl:template name="helplinks_sidebar">
    <div id="helplinks_container_l" class="sidebar-element">
      <div id="helplinks-hdr" class="helplinks-header">
        Helpful Links
      </div>
      <div id="helplinks-body" class="helplinks-body">
        <div class="sb-l-lbl">
          Key References
        </div>
        <div class="sb-l-res">
          <a target="_blank" href="https://portal.qlmortgageservices.com/guru/All/index.htm#4193.htm">Product Matrix</a>
        </div>
        <div class="sb-l-res">
          <a target="_blank" href="http://quniverse/teams/capitalmarkets/secondary_public_docs/GURU_Supplements/FHAUnder%20620UpdatedQL.pdf">FHA &lt; 620 One-Pager</a>
        </div>
        <xsl:if test="$show_contacts='1'">
          <div class="sb-l-lbl" style="margin-top:20px">
            Email Contacts
          </div>
          <div class="sb-l-res">
            <a href="mailto:GURUFeedback@Quickenloans.com">GURU Feedback</a>
          </div>
          <div class="sb-l-res">
            <a href="mailto:SOS@quickenloans.com">SOS</a>
          </div>
          <div class="sb-l-res">
            <a href="mailto: lockdesk@quickenloans.com">Pricing</a>
          </div>
        </xsl:if>
        <div class="sb-l-lbl" style="margin-top:20px">
          Other
        </div>
        <div class="sb-l-res">
          <a target="_blank" href="http://quniverse/teams/capitalmarkets/Product%20Announcements/GURU-Search-Tips.pdf">Search Tips</a>
        </div>
        <div class="sb-l-res">
          <a target="_blank" href="http://youtu.be/_4fXkqfqM_U">Guru Tutorial</a>
        </div>
      </div>
    </div>
  </xsl:template>

  <!-- Collection Filter -->
  <xsl:template name="collection_sidebar">
    <div id="collection_filter" class="sidebar-element">
      <div id="collection-hdr" class="collection-header" >
        Filter by Collection
      </div>
      <div class="collection-body">
      </div>
    </div>
  </xsl:template>

  <!-- Dictionary Results -->
  <xsl:template name="dictionary_results">
    <div id="dictionary-container" style="display: none;">
      <div id="dictionary-hdr" class="dictionary-header" >
        <!-- Replace the following with the actual dictionary term!! -->
        <div id="dictionary-term" style="display: none;" >
        </div>
      </div>
      <div id="dictionary-body" class="dictionary-body">
        <div id="dictionary-definition" class="sb-l-res" style="display: none;" >
        </div>
      </div>
    </div>
  </xsl:template>

  <!-- Relevant Training Materials -->
  <xsl:template name="training_sidebar">
    <div class="sidebar-element">
      <div class="training-header">
        Relevant Training Materials
      </div>
      <div class="training-body">
        <xsl:call-template name="onebox"/>
        <script>
          <xsl:comment>
            if (window['populateUarMessages']) {
            populateUarMessages();
            }
            //
          </xsl:comment>
        </script>
      </div>
    </div>
  </xsl:template>

  <!-- Collection Filter Links-->
  <xsl:variable name="frontend_name">default_frontend</xsl:variable>
  <xsl:template name="collection_links">
    <div id="collection_filter_links" style="min-width: 900px;">
      <nobr>
        <span>
          <div class="form-container">
            <form method="GET" action="https://portal.qlmortgageservices.com/searchguru/search">
              <input type="hidden" name="q" value="{$space_normalized_query}"/>
              <xsl:choose>
                <xsl:when test="PARAM[@name='site']/@value='All'">
                  <input type="submit" name="btnG" id="submit-clicked" value="All QL"/>
                </xsl:when>
                <xsl:otherwise>
                  <input type="submit" name="btnG" value="All QL"/>
                </xsl:otherwise>
              </xsl:choose>
              <input type="hidden" name="site" value="All"/>
              <input type="hidden" name="client" value="{$frontend_name}"/>
              <input type="hidden" name="output" value="xml_no_dtd"/>
              <input type="hidden" name="proxystylesheet" value="{$frontend_name}"/>
              <input type="hidden" name="filter" value="0"/>
              <input type="hidden" name="proxyreload" value="1"/>
            </form>
          </div>
          <div class="form-container">
            <form method="GET" action="https://portal.qlmortgageservices.com/searchguru/search">
              <input type="hidden" name="q" value="{$space_normalized_query}"/>
              <xsl:choose>
                <xsl:when test="PARAM[@name='site']/@value='Agency'">
                  <input type="submit" name="btnG" id="submit-clicked" value="Agency"/>
                </xsl:when>
                <xsl:otherwise>
                  <input type="submit" name="btnG" value="Agency"/>
                </xsl:otherwise>
              </xsl:choose>
              <input type="hidden" name="site" value="Agency"/>
              <input type="hidden" name="client" value="{$frontend_name}"/>
              <input type="hidden" name="output" value="xml_no_dtd"/>
              <input type="hidden" name="proxystylesheet" value="{$frontend_name}"/>
              <input type="hidden" name="filter" value="0"/>
              <input type="hidden" name="proxyreload" value="1"/>
            </form>
          </div>
          <div class="form-container">
            <form method="GET" action="https://portal.qlmortgageservices.com/searchguru/search">
              <input type="hidden" name="q" value="{$space_normalized_query}"/>
              <xsl:choose>
                <xsl:when test="PARAM[@name='site']/@value='FHA'">
                  <input type="submit" name="btnG" id="submit-clicked" value="FHA"/>
                </xsl:when>
                <xsl:otherwise>
                  <input type="submit" name="btnG" value="FHA"/>
                </xsl:otherwise>
              </xsl:choose>
              <input type="hidden" name="site" value="FHA"/>
              <input type="hidden" name="client" value="{$frontend_name}"/>
              <input type="hidden" name="output" value="xml_no_dtd"/>
              <input type="hidden" name="proxystylesheet" value="{$frontend_name}"/>
              <input type="hidden" name="filter" value="0"/>
              <input type="hidden" name="proxyreload" value="1"/>
            </form>
          </div>
          <div class="form-container">
            <form method="GET" action="https://portal.qlmortgageservices.com/searchguru/search">
              <input type="hidden" name="q" value="{$space_normalized_query}"/>
              <xsl:choose>
                <xsl:when test="PARAM[@name='site']/@value='FICOFHA'">
                  <input type="submit" name="btnG" id="submit-clicked" value="FHA 580-619"/>
                </xsl:when>
                <xsl:otherwise>
                  <input type="submit" name="btnG" value="FHA 580-619"/>
                </xsl:otherwise>
              </xsl:choose>
              <input type="hidden" name="site" value="FICOFHA"/>
              <input type="hidden" name="client" value="{$frontend_name}"/>
              <input type="hidden" name="output" value="xml_no_dtd"/>
              <input type="hidden" name="proxystylesheet" value="{$frontend_name}"/>
              <input type="hidden" name="filter" value="0"/>
              <input type="hidden" name="proxyreload" value="1"/>
            </form>
          </div>
          <div class="form-container">
            <form method="GET" action="https://portal.qlmortgageservices.com/searchguru/search">
              <input type="hidden" name="q" value="{$space_normalized_query}"/>
              <xsl:choose>
                <xsl:when test="PARAM[@name='site']/@value='VA'">
                  <input type="submit" name="btnG" id="submit-clicked" value="VA"/>
                </xsl:when>
                <xsl:otherwise>
                  <input type="submit" name="btnG" value="VA"/>
                </xsl:otherwise>
              </xsl:choose>
              <input type="hidden" name="site" value="VA"/>
              <input type="hidden" name="client" value="{$frontend_name}"/>
              <input type="hidden" name="output" value="xml_no_dtd"/>
              <input type="hidden" name="proxystylesheet" value="{$frontend_name}"/>
              <input type="hidden" name="filter" value="0"/>
              <input type="hidden" name="proxyreload" value="1"/>
            </form>
          </div>
          <div class="form-container">
            <form method="GET" action="https://portal.qlmortgageservices.com/searchguru/search">
              <input type="hidden" name="q" value="{$space_normalized_query}"/>
              <xsl:choose>
                <xsl:when test="PARAM[@name='site']/@value='Jumbo'">
                  <input type="submit" name="btnG" id="submit-clicked" value="Jumbo"/>
                </xsl:when>
                <xsl:otherwise>
                  <input type="submit" name="btnG" value="Jumbo"/>
                </xsl:otherwise>
              </xsl:choose>
              <input type="hidden" name="site" value="Jumbo"/>
              <input type="hidden" name="client" value="{$frontend_name}"/>
              <input type="hidden" name="output" value="xml_no_dtd"/>
              <input type="hidden" name="proxystylesheet" value="{$frontend_name}"/>
              <input type="hidden" name="filter" value="0"/>
              <input type="hidden" name="proxyreload" value="1"/>
            </form>
          </div>
          <div class="form-container">
            <form method="GET" action="https://portal.qlmortgageservices.com/searchguru/search">
              <input type="hidden" name="q" value="{$space_normalized_query}"/>
              <xsl:choose>
                <xsl:when test="PARAM[@name='site']/@value='Purchase'">
                  <input type="submit" name="btnG" id="submit-clicked" value="Purchase"/>
                </xsl:when>
                <xsl:otherwise>
                  <input type="submit" name="btnG" value="Purchase"/>
                </xsl:otherwise>
              </xsl:choose>
              <input type="hidden" name="site" value="Purchase"/>
              <input type="hidden" name="client" value="{$frontend_name}"/>
              <input type="hidden" name="output" value="xml_no_dtd"/>
              <input type="hidden" name="proxystylesheet" value="{$frontend_name}"/>
              <input type="hidden" name="filter" value="0"/>
              <input type="hidden" name="proxyreload" value="1"/>
            </form>
          </div>
        </span>
      </nobr>
    </div>
  </xsl:template>

  <!--<xsl:variable name="frontend_name">QLMS_Test_Mini</xsl:variable>
  <xsl:template name="collection_links">
    <div id="collection_filter_links" style="min-width: 900px;">
      <nobr>
        <span>
          <div class="form-container">
            <form method="GET" action="http://gsatest/search">
              <input type="hidden" name="q" value="{$space_normalized_query}"/>
              <xsl:choose>
                <xsl:when test="PARAM[@name='site']/@value='All'">
                  <input type="submit" name="btnG" id="submit-clicked" value="All QL"/>
                </xsl:when>
                <xsl:otherwise>
                  <input type="submit" name="btnG" value="All QL"/>
                </xsl:otherwise>
              </xsl:choose>
              <input type="hidden" name="site" value="All"/>
              <input type="hidden" name="client" value="{$frontend_name}"/>
              <input type="hidden" name="output" value="xml_no_dtd"/>
              <input type="hidden" name="proxystylesheet" value="{$frontend_name}"/>
              <input type="hidden" name="filter" value="0"/>
              <input type="hidden" name="proxyreload" value="1"/>
            </form>
          </div>
          <div class="form-container">
            <form method="GET" action="http://gsatest/search">
              <input type="hidden" name="q" value="{$space_normalized_query}"/>
              <xsl:choose>
                <xsl:when test="PARAM[@name='site']/@value='Agency'">
                  <input type="submit" name="btnG" id="submit-clicked" value="Agency"/>
                </xsl:when>
                <xsl:otherwise>
                  <input type="submit" name="btnG" value="Agency"/>
                </xsl:otherwise>
              </xsl:choose>
              <input type="hidden" name="site" value="Agency"/>
              <input type="hidden" name="client" value="{$frontend_name}"/>
              <input type="hidden" name="output" value="xml_no_dtd"/>
              <input type="hidden" name="proxystylesheet" value="{$frontend_name}"/>
              <input type="hidden" name="filter" value="0"/>
              <input type="hidden" name="proxyreload" value="1"/>
            </form>
          </div>
          <div class="form-container">
            <form method="GET" action="http://gsatest/search">
              <input type="hidden" name="q" value="{$space_normalized_query}"/>
              <xsl:choose>
                <xsl:when test="PARAM[@name='site']/@value='FHA'">
                  <input type="submit" name="btnG" id="submit-clicked" value="FHA"/>
                </xsl:when>
                <xsl:otherwise>
                  <input type="submit" name="btnG" value="FHA"/>
                </xsl:otherwise>
              </xsl:choose>
              <input type="hidden" name="site" value="FHA"/>
              <input type="hidden" name="client" value="{$frontend_name}"/>
              <input type="hidden" name="output" value="xml_no_dtd"/>
              <input type="hidden" name="proxystylesheet" value="{$frontend_name}"/>
              <input type="hidden" name="filter" value="0"/>
              <input type="hidden" name="proxyreload" value="1"/>
            </form>
          </div>
          <div class="form-container">
            <form method="GET" action="http://gsatest/search">
              <input type="hidden" name="q" value="{$space_normalized_query}"/>
              <xsl:choose>
                <xsl:when test="PARAM[@name='site']/@value='FICOFHA'">
                  <input type="submit" name="btnG" id="submit-clicked" value="FHA 580-619"/>
                </xsl:when>
                <xsl:otherwise>
                  <input type="submit" name="btnG" value="FHA 580-619"/>
                </xsl:otherwise>
              </xsl:choose>
              <input type="hidden" name="site" value="FICOFHA"/>
              <input type="hidden" name="client" value="{$frontend_name}"/>
              <input type="hidden" name="output" value="xml_no_dtd"/>
              <input type="hidden" name="proxystylesheet" value="{$frontend_name}"/>
              <input type="hidden" name="filter" value="0"/>
              <input type="hidden" name="proxyreload" value="1"/>
            </form>
          </div>
          <div class="form-container">
            <form method="GET" action="http://gsatest/search">
              <input type="hidden" name="q" value="{$space_normalized_query}"/>
              <xsl:choose>
                <xsl:when test="PARAM[@name='site']/@value='VA'">
                  <input type="submit" name="btnG" id="submit-clicked" value="VA"/>
                </xsl:when>
                <xsl:otherwise>
                  <input type="submit" name="btnG" value="VA"/>
                </xsl:otherwise>
              </xsl:choose>
              <input type="hidden" name="site" value="VA"/>
              <input type="hidden" name="client" value="{$frontend_name}"/>
              <input type="hidden" name="output" value="xml_no_dtd"/>
              <input type="hidden" name="proxystylesheet" value="{$frontend_name}"/>
              <input type="hidden" name="filter" value="0"/>
              <input type="hidden" name="proxyreload" value="1"/>
            </form>
          </div>
          <div class="form-container">
            <form method="GET" action="http://gsatest/search">
              <input type="hidden" name="q" value="{$space_normalized_query}"/>
              <xsl:choose>
                <xsl:when test="PARAM[@name='site']/@value='Jumbo'">
                  <input type="submit" name="btnG" id="submit-clicked" value="Jumbo"/>
                </xsl:when>
                <xsl:otherwise>
                  <input type="submit" name="btnG" value="Jumbo"/>
                </xsl:otherwise>
              </xsl:choose>
              <input type="hidden" name="site" value="Jumbo"/>
              <input type="hidden" name="client" value="{$frontend_name}"/>
              <input type="hidden" name="output" value="xml_no_dtd"/>
              <input type="hidden" name="proxystylesheet" value="{$frontend_name}"/>
              <input type="hidden" name="filter" value="0"/>
              <input type="hidden" name="proxyreload" value="1"/>
            </form>
          </div>
          <div class="form-container">
            <form method="GET" action="http://gsatest/search">
              <input type="hidden" name="q" value="{$space_normalized_query}"/>
              <xsl:choose>
                <xsl:when test="PARAM[@name='site']/@value='Purchase'">
                  <input type="submit" name="btnG" id="submit-clicked" value="Purchase"/>
                </xsl:when>
                <xsl:otherwise>
                  <input type="submit" name="btnG" value="Purchase"/>
                </xsl:otherwise>
              </xsl:choose>
              <input type="hidden" name="site" value="Purchase"/>
              <input type="hidden" name="client" value="{$frontend_name}"/>
              <input type="hidden" name="output" value="xml_no_dtd"/>
              <input type="hidden" name="proxystylesheet" value="{$frontend_name}"/>
              <input type="hidden" name="filter" value="0"/>
              <input type="hidden" name="proxyreload" value="1"/>
            </form>
          </div>
        </span>
      </nobr>
    </div>
  </xsl:template>-->

  <xsl:template name="cluster_results">
    <div id='clustering' class="sidebar-element">
      <div class="cluster-header">
        Narrow Your Search
      </div>
      <div class="cluster-body">
        <div class="sb-r-res">
          <span id='cluster_status'>
            <span id='cluster_message' style="display:none">loading...</span>
            <noscript>
              javascript must be enabled for narrowing.
            </noscript>
          </span>

          <ul>
            <li id='cluster_label0'></li>
            <li id='cluster_label1'></li>
            <li id='cluster_label2'></li>
            <li id='cluster_label3'></li>
            <li id='cluster_label4'></li>
            <li id='cluster_label5'></li>
            <li id='cluster_label6'></li>
            <li id='cluster_label7'></li>
            <li id='cluster_label8'></li>
            <li id='cluster_label9'></li>
          </ul>

        </div>
      </div>

    </div>
  </xsl:template>

  <!-- **********************************************************************
Stopwords suggestions in result page (do not customize)
     ********************************************************************** -->
  <xsl:template name="stopwords">
    <xsl:variable name="stopwords_suggestions1">
      <xsl:call-template name="replace_string">
        <xsl:with-param name="find" select="'/help/basics.html#stopwords'"/>
        <xsl:with-param name="replace" select="'user_help.html#stop'"/>
        <xsl:with-param name="string" select="/GSP/CT"/>
      </xsl:call-template>
    </xsl:variable>

    <xsl:variable name="stopwords_suggestions">
      <xsl:call-template name="replace_string">
        <xsl:with-param name="find" select="'/help/basics.html'"/>
        <xsl:with-param name="replace" select="'user_help.html'"/>
        <xsl:with-param name="string" select="$stopwords_suggestions1"/>
      </xsl:call-template>
    </xsl:variable>

    <xsl:if test="/GSP/CT">
      <font size="-1" color="gray">
        <xsl:value-of disable-output-escaping="yes"
          select="$stopwords_suggestions"/>
      </font>
    </xsl:if>
  </xsl:template>


  <!-- **********************************************************************
Spelling suggestions in result page (do not customize)
     ********************************************************************** -->
  <xsl:template name="spelling">
    <xsl:if test="/GSP/Spelling/Suggestion">
      <p>
        <span class="p">
          <font color="{$spelling_text_color}">
            <xsl:value-of select="$spelling_text"/>
            <xsl:call-template name="nbsp"/>
          </font>
        </span>
        <a href="search?q={/GSP/Spelling/Suggestion[1]/@qe}&amp;spell=1&amp;{$base_url}">
          <xsl:value-of disable-output-escaping="yes"
            select="/GSP/Spelling/Suggestion[1]"/>
        </a>
      </p>
    </xsl:if>
  </xsl:template>


  <!-- **********************************************************************
Synonym suggestions in result page (do not customize)
     ********************************************************************** -->
  <xsl:template name="synonyms">
    <xsl:if test="/GSP/Synonyms/OneSynonym">
      <p>
        <span class="p">
          <font color="{$synonyms_text_color}">
            <xsl:value-of select="$synonyms_text"/>
            <xsl:call-template name="nbsp"/>
          </font>
        </span>
        <xsl:for-each select="/GSP/Synonyms/OneSynonym">
          <a href="search?q={@q}&amp;{$synonym_url}">
            <xsl:value-of disable-output-escaping="yes" select="."/>
          </a>
          <xsl:text> </xsl:text>
        </xsl:for-each>
      </p>
    </xsl:if>
  </xsl:template>


  <!-- **********************************************************************
Truncation functions (do not customize)
     ********************************************************************** -->
  <xsl:template name="truncate_url">
    <xsl:param name="t_url"/>

    <xsl:choose>
      <xsl:when test="string-length($t_url) &lt; $truncate_result_url_length">
        <xsl:value-of select="$t_url"/>
      </xsl:when>
      <xsl:otherwise>
        <xsl:variable name="first" select="substring-before($t_url, '/')"/>
        <xsl:variable name="last">
          <xsl:call-template name="truncate_find_last_token">
            <xsl:with-param name="t_url" select="$t_url"/>
          </xsl:call-template>
        </xsl:variable>
        <xsl:variable name="path_limit" select="$truncate_result_url_length - (string-length($first) + string-length($last) + 1)"/>

        <xsl:choose>
          <xsl:when test="$path_limit &lt;= 0">
            <xsl:value-of select="concat(substring($t_url, 1, $truncate_result_url_length), '...')"/>
          </xsl:when>
          <xsl:otherwise>
            <xsl:variable name="chopped_path">
              <xsl:call-template name="truncate_chop_path">
                <xsl:with-param name="path" select="substring($t_url, string-length($first) + 2, string-length($t_url) - (string-length($first) + string-length($last) + 1))"/>
                <xsl:with-param name="path_limit" select="$path_limit"/>
              </xsl:call-template>
            </xsl:variable>
            <xsl:value-of select="concat($first, '/.../', $chopped_path, $last)"/>
          </xsl:otherwise>
        </xsl:choose>
      </xsl:otherwise>
    </xsl:choose>

  </xsl:template>

  <xsl:template name="truncate_find_last_token">
    <xsl:param name="t_url"/>

    <xsl:choose>
      <xsl:when test="contains($t_url, '/')">
        <xsl:call-template name="truncate_find_last_token">
          <xsl:with-param name="t_url" select="substring-after($t_url, '/')"/>
        </xsl:call-template>
      </xsl:when>
      <xsl:otherwise>
        <xsl:value-of select="$t_url"/>
      </xsl:otherwise>
    </xsl:choose>

  </xsl:template>

  <xsl:template name="truncate_chop_path">
    <xsl:param name="path"/>
    <xsl:param name="path_limit"/>

    <xsl:choose>
      <xsl:when test="string-length($path) &lt;= $path_limit">
        <xsl:value-of select="$path"/>
      </xsl:when>
      <xsl:otherwise>
        <xsl:call-template name="truncate_chop_path">
          <xsl:with-param name="path" select="substring-after($path, '/')"/>
          <xsl:with-param name="path_limit" select="$path_limit"/>
        </xsl:call-template>
      </xsl:otherwise>
    </xsl:choose>

  </xsl:template>


  <!-- **********************************************************************
  A single result (do not customize)
     ********************************************************************** -->
  <xsl:template match="R">
    <xsl:param name="query"/>

    <xsl:variable name="protocol"     select="substring-before(U, '://')"/>
    <xsl:variable name="temp_url"     select="substring-after(U, '://')"/>
    <xsl:variable name="display_url1" select="substring-after(UD, '://')"/>
    <xsl:variable name="escaped_url"  select="substring-after(UE, '://')"/>

    <xsl:variable name="display_url2">
      <xsl:choose>
        <xsl:when test="$display_url1">
          <xsl:value-of select="$display_url1"/>
        </xsl:when>
        <xsl:otherwise>
          <xsl:value-of select="$temp_url"/>
        </xsl:otherwise>
      </xsl:choose>
    </xsl:variable>

    <xsl:variable name="display_url">
      <xsl:choose>
        <xsl:when test="$protocol='unc'">
          <xsl:call-template name="convert_unc">
            <xsl:with-param name="string" select="$display_url2"/>
          </xsl:call-template>
        </xsl:when>
        <xsl:otherwise>
          <xsl:value-of select="$display_url2"/>
        </xsl:otherwise>
      </xsl:choose>
    </xsl:variable>

    <xsl:variable name="stripped_url">
      <xsl:choose>
        <xsl:when test="$truncate_result_urls != '0'">
          <xsl:call-template name="truncate_url">
            <xsl:with-param name="t_url" select="$display_url"/>
          </xsl:call-template>
        </xsl:when>
        <xsl:otherwise>
          <xsl:value-of select="$display_url"/>
        </xsl:otherwise>
      </xsl:choose>
    </xsl:variable>

    <xsl:variable name="crowded_url" select="HN/@U"/>
    <xsl:variable name="crowded_display_url1" select="HN"/>
    <xsl:variable name="crowded_display_url">
      <xsl:choose>
        <xsl:when test="$protocol='unc'">
          <xsl:call-template name="convert_unc">
            <xsl:with-param name="string" select="substring-after($crowded_display_url1,'://')"/>
          </xsl:call-template>
        </xsl:when>
        <xsl:otherwise>
          <xsl:value-of select="$crowded_display_url1"/>
        </xsl:otherwise>
      </xsl:choose>
    </xsl:variable>

    <xsl:variable name="lower" select="'abcdefghijklmnopqrstuvwxyz'"/>
    <xsl:variable name="upper" select="'ABCDEFGHIJKLMNOPQRSTUVWXYZ'"/>

    <xsl:variable name="url_indexed" select="not(starts-with($temp_url, 'noindex!/'))"/>

    <!-- *** Indent as required (only supports 2 levels) *** -->
    <xsl:if test="@L='2'">
      <xsl:text disable-output-escaping="yes">&lt;blockquote class=&quot;g&quot;&gt;</xsl:text>
    </xsl:if>

    <!-- *** Result Header *** -->
    <p class="g">

      <!-- *** Result Title (including PDF tag and hyperlink) *** -->
      <xsl:if test="$show_res_title != '0'">
        <font size="-2">
          <b>
            <xsl:choose>
              <xsl:when test="@MIME='text/html' or @MIME='' or not(@MIME)"></xsl:when>
              <xsl:when test="@MIME='text/plain'">[TEXT]</xsl:when>
              <xsl:when test="@MIME='application/rtf'">[RTF]</xsl:when>
              <xsl:when test="@MIME='application/pdf'">[PDF]</xsl:when>
              <xsl:when test="@MIME='application/postscript'">[PS]</xsl:when>
              <xsl:when test="@MIME='application/vnd.ms-powerpoint'">[MS POWERPOINT]</xsl:when>
              <xsl:when test="@MIME='application/vnd.ms-excel'">[MS EXCEL]</xsl:when>
              <xsl:when test="@MIME='application/msword'">[MS WORD]</xsl:when>
              <xsl:otherwise>
                <xsl:variable name="extension">
                  <xsl:call-template name="last_substring_after">
                    <xsl:with-param name="string" select="substring-after(
                                                  $temp_url,
                                                  '/')"/>
                    <xsl:with-param name="separator" select="'.'"/>
                    <xsl:with-param name="fallback" select="'UNKNOWN'"/>
                  </xsl:call-template>
                </xsl:variable>
                [<xsl:value-of select="translate($extension,$lower,$upper)"/>]
              </xsl:otherwise>
            </xsl:choose>
          </b>
        </font>
        <xsl:text> </xsl:text>

        <xsl:variable name="link"
         select="$url_indexed and not(starts-with(U, $googleconnector_protocol))"/>

        <div class="r">
          <xsl:if test="$link">

            <xsl:text disable-output-escaping='yes'>&lt;a href="</xsl:text>

            <xsl:choose>
              <xsl:when test="starts-with(U, $db_url_protocol)">
                <xsl:value-of disable-output-escaping='yes'
                              select="concat('db/', $temp_url)"/>
              </xsl:when>
              <!-- *** URI for smb or NFS must be escaped because it appears in the URI query *** -->
              <xsl:when test="$protocol='nfs' or $protocol='smb'">
                <xsl:value-of disable-output-escaping='yes'
                              select="concat($protocol,'/',$temp_url)"/>
              </xsl:when>
              <xsl:when test="$protocol='unc'">
                <xsl:value-of disable-output-escaping='yes' select="concat('file://', $display_url2)"/>
              </xsl:when>
              <xsl:otherwise>
                <xsl:value-of disable-output-escaping='yes' select="U"/>
              </xsl:otherwise>
            </xsl:choose>
            <xsl:text disable-output-escaping='yes'>"&gt;</xsl:text>
          </xsl:if>
          <span class="l">
            <xsl:choose>
              <xsl:when test="T">
                <xsl:call-template name="reformat_keyword">
                  <xsl:with-param name="orig_string" select="T"/>
                  <xsl:with-param name="is_title" select="'1'"/>
                </xsl:call-template>
              </xsl:when>
              <xsl:otherwise>
                <xsl:value-of select="$stripped_url"/>
              </xsl:otherwise>
            </xsl:choose>
          </span>
          <xsl:if test="$link">
            <xsl:text disable-output-escaping='yes'>&lt;/a&gt;</xsl:text>
          </xsl:if>
        </div>
      </xsl:if>


      <!-- *** Snippet Box *** -->
      <table cellpadding="0" cellspacing="0" border="0">
        <tr>
          <td class="s">
            <xsl:if test="$show_res_snippet != '0'">
              <div style="color:#545454">
                <xsl:call-template name="reformat_keyword">
                  <xsl:with-param name="orig_string" select="S"/>
                </xsl:call-template>
              </div>
            </xsl:if>

            <!-- *** Meta tags *** -->
            <xsl:if test="$show_meta_tags != '0'">
              <xsl:apply-templates select="MT"/>
            </xsl:if>

            <!-- *** URL *** -->
            <font color="{$res_url_color}" size="{$res_url_size}">
              <xsl:choose>
                <xsl:when test="not($url_indexed)">
                  <xsl:if test="($show_res_size!='0') or
                        ($show_res_date!='0') or
                        ($show_res_cache!='0')">
                    <xsl:text>Not Indexed:</xsl:text>
                    <xsl:value-of select="$stripped_url"/>
                  </xsl:if>
                </xsl:when>
                <xsl:otherwise>
                  <xsl:if test="$show_res_url != '0'">
                    <xsl:value-of select="$stripped_url"/>
                  </xsl:if>
                </xsl:otherwise>
              </xsl:choose>
            </font>

            <!-- *** Miscellaneous (- size - date - cache) *** -->
            <xsl:if test="$url_indexed">
              <xsl:apply-templates select="HAS/C">
                <xsl:with-param name="stripped_url" select="$stripped_url"/>
                <xsl:with-param name="escaped_url" select="$escaped_url"/>
                <xsl:with-param name="query" select="$query"/>
                <xsl:with-param name="mime" select="@MIME"/>
                <xsl:with-param name="date" select="FS[@NAME='date']/@VALUE"/>
              </xsl:apply-templates>
            </xsl:if>


            <!-- *** Link to more links from this site *** -->
            <xsl:if test="HN">
              <br/>
              [
              <a class="f" href="search?as_sitesearch={$crowded_url}&amp;{
            $search_url}">
                More results from <xsl:value-of select="$crowded_display_url"/>
              </a>
              ]



              <!-- *** Link to aggregated results from database source *** -->
              <xsl:if test="starts-with($crowded_url, $db_url_protocol)">
                [
                <a class="f" href="dbaggr?sitesearch={$crowded_url}&amp;{
          $search_url}">View all data</a>
                ]
              </xsl:if>
            </xsl:if>


            <!-- *** Result Footer *** -->
          </td>
        </tr>
      </table>
    </p>

    <!-- *** End indenting as required (only supports 2 levels) *** -->
    <xsl:if test="@L='2'">
      <xsl:text disable-output-escaping="yes">&lt;/blockquote&gt;</xsl:text>
    </xsl:if>

  </xsl:template>

  <!-- **********************************************************************
  Meta tag values within a result (do not customize)
     ********************************************************************** -->
  <xsl:template match="MT">
    <br/>
    <span class="f">
      <xsl:value-of select="@N"/>:
    </span>
    <xsl:value-of select="@V"/>
  </xsl:template>

  <!-- **********************************************************************
  A single keymatch result (do not customize)
     ********************************************************************** -->
  <xsl:template match="GM">
    <div class="result-item" style="margin-top: 20px">
      <span bgcolor="{$keymatch_bg_color}"
            style="float:right" valign="top">
        <b>
          <font size="-1" color="{$keymatch_text_color}">
            <xsl:value-of select="$keymatch_text"/>
          </font>
        </b>
      </span>
      <span class="r">
        <span bgcolor="{$keymatch_bg_color}" >
          <a ctype="keymatch" href="{GL}" >
            <xsl:call-template name="bold_keyword">
              <xsl:with-param name="orig_string" select="GD"/>
            </xsl:call-template>
          </a>
          <br/>
          <font size="-1" color="{$res_url_color}">
            <span class="a">
              <xsl:value-of select="GL"/>
            </span>
          </font>
        </span>
      </span>
    </div>
    <p></p>
  </xsl:template>


  <!-- **********************************************************************
  Variables for reformatting keyword-match display (do not customize)
     ********************************************************************** -->
  <xsl:variable name="keyword_orig_start" select="'&lt;b&gt;'"/>
  <xsl:variable name="keyword_orig_end" select="'&lt;/b&gt;'"/>

  <xsl:variable name="keyword_reformat_start">
    <xsl:if test="$res_keyword_format">
      <xsl:text>&lt;</xsl:text>
      <xsl:value-of select="$res_keyword_format"/>
      <xsl:text>&gt;</xsl:text>
    </xsl:if>
    <xsl:if test="($res_keyword_size) or ($res_keyword_color)">
      <xsl:text>&lt;font</xsl:text>
      <xsl:if test="$res_keyword_size">
        <xsl:text> size="</xsl:text>
        <xsl:value-of select="$res_keyword_size"/>
        <xsl:text>"</xsl:text>
      </xsl:if>
      <xsl:if test="$res_keyword_color">
        <xsl:text> color="</xsl:text>
        <xsl:value-of select="$res_keyword_color"/>
        <xsl:text>"</xsl:text>
      </xsl:if>
      <xsl:text>&gt;</xsl:text>
    </xsl:if>
  </xsl:variable>

  <xsl:variable name="keyword_reformat_end">
    <xsl:if test="($res_keyword_size) or ($res_keyword_color)">
      <xsl:text>&lt;/font&gt;</xsl:text>
    </xsl:if>
    <xsl:if test="$res_keyword_format">
      <xsl:text>&lt;/</xsl:text>
      <xsl:value-of select="$res_keyword_format"/>
      <xsl:text>&gt;</xsl:text>
    </xsl:if>
  </xsl:variable>

  <!-- **********************************************************************
  Reformat the keyword match display in a title/snippet string
     (do not customize)
     ********************************************************************** -->
  <xsl:template name="reformat_keyword">
    <xsl:param name="orig_string"/>
    <xsl:param name="is_title"/>

    <xsl:variable name="mod_string">
      <xsl:call-template name="remove_topicnumber">
        <xsl:with-param name="title" select="$orig_string"/>
      </xsl:call-template>
    </xsl:variable>

    <xsl:variable name="reformatted_1">
      <xsl:call-template name="replace_string">
        <xsl:with-param name="find" select="$keyword_orig_start"/>
        <xsl:with-param name="replace" select="$keyword_reformat_start"/>
        <xsl:with-param name="string">
          <xsl:choose>
            <xsl:when test="$is_title = '1' and $hide_topicnumbers = '1'">
              <xsl:value-of select="$mod_string"/>
            </xsl:when>
            <xsl:otherwise>
              <xsl:value-of select="$orig_string"/>
            </xsl:otherwise>
          </xsl:choose>
        </xsl:with-param>
      </xsl:call-template>
    </xsl:variable>

    <xsl:variable name="reformatted_2">
      <xsl:call-template name="replace_string">
        <xsl:with-param name="find" select="$keyword_orig_end"/>
        <xsl:with-param name="replace" select="$keyword_reformat_end"/>
        <xsl:with-param name="string" select="$reformatted_1"/>
      </xsl:call-template>
    </xsl:variable>

    <xsl:value-of disable-output-escaping='yes' select="$reformatted_2"/>

  </xsl:template>

  <xsl:template name="bold_keyword">
    <xsl:param name="orig_string"/>

    <xsl:variable name="bold_string">
      <xsl:variable name="queryLowercase">
        <xsl:call-template name="tosmallcase">
          <xsl:with-param name="string" select="$space_normalized_query"/>
        </xsl:call-template>
      </xsl:variable>

      <xsl:choose>
        <xsl:when test="contains($orig_string, ' ')">
          <xsl:variable name="substringBeforeLowercase">
            <xsl:call-template name="tosmallcase">
              <xsl:with-param name="string" select="substring-before($orig_string, ' ')"/>
            </xsl:call-template>
          </xsl:variable>
          <xsl:choose>
            <xsl:when test="contains($queryLowercase, $substringBeforeLowercase)">
              <xsl:value-of select="concat(concat($keyword_orig_start, substring-before($orig_string, ' ')), concat($keyword_orig_end, ' '))"/>
              <xsl:call-template name="bold_keyword">
                <xsl:with-param name="orig_string" select="substring-after($orig_string, ' ')"/>
              </xsl:call-template>
            </xsl:when>
            <xsl:otherwise>
              <xsl:value-of select="concat(substring-before($orig_string, ' '), ' ')"/>
              <xsl:call-template name="bold_keyword">
                <xsl:with-param name="orig_string" select="substring-after($orig_string, ' ')"/>
              </xsl:call-template>
            </xsl:otherwise>
          </xsl:choose>
        </xsl:when>
        <xsl:otherwise>
          <xsl:variable name="stringLowercase">
            <xsl:call-template name="tosmallcase">
              <xsl:with-param name="string" select="$orig_string"/>
            </xsl:call-template>
          </xsl:variable>
          <xsl:choose>
            <xsl:when test="contains($queryLowercase, $stringLowercase)">
              <xsl:value-of select="concat(concat($keyword_orig_start, $orig_string), $keyword_orig_end)"/>
            </xsl:when>
            <xsl:otherwise>
              <xsl:value-of select="$orig_string"/>
            </xsl:otherwise>
          </xsl:choose>
        </xsl:otherwise>
      </xsl:choose>
    </xsl:variable>

    <xsl:value-of disable-output-escaping='yes' select="$bold_string"/>

  </xsl:template>

  <xsl:variable name="smallcase" select="'abcdefghijklmnopqrstuvwxyz'" />
  <xsl:variable name="uppercase" select="'ABCDEFGHIJKLMNOPQRSTUVWXYZ'" />
  <xsl:template name="tosmallcase">
    <xsl:param name="string"/>
    <xsl:value-of select="translate($string, $uppercase, $smallcase)" />
  </xsl:template>

  <!-- **********************************************************************
  Helper templates for generating a result item (do not customize)
     ********************************************************************** -->

  <!-- *** Miscellaneous: - size - date - cache *** -->
  <xsl:template match="C">
    <xsl:param name="stripped_url"/>
    <xsl:param name="escaped_url"/>
    <xsl:param name="query"/>
    <xsl:param name="mime"/>
    <xsl:param name="date"/>

    <xsl:variable name="docid">
      <xsl:value-of select="@CID"/>
    </xsl:variable>

    <xsl:if test="$show_res_size != '0'">
      <xsl:if test="not(@SZ='')">
        <font color="{$res_url_color}" size="{$res_url_size}">
          <xsl:text> - </xsl:text>
          <xsl:value-of select="@SZ"/>
        </font>
      </xsl:if>
    </xsl:if>

    <xsl:if test="$show_res_date != '0'">
      <xsl:if test="($date != '') and
                  (translate($date, '-', '') &gt; 19500000) and
                  (translate($date, '-', '') &lt; 21000000)">
        <font color="{$res_url_color}" size="{$res_url_size}">
          <xsl:text> - </xsl:text>
          <xsl:value-of select="$date"/>
        </font>
      </xsl:if>
    </xsl:if>

    <xsl:if test="$show_res_cache != '0'">
      <font color="{$res_url_color}" size="{$res_url_size}">
        <xsl:text> - </xsl:text>
      </font>
      <xsl:variable name="cache_encoding">
        <xsl:choose>
          <xsl:when test="'' != @ENC">
            <xsl:value-of select="@ENC"/>
          </xsl:when>
          <xsl:otherwise>UTF-8</xsl:otherwise>
        </xsl:choose>
      </xsl:variable>
      <a class="f" href="search?q=cache:{$docid}:{$escaped_url}+{
                           $stripped_search_query}&amp;{$base_url}&amp;oe={
                           $cache_encoding}">
        <xsl:choose>
          <xsl:when test="not($mime)">Cached</xsl:when>
          <xsl:when test="$mime='text/html'">Cached</xsl:when>
          <xsl:when test="$mime='text/plain'">Cached</xsl:when>
          <xsl:otherwise>Text Version</xsl:otherwise>
        </xsl:choose>
      </a>
    </xsl:if>

  </xsl:template>


  <!-- **********************************************************************
Google navigation bar in result page (do not customize)
     ********************************************************************** -->
  <xsl:template name="google_navigation">
    <xsl:param name="prev"/>
    <xsl:param name="next"/>
    <xsl:param name="view_begin"/>
    <xsl:param name="view_end"/>
    <xsl:param name="guess"/>
    <xsl:param name="navigation_style"/>

    <xsl:variable name="fontclass">
      <xsl:choose>
        <xsl:when test="$navigation_style = 'top'">s</xsl:when>
        <xsl:otherwise>b</xsl:otherwise>
      </xsl:choose>
    </xsl:variable>

    <!-- *** Test to see if we should even show navigation *** -->
    <xsl:if test="($prev) or ($next)">

      <!-- *** Start Google result navigation bar *** -->
      <table width="100%" border="0" cellpadding="0" cellspacing="0">
        <tr>
          <td>
            <xsl:if test="$navigation_style != 'top'">

              <!--<xsl:text disable-output-escaping="yes">&lt;center&gt;
        &lt;div class=&quot;n&quot;&gt;</xsl:text>-->
              <xsl:text disable-output-escaping="yes">
        &lt;div class=&quot;n&quot;&gt;</xsl:text>

            </xsl:if>

            <table border="0" cellpadding="0" width="1%" cellspacing="0">
              <tr align="center" valign="top">
                <xsl:if test="$navigation_style != 'top'">
                  <td valign="bottom" nowrap="1">
                    <font size="-1">
                      Result Page<xsl:call-template name="nbsp"/>
                    </font>
                  </td>
                </xsl:if>


                <!-- *** Show previous navigation, if available *** -->
                <xsl:choose>
                  <xsl:when test="$prev">
                    <td nowrap="1">

                      <span class="{$fontclass}">
                        <a href="search?{$search_url}&amp;start={$view_begin -
                      $num_results - 1}">
                          <xsl:if test="$navigation_style = 'google'">

                            <img src="/nav_previous.gif" width="68" height="26"
                              alt="Previous" border="0"/>
                            <br/>
                          </xsl:if>
                          <xsl:if test="$navigation_style = 'top'">
                            <xsl:text>&lt;</xsl:text>
                          </xsl:if>
                          <xsl:text>Previous</xsl:text>
                        </a>
                      </span>
                      <xsl:if test="$navigation_style != 'google'">
                        <xsl:call-template name="nbsp"/>
                      </xsl:if>
                    </td>
                  </xsl:when>
                  <xsl:otherwise>
                    <td nowrap="1">
                      <xsl:if test="$navigation_style = 'google'">
                        <img src="/nav_first.gif" width="18" height="26"
                          alt="First" border="0"/>
                        <br/>
                      </xsl:if>
                    </td>
                  </xsl:otherwise>
                </xsl:choose>

                <xsl:if test="($navigation_style = 'google') or
                      ($navigation_style = 'link')">
                  <!-- *** Google result set navigation *** -->
                  <xsl:variable name="mod_end">
                    <xsl:choose>
                      <xsl:when test="$next">
                        <xsl:value-of select="$guess"/>
                      </xsl:when>
                      <xsl:otherwise>
                        <xsl:value-of select="$view_end"/>
                      </xsl:otherwise>
                    </xsl:choose>
                  </xsl:variable>

                  <xsl:call-template name="result_nav">
                    <xsl:with-param name="start" select="0"/>
                    <xsl:with-param name="end" select="$mod_end"/>
                    <xsl:with-param name="current_view" select="($view_begin)-1"/>
                    <xsl:with-param name="navigation_style" select="$navigation_style"/>
                  </xsl:call-template>
                </xsl:if>

                <!-- *** Show next navigation, if available *** -->
                <xsl:choose>
                  <xsl:when test="$next">
                    <td nowrap="1">
                      <xsl:if test="$navigation_style != 'google'">
                        <xsl:call-template name="nbsp"/>
                      </xsl:if>
                      <span class="{$fontclass}">
                        <a href="search?{$search_url}&amp;start={$view_begin +
                $num_results - 1}">
                          <xsl:if test="$navigation_style = 'google'">

                            <img src="/nav_next.gif" width="100" height="26"

                              alt="Next" border="0"/>
                            <br/>
                          </xsl:if>
                          <xsl:text>Next</xsl:text>
                          <xsl:if test="$navigation_style = 'top'">
                            <xsl:text>&gt;</xsl:text>
                          </xsl:if>
                        </a>
                      </span>
                    </td>
                  </xsl:when>
                  <xsl:otherwise>
                    <td nowrap="1">
                      <xsl:if test="$navigation_style != 'google'">
                        <xsl:call-template name="nbsp"/>
                      </xsl:if>
                      <xsl:if test="$navigation_style = 'google'">
                        <img src="/nav_last.gif" width="46" height="26"

                          alt="Last" border="0"/>
                        <br/>
                      </xsl:if>
                    </td>
                  </xsl:otherwise>
                </xsl:choose>

                <!-- *** End Google result bar *** -->
              </tr>
            </table>

            <xsl:if test="$navigation_style != 'top'">

              <!--<xsl:text disable-output-escaping="yes">&lt;/div&gt;
        &lt;/center&gt;</xsl:text>-->
              <xsl:text disable-output-escaping="yes">&lt;/div&gt;</xsl:text>
            </xsl:if>

          </td>
        </tr>
      </table>
    </xsl:if>
  </xsl:template>

  <!-- **********************************************************************
Helper templates for generating Google result navigation (do not customize)
   only shows 10 sets up or down from current view
     ********************************************************************** -->
  <xsl:template name="result_nav">
    <xsl:param name="start" select="'0'"/>
    <xsl:param name="end"/>
    <xsl:param name="current_view"/>
    <xsl:param name="navigation_style"/>

    <!-- *** Choose how to show this result set *** -->
    <xsl:choose>
      <xsl:when test="($start)&lt;(($current_view)-(10*($num_results)))">
      </xsl:when>
      <xsl:when test="(($current_view)&gt;=($start)) and
                    (($current_view)&lt;(($start)+($num_results)))">
        <td>
          <xsl:if test="$navigation_style = 'google'">
            <img src="/nav_current.gif" width="16" height="26" alt="Current"/>
            <br/>
          </xsl:if>
          <xsl:if test="$navigation_style = 'link'">
            <xsl:call-template name="nbsp"/>
          </xsl:if>
          <span class="i">
            <xsl:value-of
          select="(($start)div($num_results))+1"/>
          </span>
          <xsl:if test="$navigation_style = 'link'">
            <xsl:call-template name="nbsp"/>
          </xsl:if>
        </td>
      </xsl:when>
      <xsl:otherwise>
        <td>
          <xsl:if test="$navigation_style = 'link'">
            <xsl:call-template name="nbsp"/>
          </xsl:if>
          <a href="search?{$search_url}&amp;start={$start}">
            <xsl:if test="$navigation_style = 'google'">
              <img src="/nav_page.gif" width="16" height="26" alt="Navigation"
                   border="0"/>
              <br/>
            </xsl:if>
            <xsl:value-of select="(($start)div($num_results))+1"/>
          </a>
          <xsl:if test="$navigation_style = 'link'">
            <xsl:call-template name="nbsp"/>
          </xsl:if>
        </td>
      </xsl:otherwise>
    </xsl:choose>

    <!-- *** Recursively iterate through result sets to display *** -->
    <xsl:if test="((($start)+($num_results))&lt;($end)) and
                ((($start)+($num_results))&lt;(($current_view)+
                (10*($num_results))))">
      <xsl:call-template name="result_nav">
        <xsl:with-param name="start" select="$start+$num_results"/>
        <xsl:with-param name="end" select="$end"/>
        <xsl:with-param name="current_view" select="$current_view"/>
        <xsl:with-param name="navigation_style" select="$navigation_style"/>
      </xsl:call-template>
    </xsl:if>

  </xsl:template>


  <!-- **********************************************************************
Top separation bar (do not customize)
     ********************************************************************** -->
  <xsl:template name="top_sep_bar">
    <xsl:param name="text"/>
    <xsl:param name="show_info"/>
    <xsl:param name="time"/>
    <table width="100%" cellpadding="0" cellspacing="0" border="0" bgcolor="#f4f4f4">
      <tr>
        <td nowrap="1" width="1%" bgcolor="#f4f4f4">
          <font size="+1">
            <xsl:call-template name="nbsp"/>
            <b>
              <xsl:value-of select="$text"/>
            </b>
          </font>
        </td>
        <td nowrap="1" align="right" bgcolor="#f4f4f4">
          <xsl:if test="$show_info != '0'">
            <font size="-1">
              <xsl:if test="count(/GSP/RES/R)>0 ">
                <xsl:choose>
                  <xsl:when test="$access = 's' or $access = 'a'">
                    Results <b>
                      <xsl:value-of select="RES/@SN"/>
                    </b> - <b>
                      <xsl:value-of select="RES/@EN"/>
                    </b> for <b>
                      <xsl:value-of select="$space_normalized_query"/>
                    </b>.
                  </xsl:when>
                  <xsl:otherwise>
                    Results <b>
                      <xsl:value-of select="RES/@SN"/>
                    </b> - <b>
                      <xsl:value-of select="RES/@EN"/>
                    </b> of about <b>
                      <xsl:value-of select="RES/M"/>
                    </b> for <b>
                      <xsl:value-of select="$space_normalized_query"/>
                    </b>.
                  </xsl:otherwise>
                </xsl:choose>
              </xsl:if>
              Search took <b>
                <xsl:value-of select="round($time * 100.0) div 100.0"/>
              </b> seconds.
            </font>
          </xsl:if>
        </td>
      </tr>
    </table>
    <hr class="z"/>
    <xsl:if test="$choose_sep_bar = 'line'">
      <hr size="1" color="gray"/>
    </xsl:if>
  </xsl:template>

  <xsl:template name="result_stats">
    <xsl:param name="time"/>
    <div style="margin-top:10px; min-width:800px;">
      <div style="float:left; max-width: 388px; min-width: 240px; width: 25%; height:16px;"></div>
      <div id="resultStats" style="color:#808080;">
        <font size="-1">
          <xsl:if test="count(/GSP/RES/R)>0 ">
            About <xsl:value-of select="RES/M"/>
            results
          </xsl:if>
          (<xsl:value-of select="round($time * 100.0) div 100.0"/> seconds)
        </font>
      </div>
    </div>
  </xsl:template>

  <!-- **********************************************************************
Analytics script (do not customize)
     ********************************************************************** -->
  <xsl:template name="analytics">
    <xsl:if test="string-length($analytics_account) != '0'">
      <script src="{$analytics_script_url}" type="text/javascript"></script>
      <script type="text/javascript">
        <xsl:comment>
          _uacct = "<xsl:value-of select='$analytics_account'/>";
          urchinTracker();
          //
        </xsl:comment>
      </script>
    </xsl:if>
  </xsl:template>

  <!-- **********************************************************************
Utility function for constructing copyright text (do not customize)
     ********************************************************************** -->
  <xsl:template name="copyright">
    <center>
      <br/>
      <br/>
      <p>
        <font face="arial,sans-serif" size="-1" color="#2f2f2f">
          Powered by Google Search Appliance
        </font>
      </p>
    </center>
  </xsl:template>


  <!-- **********************************************************************
Utility functions for generating html entities
     ********************************************************************** -->
  <xsl:template name="nbsp">
    <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
  </xsl:template>
  <xsl:template name="nbsp3">
    <xsl:call-template name="nbsp"/>
    <xsl:call-template name="nbsp"/>
    <xsl:call-template name="nbsp"/>
  </xsl:template>
  <xsl:template name="nbsp4">
    <xsl:call-template name="nbsp3"/>
    <xsl:call-template name="nbsp"/>
  </xsl:template>
  <xsl:template name="quot">
    <xsl:text disable-output-escaping="yes">&amp;quot;</xsl:text>
  </xsl:template>
  <xsl:template name="copy">
    <xsl:text disable-output-escaping="yes">&amp;copy;</xsl:text>
  </xsl:template>

  <!-- **********************************************************************
Utility functions for generating head elements so that the XSLT processor
won't add a meta tag to the output, since it may specify the wrong
encoding (utf8) in the meta tag.
     ********************************************************************** -->
  <xsl:template name="plainHeadStart">
    <xsl:text disable-output-escaping="yes">&lt;head&gt;</xsl:text>
    <meta name="robots" content="NOINDEX,NOFOLLOW"/>
    <xsl:text>
  </xsl:text>
  </xsl:template>
  <xsl:template name="plainHeadEnd">
    <xsl:text disable-output-escaping="yes">&lt;/head&gt;</xsl:text>
    <xsl:text>
  </xsl:text>
  </xsl:template>


  <!-- **********************************************************************
Utility functions for generating head elements with a meta tag to the output
specifying the character set as requested
     ********************************************************************** -->
  <xsl:template name="langHeadStart">
    <xsl:text disable-output-escaping="yes">&lt;head&gt;</xsl:text>
    <meta name="robots" content="NOINDEX,NOFOLLOW"/>
    <xsl:choose>
      <xsl:when test="PARAM[(@name='oe') and (@value='utf8')]">
        <meta http-equiv="content-type" content="text/html; charset=UTF-8"/>
      </xsl:when>
      <xsl:when test="PARAM[(@name='oe') and (@value!='')]">
        <meta http-equiv="content-type" content="text/html; charset={PARAM[@name='oe']/@value}"/>
      </xsl:when>
      <xsl:when test="PARAM[(@name='lr') and (@value='lang_zh-CN')]">
        <meta http-equiv="content-type" content="text/html; charset=GB2312"/>
      </xsl:when>
      <xsl:when test="PARAM[(@name='lr') and (@value='lang_zh-TW')]">
        <meta http-equiv="content-type" content="text/html; charset=Big5"/>
      </xsl:when>
      <xsl:when test="PARAM[(@name='lr') and (@value='lang_cs')]">
        <meta http-equiv="content-type" content="text/html; charset=ISO-8859-2"/>
      </xsl:when>
      <xsl:when test="PARAM[(@name='lr') and (@value='lang_da')]">
        <meta http-equiv="content-type" content="text/html; charset=ISO-8859-1"/>
      </xsl:when>
      <xsl:when test="PARAM[(@name='lr') and (@value='lang_nl')]">
        <meta http-equiv="content-type" content="text/html; charset=ISO-8859-1"/>
      </xsl:when>
      <xsl:when test="PARAM[(@name='lr') and (@value='lang_en')]">
        <meta http-equiv="content-type" content="text/html; charset=ISO-8859-1"/>
      </xsl:when>
      <xsl:when test="PARAM[(@name='lr') and (@value='lang_et')]">
        <meta http-equiv="content-type" content="text/html; charset=ISO-8859-1"/>
      </xsl:when>
      <xsl:when test="PARAM[(@name='lr') and (@value='lang_fi')]">
        <meta http-equiv="content-type" content="text/html; charset=ISO-8859-1"/>
      </xsl:when>
      <xsl:when test="PARAM[(@name='lr') and (@value='lang_fr')]">
        <meta http-equiv="content-type" content="text/html; charset=ISO-8859-1"/>
      </xsl:when>
      <xsl:when test="PARAM[(@name='lr') and (@value='lang_de')]">
        <meta http-equiv="content-type" content="text/html; charset=ISO-8859-1"/>
      </xsl:when>
      <xsl:when test="PARAM[(@name='lr') and (@value='lang_el')]">
        <meta http-equiv="content-type" content="text/html; charset=ISO-8859-7"/>
      </xsl:when>
      <xsl:when test="PARAM[(@name='lr') and (@value='lang_iw')]">
        <meta http-equiv="content-type" content="text/html; charset=ISO-8859-8-I"/>
      </xsl:when>
      <xsl:when test="PARAM[(@name='lr') and (@value='lang_hu')]">
        <meta http-equiv="content-type" content="text/html; charset=ISO-8859-2"/>
      </xsl:when>
      <xsl:when test="PARAM[(@name='lr') and (@value='lang_is')]">
        <meta http-equiv="content-type" content="text/html; charset=ISO-8859-1"/>
      </xsl:when>
      <xsl:when test="PARAM[(@name='lr') and (@value='lang_it')]">
        <meta http-equiv="content-type" content="text/html; charset=ISO-8859-1"/>
      </xsl:when>
      <xsl:when test="PARAM[(@name='lr') and (@value='lang_ja')]">
        <meta http-equiv="content-type" content="text/html; charset=Shift_JIS"/>
      </xsl:when>
      <xsl:when test="PARAM[(@name='lr') and (@value='lang_ko')]">
        <meta http-equiv="content-type" content="text/html; charset=EUC-KR"/>
      </xsl:when>
      <xsl:when test="PARAM[(@name='lr') and (@value='lang_lv')]">
        <meta http-equiv="content-type" content="text/html; charset=ISO-8859-1"/>
      </xsl:when>
      <xsl:when test="PARAM[(@name='lr') and (@value='lang_lt')]">
        <meta http-equiv="content-type" content="text/html; charset=ISO-8859-1"/>
      </xsl:when>
      <xsl:when test="PARAM[(@name='lr') and (@value='lang_no')]">
        <meta http-equiv="content-type" content="text/html; charset=ISO-8859-1"/>
      </xsl:when>
      <xsl:when test="PARAM[(@name='lr') and (@value='lang_pl')]">
        <meta http-equiv="content-type" content="text/html; charset=ISO-8859-2"/>
      </xsl:when>
      <xsl:when test="PARAM[(@name='lr') and (@value='lang_pt')]">
        <meta http-equiv="content-type" content="text/html; charset=ISO-8859-1"/>
      </xsl:when>
      <xsl:when test="PARAM[(@name='lr') and (@value='lang_ro')]">
        <meta http-equiv="content-type" content="text/html; charset=ISO-8859-2"/>
      </xsl:when>
      <xsl:when test="PARAM[(@name='lr') and (@value='lang_ru')]">
        <meta http-equiv="content-type" content="text/html; charset=windows-1251"/>
      </xsl:when>
      <xsl:when test="PARAM[(@name='lr') and (@value='lang_es')]">
        <meta http-equiv="content-type" content="text/html; charset=ISO-8859-1"/>
      </xsl:when>
      <xsl:when test="PARAM[(@name='lr') and (@value='lang_sv')]">
        <meta http-equiv="content-type" content="text/html; charset=ISO-8859-1"/>
      </xsl:when>
      <xsl:otherwise>
        <meta http-equiv="content-type" content="text/html; charset="/>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:text>
  </xsl:text>
  </xsl:template>

  <xsl:template name="langHeadEnd">
    <xsl:text disable-output-escaping="yes">&lt;/head&gt;</xsl:text>
    <xsl:text>
  </xsl:text>
  </xsl:template>


  <!-- **********************************************************************
Utility functions (do not customize)
     ********************************************************************** -->

  <!-- *** Find the substring after the last occurence of a separator *** -->
  <xsl:template name="last_substring_after">

    <xsl:param name="string"/>
    <xsl:param name="separator"/>
    <xsl:param name="fallback"/>

    <xsl:variable name="newString"
      select="substring-after($string, $separator)"/>

    <xsl:choose>
      <xsl:when test="$newString!=''">
        <xsl:call-template name="last_substring_after">
          <xsl:with-param name="string" select="$newString"/>
          <xsl:with-param name="separator" select="$separator"/>
          <xsl:with-param name="fallback" select="$newString"/>
        </xsl:call-template>
      </xsl:when>
      <xsl:otherwise>
        <xsl:value-of select="$fallback"/>
      </xsl:otherwise>
    </xsl:choose>

  </xsl:template>

  <!-- *** Find and replace *** -->
  <xsl:template name="replace_string">
    <xsl:param name="find"/>
    <xsl:param name="replace"/>
    <xsl:param name="string"/>
    <xsl:choose>
      <xsl:when test="contains($string, $find)">
        <xsl:value-of select="substring-before($string, $find)"/>
        <xsl:value-of select="$replace"/>
        <xsl:call-template name="replace_string">
          <xsl:with-param name="find" select="$find"/>
          <xsl:with-param name="replace" select="$replace"/>
          <xsl:with-param name="string"
            select="substring-after($string, $find)"/>
        </xsl:call-template>
      </xsl:when>
      <xsl:otherwise>
        <xsl:value-of select="$string"/>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>

  <!-- *** Decode hex encoding *** -->
  <xsl:template name="decode_hex">
    <xsl:param name="encoded" />

    <xsl:variable name="hex" select="'0123456789ABCDEF'" />
    <xsl:variable name="ascii"> !"#$%&amp;'()*+,-./0123456789:;&lt;=&gt;?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\]^_`abcdefghijklmnopqrstuvwxyz{|}~</xsl:variable>

    <xsl:choose>
      <xsl:when test="contains($encoded,'%')">
        <xsl:value-of select="substring-before($encoded,'%')" />
        <xsl:variable name="hexpair" select="translate(substring(substring-after($encoded,'%'),1,2),'abcdef','ABCDEF')" />
        <xsl:variable name="decimal" select="(string-length(substring-before($hex,substring($hexpair,1,1))))*16 + string-length(substring-before($hex,substring($hexpair,2,1)))" />
        <xsl:choose>
          <xsl:when test="$decimal &lt; 127 and $decimal &gt; 31">
            <xsl:value-of select="substring($ascii,$decimal - 31,1)" />
          </xsl:when>
          <xsl:when test="$decimal &gt; 159">
            <xsl:text disable-output-escaping="yes">%</xsl:text>
            <xsl:value-of select="$hexpair" />
          </xsl:when>
          <xsl:otherwise>?</xsl:otherwise>
        </xsl:choose>
        <xsl:call-template name="decode_hex">
          <xsl:with-param name="encoded" select="substring(substring-after($encoded,'%'),3)" />
        </xsl:call-template>
      </xsl:when>
      <xsl:otherwise>
        <xsl:value-of select="$encoded" />
      </xsl:otherwise>
    </xsl:choose>

  </xsl:template>

  <!-- *** Convert UNC *** -->
  <xsl:template name="convert_unc">
    <xsl:param name="string"/>
    <xsl:variable name="slash">/</xsl:variable>
    <xsl:variable name="backslash">\</xsl:variable>
    <xsl:variable name="escaped_ampersand">&amp;amp;</xsl:variable>
    <xsl:variable name="unescaped_ampersand">&amp;</xsl:variable>

    <xsl:variable name="converted_1">
      <xsl:call-template name="replace_string">
        <xsl:with-param name="find"    select="$slash"/>
        <xsl:with-param name="replace" select="$backslash"/>
        <xsl:with-param name="string"  select="$string"/>
      </xsl:call-template>
    </xsl:variable>

    <xsl:variable name="converted_2">
      <xsl:call-template name="decode_hex">
        <xsl:with-param name="encoded" select="$converted_1"/>
      </xsl:call-template>
    </xsl:variable>

    <xsl:variable name="converted_3">
      <xsl:call-template name="replace_string">
        <xsl:with-param name="find"    select="$escaped_ampersand"/>
        <xsl:with-param name="replace" select="$unescaped_ampersand"/>
        <xsl:with-param name="string"  select="$converted_2"/>
      </xsl:call-template>
    </xsl:variable>

    <xsl:value-of disable-output-escaping='yes' select="concat($backslash,$backslash,$converted_3)"/>

  </xsl:template>

  <xsl:template name="remove_topicnumber">
    <xsl:param name="title"/>
    <xsl:variable name="space_char" select="' '"/>
    <xsl:variable name="period_char" select="'.'"/>
    <xsl:choose>
      <xsl:when test="contains($title, $space_char)">
        <xsl:choose>
          <xsl:when test="contains(substring-before($title, $space_char), $period_char)">
            <xsl:variable name="new_string" select="substring-after($title, $space_char)"/>
            <xsl:value-of select="$new_string"/>
          </xsl:when>
          <xsl:otherwise>
            <xsl:value-of select="$title"/>
          </xsl:otherwise>
        </xsl:choose>
      </xsl:when>
      <xsl:otherwise>
        <xsl:value-of select="$title"/>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>
  
  <!-- **********************************************************************
Display error messages
     ********************************************************************** -->
  <xsl:template name="error_page">
    <xsl:param name="errorMessage"/>
    <xsl:param name="errorDescription"/>

    <html>
      <xsl:call-template name="plainHeadStart"/>
      <title>
        <xsl:value-of select="$error_page_title"/>
      </title>
      <xsl:call-template name="style2"/>
      <xsl:call-template name="plainHeadEnd"/>
      <body dir="ltr" min-width="800px">
        <xsl:call-template name="analytics"/>

        <xsl:call-template name="my_page_header"/>

        <xsl:if test="$show_logo != '0'">
          <table border="0" cellpadding="0" cellspacing="0">
            <tr>
              <td rowspan="3" valign="top">
                <xsl:call-template name="logo"/>
                <xsl:call-template name="nbsp3"/>
              </td>
            </tr>
          </table>
        </xsl:if>

        <xsl:call-template name="result_stats">
          <xsl:with-param name="time" select="0"/>
        </xsl:call-template>
        <p>
          <table width="99%" border="0" cellpadding="2" cellspacing="0">
            <tr>
              <td>
                <font color="#990000" size="+1">Message:</font>
              </td>
              <td>
                <font color="#990000" size="+1">
                  <xsl:value-of select="$errorMessage"/>
                </font>
              </td>
            </tr>
            <tr>
              <td>
                <font color="#990000">Description:</font>
              </td>
              <td>
                <font color="#990000">
                  <xsl:value-of select="$errorDescription"/>
                </font>
              </td>
            </tr>
            <tr>
              <td>
                <font color="#990000">Details:</font>
              </td>
              <td>
                <font color="#990000">
                  <xsl:copy-of select="/"/>
                </font>
              </td>
            </tr>
          </table>
        </p>

        <hr/>
        <xsl:call-template name="copyright"/>
        <xsl:call-template name="my_page_footer"/>

      </body>
    </html>
  </xsl:template>


  <!-- **********************************************************************
Google Desktop for Enterprise integration templates
     ********************************************************************** -->
  <xsl:template name="desktop_tab">

    <!-- *** Show the Google tabs *** -->

    <font size="-1">
      <a class="q" onClick="return window.qs?qs(this):1" href="http://www.google.com/search?q={$qval}">Web</a>
    </font>

    <xsl:call-template name="nbsp4"/>

    <font size="-1">
      <a class="q" onClick="return window.qs?qs(this):1" href="http://images.google.com/images?q={$qval}">Images</a>
    </font>

    <xsl:call-template name="nbsp4"/>

    <font size="-1">
      <a class="q" onClick="return window.qs?qs(this):1" href="http://groups.google.com/groups?q={$qval}">Groups</a>
    </font>

    <xsl:call-template name="nbsp4"/>

    <font size="-1">
      <a class="q" onClick="return window.qs?qs(this):1" href="http://news.google.com/news?q={$qval}">News</a>
    </font>

    <xsl:call-template name="nbsp4"/>

    <font size="-1">
      <a class="q" onClick="return window.qs?qs(this):1" href="http://local.google.com/local?q={$qval}">Local</a>
    </font>

    <xsl:call-template name="nbsp4"/>

    <!-- *** Show the desktop and web tabs *** -->

    <xsl:if test="CUSTOM/HOME">
      <xsl:comment>trh2</xsl:comment>
    </xsl:if>
    <xsl:if test="Q">
      <xsl:comment>trl2</xsl:comment>
    </xsl:if>

    <!-- *** Show the appliance tab *** -->
    <font size="-1">
      <b>
        <xsl:value-of select="$egds_appliance_tab_label"/>
      </b>
    </font>

  </xsl:template>

  <xsl:template name="desktop_results">
    <xsl:comment>tro2</xsl:comment>
  </xsl:template>

  <!-- **********************************************************************
  OneBox results (if any)
     ********************************************************************** -->
  <xsl:template name="onebox">
    <xsl:for-each select="/GSP/ENTOBRESULTS">
      <xsl:apply-templates/>
    </xsl:for-each>
  </xsl:template>

  <!-- **********************************************************************
Swallow unmatched elements
     ********************************************************************** -->
  <xsl:template match="@*|node()"/>
</xsl:stylesheet>


<!-- *** END OF STYLESHEET *** -->
package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class home_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  private org.apache.jasper.runtime.TagHandlerPool _jspx_tagPool_c_forEach_var_items;
  private org.apache.jasper.runtime.TagHandlerPool _jspx_tagPool_c_if_test;

  private org.glassfish.jsp.api.ResourceInjector _jspx_resourceInjector;

  public java.util.List<String> getDependants() {
    return _jspx_dependants;
  }

  public void _jspInit() {
    _jspx_tagPool_c_forEach_var_items = org.apache.jasper.runtime.TagHandlerPool.getTagHandlerPool(getServletConfig());
    _jspx_tagPool_c_if_test = org.apache.jasper.runtime.TagHandlerPool.getTagHandlerPool(getServletConfig());
  }

  public void _jspDestroy() {
    _jspx_tagPool_c_forEach_var_items.release();
    _jspx_tagPool_c_if_test.release();
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;

    try {
      response.setContentType("text/html;charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<html lang=\"en\">\n");
      out.write("    <head>\n");
      out.write("        <meta charset=\"utf-8\">\n");
      out.write("        <title>Happy Store</title>\n");
      out.write("        <meta name=\"viewport\" content=\"width=device-width, initial-scale=1\">\n");
      out.write("        <link rel=\"stylesheet\" href=\"https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css\" integrity=\"sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2\" crossorigin=\"anonymous\">\n");
      out.write("        <script src=\"https://kit.fontawesome.com/a076d05399.js\"></script><link rel=\"stylesheet\" type=\"text/css\" href=\"style.css\">\n");
      out.write("    </head>\n");
      out.write("    <body>\n");
      out.write("        <div class=\"container-fluid content\">\n");
      out.write("            <div class=\"container \">\n");
      out.write("  \n");
      out.write("            \n");
      out.write("                <div class=\"navbar navbar-expand-lg\">\n");
      out.write("                    <div class=\"logo\">\n");
      out.write("                        <a href=\"home.jsp\"> <img src=\"images/happylogo.jpg\" width=\"125 px\" class=\"img-thumbnail\"></a>  \n");
      out.write("                    </div>\n");
      out.write("                    <nav>\n");
      out.write("\n");
      out.write("                        <ul>\n");
      out.write("                            <li class=\"nav-item\">\n");
      out.write("                                <a class=\"nav-link\" href=\"home.jsp\">Home</a>\n");
      out.write("                            </li>\n");
      out.write("                            <li class=\"nav-item\">\n");
      out.write("                                <a class=\"nav-link\" href=\"list?cate_id=null&id=null\">Product</a>\n");
      out.write("                            </li>\n");
      out.write("                            <li class=\"nav-item\">\n");
      out.write("                                <a class=\"nav-link\" href=\"#info\">About</a>\n");
      out.write("                            </li>\n");
      out.write("                            <li class=\"nav-item\">\n");
      out.write("                                <a class=\"nav-link\" href=\"#info\">Contact</a>\n");
      out.write("                            </li>\n");
      out.write("\n");
      out.write("                            <li class=\"nav-item dropdown\">\n");
      out.write("                                <a class=\"nav-link dropdown-toggle\" href=\"#\" id=\"navbarDropdown\" role=\"button\" data-toggle=\"dropdown\" aria-haspopup=\"true\" aria-expanded=\"fasle\">\n");
      out.write("                                    Account\n");
      out.write("                                </a>\n");
      out.write("                                <div class=\"dropdown-menu\" aria-labelledby=\"navbarDropdown\">\n");
      out.write("                                    ");
 if (session.getAttribute("login") != null) { 
      out.write("\n");
      out.write("                                      <a class=\"dropdown-item\" href=\"viewbill\">View Bill</a>\n");
      out.write("                                      ");
 if (session.getAttribute("account").equals("user")) { 
      out.write("        <a class=\"dropdown-item\" href=\"ChangeAccount.jsp\">Change Acount </a> ");
}
      out.write("\n");
      out.write("                                       ");
 if (session.getAttribute("account").equals("admin")) { 
      out.write("        <a class=\"dropdown-item\" href=\"AddProduct.jsp\">Add Product </a> ");
}
      out.write("\n");
      out.write("                                    <a class=\"dropdown-item\" href=\"logout\">Logout</a>  \n");
      out.write("\n");
      out.write("                                    ");
} else { 
      out.write("\n");
      out.write("                                    <a class=\"dropdown-item admin-login\"  onclick=\"adminLogin()\">Admin login</a>\n");
      out.write("                                    <a class=\"dropdown-item\" href=\"login.jsp\">User login</a>\n");
      out.write("\n");
      out.write("                                    ");
}
      out.write("\n");
      out.write("\n");
      out.write("                                </div>\n");
      out.write("                            </li>\n");
      out.write("\n");
      out.write("\n");
      out.write("                        </ul>\n");
      out.write("                                    <a  href=\"");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${(sessionScope.account != 'user')?\"#\":\"Cart.jsp\"}", java.lang.String.class, (PageContext)_jspx_page_context, null));
      out.write('"');
      out.write(' ');
      if (_jspx_meth_c_if_0(_jspx_page_context))
        return;
      out.write("><img id=\"cart\"src=\"images/cart.png\" alt=\"Cart\" width=\"30px\" height=\"30px\"></a> \n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("                    </nav>\n");
      out.write("\n");
      out.write("                </div>\n");
      out.write("                <div class=\"row1\">\n");
      out.write("                    <div class=\"col1-2\" id=\"descript\">\n");
      out.write("                        <h1>Cheaper than your thought!</h1>\n");
      out.write("                        <p>Buy what you don’t have yet or what you really want, which can be mixed with what you already own. Buy only because something excites you, not just for the simple act of shopping</p>\n");
      out.write("                        <a href=\"list?cate_id=null&id=null\" class=\"btn\">Explore Now &#8594;</a>\n");
      out.write("                    </div>\n");
      out.write("                    <div class=\"col1-2\">\n");
      out.write("                        <img src=\"images/image1.png\" alt=\"screeen\">\n");
      out.write("                    </div>\n");
      out.write("                    <!--           -------------------------------------------     loginuserform------------------>\n");
      out.write("                    <form action=\"login?account=admin\" class=\"formAdminLogin\" id=\"admin_form\" method=\"post\">\n");
      out.write("                        <div class=\"form-group\">\n");
      out.write("\n");
      out.write("                            <input name=\"id\" type=\"text\" required class=\"form-control\"  placeholder=\"Username\"/>\n");
      out.write("                        </div>\n");
      out.write("                        <div class=\"form-group\">\n");
      out.write("\n");
      out.write("                            <input name=\"pass\" type=\"password\" required class=\"form-control\"  placeholder=\"Password\"/>\n");
      out.write("                        </div>\n");
      out.write("                        <div class=\"form-check lable\">\n");
      out.write("                            <input class=\"form-check-input\" required type=\"checkbox\" id=\"gridCheck\">\n");
      out.write("                            <label class=\"form-check-label\" for=\"gridCheck\">\n");
      out.write("                                I agree with policies\n");
      out.write("                            </label>\n");
      out.write("                        </div>\n");
      out.write("                        <div class=\"button-form\">\n");
      out.write("                            <button type=\"submit\" class=\"btn btn-warning\">Sign in</button>\n");
      out.write("                            <button  class=\"btn btn-warning\" onclick=\"cancelLogin()\">Cancel</button>\n");
      out.write("                        </div>\n");
      out.write("\n");
      out.write("                    </form>\n");
      out.write("                    <!--   -------------------------------------------     login userform------------------>\n");
      out.write("                </div>\n");
      out.write("            </div>\n");
      out.write("        </div>\n");
      out.write("        <section class=\"danhmuc\" >\n");
      out.write("\n");
      out.write("            <div class=\"container\">\n");
      out.write("                <h2>Category Product</h2>\n");
      out.write("                ");
      dal.DAO db = null;
      synchronized (_jspx_page_context) {
        db = (dal.DAO) _jspx_page_context.getAttribute("db", PageContext.PAGE_SCOPE);
        if (db == null){
          db = new dal.DAO();
          _jspx_page_context.setAttribute("db", db, PageContext.PAGE_SCOPE);
        }
      }
      out.write("\n");
      out.write("\n");
      out.write("                ");
 int i = 0; 
      out.write("\n");
      out.write("                ");
      //  c:forEach
      org.apache.taglibs.standard.tag.rt.core.ForEachTag _jspx_th_c_forEach_0 = (org.apache.taglibs.standard.tag.rt.core.ForEachTag) _jspx_tagPool_c_forEach_var_items.get(org.apache.taglibs.standard.tag.rt.core.ForEachTag.class);
      _jspx_th_c_forEach_0.setPageContext(_jspx_page_context);
      _jspx_th_c_forEach_0.setParent(null);
      _jspx_th_c_forEach_0.setItems((java.lang.Object) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${db.loadAllCategory()}", java.lang.Object.class, (PageContext)_jspx_page_context, null));
      _jspx_th_c_forEach_0.setVar("c");
      int[] _jspx_push_body_count_c_forEach_0 = new int[] { 0 };
      try {
        int _jspx_eval_c_forEach_0 = _jspx_th_c_forEach_0.doStartTag();
        if (_jspx_eval_c_forEach_0 != javax.servlet.jsp.tagext.Tag.SKIP_BODY) {
          do {
            out.write("\n");
            out.write("                    ");
if (i % 4 == 0) { 
            out.write("\n");
            out.write("                    <div class=\"row\">\n");
            out.write("                        ");
}
            out.write("\n");
            out.write("                        <div class=\"col-lg-3\">\n");
            out.write("                            <div class=\" product-cate\">\n");
            out.write("                                <a href=\"list?cate_id=");
            out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${c.id}", java.lang.String.class, (PageContext)_jspx_page_context, null));
            out.write("&id=null\">\n");
            out.write("                                    <img class=\"image-Product\" src=\"");
            out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${c.source}", java.lang.String.class, (PageContext)_jspx_page_context, null));
            out.write("\" alt=\"\">\n");
            out.write("                                </a>\n");
            out.write("                                <figcaption>");
            out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${c.name}", java.lang.String.class, (PageContext)_jspx_page_context, null));
            out.write("</figcaption>\n");
            out.write("                            </div>\n");
            out.write("                        </div>\n");
            out.write("                        ");
if (i % 4 == 3) { 
            out.write("\n");
            out.write("                    </div>\n");
            out.write("                    ");
}
                        i++;
                    
            out.write("\n");
            out.write("                ");
            int evalDoAfterBody = _jspx_th_c_forEach_0.doAfterBody();
            if (evalDoAfterBody != javax.servlet.jsp.tagext.BodyTag.EVAL_BODY_AGAIN)
              break;
          } while (true);
        }
        if (_jspx_th_c_forEach_0.doEndTag() == javax.servlet.jsp.tagext.Tag.SKIP_PAGE) {
          return;
        }
      } catch (Throwable _jspx_exception) {
        while (_jspx_push_body_count_c_forEach_0[0]-- > 0)
          out = _jspx_page_context.popBody();
        _jspx_th_c_forEach_0.doCatch(_jspx_exception);
      } finally {
        _jspx_th_c_forEach_0.doFinally();
        _jspx_tagPool_c_forEach_var_items.reuse(_jspx_th_c_forEach_0);
      }
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("            </div>\n");
      out.write("\n");
      out.write("        </section>\n");
      out.write("                <section id=\"info\" class=\"Info\">\n");
      out.write("            <div class=\"container\">\n");
      out.write("                <div class=\"row\">\n");
      out.write("                    <div class=\"col-lg-3 cskh\">\n");
      out.write("                        <h6>Customer care</h6>\n");
      out.write("                        <ul>\n");
      out.write("                            <li>Help Center</li>\n");
      out.write("                            <li>Happy Blog</li>\n");
      out.write("                            <li>Shopping guide</li>\n");
      out.write("                            <li>Sales guide</li>\n");
      out.write("                            <li>Payment</li>\n");
      out.write("                            <li>Shipping</li>\n");
      out.write("                            <li>Customer care </li>\n");
      out.write("                            <li>Warranty Policy</li>\n");
      out.write("                        </ul>\n");
      out.write("                    </div>\n");
      out.write("                    <div class=\"col-lg-3\">\n");
      out.write("                        <div>\n");
      out.write("                            <h6>Payment</h6>\n");
      out.write("                            <div class=\"social-icons\">\n");
      out.write("                                <i class=\"fab fa-cc-visa\"></i>\n");
      out.write("                                <i class=\"fab fa-cc-mastercard\"></i>\n");
      out.write("                                <i class=\"fab fa-cc-jcb\"></i>\n");
      out.write("\n");
      out.write("                            </div>\n");
      out.write("                        </div>\n");
      out.write("                    </div>\n");
      out.write("                    <div class=\"col-lg-3\">\n");
      out.write("                        <h6>Follow us </h6>\n");
      out.write("                        <div class=\"social-media\">\n");
      out.write("                            <a href=\"#\" class=\"socialMedia-icons\">\n");
      out.write("                                <i class=\"fab fa-facebook\"></i>FaceBook\n");
      out.write("                            </a>\n");
      out.write("                        </div>\n");
      out.write("                        <div> <a href=\"#\" class=\"socialMedia-icons\">\n");
      out.write("                                <i class=\"fab fa-twitter-square\"></i>Twitter\n");
      out.write("                            </a></div>\n");
      out.write("                        <div> <a href=\"#\" class=\"socialMedia-icons\">\n");
      out.write("                                <i class=\"fab fa-google\"></i>Google\n");
      out.write("                            </a></div>\n");
      out.write("                        <div> <a href=\"#\" class=\"socialMedia-icons\">\n");
      out.write("                                <i class=\"fab fa-linkedin-in\"></i>Linked in\n");
      out.write("                            </a></div>\n");
      out.write("\n");
      out.write("                    </div>\n");
      out.write("\n");
      out.write("                    <div class=\"col-lg-3\">\n");
      out.write("                        <h6>Download app</h6>\n");
      out.write("                        <div class=\"image-footer\"><img src=\"images/qr.png\" alt=\"\"></div>\n");
      out.write("                        <div>\n");
      out.write("                            <div> <a href=\"#\" class=\"socialMedia-icons\">\n");
      out.write("                                    <i class=\"fab fa-apple\"></i> App store\n");
      out.write("                                </a></div>\n");
      out.write("                            <div> <a href=\"#\" class=\"socialMedia-icons\">\n");
      out.write("                                    <i class=\"fab fa-google-play\"></i>Google Play\n");
      out.write("                                </a></div>\n");
      out.write("                        </div>\n");
      out.write("                    </div>\n");
      out.write("                </div>\n");
      out.write("            </div>\n");
      out.write("\n");
      out.write("        </section>\n");
      out.write("        <footer>\n");
      out.write("            <p>Copyright &copy; 2020 by BUI DUC THANG</p>\n");
      out.write("        </footer>\n");
      out.write("        <script src=\"https://code.jquery.com/jquery-3.5.1.slim.min.js\" integrity=\"sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj\" crossorigin=\"anonymous\"></script>\n");
      out.write("        <script src=\"https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js\" integrity=\"sha384-ho+j7jyWK8fNQe+A12Hb8AhRq26LrZ/JpcUGGOn+Y7RsweNrtN/tE3MoK7ZeZDyx\" crossorigin=\"anonymous\"></script>\n");
      out.write("        <script src=\"homeScript.js\"></script>\n");
      out.write("    </body>\n");
      out.write("</html>");
    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          out.clearBuffer();
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }

  private boolean _jspx_meth_c_if_0(PageContext _jspx_page_context)
          throws Throwable {
    PageContext pageContext = _jspx_page_context;
    JspWriter out = _jspx_page_context.getOut();
    //  c:if
    org.apache.taglibs.standard.tag.rt.core.IfTag _jspx_th_c_if_0 = (org.apache.taglibs.standard.tag.rt.core.IfTag) _jspx_tagPool_c_if_test.get(org.apache.taglibs.standard.tag.rt.core.IfTag.class);
    _jspx_th_c_if_0.setPageContext(_jspx_page_context);
    _jspx_th_c_if_0.setParent(null);
    _jspx_th_c_if_0.setTest(((java.lang.Boolean) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${sessionScope.account != 'user'}", java.lang.Boolean.class, (PageContext)_jspx_page_context, null)).booleanValue());
    int _jspx_eval_c_if_0 = _jspx_th_c_if_0.doStartTag();
    if (_jspx_eval_c_if_0 != javax.servlet.jsp.tagext.Tag.SKIP_BODY) {
      do {
        out.write(" onclick=\"notLogin()\" ");
        int evalDoAfterBody = _jspx_th_c_if_0.doAfterBody();
        if (evalDoAfterBody != javax.servlet.jsp.tagext.BodyTag.EVAL_BODY_AGAIN)
          break;
      } while (true);
    }
    if (_jspx_th_c_if_0.doEndTag() == javax.servlet.jsp.tagext.Tag.SKIP_PAGE) {
      _jspx_tagPool_c_if_test.reuse(_jspx_th_c_if_0);
      return true;
    }
    _jspx_tagPool_c_if_test.reuse(_jspx_th_c_if_0);
    return false;
  }
}

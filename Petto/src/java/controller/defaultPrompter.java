package controller;

import javax.annotation.Resource;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import javax.transaction.UserTransaction;
import model.*;

public class defaultPrompter {

    @PersistenceContext
    EntityManager em;
    @Resource
    Query query;
    @Resource
    UserTransaction utx;

    public defaultPrompter() {

    }

    public String headerReturn() {
        return "    <!--Default Header -->\n"
                + "    <header>\n"
                + "        <div id=\"header_banner\" >\n"
                + "            <p id=\"header_banner_p\" style=\"background-color: #D9D9D9; width: 100%;  height: 100%; text-align:center;\">free shipping malaysia-wide for orders RM 150 above</p>\n"
                + "        </div>\n"
                + "        <nav>\n"
                + "            <ul>\n"
                + "                <li><a href=\"index.jsp\"><img style=\"width: 100px; height: 100px;\"  src= \"image/homepage/petto_logo.png\" alt=\"Petto Logo\"></a></li>\n"
                + "                <li><a href=\"about.jsp\">about us </a></li>\n"
                + "                <li><form method=\"get\" action=\"ViewInventory\"><input type=\"submit\" value=\"shop\" style=\"border: none; background-color: white; color: black;\"></form></li>\n"
                + "                <li><a href=\"sizeguide.jsp\">size guide</a></li>\n"
                + "                <li><a href=\"TC.jsp\">t&c</a></li>\n"
                + "                <li><a href=\"shipping.jsp\">shipping & returns</a></li>\n"
                + "                <li><a href=\"login.jsp\">login</a></li>\n"
                + "                <li><a href=\"signup.jsp\">sign up</a></li>\n"
                + "                <li><a href=\"#\"><img style=\"width: 20px; height: 20px;\"  src= \"image/homepage/shopping_cart.png\" alt=\"Shopping Cart\"></a></li>            </ul>   \n"
                + "        </nav>\n"
                + "    </header>";
    }

    public String headerReturn(Users user) {

        if (user.getUserType().equals("STAFF") || user.getUserType().equals("MANAGER")) {
            return "    <!--Default Header -->\n"
                    + "    <header>\n"
                    + "        <div id=\"header_banner\" >\n"
                    + "            <p id=\"header_banner_p\" style=\"background-color: #D9D9D9; width: 100%;  height: 100%; text-align:center;\">free shipping malaysia-wide for orders RM 150 above</p>\n"
                    + "        </div>\n"
                    + "        <nav>\n"
                    + "            <ul>\n"
                    + "                <li><a href=\"index.jsp\"><img style=\"width: 100px; height: 100px;\"  src= \"image/homepage/petto_logo.png\" alt=\"Petto Logo\"></a></li>\n"
                    + "                <li><a href=\"about.jsp\">about us </a></li>\n"
                    + "                <li><form method=\"get\" action=\"ViewInventory\"><input type=\"submit\" value=\"shop\" style=\"border: none; background-color: white; color: black;\"></form></li>\n"
                    + "                <li><a href=\"sizeguide.jsp\">size guide</a></li>\n"
                    + "                <li><a href=\"TC.jsp\">t&c</a></li>\n"
                    + "                <li><a href=\"shipping.jsp\">shipping & returns</a></li>\n"
                    + "                <li><a href=\"login.jsp\">login</a></li>\n"
                    + "                <li><a href=\"signup.jsp\">sign up</a></li>\n"
                    + "                <li><a href=\"manager_management.jsp\">admin</a></li>\n"
                    + "                <li><a href=\"#\"><img style=\"width: 20px; height: 20px;\"  src= \"image/homepage/shopping_cart.png\" alt=\"Shopping Cart\"></a></li>            </ul>   \n"
                    + "        </nav>\n"
                    + "    </header>";
        } else {

            return "    <!--Default Header -->\n"
                    + "    <header>\n"
                    + "        <div id=\"header_banner\" >\n"
                    + "            <p id=\"header_banner_p\" style=\"background-color: #D9D9D9; width: 100%;  height: 100%; text-align:center;\">free shipping malaysia-wide for orders RM 150 above</p>\n"
                    + "        </div>\n"
                    + "        <nav>\n"
                    + "            <ul>\n"
                    + "                <li><a href=\"index.jsp\"><img style=\"width: 100px; height: 100px;\"  src= \"image/homepage/petto_logo.png\" alt=\"Petto Logo\"></a></li>\n"
                    + "                <li><a href=\"about.jsp\">about us </a></li>\n"
                    + "                <li><form method=\"get\" action=\"ViewInventory\"><input type=\"submit\" value=\"shop\" style=\"border: none; background-color: white; color: black;\"></form></li>\n"
                    + "                <li><a href=\"sizeguide.jsp\">size guide</a></li>\n"
                    + "                <li><a href=\"TC.jsp\">t&c</a></li>\n"
                    + "                <li><a href=\"shipping.jsp\">shipping & returns</a></li>\n"
                    + "                <li><a href=\"login.jsp\">login</a></li>\n"
                    + "                <li><a href=\"signup.jsp\">sign up</a></li>\n"
                    + "                <li><a href=\"#\"><img style=\"width: 20px; height: 20px;\"  src= \"image/homepage/shopping_cart.png\" alt=\"Shopping Cart\"></a></li>            </ul>   \n"
                    + "        </nav>\n"
                    + "    </header>";
        }
    }

    public String footerReturn() {
        return "    <footer>\n"
                + "        <div class=\"footer_sections\"></div>\n"
                + "        <div id=\"first_footer\" class=\"footer_sections\">\n"
                + "            <p>help</p><br/>\n"
                + "            <a href=\"sizeguide.jsp\">size guide</a><br/><br/>\n"
                + "            <a href=\"shipping.jsp\">shipping policy</a><br/><br/>\n"
                + "            <a href=\"contact.jsp\">contact us</a><br/><br/>\n"
                + "            <a href=\"about.jsp\">about us</a>\n"
                + "        </div>\n"
                + "        <div class=\"footer_sections\">\n"
                + "            <p>woof woof wooffff</p><br/>\n"
                + "            <a href=\"TC.jsp\">t&c</a><br/><br/>\n"
                + "            <a>© 2024, Petto</a>\n"
                + "        </div>\n"
                + "        <div class=\"footer_sections\">\n"
                + "            <p>social</p><br/>\n"
                + "            <a>instagram</a><br/><br/>\n"
                + "            <a>facebook</a><br/><br/>\n"
                + "            <a>whatsapp</a>\n"
                + "        </div>\n"
                + "        <div class=\"push\"></div>\n"
                + "        <div id=\"footer_image\">\n"
                + "            <a href=\"index.jsp\"><img style=\"width: 150px; height: 150px;\"  src= \"image/homepage/petto_logo.png\" alt=\"Petto Logo\"></a>\n"
                + "        </div>   \n"
                + "    </footer>\n"
                + "    <br/><br/>\n"
                + "    <address>\n"
                + "        Ground Floor, Bangunan Tan Sri Khaw Kai Boh (Block A), Jalan Genting Kelang, Setapak, 53300 Kuala Lumpur, Federal Territory of Kuala Lumpur\n"
                + "    </address>";
    }

    public String noUsername() {
        return "<link rel=\"stylesheet\" href=\"css/default.css\">"
                + "<h2 style = \"text-align: center; color: red; font-family: LeagueSpartan;\">Username Needed!</h2><br/>"
                + "<br/><p style = \"text-align: center\"><a href = \"login.jsp\" style = \"text-decoration: underline\">Go Back</a></p>";
    }

    public String noPassword() {
        return "<link rel=\"stylesheet\" href=\"css/default.css\">"
                + "<h2 style = \"text-align: center; color: red; font-family: LeagueSpartan;\">Password Needed!</h2><br/>"
                + "<br/><p style = \"text-align: center\"><a href = \"login.jsp\" style = \"text-decoration: underline\">Go Back</a></p>";
    }

    public String noUandPs() {
        return "<link rel=\"stylesheet\" href=\"css/default.css\">"
                + "<h2 style = \"text-align: center; color: red; font-family: LeagueSpartan;\">Username and Password Needed!</h2><br/>"
                + "<br/><p style = \"text-align: center\"><a href = \"login.jsp\" style = \"text-decoration: underline\">Go Back</a></p>";
    }

}

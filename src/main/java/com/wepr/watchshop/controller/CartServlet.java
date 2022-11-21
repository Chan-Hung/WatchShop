package com.wepr.watchshop.controller;

import com.wepr.watchshop.dao.ProductDAO;
import com.wepr.watchshop.model.Cart;
import com.wepr.watchshop.model.Item;
import com.wepr.watchshop.model.Product;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "CartServlet", value = "/cart")
public class CartServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//        doPost(request,response);

        // get current action
        String action = request.getParameter("action");
        String url = null;
        if (action == null)
            action = "cart";

        if (action.equals("shop")) {
            url = "/public/index.jsp"; // the "index" page
        } else if (action.equals("cart")) {
            String productId = request.getParameter("productId");
            String quantityString = request.getParameter("quantity");

            HttpSession session = request.getSession();
            Cart cart = (Cart) session.getAttribute("cart");
            if (cart == null) {
                cart = new Cart();
            }

            if (productId == null & quantityString == null)
                session.setAttribute("cart", cart);
            else {
                int quantity;
                try {
                    quantity = Integer.parseInt(quantityString);
                    if (quantity < 0) {
                        quantity = 1;
                    }
                } catch (NumberFormatException nfe) {
                    quantity = 1;
                }
                ProductDAO productDAO = new ProductDAO();
                Product product = productDAO.getProductById(Long.parseLong(productId));
                Item item = new Item();
                item.setProduct(product);
                item.setQuantity(quantity);
                item.setAmount(product.getPrice() * quantity);

                if (quantity > 0) {
                    cart.addItem(item);
                } else if (quantity == 0) {
                    cart.removeItem(item);
                }
            }
            session.setAttribute("cart", cart);

            //Calculate final total = sum all amount
            Long subTotal = 0L;
            for (Item item: cart.getItems())
                subTotal += item.getAmount();
            session.setAttribute("subTotal", subTotal);

            url = "/public/cart.jsp";
        } else if (action.equals("checkout")) {
            url = "/public/checkout.jsp";
        }

        getServletContext()
                .getRequestDispatcher(url)
                .forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // get current action
        String action = request.getParameter("action");
        String url = null;
        if (action == null)
            action = "cart";

        if (action.equals("shop")) {
            url = "/public/index.jsp"; // the "index" page
        } else if (action.equals("cart")) {
            String productId = request.getParameter("productId");
            String quantityString = request.getParameter("quantity");

            HttpSession session = request.getSession();
            Cart cart = (Cart) session.getAttribute("cart");
            if (cart == null) {
                cart = new Cart();
            }

            if (productId == null & quantityString == null)
                session.setAttribute("cart", cart);
            else {
                int quantity;
                try {
                    quantity = Integer.parseInt(quantityString);
                    if (quantity < 0) {
                        quantity = 1;
                    }
                } catch (NumberFormatException nfe) {
                    quantity = 1;
                }
                ProductDAO productDAO = new ProductDAO();
                Product product = productDAO.getProductById(Long.parseLong(productId));
                Item item = new Item();
                item.setProduct(product);
                item.setQuantity(quantity);
                item.setAmount(product.getPrice() * quantity);

                if (quantity > 0) {
                    cart.addItem(item);
                } else if (quantity == 0) {
                    cart.removeItem(item);
                }
            }
            session.setAttribute("cart", cart);

            //Calculate final total = sum all amount
            Long subTotal = 0L;
            for (Item item: cart.getItems())
                subTotal += item.getAmount();
            session.setAttribute("subTotal", subTotal);

            url = "/public/cart.jsp";
        } else if (action.equals("checkout")) {
            url = "/public/checkout.jsp";
        }

        getServletContext()
                .getRequestDispatcher(url)
                .forward(request, response);
    }
}

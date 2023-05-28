package com.wepr.watchshop.controller.admin;

import com.wepr.watchshop.dao.CategoryDAO;
import com.wepr.watchshop.dao.ProductDAO;
import com.wepr.watchshop.dao.ProductImageDAO;
import com.wepr.watchshop.model.Category;
import com.wepr.watchshop.model.Product;
import com.wepr.watchshop.model.ProductImage;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

@WebServlet(name = "WatchManagementServlet", value = "/watch")
public class WatchManagementServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String url = "/admin/watchManagement/watchManagement.jsp";
        String action = request.getParameter("action");
        ProductDAO productDAO = new ProductDAO();
        String page = request.getParameter("page");

        if(page == null)
            page = "1";

        int paging = Integer.parseInt(page);

        //Default action
        if (action == null) {
            action = "watchManagement";
        }

        //2 URLs -  Switch case for actions
        switch (action) {
            case "watchManagement":
                url = "/admin/watchManagement/watchManagement.jsp";
                //8 lines per page
                List<Product> products = productDAO.getAllProductPaging(paging,8);
                request.setAttribute("productsList", products);
                break;

            case "viewWatch":
                url = "/admin/watchManagement/viewWatch.jsp";
                String id = request.getParameter("id");
                Product product = productDAO.getProductById(Long.parseLong(id));
                request.setAttribute("product", product);
                break;

            case "editWatch":
                url = "/admin/watchManagement/editWatch.jsp";
                id = request.getParameter("id");
                product = productDAO.getProductById(Long.parseLong(id));
                request.setAttribute("product", product);
                break;

            case "addWatch":
                url = "/admin/watchManagement/addWatch.jsp";
                break;
        }
        request.setAttribute("page", paging);
        getServletContext()
                .getRequestDispatcher(url)
                .forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String url = null;
        request.setCharacterEncoding("UTF-8");
        String action = request.getParameter("action");

        if(action.equals("addWatch")){
            try {
                url = addWatch(request);
            } catch (SQLException | ClassNotFoundException e) {
                throw new RuntimeException(e);
            }
        }else if (action.equals("editWatch")){
            try {
                url = editWatch(request);
            } catch (SQLException | ClassNotFoundException e) {
                throw new RuntimeException(e);
            }
        }

        ProductDAO productDAO = new ProductDAO();
        List<Product> products = productDAO.getAllProduct();
        request.setAttribute("productsList", products);
        getServletContext()
                .getRequestDispatcher(url)
                .forward(request, response);
    }

    private String addWatch(HttpServletRequest request) throws SQLException, ClassNotFoundException {

        ProductDAO productDAO = new ProductDAO();
        // get the user data
        String name = request.getParameter("name");
        String categoryId = request.getParameter("category");
        String brand = request.getParameter("brand");
        String origin = request.getParameter("origin");

        String glass = request.getParameter("glass");
        String machine = request.getParameter("machine");
        String diameter = request.getParameter("diameter");
        String waterResistant = request.getParameter("waterResistant");
        String images = request.getParameter("image");
        String description = request.getParameter("description");
        Long price = Long.parseLong(request.getParameter("price"));




        Product product = new Product();
        product.setName(name);
        product.setBrand(brand);
        product.setOrigin(origin);
        product.setGlass(glass);
        product.setMachine(machine);
        product.setDiameter(diameter);
        product.setWaterResistant(waterResistant);
        product.setDescription(description);
        product.setPrice(price);

        // kiem tra san pham da ton tai chua
        List<Product> productList = productDAO.getAllProduct();

        String checkProduct = "sai";
        if(!productList.isEmpty())
        {
            for (int j = 0; j < productList.size(); j++)
            {
                if(product.getName().equals(productList.get(j).getName()))
                {
                    // San pham da ton tai. Thong bao va bat nhap lai.);
                    request.setAttribute("checkproduct", checkProduct);
                    return "/admin/watchManagement/addWatch.jsp";
                }
            }
        }

        //Select category from input
        CategoryDAO categoryDAO = new CategoryDAO();
        Category category = categoryDAO.getCategoryById(Long.parseLong(categoryId));
        product.setCategory(category);

        //Insert product in DB
        productDAO.insertProduct(product);


        System.out.println(product);

        ProductImageDAO productImageDAO = new ProductImageDAO();

        String[] imagePaths = images.split(", ");
        for(int i = 0; i < imagePaths.length; i++) {
            ProductImage productImage = new ProductImage();
            productImage.setPath(imagePaths[i]);
            productImage.setProduct(product);

            //Set first image as a thumbnail
            if(i == 0) productImage.setIsThumbnail(true);

            productImageDAO.insertProductImage(productImage);
        }

        return "/admin/watchManagement/watchManagement.jsp";
    }

    private String editWatch(HttpServletRequest request) throws SQLException, ClassNotFoundException {

        ProductDAO productDAO = new ProductDAO();
        // get the user data
        String name = request.getParameter("name");
        String categoryId = request.getParameter("category");
        String brand = request.getParameter("brand");
        String origin = request.getParameter("origin");

        String glass = request.getParameter("glass");
        String machine = request.getParameter("machine");
        String diameter = request.getParameter("diameter");
        String waterResistant = request.getParameter("waterResistant");
//        String images = request.getParameter("image");
        String description = request.getParameter("description");
        Long price = Long.parseLong(request.getParameter("price"));


        Product product = new Product();
        product.setName(name);
        product.setBrand(brand);
        product.setOrigin(origin);
        product.setGlass(glass);
        product.setMachine(machine);
        product.setDiameter(diameter);
        product.setWaterResistant(waterResistant);
        product.setDescription(description);
        product.setPrice(price);



        //Select category from input
//        CategoryDAO categoryDAO = new CategoryDAO();
//        Category category = categoryDAO.getCategoryById(Long.parseLong(categoryId));
//        product.setCategory(category);

        //Insert product in DB
        productDAO.updateProduct(product);


        System.out.println(product);

//        ProductImageDAO productImageDAO = new ProductImageDAO();

//        String[] imagePaths = images.split(", ");
//        for(int i = 0; i < imagePaths.length; i++) {
//            ProductImage productImage = new ProductImage();
//            productImage.setPath(imagePaths[i]);
//            productImage.setProduct(product);
//
//            //Set first image as a thumbnail
//            if(i == 0) productImage.setIsThumbnail(true);
//
//            productImageDAO.insertProductImage(productImage);
//        }

        return "/admin/watchManagement/watchManagement.jsp";
    }
}
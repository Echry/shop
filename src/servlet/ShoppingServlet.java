package servlet;

import JDBC.Product;
import entity.Commodity;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.Set;

@WebServlet("/commodity")
public class ShoppingServlet extends HttpServlet {

    static private Map<Integer, Commodity> consumer_map = new HashMap<>();
    static private Map<Integer, Commodity> commodity_map;

    static {
        commodity_map = Product.get_commodity();
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        String method = req.getParameter("method");
        String idStr = req.getParameter("id");
        String name = req.getParameter("name");
        String scoreStr = req.getParameter("price");
        String stockStr = req.getParameter("stock");
        String type = req.getParameter("type");
        int stock = Integer.parseInt(stockStr);
        Integer id = Integer.parseInt(idStr);
        Double price = Double.parseDouble(scoreStr);
        Commodity commodity = new Commodity(id,name,price,stock,type);
        consumer_map.put(id, commodity);
        resp.sendRedirect("/commodity");

    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {


        String method = req.getParameter("method");

        if (method == null){
            method = "findAll";
        }

        switch (method){
            case "reduce":
                String idStr = req.getParameter("id");
                Integer id = Integer.parseInt(idStr);
                int amount = consumer_map.get(id).getAmount();
                if (amount > 1){
                    consumer_map.get(id).setAmount(amount - 1);
                }else{
                    consumer_map.remove(id);
                }
                req.setAttribute("map", consumer_map.values());
                req.getRequestDispatcher("Show/myCar.jsp").forward(req,resp);
                break;

            case "delete":
                idStr = req.getParameter("id");
                id = Integer.parseInt(idStr);
                consumer_map.remove(id);
                req.setAttribute("map", consumer_map.values());
                req.getRequestDispatcher("Show/myCar.jsp").forward(req,resp);
                break;

            case "findAll":
                req.setAttribute("map2", commodity_map.values());
                req.getRequestDispatcher("Show/market.jsp").forward(req,resp);
                break;

            case "findCar":
                req.setAttribute("map", consumer_map.values());
                req.getRequestDispatcher("Show/myCar.jsp").forward(req,resp);
                break;

            case "addAmount":
                idStr = req.getParameter("id");
                id = Integer.parseInt(idStr);
                consumer_map.get(id).setAmount(consumer_map.get(id).getAmount() + 1);
                req.setAttribute("map", consumer_map.values());
                req.getRequestDispatcher("Show/myCar.jsp").forward(req,resp);
                break;

            case "add":
                idStr = req.getParameter("id");
                id = Integer.parseInt(idStr);
                Set<Map.Entry<Integer, Commodity>> temp = commodity_map.entrySet();
                Iterator<Map.Entry<Integer, Commodity>> solve = temp.iterator();
                Set<Map.Entry<Integer, Commodity>> temp2 = consumer_map.entrySet();
                Iterator<Map.Entry<Integer, Commodity>> solve2 = temp2.iterator();
                Commodity value2;
                if (consumer_map.get(id)==null){
                    Commodity value = commodity_map.get(id);
                    Integer temp_id = value.getId();
                    String name = value.getName();
                    double price = value.getPrice();
                    String type = value.getType();
                    value2 = new Commodity(temp_id,name,price,type,1);
                    consumer_map.put(id,value2);
                }else {
                    consumer_map.get(id).setAmount(consumer_map.get(id).getAmount() + 1);
                }
                req.setAttribute("map", consumer_map.values());
                resp.sendRedirect("/commodity");
                break;

            case "clean":
                consumer_map.clear();
                resp.sendRedirect("/commodity");
                break;

            case "find":
                req.setAttribute("map2", commodity_map.values());
                String keySearch = req.getParameter("keySearch");
                req.setAttribute("keySearch",keySearch);
                req.getRequestDispatcher("Show/finding.jsp").forward(req,resp);
                break;
        }
    }
}
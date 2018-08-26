package com.servlet;

import com.dao.JsonUtils;
import com.dao.PhoneDAO;
import com.vo.Phone;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/phoneList")
public class PhoneList extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setCharacterEncoding("utf-8");
        response.setContentType("application/json;charset=utf-8");
        PhoneDAO dao = new PhoneDAO();

        List<Phone> phoneList = dao.findAll();
        String result = JsonUtils.toJson(phoneList);
        response.getWriter().println(result);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setCharacterEncoding("utf-8");
        response.setContentType("application/json;charset=utf-8");
        PhoneDAO dao = new PhoneDAO();
        String action = request.getParameter("action");
        if(action.equals("findId")){
            int id = Integer.parseInt(request.getParameter("id"));
            Phone phone = dao.findById(id);
            String result = JsonUtils.toJson(phone);
            System.out.println(result);
            response.getWriter().println(result);
        }else if(action.equals("findName")){
            String result="";
            String name = request.getParameter("name");
            List<Phone> phoneList = dao.getPhonesByName(name);
            result = JsonUtils.toJson(phoneList);
            response.getWriter().println(result);
        }else if(action.equals("del")){
            int id = Integer.parseInt(request.getParameter("id"));
            if(dao.delete(id))
                response.getWriter().print("{\"msg\":\"删除成功\"}");
            else
                response.getWriter().print("{\"msg\":\"删除失败\"}");
        }else if(action.equals("insert")){
            int id = Integer.parseInt(request.getParameter("id"));
            String name = request.getParameter("name");
            double price = Double.parseDouble(request.getParameter("price"));
            String datetime = request.getParameter("datetime");
            String detailed = request.getParameter("detailed");
            int stock = Integer.parseInt(request.getParameter("stock"));
            int state = Integer.parseInt(request.getParameter("state"));

            Phone phone = dao.insert(new Phone(id,name,price,datetime,detailed,stock,state));
            if(phone != null){
                response.getWriter().print("{\"msg\":\"添加成功\"}");
            }else
                response.getWriter().print("{\"msg\":\"添加失败\"}");
        }else if(action.equals("update")){
            int id = Integer.parseInt(request.getParameter("id"));
            String name = request.getParameter("name");
            double price = Double.parseDouble(request.getParameter("price"));
            String datetime = request.getParameter("datetime");
            String detailed = request.getParameter("detailed");
            int stock = Integer.parseInt(request.getParameter("stock"));
            int state = Integer.parseInt(request.getParameter("state"));

            if(dao.update(new Phone(id,name,price,datetime,detailed,stock,state))){
                response.getWriter().print("{\"msg\":\"修改成功\"}");
            }else
                response.getWriter().print("{\"msg\":\"修改失败\"}");
        }
    }
}

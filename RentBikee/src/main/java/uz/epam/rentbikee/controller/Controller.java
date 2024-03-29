package uz.epam.rentbikee.controller;


import org.apache.logging.log4j.Level;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import uz.epam.rentbikee.command.Command;
import uz.epam.rentbikee.command.CommandType;
import uz.epam.rentbikee.exception.CommandException;
import uz.epam.rentbikee.exception.ServiceException;
import uz.epam.rentbikee.pool.ConnectionPool;
import uz.epam.rentbikee.util.ParametrName;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "helloServlet", value = "/controller")
@MultipartConfig(
        fileSizeThreshold = 1024 * 1024 * 10, // 1 MB
        maxFileSize = 1024 * 1024 * 100,      // 10 MB
        maxRequestSize = 1024 * 1024 * 100   // 100 MB
)
public class Controller extends HttpServlet {


    @Override
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
        service(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws  IOException {
        service(req, resp);
    }

    public void service(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String com = request.getParameter(ParametrName.COMMAND);
        String page;
        try {
            Command command = CommandType.define(com);
            page = command.execute(request);
            request.getRequestDispatcher(page).forward(request, response);
        } catch (CommandException | ServletException e) {
            response.sendError(500);


        }
    }
}
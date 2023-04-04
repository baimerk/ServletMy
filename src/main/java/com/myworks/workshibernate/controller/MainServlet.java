package com.myworks.workshibernate.controller;

import com.myworks.workshibernate.model.Role;
import com.myworks.workshibernate.model.User;
import com.myworks.workshibernate.service.BaseService;
import com.myworks.workshibernate.service.impl.UserServiceImpl;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

@WebServlet(urlPatterns = {"/base/*"})
//обрати внимание, данная вверху ссылка должна быть прописана в свойствах томкат сервера в части URL, при этом
//часть deployment должна содержать только ссылку / - слэшь. В таком случае реализуется работа через
//String action = reg.getPathInfo. В другом случае при ссылке / в URL будет работать один servlet
public class MainServlet extends HttpServlet {
    private BaseService<User> service;
    public void init(){
        service = new UserServiceImpl();
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        //String action = req.getServletPath();
        String action = req.getPathInfo();

        try {
            switch (action) {
                case "/registration" -> registrationForm(req, resp);
                case "/login" -> loginForm(req, resp);
                case "/loginAction" -> loginUser(req, resp);
                case "/logoutAction" -> logoutUser(req, resp);
                case "/contact" -> contactsForm(req, resp);
                case "/add" -> addUser(req, resp);
                case "/cabinetUserEdit" -> manageUser(req, resp);
                case "/edit" -> showEditForm(req, resp);
                case "/delete" -> deleteUser(req, resp);
                case "/update" -> updateUser(req, resp);
                case "/addQ" -> addUserQuickly(req, resp);
                //case "/logoutAction" -> logoutUser(req, resp);
                default -> listUser(req, resp);
            }
        } catch (ServletException | IOException e) {
            throw new ServletException(e);
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doGet(req, resp);
    }

    private void listUser(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        List<User> users = service.findAll();
        req.setAttribute("listUser", users);
        ServletContext servletContext = getServletContext();
        RequestDispatcher dispatcher = servletContext.getRequestDispatcher("/WEB-INF/pages/main-page.jsp");
        dispatcher.forward(req, resp);
    }
    private void loginForm(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        //resp.getWriter().write("Method Login\n");
        ServletContext servletContext = getServletContext();
        RequestDispatcher dispatcher = servletContext.getRequestDispatcher("/WEB-INF/pages/login.jsp");
        dispatcher.forward(req, resp);
    }
    private void loginUser(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        String login = req.getParameter("login");
        String password = req.getParameter("password");
        User user = service.findByLoginAndPassword(login, password);
        if (user != null) {
            session.setAttribute("user", user);
            session.setAttribute("userRole", user.getRole().name());
        } else {
            req.setAttribute("invalidLoginOrPassword", true);
            ServletContext servletContext = getServletContext();
            RequestDispatcher dispatcher = servletContext.getRequestDispatcher("/WEB-INF/pages/login.jsp");
            dispatcher.forward(req, resp);
        }
        resp.sendRedirect("list");
    }
    private void logoutUser(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        session.invalidate();
        resp.sendRedirect("list");
    }
    private void contactsForm(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.getWriter().write("Method Contact\n");
        //ServletContext servletContext = getServletContext();
        //RequestDispatcher dispatcher = servletContext.getRequestDispatcher("/WEB-INF/pages/login.jsp");
        //dispatcher.forward(req, resp);
    }
    private void registrationForm(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        //resp.getWriter().write("Method Contact\n");
        ServletContext servletContext = getServletContext();
        RequestDispatcher dispatcher = servletContext.getRequestDispatcher("/WEB-INF/pages/registration.jsp");
        dispatcher.forward(req, resp);
    }
    private void addUser(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        String name = req.getParameter("name");
        String lName = req.getParameter("lastName");
        String address = req.getParameter("address");
        String login = req.getParameter("login");
        String password = req.getParameter("password");
        boolean isMarried = req.getParameter("isMarried").equals("true");
        Role role = Role.USER;
        User user = new User(name, lName, address, isMarried);
        user.setLogin(login);
        user.setPassword(password);
        user.setRole(role);
        boolean isAdded = service.create(user);
        if (isAdded) {
            session.setAttribute("user", user);
            session.setAttribute("userRole", user.getRole().name());
        }
        resp.sendRedirect("list");
    }

    private void addUserQuickly(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        String name = req.getParameter("name");
        String lName = req.getParameter("lastName");
        String address = req.getParameter("address");
        String login = req.getParameter("login");
        String password = req.getParameter("password");
        boolean isMarried = req.getParameter("isMarried").equals("true");
        Role role = Role.USER;
        User user = new User(name, lName, address, isMarried);
        user.setLogin(login);
        user.setPassword(password);
        user.setRole(role);
        boolean isAdded = service.create(user);
        if (isAdded) {
            session.setAttribute("user", user);
            session.setAttribute("userRole", user.getRole().name());
        }
        resp.sendRedirect("cabinetUserEdit");
    }

    private void manageUser(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String search = req.getParameter("search");
        List<User> users = service.findAll();
        req.setAttribute("listUser", users);
        ServletContext servletContext = getServletContext();
        RequestDispatcher dispatcher = servletContext.getRequestDispatcher("/WEB-INF/pages/manage-user.jsp");
        dispatcher.forward(req,resp);
        resp.sendRedirect("cabinetUserEdit");
    }

    private void updateUser(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int id = Integer.parseInt(req.getParameter("id"));
        String name = req.getParameter("name");
        String lName = req.getParameter("lastName");
        String address = req.getParameter("address");
        String login = req.getParameter("login");
        String password = req.getParameter("password");
        boolean isMarried = req.getParameter("isMarried").equals("true");
        User user = new User(name, lName, address, isMarried);
        user.setId(id);
        user.setLogin(login);
        user.setPassword(password);
        service.update(user);
        resp.sendRedirect("cabinetUserEdit");
    }

    private void deleteUser(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int id = Integer.parseInt(req.getParameter("id"));
        service.deleteById(id);
        resp.sendRedirect("cabinetUserEdit");
    }

    private void showEditForm(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int id = Integer.parseInt(req.getParameter("id"));
        User existedUser = service.findById(id);
        req.setAttribute("existedUser", existedUser);
        ServletContext servletContext = getServletContext();
        RequestDispatcher dispatcher = servletContext.getRequestDispatcher("/WEB-INF/pages/edit-user.jsp");
        dispatcher.forward(req, resp);
    }
}

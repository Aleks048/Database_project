package ca.ottawaspoon.servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;
 
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import ca.ottawaspoon.beans.Rater;
import ca.ottawaspoon.utils.DatabaseUtils;
import ca.ottawaspoon.utils.ServerUtils;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet(urlPatterns = { "/login" })
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginServlet() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		RequestDispatcher dispatcher = this.getServletContext().getRequestDispatcher("/WEB-INF/views/loginView.jsp");
		dispatcher.forward(request, response);
	}

	// When the user enters userName & password, and click Submit.
    // This method will be executed.
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String userName = request.getParameter("userName");
        String password = request.getParameter("password");
        String rememberMeStr = request.getParameter("rememberMe");
        boolean remember = "N".equals(rememberMeStr);
 
        Rater user = null;
        boolean hasError = false;
        String errorString = null;
 
        if (userName == null || password == null || userName.length() == 0 || password.length() == 0) {
            hasError = true;
            errorString = "Required username and password!";
        } else {
            Connection conn = ServerUtils.getStoredConnection(request);
            try {
                // Find the user in the DB.
                user = DatabaseUtils.findUser(conn, userName, password);
 
                if (user == null) {
                    hasError = true;
                    errorString = "Username or password invalid!";
                }
            } catch (SQLException e) {
                e.printStackTrace();
                hasError = true;
                errorString = e.getMessage();
            }
        }
        // If error, forward to /WEB-INF/views/login.jsp
        if (hasError) {
            user = new Rater();
            user.setUserName(userName);
            user.setPassword(password);
 
            // Store information in request attribute, before forward.
            request.setAttribute("errorString", errorString);
            request.setAttribute("user", user);
 
            // Forward to /WEB-INF/views/login.jsp
            RequestDispatcher dispatcher = this.getServletContext().getRequestDispatcher("/WEB-INF/views/loginView.jsp");
 
            dispatcher.forward(request, response);
        }
        
        // If no error
        // Store user information in Session
        // And redirect to userInfo page.
        else {
            HttpSession session = request.getSession();
            ServerUtils.storeLoginedUser(session, user);
 
            // If user checked "Remember me".
            if (remember) {
                ServerUtils.storeUserCookie(response, user);
            }
            // Else delete cookie.
            else {
                ServerUtils.deleteUserCookie(response);
            }
 
            // Redirect to userInfo page.
            response.sendRedirect(request.getContextPath() + "/userInfo");
        }
    }

}

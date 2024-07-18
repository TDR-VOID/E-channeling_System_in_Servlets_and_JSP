import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/DeleteChannelingServlet")
public class DeleteChannelingServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int scheduleID = Integer.parseInt(request.getParameter("scheduleID"));

        try {
            // Load MySQL JDBC driver and establish connection
            Class.forName("com.mysql.cj.jdbc.Driver");
            String dbURL = "jdbc:mysql://localhost:3306/e-channeling_system";
            String dbUser = "root";
            String dbPassword = "";
            Connection conn = DriverManager.getConnection(dbURL, dbUser, dbPassword);

            // Query to delete channeling schedule by ID
            String sql = "DELETE FROM channeling_schedule WHERE id = ?";
            PreparedStatement statement = conn.prepareStatement(sql);
            statement.setInt(1, scheduleID);

            // Execute deletion
            int rowsDeleted = statement.executeUpdate();

            if (rowsDeleted > 0) {
                response.sendRedirect("Doctor.jsp");
            } else {
                response.getWriter().println("Failed to delete schedule.");
            }

            // Close connections
            statement.close();
            conn.close();
        } catch (SQLException | ClassNotFoundException e) {
            throw new ServletException("Database connection error: " + e.getMessage());
        }
    }
}

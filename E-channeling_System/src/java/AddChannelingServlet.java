
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

@WebServlet(name = "AddChannelingServlet", urlPatterns = {"/AddChannelingServlet"})
public class AddChannelingServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String doctorID = request.getParameter("doctorID");
        String date = request.getParameter("date");
        String time = request.getParameter("time");
        int maxPatients = Integer.parseInt(request.getParameter("maxPatients"));

        Connection conn = null;
        PreparedStatement stmt = null;
        try {
            // Load MySQL JDBC driver and establish connection
            Class.forName("com.mysql.cj.jdbc.Driver");
            String dbURL = "jdbc:mysql://localhost:3306/e-channeling_system";
            String dbUser = "root";
            String dbPassword = "";
            conn = DriverManager.getConnection(dbURL, dbUser, dbPassword);

            // Insert data into channeling_schedule table
            String sql = "INSERT INTO channeling_schedule (doctor_id, channeling_date, time, max_patients) VALUES (?, ?, ?, ?)";
            stmt = conn.prepareStatement(sql);
            stmt.setString(1, doctorID);
            stmt.setString(2, date);
            stmt.setString(3, time);
            stmt.setInt(4, maxPatients);

            int rowsInserted = stmt.executeUpdate();
            if (rowsInserted > 0) {
                // Successfully added schedule
                response.sendRedirect("Doctor.jsp");
            } else {
                // Failed to add schedule
                response.getWriter().println("Failed to add schedule.");
            }
        } catch (SQLException | ClassNotFoundException ex) {
            // Exception handling
            ex.printStackTrace();
            response.getWriter().println("Database connection error: " + ex.getMessage());
        } finally {
            // Close resources
            try {
                if (stmt != null) stmt.close();
                if (conn != null) conn.close();
            } catch (SQLException ex) {
                ex.printStackTrace();
            }
        }
    }
}

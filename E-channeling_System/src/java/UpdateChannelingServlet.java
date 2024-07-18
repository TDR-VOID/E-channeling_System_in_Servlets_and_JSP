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

@WebServlet("/UpdateChannelingServlet")
public class UpdateChannelingServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String doctorID = request.getParameter("doctorID");
        String channelNumber = request.getParameter("channelNumber");
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
            
            // Update query
            String sql = "UPDATE channeling_schedule SET channeling_date = ?, time = ?, max_patients = ? WHERE doctor_id = ? AND id = ?";
            stmt = conn.prepareStatement(sql);
            stmt.setString(1, date);
            stmt.setString(2, time);
            stmt.setInt(3, maxPatients);
            stmt.setString(4, doctorID);
            stmt.setString(5, channelNumber);
            
            // Execute update
            int rowsAffected = stmt.executeUpdate();
            
            if (rowsAffected > 0) {
                // Update successful
                response.sendRedirect("Doctor.jsp");
            } else {
                // Update failed
                response.getWriter().println("Failed to update schedule.");
            }
        } catch (ClassNotFoundException | SQLException e) {
            // Handle errors
            e.printStackTrace();
            response.getWriter().println("Database connection error: " + e.getMessage());
        } finally {
            // Close connections
            try {
                if (stmt != null) {
                    stmt.close();
                }
                if (conn != null) {
                    conn.close();
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
}

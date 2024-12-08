package Servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/AddEventServlet")
public class AddEventServlet extends HttpServlet {
    private static final String JDBC_URL = "jdbc:mysql://localhost:3306/extracurricularachievementsdb";
    private static final String JDBC_USERNAME = "root";
    private static final String JDBC_PASSWORD = "Vardhan@99";

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        
        String studentId = request.getParameter("studentId");
        String eventType = request.getParameter("eventType");
        String fromDate = request.getParameter("fromDate");
        String toDate = request.getParameter("toDate");
        String eventDescription = request.getParameter("eventDescription");

        try {
            // Load MySQL JDBC Driver
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn = DriverManager.getConnection(JDBC_URL, JDBC_USERNAME, JDBC_PASSWORD);
            
            String sql = "INSERT INTO add_events (student_id, event_type, from_date, to_date, event_description) VALUES (?, ?, ?, ?, ?)";
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setInt(1, Integer.parseInt(studentId));
            stmt.setString(2, eventType);
            stmt.setDate(3, java.sql.Date.valueOf(fromDate));
            stmt.setDate(4, java.sql.Date.valueOf(toDate));
            stmt.setString(5, eventDescription);

            int rowsInserted = stmt.executeUpdate();
            if (rowsInserted > 0) {
                out.println("<h3>Event added successfully!</h3>");
            } else {
                out.println("<h3>Failed to add event. Please try again.</h3>");
            }

            conn.close();
        } catch (ClassNotFoundException e) {
            out.println("<h3>Error: Unable to load database driver.</h3>");
            e.printStackTrace();
        } catch (SQLException e) {
            out.println("<h3>Error: Database connection failed.</h3>");
            e.printStackTrace();
        } finally {
            out.close();
        }
    }
}

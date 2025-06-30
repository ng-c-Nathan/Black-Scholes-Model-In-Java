
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet that receives POST parameters and calculates the prices of financial
 * options
 * using the Black-Scholes model.
 * Returns a JSON object with the Call and Put option prices.
 * 
 * URL: /DataReceptor
 * 
 * Expected parameters:
 * - currentPrice (current stock price)
 * - strikePrice (strike price)
 * - volatility (volatility in percentage)
 * - riskFreeRate (risk-free interest rate)
 * - timeToMaturity (time until expiration)
 * - timeUnit (days, months, years)
 * 
 * JSON response:
 * {
 * "callPrice": <value>,
 * "putPrice": <value>
 * }
 * 
 * @author natha
 */
@WebServlet(urlPatterns = { "/DataReceptor" })
@MultipartConfig
public class DataReceptor extends HttpServlet {

    /**
     * Handles the HTTP GET request (test response).
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        try (PrintWriter out = response.getWriter()) {
            out.println("<!DOCTYPE html>");
            out.println("<html><head><title>DataReceptor</title></head>");
            out.println("<body>");
            out.println("<h1>Servlet is active!</h1>");
            out.println("<p>Path: " + request.getContextPath() + "</p>");
            out.println("</body></html>");
        }
    }

    /**
     * Handles the HTTP POST request and returns a JSON response.
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        response.setContentType("application/json;charset=UTF-8");

        double callPrice = 0.0;
        double putPrice = 0.0;
        try (PrintWriter out = response.getWriter()) {

            // Parse request parameters
            double spotPrice      = Double.parseDouble(request.getParameter("currentPrice"));
            double strikePrice    = Double.parseDouble(request.getParameter("strikePrice"));
            double volatility     = Double.parseDouble(request.getParameter("volatility")) / 100.0;
            double riskFreeRate   = Double.parseDouble(request.getParameter("riskFreeRate")) / 100.0;
            double timeToMaturity = Double.parseDouble(request.getParameter("timeToMaturity"));
            String timeUnit       = request.getParameter("timeUnit");

            // Calculate option prices
            ModeloBlackScholes.main(
                spotPrice, strikePrice,
                volatility, riskFreeRate,
                timeToMaturity, timeUnit
            );
            callPrice = ModeloBlackScholes.getCall();
            putPrice  = ModeloBlackScholes.getPut();

            // Send JSON response
            String jsonResponse = String.format(
                "{\"callPrice\": %.6f, \"putPrice\": %.6f}",
                callPrice, putPrice
            );
            out.print(jsonResponse);
            System.out.println("B");
        } catch (NumberFormatException e) {
            e.printStackTrace();
            response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
            // Include error message for client
            response.getWriter().print(
                String.format("{\"error\": \"Invalid parameters: %s\"}", e.getMessage())
            );
        } catch (Exception e) {
            e.printStackTrace();
            response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
            // Include error message for client
            response.getWriter().print(
                String.format("{\"error\": \"Server error: %s\"}", e.getMessage())
            );
        }
    }

    @Override
    public String getServletInfo() {
        return "Servlet that calculates Call and Put option prices using the Black-Scholes model.";
    }
}

# Black-Scholes Calculator (JSP + Java Servlets)

A web-based financial calculator implementing the Black-Scholes model for European options, built with JSP, Java Servlets, HTML5, CSS3, and AdminLTE.

---

## Features

- **Input parameters**:
  - Current stock price
  - Strike price
  - Volatility (%)
  - Risk-free interest rate (%)
  - Time to maturity (Days, Months, Years)
- **Real-time AJAX**: Fetch API to POST data and display JSON results without page reload.
- **Responsive UI**: Uses AdminLTE (Bootstrap 4) for a clean, mobile-friendly interface.
- **Pure Java model**: Backend logic in `ModeloBlackScholes.java` for precise option pricing.
- **Error handling**: Client and server-side validation with meaningful error messages.

/**
 * Financial options pricing model following the Black-Scholes formula.
 * Includes methods to calculate European Call and Put option prices.
 *
 * @author natha
 */
public class ModeloBlackScholes {

    private static double call;
    private static double put;

    /**
     * Calculates the D1 parameter of the Black-Scholes formula.
     */
    public static double calculateD1(double spotPrice, double strikePrice, double volatility, double time, double riskFreeRate) {
        double logRatio = Math.log(spotPrice / strikePrice);
        double volatilitySquared = volatility * volatility;
        double numerator = logRatio + (riskFreeRate + (volatilitySquared / 2)) * time;
        double denominator = volatility * Math.sqrt(time);
        return numerator / denominator;
    }

    /**
     * Calculates the D2 parameter of the Black-Scholes formula from D1.
     */
    public static double calculateD2(double d1, double volatility, double time) {
        return d1 - (volatility * Math.sqrt(time));
    }

    /**
     * Approximates the cumulative normal distribution function.
     */
    public static double normalDistribution(double x, double mean, double stddev, int precision) {
        x = (x - mean) / stddev;
        double result = 0.0;
        double factorial = 1.0;

        for (int i = 0; i < precision; i++) {
            int n = 2 * i + 1;
            factorial *= n;
            double term = Math.pow(x, n) / factorial;

            if (Double.isNaN(term) || Double.isInfinite(term)) {
                break;
            }

            result += term;
        }

        result *= (1.0 / Math.sqrt(2 * Math.PI)) * Math.exp(-x * x / 2.0);
        return result + 0.5;
    }

    /**
     * Calculates the price of a European Call option.
     */
    public static double calculateCall(double spotPrice, double strikePrice, double p1, double p2, double riskFreeRate, double time) {
        double presentValue = spotPrice * p1;
        double discountedStrike = strikePrice * p2 * Math.exp(-riskFreeRate * time);
        return presentValue - discountedStrike;
    }

    /**
     * Calculates the price of a European Put option using Put-Call parity.
     */
    public static double calculatePut(double callPrice, double spotPrice, double strikePrice, double riskFreeRate, double time) {
        double discountedStrike = strikePrice * Math.exp(-riskFreeRate * time);
        return callPrice + discountedStrike - spotPrice;
    }

    public static double getCall() {
        return call;
    }

    public static double getPut() {
        return put;
    }

    /**
     * Main method that initializes the model with the given parameters.
     */
    public static void main(double spotPrice, double strikePrice, double volatility, double riskFreeRate,
                            double time, String timeUnit) {

        double timeInYears;
        switch (timeUnit.toLowerCase()) {
            case "months":
            case "meses":
                timeInYears = time / 12.0;
                break;
            case "days":
            case "dias":
                timeInYears = time / 365.0;
                break;
            case "years":
            case "anos":
            case "años":
                timeInYears = time;
                break;
            default:
                throw new IllegalArgumentException("Invalid time unit: " + timeUnit);
        }

        double d1 = calculateD1(spotPrice, strikePrice, volatility, timeInYears, riskFreeRate);
        double d2 = calculateD2(d1, volatility, timeInYears);

        double p1 = (d1 > 4.9) ? 1 : normalDistribution(d1, 0.0, 1.0, 48);
        double p2 = (d2 > 4.9) ? 1 : normalDistribution(d2, 0.0, 1.0, 48);

        call = calculateCall(spotPrice, strikePrice, p1, p2, riskFreeRate, timeInYears);
        put = calculatePut(call, spotPrice, strikePrice, riskFreeRate, timeInYears);
    }
}

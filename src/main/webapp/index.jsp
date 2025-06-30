<%-- Document : index Created on : June 27, 2025, 8:08:09 PM Author : natha --%>
    <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
        <!DOCTYPE html>
        <html lang="en">

        <head>
            <meta charset="UTF-8" />
            <meta name="viewport" content="width=device-width, initial-scale=1.0" />
            <title>Black-Scholes Calculator</title>

            <!-- Google Font -->
            <link rel="stylesheet"
                href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback" />

            <!-- Font Awesome -->
            <link rel="stylesheet"
                href="${pageContext.request.contextPath}/resources/plugins/fontawesome-free/css/all.min.css" />
            <script src="https://kit.fontawesome.com/5902e5da71.js" crossorigin="anonymous"></script>

            <!-- AdminLTE Style -->
            <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/dist/css/adminlte.min.css" />

            <!-- jQuery -->
            <script src="${pageContext.request.contextPath}/resources/plugins/jquery/jquery.min.js"></script>

            <!-- Chart.js -->
            <script src="${pageContext.request.contextPath}/resources/plugins/chart.js/Chart.min.js"></script>

            <!-- Select2 -->
            <script src="${pageContext.request.contextPath}/resources/plugins/select2/js/select2.full.min.js"></script>

            <!-- AdminLTE App -->
            <script src="${pageContext.request.contextPath}/resources/dist/js/adminlte.min.js"></script>
        </head>

        <body class="hold-transition sidebar-mini">
            <div class="wrapper">
                <!-- Navbar -->
                <nav class="main-header navbar navbar-expand navbar-white navbar-light">
                    <ul class="navbar-nav">
                        <li class="nav-item">
                            <a class="nav-link" data-widget="pushmenu" href="#" role="button">
                                <i class="fas fa-bars"></i>
                            </a>
                        </li>
                    </ul>
                    <ul class="navbar-nav ml-auto">
                        <li class="nav-item">
                            <a class="nav-link" data-widget="fullscreen" role="button">
                                <i class="fas fa-expand-arrows-alt"></i>
                            </a>
                        </li>
                    </ul>
                </nav>

                <!-- Sidebar -->
                <aside class="main-sidebar sidebar-dark-primary elevation-4">
                    <a href="https://uatx.mx/" class="brand-link" target="_blank">
                        <img src="${pageContext.request.contextPath}/resources/dist/img/uat.png" alt="UAT Logo"
                            class="brand-image img-circle elevation-3" style="opacity: .8" />
                        <span class="brand-text font-weight-light">Integration Project</span>
                    </a>

                    <div class="sidebar">
                        <div class="user-panel mt-3 pb-3 mb-3 d-flex">
                            <div class="image">
                                <img src="${pageContext.request.contextPath}/resources/dist/img/calculadora.png"
                                    alt="Calculator Icon" />
                            </div>
                            <div class="info">
                                <a href="https://economipedia.com/definiciones/modelo-black-scholes.html"
                                    class="d-block" target="_blank">
                                    Black-Scholes Model
                                </a>
                            </div>
                        </div>

                        <div class="form-inline">
                            <div class="input-group" data-widget="sidebar-search">
                                <input class="form-control form-control-sidebar" type="search" placeholder="Search"
                                    aria-label="Search" />
                                <div class="input-group-append">
                                    <button class="btn btn-sidebar">
                                        <i class="fas fa-search fa-fw"></i>
                                    </button>
                                </div>
                            </div>
                        </div>

                        <nav class="mt-2">
                            <ul class="nav nav-pills nav-sidebar flex-column" data-widget="treeview" role="menu"
                                data-accordion="false">
                                <li class="nav-item menu-open">
                                    <a class="nav-link active" href="#">
                                        <i class="fa-solid fa-plus"></i>
                                        <p>
                                            More Info
                                            <i class="right fas fa-angle-left"></i>
                                        </p>
                                    </a>
                                    <ul class="nav nav-treeview">
                                        <li class="nav-item">
                                            <a href="https://www.youtube.com/watch?v=dGYc5ul4IQw&t=501s&ab_channel=TusClasesdeFinanzas"
                                                class="nav-link" target="_blank">
                                                <i class="fa-solid fa-square-root-variable"></i>
                                                <p>Calculation Tutorial</p>
                                            </a>
                                        </li>
                                        <li class="nav-item">
                                            <a href="https://goodcalculators.com/black-scholes-calculator/"
                                                class="nav-link" target="_blank">
                                                <i class="fa-solid fa-check"></i>
                                                <p>Compare Results!</p>
                                            </a>
                                        </li>
                                    </ul>
                                </li>
                            </ul>
                        </nav>
                    </div>
                </aside>

                <!-- Content Wrapper -->
                <div class="content-wrapper">
                    <!-- Header -->
                    <section class="content-header">
                        <div class="container-fluid">
                            <div class="row mb-2">
                                <div class="col-sm-6">
                                    <h1>BS Calculator</h1>
                                </div>
                                <div class="col-sm-6">
                                    <ol class="breadcrumb float-sm-right">
                                        <li class="breadcrumb-item active">Black-Scholes Calculator</li>
                                    </ol>
                                </div>
                            </div>
                        </div>
                    </section>

                    <!-- Main content -->
                    <section class="content">
                        <div class="container-fluid">
                            <div class="row">
                                <div class="col-md-6">
                                    <div class="card card-primary">
                                        <div class="card-header">
                                            <h3 class="card-title">Input Data</h3>
                                        </div>
                                        <form id="formBlackScholes">
                                            <div class="card-body">
                                                <!-- Current Stock Price -->
                                                <div class="form-group">
                                                    <label for="currentPrice">Current Stock Price</label>
                                                    <div class="input-group">
                                                        <div class="input-group-prepend">
                                                            <span class="input-group-text">
                                                                <i class="fa-solid fa-money-bill"></i>
                                                            </span>
                                                        </div>
                                                        <input id="currentPrice" name="currentPrice"
                                                            class="form-control" type="number" min="1"
                                                            placeholder="Enter current price" step="any" required />
                                                    </div>
                                                </div>

                                                <!-- Strike Price -->
                                                <div class="form-group">
                                                    <label for="strikePrice">Strike Price</label>
                                                    <div class="input-group">
                                                        <div class="input-group-prepend">
                                                            <span class="input-group-text">
                                                                <i class="fa-solid fa-hand-holding-dollar"></i>
                                                            </span>
                                                        </div>
                                                        <input id="strikePrice" name="strikePrice" class="form-control"
                                                            type="number" min="1" placeholder="Enter strike price"
                                                            step="any" required />
                                                    </div>
                                                </div>

                                                <!-- Volatility -->
                                                <div class="form-group">
                                                    <label for="volatility">Volatility (%)</label>
                                                    <div class="input-group">
                                                        <div class="input-group-prepend">
                                                            <span class="input-group-text">
                                                                <i class="fa-solid fa-cloud"></i>
                                                            </span>
                                                        </div>
                                                        <input id="volatility" name="volatility" class="form-control"
                                                            type="number" min="1" max="100"
                                                            placeholder="Enter volatility" step="any" required />
                                                    </div>
                                                </div>

                                                <!-- Risk-Free Rate -->
                                                <div class="form-group">
                                                    <label for="riskFreeRate">Risk-Free Rate (%)</label>
                                                    <div class="input-group">
                                                        <div class="input-group-prepend">
                                                            <span class="input-group-text">
                                                                <i class="fa-solid fa-triangle-exclamation"></i>
                                                            </span>
                                                        </div>
                                                        <input id="riskFreeRate" name="riskFreeRate"
                                                            class="form-control" type="number" min="0" max="100"
                                                            placeholder="Enter risk-free rate" step="any" required />
                                                    </div>
                                                </div>

                                                <!-- Time to Maturity -->
                                                <div class="form-group">
                                                    <label for="timeToMaturity">Time to Maturity</label>
                                                    <div class="input-group">
                                                        <div class="input-group-prepend">
                                                            <span class="input-group-text">
                                                                <i class="fa-solid fa-stopwatch"></i>
                                                            </span>
                                                        </div>
                                                        <input id="timeToMaturity" name="timeToMaturity"
                                                            class="form-control" type="number" min="1"
                                                            placeholder="Enter time until expiration" step="any"
                                                            required />
                                                    </div>
                                                </div>

                                                <!-- Time Unit -->
                                                <div class="form-group">
                                                    <select id="timeUnit" name="timeUnit"
                                                        class="form-control select2 select2-primary"
                                                        data-dropdown-css-class="select2-primary" style="width: 100%;">
                                                        <option value="months" selected>Months</option>
                                                        <option value="years">Years</option>
                                                        <option value="days">Days</option>
                                                    </select>
                                                </div>

                                                <div class="text-right">
                                                    <button class="btn btn-primary" type="submit">
                                                        Calculate
                                                    </button>
                                                </div>
                                            </div>
                                        </form>
                                    </div>
                                </div>

                                <div class="row"> <!-- results -->
                                    <div class="col-12">
                                        <div class="card card-success">
                                            <div class="card-header">
                                                <h3 class="card-title">Results</h3>
                                            </div>
                                            <div class="card-body">
                                                <table class="table table-hover text-nowrap">
                                                    <thead>
                                                        <tr>
                                                            <th>Parameter</th>
                                                            <th>Value</th>
                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                                        <tr>
                                                            <td>Call Price</td>
                                                            <td id="result-call"></td>
                                                        </tr>
                                                        <tr>
                                                            <td>Put Price</td>
                                                            <td id="result-put"></td>
                                                        </tr>
                                                        <tr>
                                                            <td>Current Price</td>
                                                            <td id="result-currentPrice"></td>
                                                        </tr>
                                                        <tr>
                                                            <td>Strike Price</td>
                                                            <td id="result-strikePrice"></td>
                                                        </tr>
                                                        <tr>
                                                            <td>Time (years)</td>
                                                            <td id="result-time"></td>
                                                        </tr>
                                                        <tr>
                                                            <td>Volatility</td>
                                                            <td id="result-volatility"></td>
                                                        </tr>
                                                        <tr>
                                                            <td>Risk-Free Rate</td>
                                                            <td id="result-riskFreeRate"></td>
                                                        </tr>
                                                    </tbody>
                                                </table>
                                            </div>
                                        </div>
                                    </div>
                                </div> <!-- /.row results -->

                            </div> <!-- /.container-fluid -->
                    </section> <!-- /.content -->
                </div> <!-- /.content-wrapper -->

                <footer class="main-footer text-center">
                    <strong>
                        Black-Scholes Calculator<br />
                        <a href="https://www.linkedin.com/in/nathan-vargas-733792358/" target="_blank">
                            Nathan Jose Vargas Ronquillo
                        </a><br />
                    </strong>
                    <div class="mt-2">
                        <b>Version</b> 1.0.2
                    </div>
                </footer>
            </div> <!-- /.wrapper -->

            <script>
                document
                    .getElementById("formBlackScholes")
                    .addEventListener("submit", function (e) {
                        e.preventDefault();
                        const formData = new FormData(this);
                        const params = new URLSearchParams();

                        for (let [key, value] of formData.entries()) {
                            params.append(key, value);
                        }

                        fetch("<%= request.getContextPath()%>/DataReceptor", {
                            method: "POST",
                            headers: {
                                "Content-Type":
                                    "application/x-www-form-urlencoded;charset=UTF-8",
                            },
                            body: params.toString(),
                        }) 
                            .then((res) => res.json())
                            .then((data) => {
                                document.getElementById("result-call").innerText =
                                    "$" + data.callPrice.toFixed(2);
                                document.getElementById("result-put").innerText =
                                    "$" + data.putPrice.toFixed(2);
                                document.getElementById("result-currentPrice").innerText =
                                    formData.get("currentPrice");
                                document.getElementById("result-strikePrice").innerText =
                                    formData.get("strikePrice");
                                document.getElementById("result-volatility").innerText =
                                    formData.get("volatility") + "%";
                                document.getElementById("result-riskFreeRate").innerText =
                                    formData.get("riskFreeRate") + "%";




                                let timeVal = parseFloat(
                                    formData.get("timeToMaturity")
                                );
                                if (formData.get("timeUnit") === "months") timeVal /= 12;
                                else if (formData.get("timeUnit") === "days") timeVal /= 365;
                                document.getElementById("result-time").innerText =
                                    timeVal.toFixed(2) + " years";
                            })
                    });
            </script>

            <div id="server-response" class="mt-3"></div>
        </body>

        </html>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html lang="en">

<head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <meta name="description" content="" />
    <meta name="author" content="" />
    <title>Dashboard | Bank System</title>
    <link href="https://cdn.datatables.net/1.10.20/css/dataTables.bootstrap4.min.css" rel="stylesheet" crossorigin="anonymous" />
    <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/js/all.min.js" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="css/styles.css"> 

<body class="sb-nav-fixed">
		<%if(session.getAttribute("uname")==null)
			response.sendRedirect("login.jsp");	 %>
    <nav class="sb-topnav navbar navbar-expand navbar-dark bg-dark">
        <a class="navbar-brand" href="dashboard.jsp">Bank System</a>
        <button class="btn btn-link btn-sm order-1 order-lg-0" id="sidebarToggle" href="#"><i class="fas fa-bars"></i></button>
        <!-- Navbar Search-->
        <form class="d-none d-md-inline-block form-inline ml-auto mr-0 mr-md-3 my-2 my-md-0">
            
        </form>
        <!-- Navbar-->
        <ul class="navbar-nav ml-auto ml-md-0">
            <li class="nav-item dropdown">
                <a class="nav-link dropdown-toggle" id="userDropdown" href="#" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><i class="fas fa-user fa-fw"></i></a>
                <div class="dropdown-menu dropdown-menu-right" aria-labelledby="userDropdown">
                    <a class="dropdown-item" href="profile.jsp">Profile</a>
                    <div class="dropdown-divider"></div>
                    <form action="logout">
						<input type="submit" class="dropdown-item" value="Logout" />
					</form>
                </div>
            </li>
        </ul>
    </nav>
    <div id="layoutSidenav">
        <div id="layoutSidenav_nav">
            <nav class="sb-sidenav accordion sb-sidenav-dark" id="sidenavAccordion">
                <div class="sb-sidenav-menu">
                    <div class="nav">
                        <div class="sb-sidenav-menu-heading">ACCOUNT</div>
                        <a class="nav-link" href="account_details.jsp">
                            <div class="sb-nav-link-icon"><i class="fas fa-table"></i></div>
                            Account details
                        </a>
                        <a class="nav-link" href="profile.jsp">
                            <div class="sb-nav-link-icon"><i class="fas fa-user fa-fw"></i></div>
                            My Profile
                        </a>
                        <a class="nav-link" href="transactions.jsp">
                            <div class="sb-nav-link-icon"><i class="fas fa-columns"></i></div>
                            Transactions
                        </a>
                        <div class="sb-sidenav-menu-heading">FUND TRANSFER</div>
                        
                        <a class="nav-link" href="transfer.jsp">
                            <div class="sb-nav-link-icon"><i class="fas fa-columns"></i></div>
                            Transfer
                        </a>
                        <div class="sb-sidenav-menu-heading">AMOUNT</div>
                        
                        <a class="nav-link" href="deposit.jsp">
                            <div class="sb-nav-link-icon"><i class="fas fa-columns"></i></div>
                            Deposit
                        </a>
                        <a class="nav-link" href="withdraw.jsp">
                            <div class="sb-nav-link-icon"><i class="fas fa-columns"></i></div>
                            Withdraw
                        </a>
                        <div class="sb-sidenav-menu-heading">FIXED DEPOSIT</div>
                            <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseLayouts" aria-expanded="false" aria-controls="collapseLayouts">
                                <div class="sb-nav-link-icon"><i class="fas fa-columns"></i></div>
                                FIXED DEPOSIT
                                <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                            </a>
                            <div class="collapse" id="collapseLayouts" aria-labelledby="headingOne" data-parent="#sidenavAccordion">
                                <nav class="sb-sidenav-menu-nested nav">
                                    <a class="nav-link" href="fixed_deposit.jsp">Create</a>
                                    <a class="nav-link" href="view_fd.jsp">View</a>
                                </nav>
                            </div>
                    </div>
                </div>
                <div class="sb-sidenav-footer">
                    <div class="small">Logged in as:</div>
                    ${fname} ${lname}
                </div>
            </nav>
        </div><div id="layoutSidenav_content">
    <main>
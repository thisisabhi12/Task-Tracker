<%@ Page Title="" Language="C#" MasterPageFile="~/TaskTracker.master" AutoEventWireup="true" CodeFile="Demo.aspx.cs" Inherits="Demo" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div id="right-panel" class="right-panel">

        <div class="breadcrumbs">
            <div class="col-sm-4">
                <div class="page-header float-left">
                    <div class="page-title">
                        <h1>Task Tracker</h1>
                        <h6>Welcome,<asp:Label ID="Label1" runat="server"></asp:Label>
                        </h6>
                    </div>
                </div>
            </div>
        </div>
        <form id="form1" runat="server">
            <div>
                <div class="content mt-3">
                    <%-- <div class="col-sm-6 col-lg-3">
                        <div class="card text-white bg-flat-color-1">
                            <div class="card-body pb-0">
                                <h4 class="mb-0">
                                    <span class="count">104</span>
                                </h4>
                                <p class="text-light">Employee</p>

                                <div class="chart-wrapper px-0" style="height: 70px;">
                                    <canvas id="widgetChart5"></canvas>
                                </div>

                            </div>

                        </div>
                    </div>
                    <!--/.col-->

                    <div class="col-sm-6 col-lg-3">
                        <div class="card text-white bg-flat-color-2">
                            <div class="card-body pb-0">
                                <h4 class="mb-0">
                                    <span class="count">20</span>
                                </h4>
                                <p class="text-light">Customer</p>

                                <div class="chart-wrapper px-0" style="height: 70px;">
                                    <canvas id="widgetChart6"></canvas>
                                </div>

                            </div>
                        </div>
                    </div>
                    <!--/.col-->

                    <div class="col-sm-6 col-lg-3">
                        <div class="card text-white bg-flat-color-3">
                            <div class="card-body pb-0">
                                <h4 class="mb-0">
                                    <span class="count">15</span>
                                </h4>
                                <p class="text-light">Allocated Task</p>

                            </div>

                            <div class="chart-wrapper px-0" style="height: 70px;">
                                <canvas id="widgetChart7"></canvas>
                            </div>
                        </div>
                    </div>
                    <!--/.col-->

                    <div class="col-sm-6 col-lg-3">
                        <div class="card text-white bg-flat-color-4">
                            <div class="card-body pb-0">

                                <h4 class="mb-0">
                                    <span class="count">25</span>
                                </h4>
                                <p class="text-light">Complete Task</p>

                                <div class="chart-wrapper px-3" style="height: 70px;">
                                    <canvas id="widgetChart8"></canvas>
                                </div>

                            </div>
                        </div>
                    </div>--%>
                    <!--/.col-->
                    <!--/.col-->
                    <div class="col-sm-6 col-lg-3">
                        <div class="card text-white bg-flat-color-4">
                            <div class="card-body pb-0">

                                <h4 class="mb-0">
                                    <span class="count">
                                        <asp:Label ID="Label2" runat="server" ></asp:Label></span>
                                </h4>
                                <p class="text-light">Employee</p>

                                <div class="chart-wrapper px-3" style="height: 70px;">
                                    <canvas id="widgetChart4"></canvas>
                                </div>

                            </div>
                        </div>
                    </div>

                    <div class="col-sm-6 col-lg-3">
                        <div class="card text-white bg-flat-color-3">
                            <div class="card-body pb-0">
                                <h4 class="mb-0">
                                    <span class="count">
                                        <asp:Label ID="Label3" runat="server" ></asp:Label></span>
                                </h4>
                                <p class="text-light">Allocated Task</p>

                            </div>

                            <div class="chart-wrapper px-0" style="height: 70px;">
                                <canvas id="widgetChart3"></canvas>
                            </div>
                        </div>
                    </div>
                    <!--/.col-->
                    <div class="col-sm-6 col-lg-3">
                        <div class="card text-white bg-flat-color-2">
                            <div class="card-body pb-0">
                                <h4 class="mb-0">
                                    <span class="count">
                                        <asp:Label ID="Label4" runat="server" ></asp:Label></span>
                                </h4>
                                <p class="text-light">Customer</p>

                                <div class="chart-wrapper px-0" style="height: 70px;">
                                    <canvas id="widgetChart2"></canvas>
                                </div>

                            </div>
                        </div>
                    </div>
                    <div class="col-sm-6 col-lg-3">
                        <div class="card text-white bg-flat-color-1">
                            <div class="card-body pb-0">
                                <h4 class="mb-0">
                                    <span class="count">
                                        <asp:Label ID="Label5" runat="server"></asp:Label></span>
                                </h4>
                                <p class="text-light">Complete Task</p>

                                <div class="chart-wrapper px-0" style="height: 70px;">
                                    <canvas id="widgetChart1"></canvas>
                                </div>

                            </div>

                        </div>
                    </div>
                    <!--/.col-->

                    <div class="col-xl-6">
                        <div class="card">
                            <div class="card-body">
                                <div class="row">
                                    <div class="col-sm-4">
                                        <h4 class="card-title mb-0">Overall Performance</h4>
                                        <div class="small text-muted"></div>
                                    </div>
                                    <!--/.col-->
                                    <div class="col-sm-8 hidden-sm-down">
                                        <button type="button" class="btn btn-primary float-right bg-flat-color-1"><i class="fa fa-cloud-download"></i></button>
                                        <div class="btn-toolbar float-right" role="toolbar" aria-label="Toolbar with button groups">
                                            <div class="btn-group mr-3" data-toggle="buttons" aria-label="First group">
                                                <label class="btn btn-outline-secondary">
                                                    <input type="radio" name="options" id="option1" />
                                                    Day
                                                </label>
                                                <label class="btn btn-outline-secondary active">
                                                    <input type="radio" name="options" id="option2" checked="" />
                                                    Month
                                                </label>
                                                <label class="btn btn-outline-secondary">
                                                    <input type="radio" name="options" id="option3" />
                                                    Year
                                                </label>
                                            </div>
                                        </div>
                                    </div>
                                    <!--/.col-->


                                </div>
                                <!--/.row-->
                                <div class="chart-wrapper mt-4">
                                    <canvas id="trafficChart" style="height: 200px;" height="200"></canvas>
                                </div>

                            </div>

                        </div>
                    </div>

                    <div class="col-xl-3 col-lg-6">
                        <div class="card">
                            <div class="card-body">
                                <div class="stat-widget-one">
                                    <div class="stat-icon dib"><i class="ti-alarm-clock border-success"></i></div>
                                    <div class="stat-content dib">
                                        <div class="stat-text">Pending Task</div>
                                        <div class="stat-digit">30</div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>


                    <div class="col-xl-3 col-lg-6">
                        <div class="card">
                            <div class="card-body">
                                <div class="stat-widget-one">
                                    <div class="stat-icon dib"><i class="ti-user text-primary border-primary"></i></div>
                                    <div class="stat-content dib">
                                        <div class="stat-text">New Customer</div>
                                        <div class="stat-digit">5</div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="col-xl-3 col-lg-6">
                        <div class="card">
                            <div class="card-body">
                                <div class="stat-widget-one">
                                    <div class="stat-icon dib"><i class="ti-check-box text-warning border-warning"></i></div>
                                    <div class="stat-content dib">
                                        <div class="stat-text">Complete Task</div>
                                        <div class="stat-digit">15</div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- .content -->
            </div>
        </form>
    </div>
    <!-- /#right-panel -->

    <!-- Right Panel -->

</asp:Content>


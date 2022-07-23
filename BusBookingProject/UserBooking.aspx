<%@ Page Title="" Language="C#" MasterPageFile="~/BusBookingMaster.Master" AutoEventWireup="true" CodeBehind="UserBooking.aspx.cs" Inherits="TravelBookingProject.UserBooking" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
     <style type="text/css">
        body {
            /* Safari 4-5, Chrome 1-9 */
            background: -webkit-gradient(radial, center center, 0, center center, 460, from(#789ad6), to(#3c4d6b));
            /* Safari 5.1+, Chrome 10+ */
            background: -webkit-radial-gradient(circle, #789ad6, #3c4d6b);
            /* Firefox 3.6+ */
            background: -moz-radial-gradient(circle, #1a82f7, #2F2727);
            /* IE 10 */
            background: -ms-radial-gradient(circle, #1a82f7, #2F2727);
            height: 600px;
        }

        .centered-form {
            margin-top: 10%;
        }

            .centered-form .panel {
                background: rgba(255, 255, 255, 0.8);
                box-shadow: rgba(0, 0, 0, 0.3) 20px 20px 20px;
            }

        label.label-floatlabel {
            font-weight: bold;
            color: #46b8da;
            font-size: 11px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <div class="container" style="margin-top: 5%">
    </div>
    <div class="row centered-form" style="margin-top: 5%">
        <div class="col-lg-8 col-sm-8 col-md-2 col-sm-offset-2 col-md-offset-2">
            <div class="panel panel-default">
                <div class="panel-heading">
                    <h3 class="panel-title">Book Your Trip!<%:Response.Cookies["Username"].Value%></h3>
                </div>
                <div class="panel-body">
                    <asp:ValidationSummary ID="vsRegister" runat="server" CssClass="alert alert-danger" ShowSummary="true" ValidationGroup="vgRegister" />
                    <div id="divMessage" runat="server" />
                    <div class="col-xs-6 col-sm-6 col-md-6">
                        <div class="form-group">
                            <asp:Label ID="lblBus" runat="server" Text="Name" Font-Bold="true"></asp:Label>
                            <asp:TextBox ID="txtName" runat="server" class="form-control input-sm floatlabel"/>
                             <asp:RequiredFieldValidator runat="server" ControlToValidate="txtName" Display="None" ID="rfvFirstName" ValidationGroup="vgRegister"
                                    CssClass="text-danger" ErrorMessage="Customer No is required." /><br />
                        </div>
                       <div class="form-group">
                            <asp:Label ID="lblSeatRow" runat="server" Text="Address" Font-Bold="true"></asp:Label>
                            <asp:TextBox ID="txtAddress" runat="server" class="form-control input-sm floatlabel" />
                             <asp:RequiredFieldValidator runat="server" ControlToValidate="txtAddress" Display="None" ID="rfVMobileNo" ValidationGroup="vgRegister"
                                    CssClass="text-danger" ErrorMessage="Seats number is required." /><br />
                        </div>
                        <div class="form-group">
                            <asp:Label ID="Label1" runat="server" Text="Phone Number" Font-Bold="true"></asp:Label>
                            <asp:TextBox ID="txtPhone" runat="server" class="form-control input-sm floatlabel" />
                             <asp:RequiredFieldValidator runat="server" ControlToValidate="txtPhone" Display="None" ID="RequiredFieldValidator1" ValidationGroup="vgRegister"
                                    CssClass="text-danger" ErrorMessage="Origin is Required" /><br />
                        </div>
                          <div class="form-group">
                            <asp:Label ID="Label3" runat="server" Text="Email" Font-Bold="true"></asp:Label>
                            <asp:TextBox ID="txtEmail" runat="server" class="form-control input-sm floatlabel" />
                             <asp:RequiredFieldValidator runat="server" ControlToValidate="txtEmail" Display="None" ID="RequiredFieldValidator3" ValidationGroup="vgRegister"
                                    CssClass="text-danger" ErrorMessage="Transport Name is Required" /><br />
                        </div>
                    </div>
                    <div class="col-xs-6 col-sm-6 col-md-6">
                        <div class="form-group">
                            <asp:Label ID="lbTraveltype" runat="server" Text="Travel Type" Font-Bold="true"></asp:Label>
                             <asp:DropDownList ID="txtTraveltype" runat="server" class="form-control input-sm floatlabel">
                                 <asp:ListItem Value="0" Text="Select Travel Type"></asp:ListItem>
                                 <asp:ListItem Value="1" Text="Solo"></asp:ListItem>
                                  <asp:ListItem Value="2" Text="Family"></asp:ListItem>
                             </asp:DropDownList>
                            <%--<asp:RequiredFieldValidator runat="server" ControlToValidate="txtTravletype" Display="None" ID="rfVLastName" ValidationGroup="vgRegister"
                                    CssClass="text-danger" ErrorMessage="Travel type is required." /><br />--%>
                        </div>
                        
                        <div class="form-group">
                            <asp:Label ID="lblPassword" runat="server" Text="Arrival Date" Font-Bold="true"></asp:Label>
                            <asp:TextBox ID="txtArrivaldate" runat="server" class="form-control input-sm floatlabel"  />
                             <asp:RequiredFieldValidator runat="server" ControlToValidate="txtArrivaldate" Display="None" ID="rfvPassword" ValidationGroup="vgRegister"
                                    CssClass="text-danger" ErrorMessage="Arrival Date is Required" /><br />
                        </div>
                                 <div class="form-group">
                            <asp:Label ID="Label4" runat="server" Text="Leaving Date" Font-Bold="true"></asp:Label>
                            <asp:TextBox ID="txtLeavingdate" runat="server" class="form-control input-sm floatlabel"  />
                             <asp:RequiredFieldValidator runat="server" ControlToValidate="txtLeavingdate" Display="None" ID="RequiredFieldValidator4" ValidationGroup="vgRegister"
                                    CssClass="text-danger" ErrorMessage="Leaving Date is Required" /><br />
                        </div>
                        <div class="form-group">
                            <asp:Label ID="Label2" runat="server" Text="Destination" Font-Bold="true"></asp:Label>
                            <asp:TextBox ID="txtDestination" runat="server" class="form-control input-sm floatlabel" />
                             <asp:RequiredFieldValidator runat="server" ControlToValidate="txtDestination" Display="None" ID="RequiredFieldValidator2" ValidationGroup="vgRegister"
                                    CssClass="text-danger" ErrorMessage="Destination is Required" /><br />
                        </div>
                       
                    </div>
                   <div class="col-xs-6 col-sm-6 col-md-6">
                        <div class="form-group">
                            <asp:Button ID="btnSave" runat="server" style="width:auto;margin-top:20px;" Text="Save Booking" OnClick="btnSave_Click" class="btn btn-info " ValidationGroup="vgRegister"  CausesValidation="True" ViewStateMode="Inherit" />
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>


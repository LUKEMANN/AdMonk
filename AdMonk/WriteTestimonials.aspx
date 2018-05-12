<%@ Page Title="" Language="C#" MasterPageFile="~/PublicVIew.master" AutoEventWireup="true" CodeFile="WriteTestimonials.aspx.cs" Inherits="WriteTestimonials" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="form-horizontal">
        <div class="form-group">
            <label class="col-sm-4 control-label">Name</label>
            <div class="col-sm-6">
                <asp:TextBox ID="name" runat="server" CssClass="form-control"></asp:TextBox>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="name" CssClass="red" Display="Dynamic" ErrorMessage="*only alphabets are allowed" ValidationExpression="^[a-zA-Z''-'\s]{1,40}$"></asp:RegularExpressionValidator>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="name" CssClass="red" Display="Dynamic" ErrorMessage="*mandatory field"></asp:RequiredFieldValidator>
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-4 control-label">E-Mail Id</label>
            <div class="col-sm-6">
                <asp:TextBox ID="email" runat="server" CssClass="form-control"></asp:TextBox>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="email" CssClass="red" Display="Dynamic" ErrorMessage="*invalid email address" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="email" CssClass="red" Display="Dynamic" ErrorMessage="*mandatory field"></asp:RequiredFieldValidator>
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-4 control-label">Title</label>
            <div class="col-sm-6">
                <asp:TextBox ID="title" runat="server" CssClass="form-control"></asp:TextBox>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ControlToValidate="title" CssClass="red" Display="Dynamic" ErrorMessage="*enter a valid title name" ValidationExpression="^[a-zA-Z0-9''-'&amp;\s]{1,40}$"></asp:RegularExpressionValidator>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="title" CssClass="red" Display="Dynamic" ErrorMessage="*mandatroy field"></asp:RequiredFieldValidator>
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-4 control-label">Description</label>
            <div class="col-sm-6">
                <asp:TextBox ID="description" runat="server" CssClass="form-control"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="description" CssClass="red" Display="Dynamic" ErrorMessage="*mandatory field"></asp:RequiredFieldValidator>
            </div>
        </div>
        <div class="from-group">
            <div class="col-sm-offset-4 col-sm-6">
                <asp:Button ID="Button1" runat="server" Text="Submit" CssClass="btn btn-primary" OnClick="Button1_Click" />
                <asp:SqlDataSource ID="SqlDataSourceTestimonials" runat="server" ConnectionString="<%$ ConnectionStrings:connect %>" DeleteCommand="DELETE FROM [Testimonials] WHERE [Testimonial_Id] = @Testimonial_Id" InsertCommand="INSERT INTO [Testimonials] ([Name], [Email_ID], [Title], [Description]) VALUES (@Name, @Email_ID, @Title, @Description)" SelectCommand="SELECT * FROM [Testimonials]" UpdateCommand="UPDATE [Testimonials] SET [Name] = @Name, [Email_ID] = @Email_ID, [Title] = @Title, [Description] = @Description WHERE [Testimonial_Id] = @Testimonial_Id">
                    <DeleteParameters>
                        <asp:Parameter Name="Testimonial_Id" Type="Int32" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:ControlParameter ControlID="name" Name="Name" PropertyName="Text" Type="String" />
                        <asp:ControlParameter ControlID="email" Name="Email_ID" PropertyName="Text" Type="String" />
                        <asp:ControlParameter ControlID="email" Name="Title" PropertyName="Text" Type="String" />
                        <asp:ControlParameter ControlID="description" Name="Description" PropertyName="Text" Type="String" />
                    </InsertParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="Name" Type="String" />
                        <asp:Parameter Name="Email_ID" Type="String" />
                        <asp:Parameter Name="Title" Type="String" />
                        <asp:Parameter Name="Description" Type="String" />
                        <asp:Parameter Name="Testimonial_Id" Type="Int32" />
                    </UpdateParameters>
                </asp:SqlDataSource>
            </div>
        </div>
        <div class="from-group">
            <div class="col-sm-offset-4 col-sm-6">
                
            </div>
        </div>

    </div>
    <div id="myModal" class="modal fade" role="dialog">
        <div class="modal-dialog">

            <!-- Modal content-->
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                    <h4 class="modal-title"></h4>
                </div>
                <div class="modal-body">
                    <p><asp:Label ID="msg" runat="server" CssClass="control-label"></asp:Label></p>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                </div>
            </div>

        </div>
    </div>
</asp:Content>


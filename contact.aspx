<%@ Page Title="Contact" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="contact.aspx.cs" Inherits="contact" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <div class="bg-light py-3">
        <div class="container">
            <div class="row">
                <div class="col-md-12 mb-0">
                    <a href="Home.aspx">Home</a> <span class="mx-2 mb-0">/</span>
                    <strong class="text-black">Contact</strong>
                </div>
            </div>
        </div>
    </div>

    <div class="site-section">
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <h2 class="h3 mb-5 text-black">Get In Touch</h2>
                </div>
                <div class="col-md-12">

                    <form action="#" method="post">

                        <div class="p-3 p-lg-5 border">
                            <div class="form-group row">
                                <div class="col-md-6">
                                    <label for="c_fname" class="text-black">First Name <span class="text-danger">*</span></label>
                                    <input type="text" class="form-control" id="txtFirstName" name="c_fname"/>
                                </div>
                                <div class="col-md-6">
                                    <label for="c_lname" class="text-black">Last Name <span class="text-danger">*</span></label>
                                    <input type="text" class="form-control" id="txtlastName" name="c_lname"/>
                                </div>
                            </div>
                            <div class="form-group row">
                                <div class="col-md-12">
                                    <label for="c_email" class="text-black">Email <span class="text-danger">*</span></label>
                                    <input type="email" class="form-control" id="txtEmailid" name="c_email" placeholder=""/>
                                </div>
                            </div>
                            <div class="form-group row">
                                <div class="col-md-12">
                                    <label for="c_subject" class="text-black">Subject </label>
                                    <input type="text" class="form-control" id="txtMailSubject" name="c_subject"/>
                                </div>
                            </div>

                            <div class="form-group row">
                                <div class="col-md-12">
                                    <label for="c_message" class="text-black">Message </label>
                                    <textarea name="c_message" id="txtMailBody" cols="30" rows="7" class="form-control"></textarea>
                                </div>
                            </div>
                            <div class="form-group row">
                                <div class="col-lg-12">
                                    <input type="submit" id="btnsendMail" class="btn btn-primary btn-lg btn-block" value="Send Message"/>
                                </div>
                            </div>
                        </div>
                    </form>
                </div>

            </div>
        </div>
    </div>

    <div class="container">
        <div class="row">
            <div class="col-12">
                <iframe width="100%" height="400px" frameborder="0" scrolling="no" marginheight="0" marginwidth="0" src="http://maps.google.com/maps?q=23.064222, 72.548808&z=15&output=embed"></iframe>
            </div>
        </div>
    </div>

   <script type="text/javascript">

       $("#btnsendMail").click(function (e) {
           e.preventDefault();
           
           if ($('#txtFirstName').val() == "") {
               alert("Please Enter First Name");
               return;
           }
           if ($('#txtFirstName').val() == "") {
               alert("Please Enter Last Name");
               return;
           }
           if ($('#txtEmailid').val() == "") {
               alert("Please Enter Email Address");
               return;
           }
           if (!ValidateEmail($('#txtEmailid').val())) {
               return;
           }

           $.ajax({
               type: "Post",
               url: 'contact.aspx/SendMail_ContactUs',
               contentType: "application/json; charset=utf-8",
               dataType: 'json',
               data: "{FName:'" + $('#txtFirstName').val() + "',LName:'" + $('#txtlastName').val() + "',Emailid:'" + $('#txtEmailid').val() + "',MailSubject: '" + $('#txtMailSubject').val() + "',MailBody:' " + $('#txtMailBody').val() + "'}",
               async: false,
               success: function (Data) {
                   alert(Data.d.Data);
                   $('#txtFirstName').val('');
                   $('#txtEmailid').val('');
                   $('#txtMailSubject').val('');
                   $('#txtMailBody').val('');
               },
               error: function (d) {
                   alert("something went to wrong ..!");
               }
           });
       });

       function ValidateEmail(mail) {
           var reg = /^([A-Za-z0-9_\-\.])+\@([A-Za-z0-9_\-\.])+\.([A-Za-z]{2,4})$/;

           if (reg.test(mail) == false) {
               alert('Invalid Email Address');
               return false;
           }

           return true;
       }

    </script>
</asp:Content>


 


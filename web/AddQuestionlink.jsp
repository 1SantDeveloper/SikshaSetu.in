
<%@page import="com.shikshasetu.entities.CourseEntity"%>
<%@page import="com.shikshasetu.dao.CourseDao"%>
<%@page import="com.shikshasetu.entities.Category"%>
<%@page import="com.shikshasetu.dao.CategoryDao"%>
<%@page import="com.shikshasetu.entities.UniversityEntity"%>
<%@page import="com.shikshasetu.dao.UniversityDao"%>
<%@page import="java.util.List"%>
<%@page import="com.shikshasetu.entities.QuestionEntity"%>
<%@page import="com.shikshasetu.dao.QuestionDao"%>
<%@page import="com.shikshasetu.entities.BlogEntity"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="com.shikshasetu.helper.ConnectionProvider"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.shikshasetu.entities.RegisterUser"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@page import="com.shikshasetu.entities.Message"%>
<%--<%@page import="com.shikshasetu.helper.ConnectionProvider"%>--%>
<%--<%@page  import ="java.sql.*"%>--%>
<!DOCTYPE html>
<html>
    <head>
        <!--meta tag file is added-->
        <%@include file="/metatag.jsp"%>
        <!--meta tag file is added-->
        <!-- Chrome, Firefox OS and Opera -->
        <meta name="theme-color" content="#4285f4">
        <!-- Windows Phone -->
        <meta name="msapplication-navbutton-color" content="#4285f4">
        <!-- iOS Safari -->
        <meta name="apple-mobile-web-app-status-bar-style" content="#4285f4">

        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>sikshasetu ! Add Question  :  Where student share their talent.</title>
        <script src="https://cdn.ckeditor.com/4.16.0/standard/ckeditor.js"></script>
        <!--css start -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <link href="css/shikhsasetu_css.css" rel="stylesheet" type="text/css"/>


        <!--css end--> 
    </head>


    <Body>
        <!--navbar added--> 
        <%@include file="/profileNavBar.jsp"%>
        <!--navbar ended-->

        <!--signup form code-->
        <main>
            <div class="container mt-4 mb-4">
                <div class="row">
                    <div class="col-lg-12 ">    
                        <div class="card">
                            <div class="card-header text-center bg-success text-white">
                                <span class="	fa fa-btc  fa-2x fa-spin" ></span>
                                <p class="hint-text">Please Do some Contribution in Question Paper Section</p>
                            </div>
                            <%                                Message m = (Message) session.getAttribute("QM");
                                if (m != null) {
                            %>

                            <div class="alert alert-warning alert-dismissible fade show bg-info text-white" role="alert">
                                <strong> <%=m.getType()%><br><%=m.getMsg()%></strong>
                                <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                            </div>
                            <%
                                    session.removeAttribute("QM");
                                }


                            %>
                            <%                                Message modalMessage = (Message) session.getAttribute("modalMessage");
                                if (modalMessage != null) {
                            %>

                            <div class="alert alert-warning alert-dismissible fade show bg-warning text-dark" role="alert">
                                <strong> <%=modalMessage.getType()%><br><%=modalMessage.getMsg()%></strong>
                                <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                            </div>
                            <%
                                    session.removeAttribute("modalMessage");
                                }


                            %>
                            <!--Edit quesiton messsage  sesion message--> 
                            <%                        Message mm = (Message) session.getAttribute("QEM");
                                if (mm != null) {
                            %>

                            <div class="alert alert-warning alert-dismissible fade show bg-info text-white" role="alert">
                                <strong> <%=mm.getType()%><br><%=mm.getMsg()%></strong>
                                <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                            </div>
                            <%
                                    session.removeAttribute("QEM");
                                }


                            %>

                            <!--edit quesitn  return message session end here-->


                            <div class="card-body bg-primary text-white">		
                                <form action="AddQuestionLink" method="post" enctype="multipart/form-data" >

                                    <div class="form-group">
                                        <label for="formGroupExampleInput" class="form-label"><strong>Subject Name</strong></label>
                                        <input type="text" class="form-control" name="subject" placeholder="eg. Artificail intelligence" required="required">
                                    </div>
                                    <!--                                    <div class="form-group">
                                                                            <label for="formGroupExampleInput" class="form-label mt-4"><strong>Choose University Name or Education Board Name</strong></label>
                                                                            <input type="text" class="form-control" name="university" placeholder="Short name eg. mdu for maharishi dayanand University or HBSE for haryana Board" required="required">
                                                                        </div>-->
                                    <!--                                    <div class="form-group">
                                                                            <label for="formGroupExampleInput" class="form-label mt-4"><strong>Choose Your Course</strong></label>-->

                                    <!--<input type="text" class="form-control" name="course" placeholder="eg. MCA" required="required">

                                    <select class="form-select" name="course" aria-label="Default select example">
                                        <option selected>MCA</option>
                                        <option value="1">BCA</option>
                                        <option value="2">MA</option>
                                        <option value="3">BSc</option>
                                    </select>


                                </div>
                                <div class="form-group">
                                    <label for="formGroupExampleInput" class="form-label mt-4"><strong>Semester</strong></label>
                                    <input type="number" class="form-control" name="semester"  placeholder="If not applicable leave it blank">
                                </div>
                                    <!--previous code here without select option-->
                                    <div class="form-group">
                                        <label for="formGroupExampleInput" class="form-label mt-4"><strong>Choose University or Education Board Name</strong></label> &nbsp;&nbsp;&nbsp;&nbsp;Note: If not found please &nbsp;<a href="" class="btn btn-warning mb-2" data-bs-toggle="modal" data-bs-target="#exampleModal1"><span class="fa fa-plus-circle"></span> </a>
                                        <!--coding for madals add education board name-->
                                        <!-- Button trigger modal -->



                                        <select class="form-select" name="university" aria-label="Default select example">
                                            <%                                                UniversityDao uddd = new UniversityDao(ConnectionProvider.getConnect());
                                                List<UniversityEntity> ulll = uddd.getUniversityList();
                                                for (UniversityEntity ue : ulll) {
                                            %>
                                            <hr>
                                            <option   class="separator" value="<%=ue.getUname()%>,<%=ue.getState()%>"><%=ue.getUname()%>,<%=ue.getState()%></option>
                                            <option disabled>----------------------------</option>
                                            <%}%>
                                        </select>

                                        <!--<input type="text" class="form-control" name="university" placeholder="eg. mdu for maharishi dayanand University or HBSE for haryana Board" required="required">-->
                                    </div>
                                    <div class="form-group">
                                        <label for="formGroupExampleInput" class="form-label mt-4"><strong>Choose Exam Category</strong></label>&nbsp;&nbsp;&nbsp;&nbsp;Note: If not available please &nbsp;<a href="" class="btn btn-warning mb-2" data-bs-toggle="modal" data-bs-target="#exampleModal2"><span class="fa fa-plus-circle"></span> </a>



                                        <select class="form-select" name="category"  aria-label="Default select example">
                                            <!--<option selected>General   </option>-->
                                            <%
                                                CategoryDao cdddd = new CategoryDao(ConnectionProvider.getConnect());
                                                List<Category> lccc = cdddd.GetAllCategory();
                                                for (Category c : lccc) {%>
                                            <option value="<%=c.getCategory()%>"><%=c.getCategory()%> &nbsp;,<%=c.getDesc()%>  </option>
                                            <option disabled>----------------------</option>
                                            <%}%>
                                        </select>
                                        <!--<input type="text" class="form-control" name="category" placeholder="eg. MCA" required="required">-->
                                    </div>
                                    <div class="form-group">
                                        <label for="formGroupExampleInput" class="form-label mt-4"><strong>Choose Course</strong></label>&nbsp;&nbsp;&nbsp;&nbsp;Note: If not available please &nbsp;<a href="" class="btn btn-warning mb-2" data-bs-toggle="modal" data-bs-target="#exampleModal3"><span class="fa fa-plus-circle"></span> </a>


                                        <select class="form-select" name="course" aria-label="Default select example">
                                            <!--<option selected>MCA</option>-->
                                            <%
                                                CourseDao Cddd = new CourseDao(ConnectionProvider.getConnect());
                                                List<CourseEntity> cld = Cddd.getAllCourse();
                                                for (CourseEntity ec : cld) {
                                            %>
                                            <option value="<%=ec.getCoursename()%>,<%=ec.getShortname()%>"><%=ec.getCoursename()%>,&nbsp;<%=ec.getShortname()%></option>

                                            <option disabled>----------------</option>
                                            <%}%>
                                        </select>
                                        <!--<input type="text" class="form-control" name="course" placeholder="eg. MCA" required="required">-->
                                    </div>
                                    <div class="form-group">
                                        <label for="formGroupExampleInput" class="form-label mt-4"><strong>Semester</strong></label>
                                        <input type="number" class="form-control" name="semester"  placeholder="If not applicable leave it blank">
                                    </div>
                                    <!--previous code end here without select option-->
                                    <div class="form-group">
                                        <label for="formGroupExampleInput" class="form-label mt-4"><strong>Year</strong></label>
                                        <input type="number" class="form-control" name="year" placeholder="If not applicable leave it blank">
                                    </div>
                                    <div class="form-group">
                                        <label for="formGroupExampleInput" class="form-label mt-4"><strong>Paste Question Paper Link</strong></label>
                                        <input type="text" class="form-control" name="filelink" required="required">

                                    </div>

                                    <div class="d-grid gap-2 mt-4">
                                        <input type="submit" class="btn btn-danger" value="Add Paper">
                                    </div>
                                </form>
                            </div>
                        </div
                    </div>

                </div>
            </div>
        </div>
        <!-- Modal -->
        <div class="modal fade" id="exampleModal1" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title text-dark" id="exampleModalLabel">Thanks for adding University or Board </h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <form action="AddBoardNameServlet" method="post">
                        <div class="modal-body text-dark">

                            <div class="form-group mb-2">
                                <label for="formGroupExampleInput" class="form-label"><strong>Enter full name of University or Education Board Name</strong></label>
                                <input type="text" class="form-control" name="uname" required="required" placeholder="eg. Maharishi Dayananad University">
                            </div>
                            <div class="form-group mb-2">
                                <label for="formGroupExampleInput" class="form-label"><strong>Enter Short name of University or Education Board Name</strong></label>
                                <input type="text" class="form-control" name="sname"  required="required" placeholder="eg. MDU">
                            </div>
                            <div class="form-group mb-2">
                                <label for="formGroupExampleInput" class="form-label"><strong>Description</strong></label>
                                <input type="text" class="form-control" name="desc" placeholder="About university or quit field">
                            </div>
                            <div class="form-group mb-2">
                                <label for="formGroupExampleInput" class="form-label"><strong>Where it is located(Address)</strong></label>
                                <input type="text" class="form-control" name="state" required="required" placeholder="eg, Rohtak,Haryana">
                            </div>
                            <div class="form-group mb-2">
                                <label for="formGroupExampleInput" class="form-label"><strong>Country</strong></label>
                                <input type="text" class="form-control" name="country">
                            </div>
                            <div class="form-group mb-2">
                                <input type="hidden" class="form-control" name="userid" value="<%=ru.getUserId()%>">
                            </div>
                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                            <button type="submit" class="btn btn-primary">Save</button>
                        </div>
                    </form>          
                            <div class="modal-footer">

                    </div>

                </div>
            </div>
        </div>


        <!--end here first modals-->
        <!-- Modal -->
        <div class="modal fade" id="exampleModal2" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title text-dark" id="exampleModalLabel">Thanks for adding Exam Category</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <form action="AddExamCategory" method="post">
                        <div class="modal-body">

                            <div class="form-group mb-2">
                                <label for="formGroupExampleInput" class="form-label"><strong>Enter new Exam category</strong></label>
                                <input type="text" class="form-control" name="name" required="required" placeholder="eg. Entrance Exam ">
                            </div>
                            <div class="form-group mb-2">
                                <label for="formGroupExampleInput" class="form-label"><strong>Short Description and purpose of this Category</strong></label>
                                <input type="text" class="form-control" name="purpose"  placeholder="Purpose of examination or quit text field">
                            </div>
                            <div class="form-group mb-2">
                                <input type="hidden" class="form-control" name="userid" value="<%=ru.getUserId()%>">
                            </div>



                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                            <button type="submit" class="btn btn-primary">Save</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>


        <!--modal second end  here-->

        <!--modal third start  here-->


        <!-- Modal -->
        <div class="modal fade" id="exampleModal3" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title text-dark" id="exampleModalLabel">Thanks for adding Course</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <form action="AddNewCourseName" method="post">
                        <div class="modal-body">

                            <div class="form-group mb-2">
                                <label for="formGroupExampleInput" class="form-label"><strong>Enter Full name of Course</strong></label>
                                <input type="text" class="form-control" name="fullname" required="required" placeholder="eg.Master of Computer Application">
                            </div>
                            <div class="form-group mb-2">
                                <label for="formGroupExampleInput" class="form-label"><strong>Short Name of Course</strong></label>
                                <input type="text" class="form-control" name="shortname" required="required" placeholder="eg. MCA or B.A.">
                            </div>
                            <div class="form-group mb-2">
                                <label for="formGroupExampleInput" class="form-label"><strong>Short description of Course</strong></label>
                                <input type="text" class="form-control" name="purpose" placeholder="eg.Computer Science Engineer or quit">
                            </div>
                            <div class="form-group mb-2">
                                <input type="hidden" class="form-control" name="userid" value="<%=ru.getUserId()%>">
                            </div>




                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                            <button type="submit" class="btn btn-primary">Save</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>

        <!--modal third end  here-->





    </main>

    <section>
        <div class="container mt-4 mb-4 ">
            <div class="card w-100">
                <div class="card-body">
                    <h5 class="card-title text-center"><span class="fa fa-btc fa-spin fa-2x"></span></h5>
                    <p class="card-body text-center"><strong>Thanks for supporting us . Your  Contribution is here !..</strong></p>


                    <!--                    <div class="alert alert-warning alert-dismissible text-center" role="alert">
                                            <strong><script>swal("Good job!", "You clicked the button!", "success");</script>
                                                <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                                        </div>
                    showing message if dissmisable;
                    -->






                </div>


                <!--</div>-->
                <div class="container">
                    <table class="table table-dark table-striped">

                        <thead>
                            <tr>
                                <th scope="col">Question Detail</th>
                              
                                <th scope="col">Action</th>
                            </tr>
                        </thead>

                        <%                            RegisterUser Ru = (RegisterUser) session.getAttribute("cuser");
                            if (Ru != null) {

                                int UserId = Ru.getUserId();
                                QuestionDao QD = new QuestionDao(ConnectionProvider.getConnect());
                                List<QuestionEntity> QEL = QD.getQuestionDetailByUserID(UserId);

                                for (QuestionEntity QE : QEL) {
                        %>



                        <tbody>
                            <tr>
                       
                                <td  class="text-white"><small><%=QE.getSubject()%>,<%=QE.getUniversity()%>,<%=QE.getCourse()%>                        </small>   
</td>

                                <td>  <a href="EditQuestion.jsp?QuestionID=<%=QE.getQuestionid()%>" class="btn btn-danger btn-sm">EDIT</a></td>
                        </tr>
                            
                        </tbody>

                        <%
                                    //                                                        out.println(RS.getInt("UID"));
                                    //                                                        out.println(RS.getString("PTitle"));
                                    //                                                        out.println(RS.getInt("PID"));
                                }

                            }
                        %>
                    </table>
                </div>
            </div>

    </section>

    <!--signup form code ened-->

    <!--js-->
    <script src="https://code.jquery.com/jquery-3.5.1.min.js" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js" integrity="sha384-q2kxQ16AaE6UbzuKqyBE9/u/KzioAlnx2maXQHiDX9d4/zp8Ok3f+M7DPm+Ib6IU" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.min.js" integrity="sha384-pQQkAEnwaBkjpqZ8RU1fF1AKtTcHJwFl3pblpTlHXybJjHpMYo79HY3hIi4NKxyj" crossorigin="anonymous"></script>
    <script scr= "https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"></script>
    <!--js end-->  
    <!--carosolcodin-->


    <!--carosole coding end-->







</body>
<%@include file="/footer.jsp" %>  
</html>




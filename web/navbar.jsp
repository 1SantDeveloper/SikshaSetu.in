<%@page import="com.shikshasetu.entities.QuestionEntity"%>
<%@page import="com.shikshasetu.dao.QuestionDao"%>
<%@page import="com.shikshasetu.entities.CourseEntity"%>
<%@page import="com.shikshasetu.entities.CourseEntity"%>
<%@page import="com.shikshasetu.dao.CourseDao"%>
<%@page import="com.shikshasetu.entities.UniversityEntity"%>
<%@page import="com.shikshasetu.dao.UniversityDao"%>
<%@page import="com.shikshasetu.entities.Category"%>
<%@page import="java.util.List"%>
<%@page import="com.shikshasetu.dao.CategoryDao"%>
<%@page import="com.shikshasetu.helper.ConnectionProvider"%>
<%@page import="com.shikshasetu.entities.RegisterUser"%>
<nav class="navbar navbar-expand-lg navbar-light" style="background-color:snow;">
    <!--<nav class="navbar navbar-expand-lg navbar-light" style="background-color:#673ab7;">-->
    <!--<nav class="navbar navbar-expand-lg navbar-dark text-white" style="background-color:#e57373;">-->
    <div class="container-fluid">

        <a class="navbar-brand" href="index.jsp"> <img src="img/logo.png" class="" alt="" width="150" height="50" /></a>
        <!--<img src="img/logo.png" alt="" width="30" height="24" style="max-height: 50px; max-width:150px; min-width: 100px; min-height: 50px"/>-->
        <!--<a class="navbar-brand" href="index.jsp"><strong>SikshaSetu</strong></a>-->
        <button class="navbar-toggler collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#navbarColor02" aria-controls="navbarColor02" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon" ></span>
        </button>
        <div class="navbar-collapse collapse" id="navbarColor02" style="font-size: 20px;">
            <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                <li class="nav-item">
                    <a class="nav-link text-dark" aria-current="page" href="index.jsp">Home</a>
                </li>
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle text-dark" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                        QuestionPaper
                    </a>
                    <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                        <%
                            CategoryDao cd = new CategoryDao(ConnectionProvider.getConnect());
                            List<Category> ce = cd.GetAllCategory();
                            for (Category c : ce) {


                        %>
                        <li><a class="dropdown-item" href="categoryquestion.jsp?category=<%=c.getCategory()%>"><%=c.getCategory()%></a></li>
                        <li><hr class="dropdown-divider"></li>
                            <%}%>
                        <li><a class="dropdown-item" href="showAllQuestionPaper.jsp">All Question Paper</a></li>
                        <hr>
                        <li><button class="dropdown-item" data-bs-toggle="modal" data-bs-target="#exampleModal5">Search Using filter</button></li>


                    </ul>
                    
                    <!--<a class="nav-link  text-white " href="showAllQuestionPaper.jsp">QuestionPaper</a>-->
                </li>
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle text-dark" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                        Blogs
                    </a>
                    <ul class="dropdown-menu" aria-labelledby="navbarDropdown">

                            <li><a class="dropdown-item" href="showblogbycategory.jsp?category=General knowledge">General Knowledge</a></li>
                            <hr class="dropdown-divider"></li>
                            <li><a class="dropdown-item" href="showblogbycategory.jsp?category=News">News Blogs</a></li>
                            <hr class="dropdown-divider"></li>
                            <li><a class="dropdown-item" href="showblogbycategory.jsp?category=Programming">Computer Programming</a></li>
                            <li>
                                <hr class="dropdown-divider"></li>

                            <li><a class="dropdown-item  text-dark" href="showAllBlog.jsp">Show All Blogs</a></li>

                        </ul>
               

                </li>

                <li class="nav-item">
                    <a class="nav-link  text-dark" href="ShowAppStore.jsp">LiveStore</a>
                </li>
                 <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle text-dark" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                        Notifications
                    </a>
                    <ul class="dropdown-menu" aria-labelledby="navbarDropdown">

                            <li><a class="dropdown-item" href="shownotificationbycategory.jsp?category=Result">Result Notification</a></li>
                            <hr class="dropdown-divider"></li>
                           
                            <li><a class="dropdown-item" href="shownotificationbycategory.jsp?category=job">Govt. or private Job Alert</a></li>
                            <hr class="dropdown-divider"></li>
                           
                            <li><a class="dropdown-item" href="shownotificationbycategory.jsp?category=university">University or school Alert</a></li>
                            <hr class="dropdown-divider"></li>
                           
                            <li><a class="dropdown-item" href="shownotificationbycategory.jsp?category=admitcard">Admit Card or DateSheet Notification</a></li>
                            <hr class="dropdown-divider"></li>
                            <li><a class="dropdown-item" href="shownotificationbycategory.jsp?category=importantlink">Important links</a></li>
                            <hr class="dropdown-divider"></li>
                           

                            <li> <a class="nav-link  text-dark" href="ShowAllNotification.jsp">Show  All Notifications</a></li>

                        </ul>
               

                </li>

                
                
                
                <li class="nav-item">
                    <a class="nav-link  text-dark" href="showAllBookStore.jsp">BookStore</a>
                </li>
                <!--code for login and signup and profile-->

                <%
                    RegisterUser cu = (RegisterUser) session.getAttribute("cuser");
                    if (cu == null) {
                %>
                <li class="nav-item">
                    <a class="nav-link  text-success fa fa-user-circle mt-1" href="login.jsp" >Login<a/>
                </li>
                <li class="nav-item">
                    <a class="nav-link  text-info fa fa-user-plus mt-1" href="signup.jsp" >SignUp<a/>
                </li>

                <% } else {%>
                <li class="nav-item">
                    <a class="nav-link  text-dark mt-1" href="profile.jsp"><span> <img src="img/profileimage/<%=cu.getProfile()%>" class="rounded-circle" alt="" style="max-height:2rem; max-width:1.5rem;"/></span>Profile</a>
                </li>
                <%

                    }


                %>

                <!--code end here--> 


            </ul>
            <form class="d-flex" action="indexPageSearchServlet">
                <input class="form-control me-1" type="search" name="SearchString" required="required" placeholder="Type single word to Search" aria-label="Search">
                <button class="btn btn-outline-dark mx-2" type="submit">Search</button>

            </form>


        </div>
    </div>

</nav>

<!--advance search filter code start here-->
<div class="modal fade" id="exampleModal5" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Advance Question paper search with filter</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <div class="card-body bg-info text-white">	

                    <form action="AdvanceSearchServlet" method="post">
                        <div class="form-group">
                            <label for="formGroupExampleInput" class="form-label mt-4"><strong>Choose University Name or Education Board Name</strong></label> 
                            <!--coding for madals add education board name-->
                            <!-- Button trigger modal -->



                            <select class="form-select" name="university" aria-label="Default select example">
                                <%                                                                UniversityDao udd = new UniversityDao(ConnectionProvider.getConnect());
                                    List<UniversityEntity> ul = udd.getUniversityList();
                                    for (UniversityEntity ue : ul) {
                                %>
                                <hr>
                                <option   class="separator" value="<%=ue.getUname()%>,<%=ue.getState()%>"><%=ue.getUname()%>,<%=ue.getState()%></option>
                                <option disabled>--------------------------------------------------------------------------</option>
                                <%}%>
                            </select>

                            <!--<input type="text" class="form-control" name="university" placeholder="eg. mdu for maharishi dayanand University or HBSE for haryana Board" required="required">-->
                        </div>
                        <div class="form-group">
                            <label for="formGroupExampleInput" class="form-label mt-4"><strong>Choose Exam Category</strong></label>
                            <select class="form-select" name="category" aria-label="Default select example">
                                <%
                                    CategoryDao cdd = new CategoryDao(ConnectionProvider.getConnect());
                                    List<Category> cee = cdd.GetAllCategory();
                                    for (Category c : cee) {
                                %>
                                <option value="<%=c.getCategory()%>"> <%=c.getCategory()%></option>
                                <option disabled>--------------------------------------------</option>
                                <%}%>
                            </select>
                        </div>
                        <div class="form-group">
                            <label for="formGroupExampleInput" class="form-label mt-4"><strong>Choose Course</strong></label>


                            <select class="form-select" name="course" aria-label="Default select example">
                                <%                                                                CourseDao Cd = new CourseDao(ConnectionProvider.getConnect());
                                    List<CourseEntity> cl = Cd.getAllCourse();
                                    for (CourseEntity ec : cl) {
                                %>
                                <option value="<%=ec.getCoursename()%>,<%=ec.getShortname()%>"><%=ec.getCoursename()%>,&nbsp;<%=ec.getShortname()%></option>
                                <option disabled>--------------------------------------------</option>
                                <%}%>
                            </select>
                            <!--<input type="text" class="form-control" name="course" placeholder="eg. MCA" required="required">-->
                        </div>

                        <!--previous code end here without select option-->
                        <div class="form-group">
                            <label for="formGroupExampleInput" class="form-label mt-4"><strong>Enter Subject Name</strong></label>

                            <input type="text" class="form-control bg-light " list="datalistOptions" id="exampleDataList"  name="subject" placeholder="subject name question paper name" aria-label="Recipient's username with two button addons">
                            <!--<input class="form-control" list="datalistOptions" id="exampleDataList" placeholder="Type to search...">-->
                            <datalist id="datalistOptions">
                                <%//                                                               UniversityDao ud = new UniversityDao(ConnectionProvider.getConnect());
                                    QuestionDao qdao2 = new QuestionDao(ConnectionProvider.getConnect());
                                    List<QuestionEntity> ql2 = qdao2.getAllQuestionDetailWithCategory();
                                    for (QuestionEntity qe2 : ql2) {
                                %>
                                <option value="<%=qe2.getSubject()%>"><%=qe2.getSubject()%></option>
                                <!--<option disabled>----------------------------------------</option>-->
                                <%}%>
                            </datalist>

                        </div>

                        <div class="d-grid gap-2 mt-4">
                            <input type="submit" class="btn btn-warning" value="Search Question with filter">
                        </div>
                    </form>
                </div>
            </div>

        </div>
    </div>
</div>
<!--end here-->




<!--Start of Tawk.to Script-->
<script type="text/javascript">
    var Tawk_API = Tawk_API || {}, Tawk_LoadStart = new Date();
    (function () {
        var s1 = document.createElement("script"), s0 = document.getElementsByTagName("script")[0];
        s1.async = true;
        s1.src = 'https://embed.tawk.to/5fc88699920fc91564ccfdce/1f47cd8r1';
        s1.charset = 'UTF-8';
        s1.setAttribute('crossorigin', '*');
        s0.parentNode.insertBefore(s1, s0);
    })();
</script>
<!--End of Tawk.to Script-->
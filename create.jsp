<%@ page import = "java.sql.*" %>
<html>
    <head>
        <title>Student Management System</title>
        <link rel="stylesheet" href="mystyle.css">
    </head>
    <body>
        <center>
            <div class ="nav">
                <a href = "index.jsp">Home</a>
                <a href = "create.jsp">Create</a>
                <a href = "delete.jsp">Delete</a>

            </div>
            <h1>Add Student</h1>
            <form >
                <input type="number" name = "rno" placeholder="Enter Roll Number" required/>
                <br>
                <br>
                <input type="text" name = "name" placeholder="Enter Name" required/>
                <br><br>
                <input type="number" name="marks" placeholder="Enter Marks" required/>
                <br><br>
                <input type="submit" name="btn" value="Save"/>
                <br><br>
            </form>
            <%
            if(request.getParameter("btn") != null)
            {
                int rno = Integer.parseInt(request.getParameter("rno"));
                String name = request.getParameter("name");
                int marks = Integer.parseInt(request.getParameter("marks"));
                Connection con = null;
                try{
                    DriverManager.registerDriver(new com.mysql.cj.jdbc.Driver());
                    String url = "jdbc:mysql://localhost:3306/sms27dec24";
                    con = DriverManager.getConnection(url,"root","halloween");
                    String sql = "insert into student values(?,?,?)";
                    PreparedStatement pst = con.prepareStatement(sql);
                    pst.setInt(1,rno);
                    pst.setString(2,name);
                    pst.setInt(3,marks);
                    pst.executeUpdate();
                    out.println("RECORD ADDED");

                }catch(SQLException e){
                    out.println("ISSUE" +e);
                }
                finally{
                    try{
                        con.close();
                    }catch(SQLException e){
                        out.println("CLOSURE ISSUE" +e);
                    }
                }
            }
            %>
        </center>
    </body>
</html>
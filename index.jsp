<%@ page import = "java.sql.*" %>
<html>
    <head>
        <title>Student Management System</title>
        <link rel="stylesheet" href="mystyle.css">
    </head>
    <body>
        <center>
            <div class="nav">
                <a href="index.jsp">Home</a>
                <a href = "create.jsp">Create</a>
                <a href = "delete.jsp">Delete</a>
            </div>
            <h1>Home Page</h1>
            <table border="5">
                <tr>
                    <th>Roll no</th>
                    <th>Name</th>
                    <th>Marks</th>
                </tr>
        <%
           Connection con = null;
           try{
            DriverManager.registerDriver(new com.mysql.cj.jdbc.Driver());
            String url = "jdbc:mysql://localhost:3306/sms27dec24";
            con = DriverManager.getConnection(url,"root","halloween");
            String sql = "select * from student";
            PreparedStatement pst = con.prepareStatement(sql);
            ResultSet rs = pst.executeQuery();
            while(rs.next()){
                int rno = rs.getInt(1);
                String name = rs.getString(2);
                int marks = rs.getInt(3);
        %>

             <tr>
                <td><%=rno%></td>
                <td><%=name%></td>
                <td><%=marks%></td>
             </tr>
        <%
            }
            rs.close();

           }
           catch(SQLException e){
            out.println("ISSUE" +e);
           }finally{
            try{
                con.close();
            }catch(SQLException e){
                out.println("CLOSURE ISSUE" +e);
            }
           }
        %>

            </table>
        </center>
    </body>
</html>
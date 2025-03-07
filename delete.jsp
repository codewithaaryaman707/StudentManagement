<%@ page import ="java.sql.*" %>
<html>
    <head>
        <title>Delete Student Record</title>
        <link rel="stylesheet" href="mystyle.css">
    </head>
    <body>
        <center>
            <div class ="nav">
                <a href="index.jsp">Home</a>
                <a href ="create.jsp">Create</a>
                <a href="delete.jsp">Delete</a>
            </div>
            <h1>Delete Record</h1>
            <form  >
                <input type="number" name = "rno" placeholder="Enter Roll No to delete"/>
                <br>
                <br>
                <input type="submit" name ="btn" value="Delete Student"/>
            </form>
            <%
            if(request.getParameter("btn") !=null)
            {
                int rno = Integer.parseInt(request.getParameter("rno"));
                Connection con = null;
                try{
                    DriverManager.registerDriver(new com.mysql.cj.jdbc.Driver());
                    String url = "jdbc:mysql://localhost:3306/sms27dec24";
                    con = DriverManager.getConnection(url,"root","halloween");
                    //logic to delete a record
                    String sql = "delete from student WHERE roll =?";
                    PreparedStatement pst = con.prepareStatement(sql);
                    pst.setInt(1,rno);
                    int rs = pst.executeUpdate();
                    if(rs >0){
                        out.println("ROLL NO  DELETED");
                    }else{
                        out.println("NO RECORD FOUND");
                    }

                }catch(SQLException e){
                    out.println("ISSUE" +e);
                }finally{
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
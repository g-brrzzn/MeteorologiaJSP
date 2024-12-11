<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css" href="css/style.css">
<meta charset="UTF-8">
<title>MeteorologiaJSP</title>
</head>
<body>
<h3 style="text-align: center;">Bem-vindo ao MeteorologiaJSP</h3><br>
       <form action="getData" method="post">
            Insira um CEP (dos EUA):
            <br>
            <input type="text" name="zip">
            <br>
            <input type="submit">
       </form><br>
       <table style="width: 50%;">
               <thead>
                   <tr>
                       <th>Estado</th>
                       <th>CEPs (EUA)</th>
                   </tr>
               </thead>
               <tbody>
                   <tr>
                       <td>California</td>
                       <td>90001 a 96162</td>
                   </tr>
                   <tr>
                       <td>Texas</td>
                       <td>73301 a 88595</td>
                   </tr>
                   <tr>
                       <td>Florida</td>
                       <td>32003 a 34997</td>
                   </tr>
                   <tr>
                       <td>New York</td>
                       <td>00501 a 14925</td>
                   </tr>
                   <tr>
                       <td>Illinois</td>
                       <td>60001 a 62999</td>
                   </tr>
                   <tr>
                       <td>Pennsylvania</td>
                       <td>15001 a 19640</td>
                   </tr>
                   <tr>
                       <td>Ohio</td>
                       <td>43001 a 45999</td>
                   </tr>
                   <tr>
                       <td>Georgia</td>
                       <td>30002 a 39901</td>
                   </tr>
                   <tr>
                       <td>North Carolina</td>
                       <td>27006 a 28909</td>
                   </tr>
                   <tr>
                       <td>Michigan</td>
                       <td>48001 a 49971</td>
                   </tr>
               </tbody>
           </table>
       
</body>
</html>
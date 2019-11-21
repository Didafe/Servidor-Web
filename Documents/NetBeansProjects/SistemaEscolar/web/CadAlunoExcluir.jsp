<%-- 
    Document   : CadastroAlunoInserir
    Created on : 21/10/2019, 13:25:52
    Author     : Fernando Rodrigues de Sousa
--%>


<%@page import="java.util.Hashtable"%>
<%@page import="modelo_aluno.clsAluno"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="icon" href="img/favicon.png" />
        <link rel="stylesheet" type="text/css" href="style.css"/>
    </head>
    <body>

        <table width="1024" border="1" align="center">
            <tr>
                <td width="119" height="99">&nbsp;</td>
                <td width="781" align="center"><a href="https://srt.ifsp.edu.br/" target="_blank"><img src="img/logo.png" class="media-object  img-responsive img-thumbnail"></a>
                <td width="102" align="center">&nbsp;</td>
            </tr>
        </table>
        <br><br>

        <form name="frmCadastro" action="ControleAluno" method="POST">
            <%

                String pCodAluno = request.getParameter("CodAluno");
                Integer CodAluno = Integer.parseInt(pCodAluno);

                Hashtable<Integer, clsAluno> hstAluno = null;

                hstAluno = (Hashtable<Integer, clsAluno>) getServletContext().getAttribute("hstAluno");

                clsAluno o_Aluno = hstAluno.get(CodAluno);
            %>
            <table width="1024" border="1" align="center" >
                <thead>
                    <tr>
                        <th class="titulo" colspan="2" align="center">Excluir Dados de Aluno</th>
                    </tr>            
                    <tr>
                        <th width="126">Código</th>
                        <td width="483"><input type="text" readonly="readonly" name="txtCodigoAluno" value="<%= o_Aluno.CodAluno%>" /></td>
                    </tr>
                    <tr>
                        <th>Nome</th>
                        <td><input type="text" readonly="readonly" name="txtNomeAluno" value="<%= o_Aluno.NomeAluno%>"/></td>
                    </tr>
                    <tr>
                        <th>Avaliação 1</th>
                        <td><input type="text" readonly="readonly" name="txtAvaliacao1" value="<%= o_Aluno.Avaliacao1%>"/></td>
                    </tr>
                    <tr>
                        <th>Avaliação 2</th>
                        <td><input type="text" readonly="readonly" name="txtAvaliacao2" value="<%= o_Aluno.Avaliacao2%>"/></td>
                    </tr>
                    <tr>
                        <td colspan="2" align="center">
                            <input type="submit" value="Cancelar" name="btnOperacao" />&nbsp;&nbsp;
                            <input type="submit" value="Excluir" name="btnOperacao" />
                    </tr>
                    
                    <tr>
                        <th class="aviso" colspan="2" align="center">Deseja realmente excluir este registro?</th>
                    </tr>
                </thead>
            </table>

        </form>


</html>

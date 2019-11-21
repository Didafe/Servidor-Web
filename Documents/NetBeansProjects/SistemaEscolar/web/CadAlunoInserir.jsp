<%-- 
    Document   : CadastroAlunoInserir
    Created on : 21/10/2019, 13:25:52
    Author     : Fernando Rodrigues de Sousa
--%>

<%@page import="java.util.Set"%>
<%@page import="java.util.Hashtable"%>
<%@page import="modelo_aluno.clsAluno"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cadastro de Alunos</title>
        <link rel="icon" href="img/favicon.png" />
        <link rel="stylesheet" type="text/css" href="style.css"/>
        <style>
            
        </style>
    </head>
    <body>
        
        <table width="1024" border="1" align="center">
            <tr>
                <td width="119" height="99">&nbsp;</td>
                <td width="781" align="center"><a href="https://srt.ifsp.edu.br/" target="_blank"><img src="img/logo.png" class="media-object  img-responsive img-thumbnail"></a>
                </td>
                <td width="102" align="center">&nbsp;</td>
            </tr>
        </table>
        <br><br>

        <form name="frmCadastro" action="ControleAluno" method="POST">

            <table width="1024" border="1" align="center" >
                <thead>
                    <tr>
                        <th class="titulo" colspan="2" align="center">Cadastro de Alunos</th>
                    </tr>            
                    <tr>
                        <th width="126">Código</th>
                        <td width="483"><input type="text" name="txtCodigoAluno" value="" /></td>
                    </tr>
                    <tr>
                        <th>Nome</th>
                        <td><input type="text" name="txtNomeAluno" value=""/></td>
                    </tr>
                    <tr>
                        <th>Avaliação 1</th>
                        <td><input type="text" name="txtAvaliacao1" value=""/></td>
                    </tr>
                    <tr>
                        <th>Avaliação 2</th>
                        <td><input type="text" name="txtAvaliacao2" value=""/></td>
                    </tr>
                    <tr>
                        <td colspan="2" align="center"><input type="submit" value="Limpar" name="btnOperacao" />&nbsp;&nbsp;
                            <input type="submit" value="Inserir" name="btnOperacao" />
                    </tr>
                </thead>
            </table>

        </form>

        <br><br>
        <table class="data" width="1024" border="1" align="center">
            <thead>
                <tr>
                    <th class="titulo" colspan="7" align="center">Listagem de Alunos</th>
                </tr>
                <tr>
                    <th class="sub-titulo" width="70" align="center">Cód</th>
                    <th class="sub-titulo" align="center">Nome</td>
                    <th class="sub-titulo" width="50" align="center">A1</th>
                    <th class="sub-titulo" width="50" align="center">A2</th>
                    <th class="sub-titulo" width="50" align="center">Média</th>
                    <th class="sub-titulo" width="70" align="center">Alterar</th>
                    <th class="sub-titulo" width="70" align="center">Excluir</th>
                </tr>

                <%

                    Hashtable<Integer, clsAluno> hstAluno = null;

                    hstAluno = (Hashtable<Integer, clsAluno>) getServletContext().getAttribute("hstAluno");

                    if (hstAluno != null) {
                        Set<Integer> setCodAluno = hstAluno.keySet();

                        for (Integer CodAluno : setCodAluno) {

                            clsAluno o_Aluno = hstAluno.get(CodAluno);

                            if (o_Aluno.Avaliacao1 == null) {
                                o_Aluno.Avaliacao1 = 0.0f;
                            }
                            if (o_Aluno.Avaliacao2 == null) {
                                o_Aluno.Avaliacao2 = 0.0f;
                            }

                            float Media;

                            if (o_Aluno.Avaliacao1 > 0 || o_Aluno.Avaliacao2 > 0) {
                                Media = (float) (o_Aluno.Avaliacao1 + o_Aluno.Avaliacao2) / 2;
                            } else {
                                Media = 0.0f;
                            }

                            out.println("<tr>");
                            out.println("<td  width=70 align=center>&nbsp;" + o_Aluno.CodAluno + "</td>");
                            out.println("<td>&nbsp;" + o_Aluno.NomeAluno + "</td>");
                            out.println("<td width=50 align=center>&nbsp;" + o_Aluno.Avaliacao1 + "</td>");
                            out.println("<td width=50 align=center>&nbsp;" + o_Aluno.Avaliacao2 + "</td>");
                            out.println("<td width=50 align=center>&nbsp;" + Media + "</td>");
                            out.println("<td id=alterar width=70 align=center ><a href=CadAlunoAlterar.jsp?CodAluno=" + o_Aluno.CodAluno + ">Alterar</a></td>");
                            out.println("<td id=excluir whidth=70 align=center ><a href=CadAlunoExcluir.jsp?CodAluno=" + o_Aluno.CodAluno + ">Excluir</a></td>");
                            out.println("</tr>");
                        }

                    }


                %>

            </thead>
        </table>   

    </body>
</html>

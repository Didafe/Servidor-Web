package camada_controle;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Hashtable;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import modelo_aluno.clsAluno;

@WebServlet(name = "ControleAluno", urlPatterns = {"/ControleAluno"})
public class ControleAluno extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try (PrintWriter out = response.getWriter()) {

            out.println("Dentro Controle Aluno");
            

            String CodigoAluno = null;
            String NomeAluno = null;
            String Avaliacao1 = null;
            String Avaliacao2 = null;
            String Operacao = null;

            Integer CodAluno = null;
            Float Aval1 = null;
            Float Aval2 = null;
           
            CodigoAluno = request.getParameter("txtCodigoAluno");
            NomeAluno = request.getParameter("txtNomeAluno");
            Avaliacao1 = request.getParameter("txtAvaliacao1");
            Avaliacao2 = request.getParameter("txtAvaliacao2");
            Operacao = request.getParameter("btnOperacao");

            if (CodigoAluno != null && !CodigoAluno.isEmpty()) {
                CodAluno = Integer.parseInt(CodigoAluno);
            }else{
                RequestDispatcher o_RequestDispLimpar = request.getRequestDispatcher("CadAlunoInserir.jsp");
                o_RequestDispLimpar.forward(request, response);
            }

            if (Avaliacao1 != null && !Avaliacao1.isEmpty()) {
                Aval1 = Float.parseFloat(Avaliacao1);
            }else{
                RequestDispatcher o_RequestDispLimpar = request.getRequestDispatcher("CadAlunoInserir.jsp");
                o_RequestDispLimpar.forward(request, response);
            }

            if (Avaliacao2 != null && !Avaliacao2.isEmpty()) {
                Aval2 = Float.parseFloat(Avaliacao2);
            }else{
                RequestDispatcher o_RequestDispLimpar = request.getRequestDispatcher("CadAlunoInserir.jsp");
                o_RequestDispLimpar.forward(request, response);
            }
            
            if (Operacao != null) {

                switch (Operacao) {

                    case "Inserir":
                        clsAluno o_AlunoInserir = new clsAluno();
                        o_AlunoInserir.CodAluno = CodAluno;
                        o_AlunoInserir.NomeAluno = NomeAluno;
                        o_AlunoInserir.Avaliacao1 = Aval1;
                        o_AlunoInserir.Avaliacao2 = Aval2;

                        Hashtable<Integer, clsAluno> hstAlunoInserir = null;

                        hstAlunoInserir = (Hashtable<Integer, clsAluno>) getServletContext().getAttribute("hstAluno");
                        if (hstAlunoInserir == null) {
                            hstAlunoInserir = new Hashtable<Integer, clsAluno>();
                        }

                        hstAlunoInserir.put(CodAluno, o_AlunoInserir);

                        getServletContext().setAttribute("hstAluno", hstAlunoInserir);

                        RequestDispatcher o_RequestDispInserir = request.getRequestDispatcher("CadAlunoInserir.jsp");
                        o_RequestDispInserir.forward(request, response);

                        break;

                    case "Alterar":
                        clsAluno o_AlunoAlterar = new clsAluno();
                        o_AlunoAlterar.CodAluno = CodAluno;
                        o_AlunoAlterar.NomeAluno = NomeAluno;
                        o_AlunoAlterar.Avaliacao1 = Aval1;
                        o_AlunoAlterar.Avaliacao2 = Aval2;

                        Hashtable<Integer, clsAluno> hstAlunoAlterar = null;

                        hstAlunoAlterar = (Hashtable<Integer, clsAluno>) getServletContext().getAttribute("hstAluno");

                        hstAlunoAlterar.replace(CodAluno, o_AlunoAlterar);

                        RequestDispatcher o_ReqDispAlterar = request.getRequestDispatcher("CadAlunoInserir.jsp");
                        o_ReqDispAlterar.forward(request, response);

                        break;

                    case "Excluir":

                        clsAluno o_AlunoExcluir = new clsAluno();
                        o_AlunoExcluir.CodAluno = CodAluno;
                        o_AlunoExcluir.NomeAluno = NomeAluno;
                        o_AlunoExcluir.Avaliacao1 = Aval1;
                        o_AlunoExcluir.Avaliacao2 = Aval2;

                        Hashtable<Integer, clsAluno> hstAlunoExcluir = null;

                        hstAlunoExcluir = (Hashtable<Integer, clsAluno>) getServletContext().getAttribute("hstAluno");

                        hstAlunoExcluir.remove(CodAluno);

                        RequestDispatcher o_ReqDispExcluir = request.getRequestDispatcher("CadAlunoInserir.jsp");
                        o_ReqDispExcluir.forward(request, response);

                        break;

                    case "Cancelar":

                        RequestDispatcher o_RequestDispCancelar = request.getRequestDispatcher("CadAlunoInserir.jsp");
                        o_RequestDispCancelar.forward(request, response);
                        break;

                    case "Limpar":
                        RequestDispatcher o_RequestDispLimpar = request.getRequestDispatcher("CadAlunoInserir.jsp");
                        o_RequestDispLimpar.forward(request, response);
                        break;

                    default:
                        out.println("Operação INDEFINIDA!");
                }
            }
        }

    }

}

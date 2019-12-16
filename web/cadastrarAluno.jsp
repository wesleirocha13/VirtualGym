
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html; charset=ISO-8859-1" language="java" pageEncoding="UTF-8" import="java.sql.*" errorPage="" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script src="scripts/aluno.js" charset="utf-8"></script>
        <title>Virtual Gym</title>
    </head>
    <body>
        <a href="index.jsp"><button>Menu</button></a>
        <a href="PesquisaAlunoController"><button>Voltar</button></a>
        <h1>${operacao} Aluno</h1>
        <form action="ManterAlunoController?acao=confirmarOperacao&operacao=${operacao}" method="post" name="formManterAluno" onsubmit="return validarFormulario(this)">
            <span id="erro" style="color: red">${erro}</span>
            <table>
                <tr>
                    <th>Dados Pessoais</th>
                </tr>
                <tr>
                    <td>Código do Aluno: </td> <td><input type="number" name="txtIdAluno" min="1" value="${aluno.idAluno}" <c:if test="${operacao != 'Incluir'}"> readonly </c:if>></td>
                    </tr>
                    <tr>
                        <td>Nome: </td> <td><input type="text" name="txtNome" maxlength="40" value="${aluno.nome}" <c:if test="${operacao == 'Excluir'}"> readonly </c:if>></td>
                    </tr>
                    <tr>
                        <td>Email: </td> <td><input type="text" name="txtEmail" maxlength="40" value="${aluno.email}" <c:if test="${operacao == 'Excluir'}"> readonly </c:if>></td>
                    </tr>
                    <tr>
                        <td>CPF: </td> <td><input type="text" name="txtCpf" maxlength="11" value="${aluno.cpf}" <c:if test="${operacao == 'Excluir'}"> readonly </c:if>></td>
                    </tr>
                    <tr>
                        <td>RG: </td> <td><input type="text" name="txtRg" maxlength="10" value="${aluno.rg}" <c:if test="${operacao == 'Excluir'}"> readonly </c:if>></td>
                    </tr>
                    <tr>
                        <td>Sexo: </td>
                        <td>
                            <select name="optSexo" <c:if test="${operacao == 'Excluir'}"> disabled </c:if>>
                            <option value="Masculino" <c:if test="${aluno.sexo == 'Masculino'}"> selected </c:if>>Masculino</option>
                            <option value="Feminino" <c:if test="${aluno.sexo == 'Feminino'}"> selected </c:if>>Feminino</option>
                            <option value="Outros" <c:if test="${aluno.sexo == 'Outros'}"> selected </c:if>>Outros</option>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td>Data de Nascimento: </td> <td><input type="date" name="txtDataNascimento" value="${aluno.dataNascimento}" <c:if test="${operacao == 'Excluir'}"> readonly </c:if>></td>
                    </tr>
                    <tr>
                        <td>Nome do Responsável: </td> <td><input type="text" name="txtResponsavel" maxlength="40" value="${aluno.responsavel}" <c:if test="${operacao == 'Excluir'}"> readonly </c:if>></td>
                    </tr>
                    <tr>
                        <td>Telefone: </td> <td><input type="text" name="txtTelefone" maxlength="14" value="${aluno.telefone}" <c:if test="${operacao == 'Excluir'}"> readonly </c:if>></td>
                    </tr>
                    <tr>
                        <th>Endereço</th>
                    </tr>
                    <tr>
                        <td>Logradouro: </td> <td><input type="text" name="txtLogradouro" maxlength="32" value="${aluno.endereco.logradouro}" <c:if test="${operacao == 'Excluir'}"> readonly </c:if>></td>
                    </tr>
                    <tr>
                        <td>Número: </td> <td><input type="text" name="txtNumero" maxlength="10" value="${aluno.endereco.numero}" <c:if test="${operacao == 'Excluir'}"> readonly </c:if>></td>
                    </tr>
                    <tr>
                        <td>Complemento: </td> <td><input type="text" name="txtComplemento" maxlength="10" value="${aluno.endereco.complemento}" <c:if test="${operacao == 'Excluir'}"> readonly </c:if>></td>
                    </tr>
                    <tr>
                        <td>Bairro: </td> <td><input type="text" name="txtBairro" maxlength="32" value="${aluno.endereco.bairro}" <c:if test="${operacao == 'Excluir'}"> readonly </c:if>></td>
                    </tr>
                    <tr>
                        <td>Cidade:</td> <td> <input type="text" name="txtCidade" maxlength="32" value="${aluno.endereco.cidade}" <c:if test="${operacao == 'Excluir'}"> readonly </c:if>></td>
                    </tr>
                    <tr>
                        <td>UF: </td> <td><input type="text" name="txtUf" maxlength="2" value="${aluno.endereco.uf}" <c:if test="${operacao == 'Excluir'}"> readonly </c:if>></td>
                    </tr>
                    <tr>
                        <td>CEP:</td> <td> <input type="text" name="txtCep" maxlength="8" value="${aluno.endereco.cep}" <c:if test="${operacao == 'Excluir'}"> readonly </c:if>></td>
                    </tr>
                    <tr>
                        <th>Outros</th>
                    </tr>
                    <tr>
                        <td>Status: </td>
                        <td>
                            <select name="optStatus" <c:if test="${operacao == 'Excluir'}"> disabled </c:if>>
                            <option value="Ativo" <c:if test="${aluno.status == 'Ativo'}"> selected </c:if>>Ativo</option>
                            <option value="Inativo" <c:if test="${aluno.status == 'Inativo'}"> selected </c:if>>Inativo</option>
                            <option value="Inadimplente" <c:if test="${aluno.status == 'Inadimplente'}"> selected </c:if>>Inadimplente</option>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td>Senha: </td> <td><input type="text" name="txtSenha" maxlength="20" value="${aluno.senha}" <c:if test="${operacao == 'Excluir'}"> readonly </c:if>></td>
                    </tr>
                </table>
                <input type="submit" name="btnConfirmar" value="Confirmar">
        </form>
    </body>
</html>
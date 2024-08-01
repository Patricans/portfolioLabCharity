<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="bs" tagdir="/WEB-INF/tags" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="header.jsp" %>


<section class="login-page">
    <h2>Załóż konto</h2>
    <form:form action="/rejestracja" modelAttribute="userForm">

        <bs:bsinput type="email" name="email" required="true" placeholder="Twój Email"
                    label="Adres email"/>

        <bs:bsinput type="password" name="password" required="true" placeholder="Hasło" label="Hasło"/>

        <bs:bsinput type="password" name="password2" required="true" placeholder="Potwierdź hasło"
                    label="Potwierdź hasło"/>

        <div class="form-group form-group--buttons">
            <a href="login.html" class="btn btn--without-border">Zaloguj się</a>
            <button class="btn" type="submit">Załóż konto</button>
        </div>
    </form:form>
</section>
<footer>

<%@ include file="footer.jsp" %>
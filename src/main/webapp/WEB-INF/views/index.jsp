<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ include file="header.jsp" %>

<div class="slogan container container--90">
    <div class="slogan--item">
        <h1>
            Zacznij pomagać!<br/>
            Oddaj niechciane rzeczy w zaufane ręce
        </h1>
    </div>
</div>
</header>
<section id="stats" class="stats">
    <div class="container container--85">
        <div class="stats--item">
            <em>${donationsSum}</em>
            <h3>Oddanych worków</h3>
            <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Eius est beatae, quod accusamus illum
                tempora!</p>
        </div>

        <div class="stats--item">
            <em>${donationsCount}</em>
            <h3>Przekazanych darów</h3>
            <p>Lorem ipsum dolor sit amet consectetur, adipisicing elit. Laboriosam magnam, sint nihil cupiditate quas
                quam.</p>
        </div>
    </div>
</section>

<section id="steps" class="steps">
    <h2>Wystarczą 4 proste kroki</h2>

    <div class="steps--container">
        <div class="steps--item">
            <span class="icon icon--hands"></span>
            <h3>Wybierz rzeczy</h3>
            <p>ubrania, zabawki, sprzęt i inne</p>
        </div>
        <div class="steps--item">
            <span class="icon icon--arrow"></span>
            <h3>Spakuj je</h3>
            <p>skorzystaj z worków na śmieci</p>
        </div>
        <div class="steps--item">
            <span class="icon icon--glasses"></span>
            <h3>Zdecyduj komu chcesz pomóc</h3>
            <p>wybierz zaufane miejsce</p>
        </div>
        <div class="steps--item">
            <span class="icon icon--courier"></span>
            <h3>Zamów kuriera</h3>
            <p>kurier przyjedzie w dogodnym terminie</p>
        </div>
    </div>

    <a href="/rejestracja" class="btn btn--large">Załóż konto</a>
</section>

<section id="about-us" class="about-us">
    <div class="about-us--text">
        <h2>O nas</h2>
        <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Voluptas vitae animi rem pariatur incidunt libero
            optio esse quisquam illo omnis.</p>
        <img src="<c:url value="resources/images/signature.svg"/>" class="about-us--text-signature" alt="Signature"/>
    </div>
    <div class="about-us--image"><<c:url value="resources/images/about-us.jpg"/>" alt="People in circle" />
    </div>

</section>

<section id="help" class="help">
    <h2>Komu pomagamy?</h2>

    <!-- SLIDE 1 -->
    <div class="help--slides active" data-id="1">
        <p>W naszej bazie znajdziesz listę zweryfikowanych Fundacji, z którymi współpracujemy.
            Możesz sprawdzić czym się zajmują.</p>

        <ul class="help--slides-items">
            <c:forEach items="${institutions}" var="institution" varStatus="loop">
                <c:if test="${loop.index % 2 == 0}">
                    <li>
                    <div class="col">
                        <div class="title">${institution.name}</div>
                        <div class="subtitle">${institution.description}</div>
                    </div>
                </c:if>
                <c:if test="${loop.index % 2 != 0}">
                    <div class="col">
                        <div class="title">${institution.name}</div>
                        <div class="subtitle">${institution.description}</div>
                    </div>
                    </li>
                </c:if>
            </c:forEach>
            <c:if test="${institutions.size() % 2 != 0 }">
                <div class="col">
                    <div class="title"></div>
                    <div class="subtitle"></div>
                </div>
                </li>
            </c:if>
        </ul>
    </div>
</section>
<footer>
    <div class="contact" id="contact">
        <h2>Skontaktuj się z nami</h2>
        <h3>Formularz kontaktowy</h3>
        <form:form class="form--contact" action="/kontakt" modelAttribute="contactForm">
            <div class="form-group form-group--50">
                <form:input type="text" path="name" placeholder="Imię"/>
            </div>
            <div class="form-group form-group--50">
                <form:input type="text" path="surname" placeholder="Nazwisko"/>
            </div>

            <div class="form-group">
                <form:textarea path="message" placeholder="Wiadomość" rows="1"/>
            </div>

            <button class="btn" type="submit">Wyślij</button>
        </form:form>
    </div>

<%@ include file="footer.jsp" %>
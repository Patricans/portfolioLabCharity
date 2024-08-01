<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ include file="header.jsp" %>

<div class="slogan container container--90">
    <div class="slogan--item">
        <h1>
            Oddaj rzeczy, których już nie chcesz<br/>
            <span class="uppercase">potrzebującym</span>
        </h1>

        <div class="slogan--steps">
            <div class="slogan--steps-title">Wystarczą 4 proste kroki:</div>
            <ul class="slogan--steps-boxes">
                <li>
                    <div><em>1</em><span>Wybierz rzeczy</span></div>
                </li>
                <li>
                    <div><em>2</em><span>Spakuj je w worki</span></div>
                </li>
                <li>
                    <div><em>3</em><span>Wybierz fundację</span></div>
                </li>
                <li>
                    <div><em>4</em><span>Zamów kuriera</span></div>
                </li>
            </ul>
        </div>
    </div>
</div>
</header>

<section class="form--steps">
    <div class="form--steps-instructions">
        <div class="form--steps-container">
            <h3>Ważne!</h3>
            <p data-step="1" class="active">
                Uzupełnij szczegóły dotyczące Twoich rzeczy. Dzięki temu będziemy
                wiedzieć komu najlepiej je przekazać.
            </p>
            <p data-step="2">
                Uzupełnij szczegóły dotyczące Twoich rzeczy. Dzięki temu będziemy
                wiedzieć komu najlepiej je przekazać.
            </p>
            <p data-step="3">
                Wybierz jedną, do
                której trafi Twoja przesyłka.
            </p>
            <p data-step="4">Podaj adres oraz termin odbioru rzeczy.</p>
        </div>
    </div>

    <div class="form--steps-container">
        <div class="form--steps-counter">Krok <span>1</span>/4</div>

        <form:form action="/oddaj" method="post" modelAttribute="donation">
            <!-- STEP 1: class .active is switching steps -->
            <div data-step="1" class="active divStep">
                <h3>Zaznacz co chcesz oddać:</h3>
                <c:forEach items="${categories}" var="category">
                    <div class="form-group form-group--checkbox">
                        <label>
                            <input
                                    type="checkbox"
                                    name="categories"
                                    value="${category.id}"
                            />
                            <span class="checkbox"></span>
                            <span class="description">${category.name}</span>
                        </label>
                    </div>
                </c:forEach>
                <div class="form-group form-group--buttons">
                    <button type="button" class="btn next-step">Dalej</button>
                </div>
            </div>

            <!-- STEP 2 -->
            <div data-step="2" class="divStep">
                <h3>Podaj liczbę 60l worków, w które spakowałeś/aś rzeczy:</h3>
                <spring:bind path="quantity">
                    <div class="form-group form-group--inline">
                        <label>
                            Liczba 60l worków:
                            <form:input type="number" path="quantity" step="1" min="1"/>
                        </label>
                    </div>
                </spring:bind>
                <div class="form-group form-group--buttons">
                    <button type="button" class="btn prev-step">Wstecz</button>
                    <button type="button" class="btn next-step">Dalej</button>
                </div>
            </div>


            <!-- STEP 3 -->
            <div data-step="3" class="divStep">
                <h3>Wybierz organizacje, której chcesz pomóc:</h3>

                <c:forEach items="${institutions}" var="institution">
                    <div class="form-group form-group--checkbox">
                        <label>
                            <input type="radio" name="organization" value="${institution.id}"/>
                            <span class="checkbox radio"></span>
                            <span class="description">
                            <div class="title">${institution.name}</div>
                            <div class="subtitle">Cel i misja: ${institution.description}</div>
                        </span>
                        </label>
                    </div>
                </c:forEach>

                <div class="form-group form-group--buttons">
                    <button type="button" class="btn prev-step">Wstecz</button>
                    <button type="button" class="btn next-step">Dalej</button>
                </div>
            </div>
            <!-- STEP 4 -->
            <div data-step="4" class="divStep">
                <h3>Podaj adres oraz termin odbioru rzecz przez kuriera:</h3>

                <div class="form-section form-section--columns">

                    <spring:bind path="street">
                    <div class="form-section--column">
                        <h4>Adres odbioru</h4>
                        <div class="form-group form-group--inline">
                            <label> Ulica <form:input type="text" path="street"/> </label>
                        </div>
                        </spring:bind>

                        <spring:bind path="city">
                            <div class="form-group form-group--inline">
                                <label> Miasto <form:input type="text" path="city"/> </label>
                            </div>
                        </spring:bind>

                        <spring:bind path="zipCode">
                            <div class="form-group form-group--inline">
                                <label>
                                    Kod pocztowy <form:input type="text" path="zipCode"/>
                                </label>
                            </div>
                        </spring:bind>

                        <spring:bind path="phoneNumber">
                            <div class="form-group form-group--inline">
                                <label>
                                    Numer telefonu <form:input type="phone" path="phoneNumber"/>
                                </label>
                            </div>
                        </spring:bind>
                    </div>
                    <div class="form-section--column">
                        <h4>Termin odbioru</h4>
                        <spring:bind path="pickUpDate">
                            <div class="form-group form-group--inline">
                                <label> Data <form:input type="date" path="pickUpDate"/> </label>
                            </div>
                        </spring:bind>
                        <spring:bind path="pickUpTime">
                            <div class="form-group form-group--inline">
                                <label> Godzina <form:input type="time" path="pickUpTime"/> </label>
                            </div>
                        </spring:bind>
                        <spring:bind path="pickUpComment">
                            <div class="form-group form-group--inline">
                                <label>
                                    Uwagi dla kuriera
                                    <form:textarea path="pickUpComment" rows="5"></form:textarea>
                                </label>
                            </div>
                        </spring:bind>
                    </div>
                </div>
                <div class="form-group form-group--buttons">
                    <button type="button" class="btn prev-step">Wstecz</button>
                    <button type="button" class="btn next-step">Dalej</button>
                </div>
            </div>

            <!-- STEP 5 -->
            <div data-step="5" class="divStep">
                <h3>Podsumowanie Twojej darowizny</h3>

                <div class="summary">
                    <div class="form-section">
                        <h4>Oddajesz:</h4>
                        <ul>
                            <li>
                                <span class="icon icon-bag"></span>
                                <span class="summary--text"
                                      id="coOddano">4 worki ubrań w dobrym stanie dla dzieci</span>
                            </li>

                            <li>
                                <span class="icon icon-hand"></span>
                                <span class="summary--text"
                                      id="gdzieOddano"> Dla fundacji "Mam marzenie" w Warszawie</span>
                            </li>
                        </ul>
                    </div>

                    <div class="form-section form-section--columns">
                        <div class="form-section--column">
                            <h4>Adres odbioru:</h4>
                            <ul>
                                <li id="summary-street">Prosta 51</li>
                                <li id="summary-city">Warszawa</li>
                                <li id="summary-zipCode">99-098</li>
                                <li id="summary-phoneNumber">123 456 789</li>
                            </ul>
                        </div>

                        <div class="form-section--column">
                            <h4>Termin odbioru:</h4>
                            <ul>
                                <li id="summary-date">13/12/2018</li>
                                <li id="summary-time">15:40</li>
                                <li id="summary-comments">Brak uwag</li>
                            </ul>
                        </div>
                    </div>
                </div>

                <div class="form-group form-group--buttons">
                    <button type="button" class="btn prev-step">Wstecz</button>
                    <button type="submit" class="btn">Potwierdzam</button>
                </div>
            </div>
        </form:form>
    </div>
</section>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script>
    $('button.next-step').click(function () {
        var div = $(this).closest('.divStep');
        var step = 0 + $(div).data('step');
        step += 1;
        $('div[data-step=' + step + ']').addClass('active');
        $(div).removeClass('active');
        if (step === 5) {
            var oddaneRzeczy = $.map($('input[name=categories]:checked'), function (e) {
                return $(e).siblings('span.description').text();
            }).join(', ');
            var ileOddal = $('input#quantity').val();
            var nazwaFundacji = $.map($('input[name=organization]:checked'), function (e) {
                return $(e).parent().find('.description .title').text();
            }) [0];
            $('span#coOddano').text(ileOddal + ' worki ' + oddaneRzeczy);
            $('span#gdzieOddano').text(nazwaFundacji);
            $('li#summary-street').text($('input#street').val());
            $('li#summary-city').text($('input#city').val());
            $('li#summary-zipCode').text($('input#zipCode').val());
            $('li#summary-phoneNumber').text($('input#phoneNumber').val());
            $('li#summary-date').text($('input#pickUpDate').val());
            $('li#summary-time').text($('input#pickUpTime').val());
            $('li#summary-comments').text($('textarea#pickUpComment').val());
        }
    });
    $('button.prev-step').click(function () {
        var div = $(this).closest('.divStep');
        var step = 0 + $(div).data('step');
        step -= 1;
        $('div[data-step=' + step + ']').addClass('active');
        $(div).removeClass('active');
    });
</script>
<footer>
<%@ include file="footer.jsp" %>
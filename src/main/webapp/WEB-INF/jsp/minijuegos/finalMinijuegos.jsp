<%@ page session="false" trimDirectiveWhitespaces="true" %>
    <%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
        <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
            <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
                <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
                    <%@ taglib prefix="petclinic" tagdir="/WEB-INF/tags" %>


                        <petclinic:layout pageName="finalMinijuegos">

                            <body style="background-color: #bea3cd;">
                                <div class="container" style="margin-top: 20%;">
                                    <div class="row text-center">
                                        <div class="col-6">
                                            <h2>GANADOR</h2>
                                            <p>${ganador.firstName}</p>
                                            <c:if test="${creador == jugadorActual}">
                                                <a href="/games/${gameId}/finalizar"><button class="btn btn-danger">Finalizar Partida</button></a>
                                            </c:if>
                                        </div>
                                        <div class="col-6">
                                            <h2>PERDEDOR</h2>
                                            <p>${perdedor.firstName}</p>
                                            <c:if test="${perdedor.id == jugadorActual}">
                                                <a href="/games/${gameId}/minijuegos/seleccion"><button
                                                        class="btn btn-success">Siguente Minijuego</button></a>
                                            </c:if>
                                        </div>
                                    </div>
                                </div>
                            </body>
                        </petclinic:layout>
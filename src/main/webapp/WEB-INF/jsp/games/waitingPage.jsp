<%@ page session="false" trimDirectiveWhitespaces="true" %>
    <%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
        <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
            <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
                <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
                    <%@ taglib prefix="petclinic" tagdir="/WEB-INF/tags" %>


                        <petclinic:layout pageName="games">

                            <body style="background-color: #bea3cd;">
                                <div class="container" style="margin-top: 20%;">
                                    <div class="text-center">
                                        <h2>Espera un poquito pisha, paciencia. Numero jugadores:
                                            <c:out value="${now}" />
                                        </h2>
                                        <c:if test="${boton}">
                                           <a href="/games/${gameId}/primera"><button class="btn btn-success">EMPEZAR PARTIDA</button></a>
                                        </c:if>
                                    </div>
                                </div>
                            </body>
                        </petclinic:layout>
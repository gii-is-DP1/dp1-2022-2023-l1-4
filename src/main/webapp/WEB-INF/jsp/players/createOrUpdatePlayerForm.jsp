<%@ page session="false" trimDirectiveWhitespaces="true" %>
    <%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
        <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
            <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
                <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
                    <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
                        <%@ taglib prefix="petclinic" tagdir="/WEB-INF/tags" %>

                            <petclinic:layout pageName="players">
                                <form:form modelAttribute="player" class="form-horizontal" id="add-player-form">
                                    <section class="vh-100 gradient-custom">
                                        <div class="container py-5 h-100">
                                            <div class="row justify-content-center align-items-center h-25">
                                                <div class="col-12 col-lg-9 col-xl-7">
                                                    <div class="card shadow-2-strong card-registration"
                                                        style="border-radius: 15px;">
                                                        <div class="card-body p-4 p-md-5">
                                                            <h3 class="mb-4 pb-2 pb-md-0 mb-md-5">Registration Form</h3>
                                                            <div class="row">
                                                                <div class="col-md-6 mb-4">
                                                                    <div class="form-outline">
                                                                        <petclinic:inputField label="First Name"
                                                                            name="firstName" />
                                                                    </div>
                                                                </div>
                                                                <div class="col-md-6 mb-4">

                                                                    <div class="form-outline">
                                                                        <petclinic:inputField label="Last Name"
                                                                            name="lastName" />
                                                                    </div>

                                                                </div>
                                                            </div>

                                                            <div class="row">
                                                                <div class="col-md-6 mb-4">

                                                                    <div class="form-outline">
                                                                        <petclinic:inputField label="Telephone"
                                                                            name="telephone" />
                                                                    </div>
                                                                </div>
                                                                <div class="col-md-6 mb-4">
                                                                    <div class="form-outline">
                                                                        <petclinic:inputField label="Email"
                                                                            name="email" />
                                                                    </div>
                                                                </div>
                                                            </div>

                                                            <div class="row">
                                                                <div class="col-md-6 mb-4 pb-2">
                                                                    <div class="form-outline">
                                                                        <petclinic:inputField label="Username"
                                                                            name="user.username" />
                                                                    </div>
                                                                </div>
                                                                <div class="col-md-6 mb-4 pb-2">
                                                                    <div class="form-outline">
                                                                        <petclinic:inputField label="Password"
                                                                            name="user.password" />
                                                                    </div>

                                                                </div>
                                                            </div>

                                                            <div class="row">
                                                                <div class="col-md-6 mb-4 pb-2"></div>
                                                                <c:choose>
                                                                    <c:when test="${player['new']}">
                                                                        <button class="btn btn-success"
                                                                            type="submit">Add Player</button>
                                                                    </c:when>
                                                                    <c:otherwise>
                                                                        <button class="btn btn-success"
                                                                            type="submit">Update
                                                                            Player</button>
                                                                    </c:otherwise>
                                                                </c:choose>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        </div>
                                    </section>

                                </form:form>
                            </petclinic:layout>
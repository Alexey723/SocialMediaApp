<#include "security.ftlh">
<#import "login.ftlh" as l>

<nav class="navbar navbar-expand-lg bg-body-tertiary px-5">
        <a class="navbar-brand" href="#">Social Media App</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="������������� ���������">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                <li class="nav-item">
                    <a class="nav-link" href="/">Главная</a>
                </li>
                <#if known>
                <li class="nav-item">
                    <a class="nav-link" href="/main">Посты</a>
                </li>
                <#else>
                    <li class="nav-item">
                        <a class="nav-link" href="/login">Личный кабинет</a>
                    </li>
                </#if>
                <#if isAdmin>
                <li class="nav-item">
                    <a class="nav-link" href="/user">Список пользователей</a>
                </li>
                </#if>
                <#if known>
                    <li class="nav-item">
                        <a class="nav-link" href="/user/profile">Профиль</a>
                    </li>
                </#if>
            </ul>
            <div class="navbar-text mx-3">${name}</div>
            <#if known>
            <@l.logout />
            </#if>
        </div>
</nav>
<#macro login path isRegisterForm>
    <form action="${path}" method="post">
        <div class="row mb-3">
            <label class="col-sm-2 col-form-label">Логин: </label>
            <div class="col-sm-6">
                <input type="text" class="form-control" name="username" placeholder="Введите логин"/>
            </div>
        </div>
        <#if isRegisterForm>
        <div class="row mb-3">
            <label class="col-sm-2 col-form-label">E-mail:</label>
            <div class="col-sm-6">
                <input type="email" class="form-control" name="email" placeholder="example@examle.com"/>
            </div>
        </div>
        </#if>
        <div class="row mb-3">
            <label class="col-sm-2 col-form-label">Пароль:</label>
            <div class="col-sm-6">
                <input type="password" class="form-control" name="password" placeholder="Введите пароль"/>
            </div>
        </div>

        <input type="hidden" name="_csrf" value="${_csrf.token}"/>
       <#if !isRegisterForm><a href="/registration">Add new user</a></#if>
        <button type="submit" class="btn btn-primary"><#if isRegisterForm>Зарегистрироваться<#else>Войти</#if></button>
    </form>
</#macro>
<#macro logout>
    <form action="/logout" method="post">
        <input type="hidden" name="_csrf" value="${_csrf.token}">
        <button type="submit" class="btn btn-primary">Выйти</button>
    </form>
</#macro>
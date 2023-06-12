<#import "parts/common.ftlh" as c>
<@c.page>
    <h5>${username}</h5>
    ${message!}
    <form method="post">
            <div class="row mb-3">
                <label class="col-sm-2 col-form-label">E-mail:</label>
                <div class="col-sm-6">
                    <input type="email" class="form-control" name="email" value="${email!''}"/>
                </div>
            </div>
        <div class="row mb-3">
            <label class="col-sm-2 col-form-label">Пароль:</label>
            <div class="col-sm-6">
                <input type="password" class="form-control" name="password" placeholder="Введите пароль"/>
            </div>
        </div>
        <input type="hidden" name="_csrf" value="${_csrf.token}"/>
        <button type="submit" class="btn btn-primary">Сохранить</button>
    </form>
</@c.page>
<#import "parts/common.ftlh" as c>
<@c.page>
    <form class="row g-2" method="get" action="/main">
        <div class="col-auto">
            <label for="inputSearch" class="visually-hidden">Поиск</label>
            <input type="text" class="form-control" id="inputSearch" name="filter" value="${filter!}"
                   placeholder="Введите тэги для поиска">
        </div>
        <div class="col-auto">
            <button type="submit" class="btn btn-primary mb-3">Поиск</button>
        </div>
    </form>

    <#include "parts/messageEdit.ftlh" />

    <#include "parts/messageList.ftlh" />

</@c.page>
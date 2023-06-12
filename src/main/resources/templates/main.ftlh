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

    <a class="btn btn-primary" data-bs-toggle="collapse" href="#collapseExample" role="button" aria-expanded="false"
       aria-controls="collapseExample">
        Добавить пост
    </a>
    <div class="collapse <#if message??>show</#if> my-3" id="collapseExample">
        <div class="card card-body">
            <div class="form-group">
                <form method="post" enctype="multipart/form-data">
                    <div class="form-group  mt-3">
                        <textarea cols="60" rows="5" class="form-control ${(textError??)?string('is-invalid', '')}" value="<#if mesage??>${message.text}</#if>" name="text" placeholder="Введите ваше сообщение"></textarea>
                        <#if textError??>
                            <div class="invalid-feedback">
                                ${textError}
                            </div>
                        </#if>
                    </div>

                    <div class="form-group  mt-3">
                        <input type="text" class="form-control" value="<#if mesage??>${message.tag}</#if>" name="tag" placeholder="Tag"/>
                        <#if textError??>
                            <div class="invalid-feedback">
                                ${textError}
                            </div>
                        </#if>
                    </div>
                    <div class="form-group  mt-3">
                        <div class="input-group">
                            <input type="file" name="file" class="form-control" id="inputGroupFile04" aria-describedby="inputGroupFileAddon04" aria-label="Загрузка">
                        </div>
                    </div>
                    <input type="hidden" name="_csrf" value="${_csrf.token}">
                    <button type="submit" class="btn btn-primary  mt-3">Добавить</button>
                </form>
            </div>
        </div>
    </div>
    <div class="mb-5">
    <#list messages as message>
        <div class="card  text-center mb-3" style="width: 45rem;">
            <#if message.filename??>
            <img src="/img/${message.filename}" class="card-img-top">
            </#if>
            <div class="m-2">
                <span>${message.text}</span>
                <i>${message.tag}</i>
            </div>
            <div class="card-footer text-muted">
    ${message.authorName}
  </div>
        </div>

        <#--<div>
            <b>${message.id}</b>
            <span>${message.text}</span>
            <i>${message.tag}</i>
            <strong>${message.authorName}</strong>
            <#if message.filename??>
                <div>
                    <img src="/img/${message.filename}">
                </div>

        </div>-->
    <#else>
        No messages
    </#list>
    </div>


</@c.page>
<a class="btn btn-primary" data-bs-toggle="collapse" data-bs-target="#collapseExample" href="#collapseExample" role="button" aria-expanded="false" aria-controls="collapseExample">
    Добавление / Редактирование
</a>
<div class="collapse <#if message??>show</#if>" id="collapseExample">
    <div class="form-group">
        <form method="post" enctype="multipart/form-data">
            <div class="form-group mt-3">
                <textarea cols="60" rows="5" class="form-control ${(textError??)?string('is-invalid', '')}" name="text" placeholder="Введите ваше сообщение"><#if message??>${message.text}</#if></textarea>
                <#if textError??>
                    <div class="invalid-feedback">
                        ${textError}
                    </div>
                </#if>
            </div>
            <div class="form-group mt-3">
                <input type="text" class="form-control"
                       value="<#if message??>${message.tag}</#if>" name="tag" placeholder="Тэг">
                <#if tagError??>
                    <div class="invalid-feedback">
                        ${tagError}
                    </div>
                </#if>
            </div>
            <div class="form-group mt-3">
                <div class="input-group">
                    <input type="file" name="file" class="form-control" id="inputGroupFile04" aria-describedby="inputGroupFileAddon04" aria-label="Загрузка">
                </div>
            </div>
            <input type="hidden" name="_csrf" value="${_csrf.token}" />
            <input type="hidden" name="id" value="<#if message??>${message.id}</#if><#--<#if message??>${message.id}<#else>1</#if>-->" />
            <div class="form-group mt-3">
                <button type="submit" class="btn btn-primary">Добавить / Сохранить</button>
            </div>
        </form>
    </div>
</div>




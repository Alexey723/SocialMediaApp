<#include "security.ftlh">
<#import "pager.ftlh" as  p>

<@p.pager url page />
<div class="card-columns" id="message-list">
    <#list page.content as message>
        <div class="card my-3" data-id="${message.id}">
            <#if message.filename??>
                <img src="/img/${message.filename}" class="card-img-top" />
            </#if>
            <div class="m-2">
               <span style="font-family: Arial; font-size: 16px; white-space: pre-wrap;">${message.text}</span><br/>
                <i>#${message.tag}</i>
            </div>
            <div class="card-footer text-muted container">
                <div class="row">
                    <a class="col align-self-center" href="/user-messages/${message.author.id}">${message.authorName}</a>
                    <a class="col align-self-center" href="/messages/${message.id}/like">
                        <#if message.meLiked>
                            <i class="fas fa-heart"></i>
                        <#else>
                            <i class="far fa-heart"></i>
                        </#if>
                        ${message.likes}
                    </a>
                    <#if message.author.id == currentUserId>
                        <a class="col btn btn-primary" href="/user-messages/${message.author.id}?message=${message.id}">
                            Редактировать
                        </a>
                    </#if>
                </div>
            </div>
        </div>
    <#else>
        Нет постов
    </#list>
</div>
<#--<div class="mb-5">
    <#list page.content as message>
    <div class="card  text-center mb-3 mx-auto" style="width: 45rem;">
        <#if message.filename??>
            <img src="/img/${message.filename}" class="card-img-top">
        </#if>
        <div class="m-2">
            <span>${message.text}</span><br>
            <i>#${message.tag}</i>
        </div>
        <p class="mx-5" style="text-align: right">Автор:
        <a style="text-decoration: none" href="/user-messages/${message.author.id}">${message.authorName}</a>
        </p>
        <#if message.author.id == currentUserId>
            <a class="btn btn-primary" href="/user-messages/${message.author.id}?message=${message.id}">
                Редактировать
            </a>
        </#if>
    </div>
        <#else>
            No messages
        </#list>
</div>-->
<@p.pager url page />
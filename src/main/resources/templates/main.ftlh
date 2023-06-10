<#import "parts/common.ftlh" as c>
<#import "parts/login.ftlh" as l>
<@c.page>
    <@l.logout />
    <div>
        <form method="post" action="/main">
            <input type="hidden" name="_csrf" value="${_csrf.token}">
            <input type="text" name="text" placeholder="Enter your message"/>
            <input type="text" name="tag" placeholder="Tag"/>
            <button type="submit">Add</button>
        </form>
    </div>
    <div>
        List of messages:
    </div>
    <form method="post" action="filter">
        <input type="hidden" name="_csrf" value="${_csrf.token}">
        <input type="text" name="filter" value="${filter!""}">
        <button type="submit">Find</button>
    </form>
    <#list messages as message>
        <div>
            <b>${message.id}</b>
            <span>${message.text}</span>
            <i>${message.tag}</i>
            <strong>${message.authorName}</strong>
        </div>
    <#else>
        No messages
    </#list>
</@c.page>
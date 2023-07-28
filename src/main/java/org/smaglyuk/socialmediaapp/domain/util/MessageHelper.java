package org.smaglyuk.socialmediaapp.domain.util;

import org.smaglyuk.socialmediaapp.domain.User;

public abstract class MessageHelper {
    public static String getAuthorName(User author){
        return author != null ? author.getUsername() : "<none>";
    }
}

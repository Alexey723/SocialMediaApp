package org.smaglyuk.socialmediaapp.Service;

import org.smaglyuk.socialmediaapp.domain.Message;
import org.smaglyuk.socialmediaapp.domain.User;
import org.smaglyuk.socialmediaapp.domain.dto.MessageDto;
import org.smaglyuk.socialmediaapp.repository.MessageRepository;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
public class MessageService {

    private final MessageRepository messageRepository;

    public MessageService(MessageRepository messageRepository) {
        this.messageRepository = messageRepository;
    }

    public Page <MessageDto> getAllMsg(Pageable pageable, User user){
    return messageRepository.findAll(pageable, user);
    }

    public Page <Message> getAllMsgByAuthor(User user, Pageable pageable){
        return messageRepository.findAllByAuthor(user, pageable);
    }
    public Page <MessageDto> messageList(Pageable pageable, String filter, User user){
        if(filter != null && !filter.isEmpty()){
            return messageRepository.findByTag(filter, pageable, user);
        } else {
            return  messageRepository.findAll(pageable, user);
        }
    }

    public Page<MessageDto> getByTag(String tag, Pageable pageable, User user){
        return messageRepository.findByTag(tag, pageable, user);
    }
    @Transactional
    public void saveMessage(Message message){
        messageRepository.save(message);
    }

    public Page<MessageDto> messageListForUser(Pageable pageable, User currentUser, User author) {
        return messageRepository.findByUser(pageable, author, currentUser);
    }
}

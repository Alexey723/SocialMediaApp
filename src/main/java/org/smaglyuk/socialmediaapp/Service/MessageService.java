package org.smaglyuk.socialmediaapp.Service;

import org.smaglyuk.socialmediaapp.domain.Message;
import org.smaglyuk.socialmediaapp.repository.MessageRepository;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
public class MessageService {

    private final MessageRepository messageRepository;

    public MessageService(MessageRepository messageRepository) {
        this.messageRepository = messageRepository;
    }

    public Iterable <Message> getAllMsg(){
    return messageRepository.findAll();
    }

    public List <Message> getByTag(String tag){
        return messageRepository.findByTag(tag);
    }
    @Transactional
    public void saveMessage(Message message){
        messageRepository.save(message);
    }
}

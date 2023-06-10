package org.smaglyuk.socialmediaapp.Controller;

import org.smaglyuk.socialmediaapp.Service.MessageService;
import org.smaglyuk.socialmediaapp.domain.Message;
import org.smaglyuk.socialmediaapp.domain.User;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.Map;

@Controller
public class MainController {

    private final MessageService messageService;

    public MainController(MessageService messageService) {
        this.messageService = messageService;
    }

    @GetMapping("/")
    public String greeting () {
        return "greeting";
    }
    @GetMapping("/main")
    public String main(Map<String, Object> model) {
        model.put("messages", messageService.getAllMsg());
        return "main";
    }
    @PostMapping("/main")
    public String addMessage(
            @AuthenticationPrincipal User user,
            @RequestParam String text,
            @RequestParam String tag,
            Map<String, Object> model){
        Message message = new Message(text, tag, user);
        messageService.saveMessage(message);
        model.put("messages", messageService.getAllMsg());
    return "main";
    }

    @PostMapping("filter")
    public String filter(@RequestParam String filter, Map<String, Object> model){
        Iterable<Message> messages;
        if(filter != null && !filter.isEmpty()){
           messages = messageService.getByTag(filter);
        } else {
            messages =  messageService.getAllMsg();
        }
        model.put("messages", messages);
        return "main";
    }

}

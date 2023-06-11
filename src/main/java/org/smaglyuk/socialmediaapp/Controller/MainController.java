package org.smaglyuk.socialmediaapp.Controller;

import org.smaglyuk.socialmediaapp.Service.MessageService;
import org.smaglyuk.socialmediaapp.domain.Message;
import org.smaglyuk.socialmediaapp.domain.User;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.util.UUID;

@Controller
public class MainController {

    private final MessageService messageService;
    @Value("${upload.path}")
    private String uploadPath;

    public MainController(MessageService messageService) {
        this.messageService = messageService;
    }

    @GetMapping("/")
    public String greeting () {
        return "greeting";
    }
    @GetMapping("/main")
    public String main(@RequestParam(required = false) String filter, Model model) {
        Iterable<Message> messages;
        if(filter != null && !filter.isEmpty()){
            messages = messageService.getByTag(filter);
        } else {
            messages =  messageService.getAllMsg();
        }
        model.addAttribute("messages", messages);
        model.addAttribute("filter", filter);
        return "main";
    }
    @PostMapping("/main")
    public String addMessage(
            @AuthenticationPrincipal User user,
            @RequestParam String text,
            @RequestParam String tag,
            @RequestParam("file") MultipartFile file,
            Model model) throws IOException {
        Message message = new Message(text, tag, user);
        File uploadDir = new File(uploadPath);
        if(!uploadDir.exists()){
            uploadDir.mkdir();
        }
        String uuidFile = UUID.randomUUID().toString();
        String resultFileName = uuidFile + "." + file.getOriginalFilename();
        if(file != null && !file.getOriginalFilename().isEmpty()){
            message.setFilename(resultFileName);
        }
        file.transferTo(new File(uploadPath + "/" + resultFileName));
        messageService.saveMessage(message);
        model.addAttribute("messages", messageService.getAllMsg());
    return "main";
    }
}

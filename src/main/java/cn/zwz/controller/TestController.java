package cn.zwz.controller;

import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@RestController
@RequestMapping("/test")
public class TestController {

    @RequestMapping(value = "/hello", method = RequestMethod.GET)
    public String hello() {
        return "Hello world!";
    }

    @RequestMapping(value = "/add", method = RequestMethod.GET)
    public int add(@RequestParam int a,@RequestParam int b) {
        return a + b;
    }
}
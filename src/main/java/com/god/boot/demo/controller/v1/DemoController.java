package com.god.boot.demo.controller.v1;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * @author God Boot
 * @version 1.0.0
 * @className DemoController
 * @description
 * @createTime 2021年10月10日 11:16
 */
@RestController
@RequestMapping("v1/demo")
public class DemoController {
    @GetMapping("test")
    public String test(){
        return "测试啊22";
    }

    @GetMapping("test2")
    public String test2(){
        return "测试啊111";
    }
}

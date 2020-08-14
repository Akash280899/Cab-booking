package com.akj.carproj;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class CheckoutController {
 
    @Value("pk_test_51HEs0aBr4eQCMem1OtCfBv06zz5tHAfSbexizDh1TuPeX3OyknslpUkzb7mj70eJ0c89PkwePHMp8L6Hxkn2bfeb00prscGb4M")
    private String stripePublicKey;
 
    @RequestMapping("/checkout")
    public String checkout(Model model) {
        model.addAttribute("amount", 50 * 100); // in cents
        model.addAttribute("stripePublicKey", stripePublicKey);
        model.addAttribute("currency", ChargeRequest.Currency.EUR);
        return "checkout";
    }
}
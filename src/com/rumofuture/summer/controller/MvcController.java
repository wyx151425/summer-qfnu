package com.rumofuture.summer.controller;

import com.rumofuture.summer.model.Ticket;
import com.rumofuture.summer.model.Train;
import com.rumofuture.summer.model.User;
import com.rumofuture.summer.service.TicketService;
import com.rumofuture.summer.service.TrainService;
import com.rumofuture.summer.util.Constant;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Controller
@RequestMapping(value = "mvc")
public class MvcController extends SummerController {

    @Autowired
    private TrainService trainService;

    @Autowired
    private TicketService ticketService;

    @RequestMapping(value = "register", method = RequestMethod.GET)
    public String viewRegister() {
        return "register";
    }

    @RequestMapping(value = "login", method = RequestMethod.GET)
    public String viewLogin() {
        return "login";
    }

    @RequestMapping(value = "accountInfo", method = RequestMethod.GET)
    public String routeAccountInfo() {
        return "accountInfo";
    }

    @RequestMapping(value = "passwordUpdate", method = RequestMethod.GET)
    public String routePasswordUpdate() {
        return "passwordUpdate";
    }

    @RequestMapping(value = "trainList", method = RequestMethod.GET)
    public ModelAndView viewHomepage() {
        List<Train> trainList = null;
        try {
            trainList = trainService.findTrainList(0);
        } catch (Exception e) {
            e.printStackTrace();
        }
        ModelAndView mv = new ModelAndView();
        mv.setViewName("trainList");
        mv.addObject(Constant.TRAIN_LIST, trainList);
        return mv;
    }

    @RequestMapping(value = "trainAdd", method = RequestMethod.GET)
    public String viewTrainAdd() {
        return "trainAdd";
    }

    @RequestMapping(value = "ticketBook/{id}", method = RequestMethod.GET)
    public ModelAndView viewTicketBook(@PathVariable("id") Integer id) {
        Train train = trainService.findTrainById(id);
        ModelAndView mv = new ModelAndView();
        mv.setViewName(Constant.TICKET_BOOK);
        mv.addObject(Constant.TRAIN, train);
        return mv;
    }

    @RequestMapping(value = "ticketList", method = RequestMethod.GET)
    public ModelAndView viewTicketList() {
        User user = getSessionUser();
        List<Ticket> ticketList = ticketService.findTicketListByUser(user.getId());
        ModelAndView mv = new ModelAndView();
        mv.setViewName(Constant.TICKET_LIST);
        mv.addObject(Constant.TICKET_LIST, ticketList);
        return mv;
    }

    @RequestMapping(value = "ticketManage", method = RequestMethod.GET)
    public ModelAndView viewTicketManage() {
        List<Ticket> ticketList = ticketService.findTicketListWithUser();
        ModelAndView mv = new ModelAndView();
        mv.setViewName(Constant.TICKET_MANAGE);
        mv.addObject(Constant.TICKET_LIST, ticketList);
        return mv;
    }

    @RequestMapping(value = "cityTrain", method = RequestMethod.GET)
    public ModelAndView viewCityTrainList(
            @RequestParam(value = "fromCity") String fromCity,
            @RequestParam(value = "toCity") String toCity
    ) {
        List<Train> trainList = null;
        try {
            trainList = trainService.findTrainListByCity(fromCity, toCity);
        } catch (Exception e) {
            e.printStackTrace();
        }
        ModelAndView mv = new ModelAndView();
        mv.setViewName("trainList");
        mv.addObject(Constant.TRAIN_LIST, trainList);
        return mv;
    }
}

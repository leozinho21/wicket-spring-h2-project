package home.estore.admin.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import home.estore.core.business.repositories.shoppingcart.PcCpuRepository;
import home.estore.core.business.repositories.shoppingcart.PcHardDriveRepository;
import home.estore.core.business.repositories.shoppingcart.PcMemoryRepository;
import home.estore.core.business.repositories.shoppingcart.PcMonitorRepository;
import home.estore.core.business.repositories.shoppingcart.UserRepository;
import home.estore.core.model.estore.PcCpu;
import home.estore.core.model.estore.PcHardDrive;
import home.estore.core.model.estore.PcMemory;
import home.estore.core.model.estore.PcMonitor;
import home.estore.core.model.estore.User;


@Controller 
@RequestMapping("/") // This means URL's start with / (after Application path)
public class AdminController {
	
	private static final Logger log = LoggerFactory.getLogger(AdminController.class);

	@Autowired
	private UserRepository 			userRepository;
	@Autowired
	private PcCpuRepository 		pcCpuRepository;
	@Autowired
	private PcMonitorRepository 	pcMonitorRepository;
	@Autowired
	private PcMemoryRepository 		pcMemoryRepository;
	@Autowired
	private PcHardDriveRepository 	pcHardDriveRepository;

	@RequestMapping({ "/admin" })
	public String landing(HttpServletRequest request) {
		
		if(request.getSession().getAttribute("user") != null) {
			return "home";
		}
		else {
			return "redirect:/admin/login";
		}
	}
	
	@RequestMapping({ "/admin/login" })
	public ModelAndView login(HttpServletRequest request) {
		
		return new ModelAndView("logon");
	}
	
	@RequestMapping(value="/admin/login",method=RequestMethod.POST)
	public String validate(HttpServletRequest request,HttpServletResponse response,
			@RequestParam(value = "username", defaultValue = "") String username,
			@RequestParam(value = "password", defaultValue = "") String password) {
			
			User user = new User();// userRepository.find(username, password);
			if(user != null) {
				request.getSession(true).setAttribute("user", user);
			}
			return "redirect:home";
			
	}
	
	@RequestMapping({ "/admin/home" })
	public ModelAndView initHome(HttpServletRequest request) {
		
		Iterable<PcCpu> 		cpuIter 	= pcCpuRepository.count() 		> 0 ? pcCpuRepository.findAll() 		: null;
		Iterable<PcMonitor> 	cpuMonitor 	= pcMonitorRepository.count() 	> 0 ? pcMonitorRepository.findAll() 	: null;
		Iterable<PcMemory> 		pcMemory 	= pcMemoryRepository.count() 	> 0 ? pcMemoryRepository.findAll() 		: null;
		Iterable<PcHardDrive> 	hardDrive 	= pcHardDriveRepository.count() > 0 ? pcHardDriveRepository.findAll()	: null;

		ModelAndView model = new ModelAndView("home");
		
		if(cpuIter != null) {
			List<PcCpu> cpuList = new ArrayList<>();
			cpuIter.forEach(cpuList::add);
			model.addObject("cpuList", cpuList);
		}
		if(cpuMonitor != null) {
			List<PcMonitor> monitorList = new ArrayList<>();
			cpuMonitor.forEach(monitorList::add);
			model.addObject("monitorList", monitorList);
		}
		if(pcMemory != null) {
			List<PcMemory> memoryList = new ArrayList<>();
			pcMemory.forEach(memoryList::add);
			model.addObject("memoryList", memoryList);
		}
		if(hardDrive != null) {
			List<PcHardDrive> hardDriveList = new ArrayList<>();
			hardDrive.forEach(hardDriveList::add);
			model.addObject("hardDriveList", hardDriveList);
		}
		return model;
	}
	
	@RequestMapping(value="/admin/addCPU",method=RequestMethod.POST)
	public String addCPU(HttpServletRequest request,
			@RequestParam(value = "image", defaultValue = "") String image,
			@RequestParam(value = "descr", defaultValue = "") String descr,
			@RequestParam(value = "price", defaultValue = "") String price) {
		
		PcCpu cpu = new PcCpu();
		if(!image.isEmpty()) {
			cpu.setImage(image);
		}
		if(!descr.isEmpty()) {
			cpu.setDescr(descr);
		}
		if(!price.isEmpty()) {
			cpu.setPrice(Double.valueOf(price));
		}
		
		pcCpuRepository.save(cpu);
		printSave(cpu.getClass().getName(), image, descr, price);
		
		return "redirect:home";
	}
	@RequestMapping(value="/admin/removeCPU",method=RequestMethod.POST)
	public String removeCPU(HttpServletRequest request,
			@RequestParam(value = "id", defaultValue = "") String id) {
		
		if(!id.isEmpty()) {
			pcCpuRepository.delete(Long.valueOf(id));
			log.debug("CPU with id["+id+"] has been deleted.");
		}
		return "redirect:home";
	}
	@RequestMapping(value="/admin/addMemory",method=RequestMethod.POST)
	public String addMemory(HttpServletRequest request,
			@RequestParam(value = "image", defaultValue = "") String image,
			@RequestParam(value = "descr", defaultValue = "") String descr,
			@RequestParam(value = "price", defaultValue = "") String price) {
		
		PcMemory memory = new PcMemory();
		if(!image.isEmpty()) {
			memory.setImage(image);
		}
		if(!descr.isEmpty()) {
			memory.setDescr(descr);
		}
		if(!price.isEmpty()) {
			memory.setPrice(Double.valueOf(price));
		}
		
		pcMemoryRepository.save(memory);
		printSave(memory.getClass().getName(), image, descr, price);
		
		return "redirect:home";
	}
	@RequestMapping(value="/admin/removeMemory",method=RequestMethod.POST)
	public String removeMemory(HttpServletRequest request,
			@RequestParam(value = "id", defaultValue = "") String id) {
		
		if(!id.isEmpty()) {
			pcMemoryRepository.delete(Long.valueOf(id));
			log.debug("Memory with id["+id+"] has been deleted.");
		}
		return "redirect:home";
	}
	
	@RequestMapping(value="/admin/addHDDrive",method=RequestMethod.POST)
	public String addHDDrive(HttpServletRequest request,
			@RequestParam(value = "image", defaultValue = "") String image,
			@RequestParam(value = "descr", defaultValue = "") String descr,
			@RequestParam(value = "price", defaultValue = "") String price) {
		
		PcHardDrive hardDrive = new PcHardDrive();
		if(!image.isEmpty()) {
			hardDrive.setImage(image);
		}
		if(!descr.isEmpty()) {
			hardDrive.setDescr(descr);
		}
		if(!price.isEmpty()) {
			hardDrive.setPrice(Double.valueOf(price));
		}
		
		pcHardDriveRepository.save(hardDrive);
		printSave(hardDrive.getClass().getName(), image, descr, price);
		
		return "redirect:home";
	}
	@RequestMapping(value="/admin/removeHDDrive",method=RequestMethod.POST)
	public String removeHDDrive(HttpServletRequest request,
			@RequestParam(value = "id", defaultValue = "") String id) {
		
		if(!id.isEmpty()) {
			pcHardDriveRepository.delete(Long.valueOf(id));
			log.debug("HD Drive with id["+id+"] has been deleted.");
		}
		return "redirect:home";
	}
	
	@RequestMapping(value="/admin/addMonitor",method=RequestMethod.POST)
	public String addMonitor(HttpServletRequest request,
			@RequestParam(value = "image", defaultValue = "") String image,
			@RequestParam(value = "descr", defaultValue = "") String descr,
			@RequestParam(value = "price", defaultValue = "") String price) {
		
		PcMonitor monitor = new PcMonitor();
		if(!image.isEmpty()) {
			monitor.setImage(image);
		}
		if(!descr.isEmpty()) {
			monitor.setDescr(descr);
		}
		if(!price.isEmpty()) {
			monitor.setPrice(Double.valueOf(price));
		}
		
		pcMonitorRepository.save(monitor);
		printSave(monitor.getClass().getName(), image, descr, price);
		
		return "redirect:home";
	}
	
	@RequestMapping(value="/admin/removeMonitor",method=RequestMethod.POST)
	public String removeMonitor(HttpServletRequest request,
			@RequestParam(value = "id", defaultValue = "") String id) {
		
		if(!id.isEmpty()) {
			pcMonitorRepository.delete(Long.valueOf(id));
			log.debug("Monitor with id["+id+"] has been deleted.");
		}
		return "redirect:home";
	}
	private void printSave(String type,String img,String descr,String price) {
		System.out.println("Adding new ["+type+"]");
		System.out.println("Image \t: "+img);
		System.out.println("Descr \t: "+descr);
		System.out.println("Price \t: "+price);
	}
	
	@RequestMapping({ "/admin/logout" })
	public String logout(HttpServletRequest request,HttpServletResponse response,
			@RequestParam(value = "id", defaultValue = "") String id) {
	
		request.getSession().setAttribute("user", null);
		request.getSession().invalidate();
		return "redirect:/admin";
	}
}

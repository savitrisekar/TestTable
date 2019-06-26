/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package services;

import controllers.RegionController;
import icontrollers.IRegionController;
import java.util.List;
import javax.jws.WebService;
import javax.jws.WebMethod;
import javax.jws.WebParam;
import models.Region;
import org.hibernate.SessionFactory;
import tools.HibernateUtil;

/**
 *
 * @author Sekar Ayu Safitri
 */
//webparam : menambah parameter
@WebService(serviceName = "RegionService") //servis
public class RegionService {

    private SessionFactory factory = HibernateUtil.getSessionFactory();
    IRegionController irc = new RegionController(factory);

    /**
     * This is a sample web service operation
     */
    @WebMethod(operationName = "hello") //fungsi
    public String hello(@WebParam(name = "name") String name,
            @WebParam(name = "jalan") String jalan) {
        return "Hello " + name + ", yang tinggal di jalan " + jalan + " !";
    }

    /**
     * Web service operation
     */
    @WebMethod(operationName = "Penambahan")
    public int Penambahan(@WebParam(name = "angka1") int angka1,
            @WebParam(name = "angka2") int angka2) {
        //TODO write your implementation code here:
        return angka1 + angka2;
    }

    /**
     * Web service operation
     */
    @WebMethod(operationName = "getAll")
    public List<Region> getAll() {
        //TODO write your implementation code here:
        return irc.getAll();
    }

    /**
     * Web service operation
     */
    @WebMethod(operationName = "save")
    public String save(@WebParam(name = "id") String id, @WebParam(name = "name") String name) {
        //TODO write your implementation code here:
        return irc.save(id, name);
    }

    /**
     * Web service operation
     */
    @WebMethod(operationName = "delete")
    public String delete(@WebParam(name = "id") String id) {
        //TODO write your implementation code here:
        return irc.delete(id);
    }

    /**
     * Web service operation
     */
    @WebMethod(operationName = "search")
    public List<Region> search(@WebParam(name = "keyword") Object keyword) {
        //TODO write your implementation code here:
        return irc.search(keyword);
    }

    /**
     * Web service operation
     */
    @WebMethod(operationName = "pengurangan")
    public int pengurangan(@WebParam(name = "angka1") int angka1, @WebParam(name = "angka2") int angka2) {
        //TODO write your implementation code here:
        return angka1-angka2;
    }
}

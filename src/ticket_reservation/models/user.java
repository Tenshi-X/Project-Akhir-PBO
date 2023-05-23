/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package ticket_reservation.models;

/**
 *
 * @author Lenovo
 */
public class user {
    private int id;
    private String username;
    private String password;
    private String nama;
    private int noHp;
    
    public void setId(int idUser){
        this.id = idUser;
    }
    public void setUsername(String usernameUser){
        this.username = usernameUser;
    }
    public void setPassword(String passwordUser){
        this.password = passwordUser;
    }public void setNama(String namaUser){
        this.nama = namaUser;
    }public void setnoHp(int noHpUser){
        this.noHp = noHpUser;
    }
    
    public int GetId(){
        return id;
    }
    public String GetUsername(){
        return username;
    }
    public String GetPassword(){
        return password;
    }
    public String GetNama(){
        return nama;
    }
    public int GetNoHp(){
        return noHp;
    }
    
}

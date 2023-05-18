/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package ticket_reservation.models;

/**
 *
 * @author Lenovo
 */
public class film {
    private String nama;
    private String poster;
    
    public void setNamaFilm(String nama){
     this.nama = nama;   
    }    
    public void setPosterFilm(String poster){
    this.poster = poster;
    }
    
    public String getNamaFilm(String nama){
    return nama;
    }
    
}

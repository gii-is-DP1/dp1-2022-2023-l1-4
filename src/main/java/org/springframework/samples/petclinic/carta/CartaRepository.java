package org.springframework.samples.petclinic.carta;

import java.util.Collection;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

@Repository
public interface CartaRepository extends CrudRepository<Carta, Integer>{

    Collection<Carta> findAll();

    @Query("SELECT c FROM Carta c WHERE c.id =:id")
    public Carta findCardById(@Param("id") int id);

    //@Query("SELECT  f.name FROM cartas_fotos cf JOIN fotos f WHERE cf.foto_id=f.id AND cf.carta_id=:carta_id")
    //Collection<Foto> findNamePhotosByCard(@Param("carta_id") int carta_id);

    //@Query("SELECT c FROM Carta c where c.player_id=:player_id")
    //List<Carta> findByPlayerId(@Param("player_id")int player_id);

    //@Query("SELECT c.foto.name FROM Carta c where c.id=:id")
    //List<Foto> findPhotosByCard(@Param("id") int id);
    
}
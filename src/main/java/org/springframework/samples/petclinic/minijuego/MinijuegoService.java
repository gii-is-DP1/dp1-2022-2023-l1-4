package org.springframework.samples.petclinic.minijuego;

import java.util.ArrayList;
import java.util.Collection;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.samples.petclinic.carta.Carta;
import org.springframework.samples.petclinic.carta.CartaService;
import org.springframework.samples.petclinic.foto.FotoService;
import org.springframework.samples.petclinic.mazo.MazoService;
import org.springframework.samples.petclinic.player.Player;
import org.springframework.samples.petclinic.player.PlayerService;
import org.springframework.samples.petclinic.user.AuthoritiesService;
import org.springframework.samples.petclinic.user.UserService;
import org.springframework.samples.petclinic.util.AuthenticationService;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
public class MinijuegoService {
	MinijuegoRepository minijuegoRepository;
	CartaService cartaService;
	PlayerService playerService;
	UserService userService;
	FotoService fotoService;
	MazoService mazoService;
	AuthenticationService authenticationService;

	@Autowired
	public MinijuegoService(MinijuegoRepository minijuegoRepository, CartaService cartaService,
			PlayerService playerService, UserService userService, FotoService fotoService, MazoService mazoservice, AuthenticationService authenticationService) {
		this.minijuegoRepository = minijuegoRepository;
		this.cartaService = cartaService;
		this.playerService = playerService;
		this.userService = userService;
		this.fotoService = fotoService;
		this.mazoService = mazoservice;
		this.authenticationService = authenticationService;
	}

	@Transactional(readOnly = true)
	public Collection<Minijuego> getAllMinijuegos() {
		return minijuegoRepository.findAll();
	}

	@Transactional(readOnly = true)
	public Minijuego getMinijuegoByName(String name) {
		return minijuegoRepository.findMinijuegoByName(name);
	}

	public Collection<Minijuego> getMinijuegosPartida(int id) {
		return minijuegoRepository.findMinijuegosPartida(id);
	}

	public Set<Player> getPlayersByGameId(int game_id) {
		return minijuegoRepository.findPlayersByGameId(game_id);
	}

	@Transactional
	public void saveMinijuego(Minijuego minijuego) throws DataAccessException {
		minijuegoRepository.save(minijuego);
	}

	@Transactional
	public Player playerSesion() throws DataAccessException {
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		String username = authentication.getName();
		Player player = this.playerService.findPlayerByUsername(this.userService.findUser(username).orElse(null));
		return player;
	}


	public static Carta getRandomCard(List<Carta> gameCards) {
		int rnd = new Random().nextInt(gameCards.size());
		return gameCards.get(rnd);
	}

	//Repartimos las cartas: Creamos una lista con todas las cartas y seleccionamos una por jugador 
	//y la eliminamos de la lista inicial, que luego será la lista de cartas centrales.
	public void reparteCartas(Minijuego minijuego) {
		if (minijuego.getName().equals("La Torre Infernal")) {
			Collection<Carta> gameCards= cartaService.getAll();
			List<Carta> cardsList = new ArrayList<>();
			gameCards.forEach(x->cardsList.add(x));
			Collections.shuffle(cardsList);
			List<Player> players = new ArrayList<>();
			minijuego.getGame().getPlayersList().forEach(x -> players.add(x));
			Map<Integer, List<Integer>> playerCard = new HashMap<>();
			players.forEach(x -> {
				List<Integer> card = new ArrayList<>();
				if (!playerCard.containsKey(x.getId())){
					Carta randomCard = getRandomCard(cardsList);
					card.add(randomCard.getId());
					playerCard.put(x.getId(), card);
					cardsList.remove(randomCard);
				}
			});
		}
	}

	public void actualizaCartas(List<Carta> cardList, Map<Integer,Integer> playerCard){
		Integer succesPlayer = authenticationService.getPlayer().getId();

		if()
	}

}

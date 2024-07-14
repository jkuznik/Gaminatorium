package eu.gaminatorium.game;

import eu.gaminatorium.game.dto.ActiveGameDto;
import lombok.AllArgsConstructor;
import lombok.RequiredArgsConstructor;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
@RequiredArgsConstructor
class ActiveGameService {

    GameRepository gameRepository;

    public List<ActiveGameDto> getMatchingActiveGamesPaged(String title, Pageable pageable) {
        return null;
    }

    public Optional<ActiveGameDto> startNewGame(long gameid) {
//        if (gameRepository.existsById(gameid)) {
//            var game = gameRepository.findById(gameid);
//            var activeGame = game.startNewGame();
//            gameRepository.save(game);
//            return Optional.of(toDto(activeGame));
//        }
        return Optional.empty();
    }

    public Optional<List<ActiveGameDto>> getAllActiveGamesForThisGame(long gameid, Pageable pageable) {
        if (gameRepository.existsById(gameid)) {
            return Optional.of(gameRepository.findAllActiveGamesByGameId(gameid, pageable).map(ActiveGameService::toDto).toList());
        }
        return Optional.empty();
    }

    public List<ActiveGameDto> getAllActiveGamesForAllGames(Pageable pageable) {
        return gameRepository.findAllActiveGamesBy(pageable).map(ActiveGameService::toDto).toList();
    }

    public Optional<ActiveGameDto> joinGame(long activegameid) {
//        if (gameRepository.existsActiveGameById(activegameid)){
//            Game.Active activeGame = gameRepository.findActiveGameById(activegameid);
//            Game game = activeGame.getGame();
//            game.joinExistingActiveGame(activeGame);
//            gameRepository.save(game);
//            return Optional.of(toDto(activeGame));
//        }
        return Optional.empty();
    }

    private static ActiveGameDto toDto(Game.Active activeGame) {
        ActiveGameDto activeGameDto = new ActiveGameDto(activeGame.getGame());
        activeGameDto.setId(activeGame.getId());
        activeGameDto.setCurrentPlayers(activeGame.getCurrentPlayers());
        activeGameDto.setMaxPlayers(activeGameDto.getMaxPlayers());
        activeGameDto.setStartedAt(activeGame.getStartedAt());

        return activeGameDto;
    }
}

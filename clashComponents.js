const cardIcon = (card) => {
    const cardIcon = document.createElement('img');
    cardIcon.src = card.iconUrls.medium;
    cardIcon.alt = card.name;
    return cardIcon;
}

const clashApiPlayer = (rootElement, playerData) => {
    const {
        leagueStatistics,
        role,
        name,
        currentDeck,
        currentFavouriteCard,
    } = playerData;
    const app = document.querySelector(rootElement);
    const player = document.createElement('div');
    player.id = name.replace(/[\s]/, '-');
    const playerHeader = document.createElement('div');
    const h1 = document.createElement('h1');
    h1.textContent = `${name} (${role})`;
    const favouriteCardIcon = cardIcon(currentFavouriteCard);
    h1.prepend(favouriteCardIcon);
    playerHeader.appendChild(h1);
    const stats = document.createElement('div');
    stats.innerHTML = `<p class="best-trophies">Best season trophies: ${leagueStatistics.bestSeason.trophies}</p><p class="current-best-trophies">Current season best trophies: ${leagueStatistics.currentSeason.bestTrophies}</p>`;
    playerHeader.appendChild(stats);
    const cards = document.createElement('div');
    const cardsTitle = document.createElement('h2');
    cards.appendChild(cardsTitle);
    cardsTitle.textContent = "Current deck";
    const currentDeckCardElements = currentDeck.map((card) => {
        const cardTemp = cardIcon(card);
        return cardTemp;
    });
    currentDeckCardElements.forEach((element) => {
        cards.appendChild(element);
    });
    player.appendChild(playerHeader);
    player.appendChild(cards);
    app.appendChild(player);
};

const clashApiClan = (rootElement, clanData) => {
    const app = document.querySelector(rootElement);
    const {
        name,
        description,
        clanScore,
        clanWarTrophies,
    } = clanData;
    const clanHeader = document.createElement('div');
    clanHeader.innerHTML = `<h1>Fluffy&shy;Nerds</h1><p class="description">${description}</p><p class="score">Score: ${clanScore}</p><p class="trophies">War Trophies ${clanWarTrophies}</p>`;
    const clanMembers = clanData.memberList.map(element => {
        const {
            name,
            role,
            expLevel,
            trophies,
            arena,
            lastSeen,
        } = element;
        return `<li>${name} (${role}): Trophies ${trophies} (lvl ${expLevel}/${arena.name}) last seen ${formatClashDate(lastSeen).toLocaleString()}</li>`;
    });
    const clanMemberList = document.createElement('ul');
    clanMembers.forEach(element => {
        clanMemberList.innerHTML += element;
    });
    app.appendChild(clanHeader);
    app.appendChild(clanMemberList);
};

const clashApiBattle = (rootElement, clashBattleData, playerName) => {
    const app = document.querySelector(rootElement);
    const battleList = document.createElement('dl');
    const playerHeading = document.createElement('h2');
    playerHeading.textContent = `Last 25 battles for ${playerName}`;
    const battles = clashBattleData.map(element => {
        const {
            arena,
            type,
            gameMode,
            battleTime,
            opponent,
            team,
        } = element;
        const teamCrowns = team.reduce((accumulator, item) => {
            accumulator += item.crowns;
            return accumulator;
        }, 0);
        const opponentCrowns = opponent.reduce((accumulator, item) => {
            accumulator += item.crowns;
            return accumulator;
        }, 0);
        return `<dt>${arena.name} ${formatClashDate(battleTime).toLocaleString()}:</dt><dd> ${type} ${gameMode.name} -  ${teamCrowns} - ${opponentCrowns} ${opponent[0].name}</dd>`;
    });
    battleList.innerHTML = battles.join('');
    app.appendChild(playerHeading);
    app.appendChild(battleList);
};
const clashApiPlayer = (rootElement, playerData) => {
    const { leagueStatistics, role, name, currentDeck, currentFavouriteCard } = playerData;
    const app = document.querySelector(rootElement);
    const player = document.createElement('div');
    const playerHeader = document.createElement('div');
    const h1 = document.createElement('h1');
    h1.textContent = `${name} (${role})`;
    const favouriteCardIcon = document.createElement('img');
    favouriteCardIcon.src = currentFavouriteCard.iconUrls.medium;
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
        const cardTemp = document.createElement('img');
        cardTemp.src = card.iconUrls.medium;
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
    const { name, description, clanScore, clanWarTrophies } = clanData;
    const clanHeader = document.createElement('div');
    clanHeader.innerHTML = `<h1>Fluffy&shy;Nerds</h1><p class="description">${description}</p><p class="score">Score: ${clanScore}</p><p class="trophies">War Trophies ${clanWarTrophies}</p>`;
    const clanMembers = clanData.memberList.map(element => {
        const {name, role, expLevel, trophies, arena} = element;
        return `<li>${name} (${role}): Trophies ${trophies} (${expLevel}/${arena.name})</li>`;
    });
    const clanMemberList = document.createElement('ul');
    clanMembers.forEach(element => {
        clanMemberList.innerHTML += element;
    });
    app.appendChild(clanHeader);
    app.appendChild(clanMemberList);
};

const clashApiBattle = (rootElement, clashBattleData) => {
    const app = document.querySelector(rootElement);
    const battleWrapper = document.createElement('div');
    const battleList = document.createElement('dl');
    const playerName = clashBattleData[0].team[0].name;
    const playerHeading = document.createElement('h2');
    playerHeading.textContent = `Last 25 battles for ${playerName}`;
    const battles = clashBattleData.map(element => {
        const { type, gameMode, battleTime, opponent, team } = element;
        const battleElement = document.createElement('div');
        battleElement.innerHTML = `<dt>${battleTime}:</dt><dd> ${type} ${gameMode.name} -  ${team[0].crowns} - ${opponent[0].crowns} ${opponent[0].name}</dd>`;
        return battleElement;
    });
    battles.map(element => {
        battleList.appendChild(element);
    });
    battleWrapper.appendChild(battleList);
    app.appendChild(playerHeading);
    app.appendChild(battleWrapper);
};
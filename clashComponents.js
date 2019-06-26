const clashApiPlayer = (rootElement, playerData) => {
    const app = document.querySelector(rootElement);
    const h1 = document.createElement('h1');
    h1.textContent = `${playerData.name} (${playerData.tag})`;
    const favoutireCardIcon = document.createElement('img');
    favoutireCardIcon.src = playerData.currentFavouriteCard.iconUrls.medium;
    h1.appendChild(favoutireCardIcon);
    app.appendChild(h1);
    const cards = document.createElement('div');
    const cardsTitle = document.createElement('h2');
    cards.appendChild(cardsTitle);
    cardsTitle.textContent = "Current deck";
    currentDeckCardElements = playerData.currentDeck.map((card) => {
        let cardTemp = document.createElement('img');
        cardTemp.src = card.iconUrls.medium;
        return cardTemp;
    });
    currentDeckCardElements.forEach((element) => {
        cards.appendChild(element);
    });
    app.appendChild(cards);
    console.log(currentDeckCardElements);
    const league = document.createElement('p');
    league.textContent = `Best season trophies: ${playerData.leagueStatistics.bestSeason.trophies}
        Current season best trophies: ${playerData.leagueStatistics.currentSeason.bestTrophies}
        `;
    app.appendChild(league);
    const h2 = document.createElement('h2');
    h2.textContent = `${playerData.clan.name} (${playerData.clan.tag})`;
    app.appendChild(h2);
};

const clashApiClan = (rootElement, clanData) => {
    const app = document.querySelector(rootElement);
    const clanMembers = clanData.memberList.map(element => {
        return `<li>${element.name} (${element.tag})</li>`;
    });
    console.log(clanMembers);
    const clanMemberList = document.createElement('ul');
    clanMembers.forEach(element => {
        clanMemberList.innerHTML += element;
    });
    app.appendChild(clanMemberList)
};

const clashApiBattle = (rootElement, clashBattleData) => {
    const app = document.querySelector(rootElement);
    console.log(clashBattleData);
    const battleWrapper = document.createElement('div');
    battles = clashBattleData.map(element => {
        const battleElement = document.createElement('div');
        battleElement.textContent = `${element.type} ${element.gameMode.name} - ${element.battleTime} - ${element.opponent[0].name}`;
        return battleElement;
    });
    battles.map(element => {
        battleWrapper.appendChild(element);
    });
    app.appendChild(battleWrapper);
};
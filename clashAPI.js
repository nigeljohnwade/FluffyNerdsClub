const playerData = (tag) => {
    return fetch(`clash_data/clash_profile_data_${tag}_06-25-2019-21-41-12.json`)
        .then(response => response.json())
        .then(data => data);
};
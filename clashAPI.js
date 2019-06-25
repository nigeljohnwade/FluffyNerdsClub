const getJSON = url => {
    return fetch(url)
        .then(response => response.json())
        .then(data => data);
};

const getPlayer = name =>{
    return getJSON(`clash_data/clash_profile_data_${name}_06-25-2019-21-41-12.json`)
};
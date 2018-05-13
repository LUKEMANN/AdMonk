
var Ads = [];
var counter = 0;

function getAds(apiKey) {

    $.getJSON("http://localhost:49744/API/GetAdvertisements.aspx?apiKey=" + apiKey, function (result) {
        $.map(result, function (item) {
            Ads.push(item);
        });
        console.log(Ads);
        setInterval(function () { showAd(counter, apiKey) }, 3000);
    });
}

function showAd(a, b) {
    console.log(a);
    $("#admonk").html('<a href="' + Ads[a].RedirectLink + '"><img src="' + Ads[a].Photo + '" /></a>');
    $.get("http://localhost:49744/API/GetHit.aspx?apiKey=" + b + "&id=" + Ads[a].AdvertisementId, function (data, status) {
        if (status == "success") {
            console.log(data);
        }
    });
    console.log('Ads Length: ' + Ads.length);
    if (a < Ads.length - 1) {
        a++;
    } else {
        a = 0;
    }
    console.log('A: ' + a);
    counter = a;
    console.log('Counter: ' + counter);

}
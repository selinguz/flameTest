const gameWidth = 1080.0;
const gameHeight = 1920.0;

const obstacleSize = 216.0;
const extendedHeight =
    gameHeight *
    4; //Gogreenworld dosyasında obstacleların loop içerisinde döndüğü update metodu var. burada ekran yüksekliğini 4 kez büyüttük ki loop 4 kez büyümüş ekran tamamlandığında 1 kez dönsün. çok fazla loop çalışması olmasın diye.

const playerHeight = 150.0;
const playerWidth = 52.5;

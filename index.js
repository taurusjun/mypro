const Day1 = '${APP_1ST}.herokuapp.com'
const Day2 = '${APP_2ND}.herokuapp.com'

addEventListener(
  "fetch",event => {
    let url=new URL(event.request.url);
    if (new Date().getDate()<=15) {
      url.hostname = Day1
    } else {
      url.hostname = Day2
    }
    let request=new Request(url,event.request);
    event. respondWith(
      fetch(request)
    )
  }
)

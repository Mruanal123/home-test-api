function fn() {

  var config = 
  {
    "baseUrl": "http://localhost:3100"

  };
 
  karate.configure('connectTimeout', 5000);
  karate.configure('readTimeout', 5000);
  return config;
}
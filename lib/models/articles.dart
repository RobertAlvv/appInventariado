import 'computer.dart';
import 'monitor.dart';
import 'keyboard.dart';
export 'computer.dart';
export 'monitor.dart';
export 'keyboard.dart';

class Articles{
   Articles({
        this.computer,
        this.monitor,
        this.keyboard,
    });

    List<Computer> computer;
    List<Monitor> monitor;
    List<Keyboard> keyboard;

   factory Articles.fromJson(Map<String, dynamic> json) => Articles(
        computer: json["computer"] == null ? null : json["computer"],
        monitor: json["monitor"] == null ? null : json["monitor"],
        keyboard: json["keyboard"] == null ? null : json["keyboard"],
    );

    Map<String, dynamic> toJson() => {
        "computer": computer == null ? null : computer,
        "monitor": monitor == null ? null : monitor,
        "keyboard": keyboard == null ? null : keyboard,
    };
}

Articles listArticles(List<dynamic> data){
  Articles articles = Articles();
  List<Computer> computers = [];
  List<Monitor> monitors = [];
  List<Keyboard> teclados = [];

  for(var item in data){
   switch (item["id_type_article"]) {
      case 1:
        computers.add(Computer.fromJson(item));
        break;
      case 2:
        monitors.add(Monitor.fromJson(item));
        break;
      case 3:
        teclados.add(Keyboard.fromJson(item));
        break;
   }
  }
  articles.computer = computers;
  articles.monitor = monitors;
  articles.keyboard = teclados;
 return articles;
}
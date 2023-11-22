import java.util.Collections;
import java.util.Iterator;

HashMap<String, PImage> game_sprites = new HashMap<String, PImage>();// Diccionario para almacenar los sprites del juego
Simulation simulation;// Objeto de la clase Simulacion

int tenth = 0;// Contador para las décimas de segundo
int clock = 0;// Contador para el tiempo


void setup() {
  size(1280, 720);// Establecer el tamaño del lienzo
  initialize_sprites();// Inicializar los sprites del juego
  simulation = new Simulation();// Inicializar el objeto de simulación
}

void draw() {
  background(247);// Establecer el fondo del lienzo
  simulation.update();// Actualizar la simulación
  simulation.print();// Mostrar la simulación en el lienzo
  if (millis() - tenth > 50){
  // cada 0.05 segundos
    tenth = millis();
    clock++;
    if (clock % 2 == 0){
      // cada 0.1 segundos
      simulation.tenth_of_second();
    }
    if (clock % 5 == 0){
      // cada 0.25 segundos
      simulation.quarter_of_second();
    }
  }
}

void initialize_sprites(){
  PImage sprite_sheet = loadImage("sprites.png");
  game_sprites.put("standing_dino", sprite_sheet.get(1338, 2, 88, 94));
  game_sprites.put("walking_dino_1", sprite_sheet.get(1514, 2, 88, 94));
  game_sprites.put("walking_dino_2", sprite_sheet.get(1602, 2, 88, 94));
  game_sprites.put("dead_dino", sprite_sheet.get(1690, 2, 88, 94));
  game_sprites.put("crouching_dino_1", sprite_sheet.get(1866, 36, 118, 60));
  game_sprites.put("crouching_dino_2", sprite_sheet.get(1984, 36, 118, 60));
  game_sprites.put("cactus_type_1", sprite_sheet.get(446, 2, 34, 70));
  game_sprites.put("cactus_type_2", sprite_sheet.get(480, 2, 68, 70));
  game_sprites.put("cactus_type_3", sprite_sheet.get(548, 2, 102, 70));
  game_sprites.put("cactus_type_4", sprite_sheet.get(652, 2, 50, 100));
  game_sprites.put("cactus_type_5", sprite_sheet.get(702, 2, 100, 100));
  game_sprites.put("cactus_type_6", sprite_sheet.get(802, 2, 150, 100));
  game_sprites.put("bird_flying_1", sprite_sheet.get(260, 2, 92, 80));
  game_sprites.put("bird_flying_2", sprite_sheet.get(352, 2, 92, 80));
  game_sprites.put("ground", sprite_sheet.get(2, 104, 2400, 24));
}

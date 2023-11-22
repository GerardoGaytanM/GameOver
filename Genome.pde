class Gen {
  
  boolean source_hidden_layer;   // Indica si la neurona fuente está en la capa oculta
  int id_source_neuron;         // ID de la neurona fuente
  int id_target_neuron;         // ID de la neurona objetivo
  float weight;                 // Peso del gen
  
  Gen(){
    source_hidden_layer = (random(1) < 0.5); // Decide aleatoriamente si la neurona fuente está en la capa oculta
    id_source_neuron = (int)random(0, 7);    // Asigna aleatoriamente una ID a la neurona fuente (0-6)
    if (source_hidden_layer){
      id_target_neuron = (int)random(0, 7);// Si la neurona fuente está en la capa oculta, asigna aleatoriamente una ID a la neurona objetivo (0-6)
    } else {
      id_target_neuron = (int)random(0, 2); // Si la neurona fuente está en la capa de salida, asigna aleatoriamente una ID a la neurona objetivo (0-1)
    }
    weight = random(-1, 1); // Asigna aleatoriamente un peso entre -1 y 1
  }
  
}

class Genome {
  
  int length;
  ArrayList<Gen> genes;
  float[] hidden_layer_bias;
  float[] output_layer_bias;

  Genome(){
    length = 16;
    genes = new ArrayList<Gen>();
    for (int i = 0; i < length; i++){
      genes.add(new Gen());   // Inicializa la lista de genes con instancias de la clase Gen
    }
    hidden_layer_bias = random_vector(7); // Inicializa sesgos para la capa oculta
    output_layer_bias = random_vector(2); // Inicializa sesgos para la capa de salida
  }

  Genome copy(){
    Genome copy = new Genome();
    for (int i = 0; i < length; i++){
      copy.genes.set(i, genes.get(i)); // Copia los genes del genoma actual a la copia
    }
    for (int i = 0; i < 7; i++){
      copy.hidden_layer_bias[i] = hidden_layer_bias[i]; // Copia los sesgos de la capa oculta
    }
    for (int i = 0; i < 2; i++){
      copy.output_layer_bias[i] = output_layer_bias[i]; // Copia los sesgos de la capa de salida
    }
    return copy;
  }
  
  Genome mutate() {
    // Comienza con una copia del genoma actual
    Genome mutated_genome = copy();
    // But change some of the genes for new random ones
    int amount_of_mutations = (int)random(1, 5);
    for (int i = 0; i < amount_of_mutations; i++){
      int index = (int)random(0, length);
      mutated_genome.genes.set(index, new Gen());
    }
    return mutated_genome;
  }

  Genome crossover(Genome anotherGenome) {
    // Start with a copy of the genome
    Genome crossed_genome = copy();
     // Pero cambia algunos de los genes por algunos de los genes del otro genoma
    int amount_of_crossovers = (int)random(1, 5);
    for (int i = 0; i < amount_of_crossovers; i++){
      int index = (int)random(0, length);
      crossed_genome.genes.set(index, anotherGenome.genes.get(index));
    }
    return crossed_genome;
  }
}

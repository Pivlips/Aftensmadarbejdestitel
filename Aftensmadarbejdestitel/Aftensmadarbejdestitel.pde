boolean Forside = true;
boolean Opskrifter = false;
boolean Scan_varer = false;
boolean Se_varer = false;

boolean mad1, mad2, mad3, mad4;

int antalOpskrifter = 0;

int opskiftsider1 = 1;

PImage opskrift1;

void setup() {
  //fullScreen();
  size(1280, 800);
  
  noStroke();
  
  mad1 = true; //mel
  mad2 = true; //mælk
  mad3 = true; //smør
  mad4 = true; //æg
  
  opskrift1 = loadImage("pandekage_billede.jpg");
}

void draw() {
  
  /*     DEL ET     */
  /* LAYOUT OG MENU */
    
  background(0);
  
  ///////////////
  // KAPITEL I //
  //  FORSIDE  //
  ///////////////
  
  if (Forside == true) {
  
      //OPSKRIFTER
    fill(255);
    rect (334,152,613,99);
        //tekst
    textSize(50);
    fill(112);
    text("Opskrifter", 530, 222);
  
      //SCAN VARER
    fill(255);
    rect (334,351,613,99);
        //tekst
    fill(112);
    text("Scan varer", 521, 421);
    
      //SE VARER
    fill(255);
    rect (334,550,613,99);
        //tekst
    fill(112);
    text("Se varer", 548, 620);
    
      //NAVIGERING
        //opskrifter
    if((mouseY<(152+99))&&(mouseY>(152))){
      if((mouseX<(334+613))&&(mouseX>(334))){
        if (mousePressed){
          Opskrifter = true;
          Forside = false;
        }
      }
    }
        //scan varer
     if((mouseY<(351+99))&&(mouseY>(351))){
      if((mouseX<(334+613))&&(mouseX>(334))){
        if (mousePressed){
          Scan_varer = true;
          Forside = false;
         }
       }
     }
        //se varer
     if((mouseY<(550+99))&&(mouseY>(550))){
      if((mouseX<(334+613))&&(mouseX>(334))){
        if (mousePressed){
          Se_varer = true;
          Forside = false;
         }
       }
     }
     
  }
  
  ////////////////
  // KAPITEL II //
  // OPSKRIFTER //
  ////////////////
  
  if (Opskrifter == true)  {
      //TITEL
    textSize(100);
    fill(255);
    text("Opskrifter", 420, 148);
  
      //INDHOLD
    textSize(80);
    fill(255, 165, 165);
    text("Ingen opskrifter tilgængelig", 184, 381);
  
      //KNAPPER
        //tilbage
    fill(100, 0, 0); //farve på knap
    rect (41,673,291,87);
    fill(255); //farve på tekst
    textSize(50);
    text("Tilbage", 105, 737);
    
      //NAVIGERING
    if((mouseY<(673+87))&&(mouseY>(673))){
      if((mouseX<(41+291))&&(mouseX>(41))){
        if (mousePressed){
          Opskrifter = false;
          Forside = true;
          opskiftsider1 = 1;
          
        }
      }
    }
  
  }

  /////////////////
  // KAPITEL III //
  // SCAN  VARER //
  /////////////////
  
  if (Scan_varer == true) {
    
      //TITEL
    textSize(100);
    fill(255);
    text("Scan en varer", 332, 148);
      
      //TEKSTFELT
    fill(191); //farve på felt
    rect (334,198,613,445);
      
      //KNAPPER
        //tilbage
    fill(100, 0, 0); //farve på knap
    rect (41,673,291,87);
    fill(255); //farve på tekst
    textSize(50);
    text("Annuller", 96, 737);
    
     //NAVIGERING
    if((mouseY<(673+87))&&(mouseY>(673))){
      if((mouseX<(41+291))&&(mouseX>(41))){
        if (mousePressed){
          Scan_varer = false;
          Forside = true;
        }
      }
    }
  
  }
  
  ////////////////
  // KAPITEL IV //
  //  SE VARER  //
  ////////////////
  
  if (Se_varer == true) {
    
      //TITEL
    textSize(100);
    fill(255);
    text("Se varer", 444, 148);
    
      //TEKSTFELT
        //felt venstre 
    fill(191); //farve på felt
    rect (80,193,521,454);
    
    fill(0); //farve på streger
    rect (80,268,521,1);
    rect (80,343,521,1);
    rect (80,419,521,1);
    rect (80,495,521,1);
    rect (80,571,521,1);
    rect (253,193,1,455);
    rect (427,193,1,455);
    
        //felt højre
    fill(191); //farve på felt
    rect (679,193,521,454);
    
    fill(0); //farve på streger
    rect (679,268,521,1);
    rect (679,343,521,1);
    rect (679,419,521,1);
    rect (679,495,521,1);
    rect (679,571,521,1);
    rect (852,193,1,455);
    rect (1026,193,1,455);
    
    
      //KNAPPER
        //tilbage
    fill(100, 0, 0); //farve på knap
    rect (41,673,291,87);
    fill(255); //farve på tekst
    textSize(50);
    text("Tilbage", 105, 737);
    
     //NAVIGERING
    if((mouseY<(673+87))&&(mouseY>(673))){
      if((mouseX<(41+291))&&(mouseX>(41))){
        if (mousePressed){
          Se_varer = false;
          Forside = true;
        }
      }
    }
    
    /*   DEL  TO   */
    /* INDSCANNING */
    
    ///////////////
    // KAPITEL V //
    //  EN VARE  //
    ///////////////
    
    //MEL
    if (mad1==true && mad2==false && mad3==false && mad4==false){
      textSize(30);
      fill(0);
      text("Mel", 83, 243);
    }
    
    //MÆLK
    if (mad1==false && mad2==true && mad3==false && mad4==false){
      textSize(30);
      fill(0);
      text("Mælk", 83, 243);
    }
    
     //SMØR
    if (mad1==false && mad2==false && mad3==true && mad4==false){
      textSize(30);
      fill(0);
      text("Smør", 83, 243);
    }
    
     //ÆG
    if (mad1==false && mad2==false && mad3==false && mad4==true){
      textSize(30);
      fill(0);
      text("Æg", 83, 243);
    }
    
    ////////////////
    // KAPITEL VI //
    //  TO VARER  //
    ////////////////
    
    //MEL OG MÆLK
    if (mad1==true && mad2==true && mad3==false && mad4==false){
      textSize(30);
      fill(0);
      text("Mel", 83, 243);
      text("Mælk", 83, 318);
    }
    
    //MEL OG SMØR
    if (mad1==true && mad2==false && mad3==true && mad4==false){
      textSize(30);
      fill(0);
      text("Mel", 83, 243);
      text("Smør", 83, 318);
    }
    
    //MEL OG ÆG
    if (mad1==true && mad2==false && mad3==false && mad4==true){
      textSize(30);
      fill(0);
      text("Mel", 83, 243);
      text("Æg", 83, 318);
    }
    
    //MÆLK OG SMØR
    if (mad1==false && mad2==true && mad3==true && mad4==false){
      textSize(30);
      fill(0);
      text("Mælk", 83, 243);
      text("Smør", 83, 318);
    }
    
    //MÆLK OG ÆG
    if (mad1==false && mad2==true && mad3==false && mad4==true){
      textSize(30);
      fill(0);
      text("Mælk", 83, 243);
      text("Æg", 83, 318);
    }
    
    //SMØR OG ÆG
    if (mad1==false && mad2==false && mad3==true && mad4==true){
      textSize(30);
      fill(0);
      text("Smør", 83, 243);
      text("Æg", 83, 318);
    }
    
    /////////////////
    // KAPITEL VII //
    //  TRE VARER  //
    /////////////////
    
    //MEL, MÆLK OG SMØR
    if (mad1==true && mad2==true && mad3==true && mad4==false){
      textSize(30);
      fill(0);
      text("Mel", 83, 243);
      text("Mælk", 83, 318);
      text("Smør", 83, 394);
    }
    
    //MEL, MÆLK OG ÆG
    if (mad1==true && mad2==true && mad3==false && mad4==true){
      textSize(30);
      fill(0);
      text("Mel", 83, 243);
      text("Mælk", 83, 318);
      text("Æg", 83, 394);
    }
    
    //MEL, SMØR OG ÆG
    if (mad1==true && mad2==false && mad3==true && mad4==true){
      textSize(30);
      fill(0);
      text("Mel", 83, 243);
      text("Smør", 83, 318);
      text("Æg", 83, 394);
    }
    
    //MÆLK, SMØR OG ÆG
    if (mad1==false && mad2==true && mad3==true && mad4==true){
      textSize(30);
      fill(0);
      text("Mælk", 83, 243);
      text("Smør", 83, 318);
      text("Æg", 83, 394);
    }
    
    //////////////////
    // KAPITEL VIII //
    //  FIRE VARER  //
    //////////////////
    
    //MEL, MÆLK, SMØR OG ÆG
    if (mad1==true && mad2==true && mad3==true && mad4==true){
      textSize(30);
      fill(0);
      text("Mel", 83, 243);
      text("Mælk", 83, 318);
      text("Smør", 83, 394);
      text("Æg", 83, 470);
    }
    
  }
   
  
  /*  DEL  TRE  */
  /* OPSKRIFTER */
  
  /////////////////
  // KAPITEL  IX //
  // SE OPSKIRFT //
  /////////////////

  if (mad1==true && mad2==true && mad3==true && mad4==true) {
    antalOpskrifter = 1;
  } else {
    antalOpskrifter = 0;
  }
  
  if (Opskrifter == true && antalOpskrifter == 1) {
    //Boks
    fill(255); //farve på boks
    rect (125,230,1030,405); //boks
    
    //Overskrift på opskrift
    textSize(40);
    fill(57, 142, 67);
    text("Pandekager", 135, 280);
    
    //Underskift på opskrift
    textSize(30);
    fill(77);
    text("4 personer", 135, 320);
    text("20 minutter", 135, 355);
    
    //Billede
    image(opskrift1, 842, 230);
    
    //Indhold
    fill(0); //farve på tekst
    textSize(40);
    
    //første kolonne
    text("300g mel", 135, 432);
    text("9 dl mælk", 135, 482);
    text("100g smør", 135, 532);
    text("6 æg", 135, 582);
    //anden kolonne
    text("1 tsk salt", 440, 432);
    
    //Knap - Næste
    if (opskiftsider1 <= 6) {
    fill(0, 100, 0); //farve på knap
    rect (955,673,291,87);
    fill(255); //farve på tekst
    textSize(50);
    text("Næste", 1027, 737);
    }
    
    //Knap - Forrige
    if (opskiftsider1 >= 2) {
      fill(113, 77, 28); //farve på knap
      rect (614,673,291,87);
      fill(255); //farve på tekst
      textSize(50);
      text("Forrige", 681, 737);
    }
      
    
    
    
    /////////////////////
    //    KAPITEL X    //
    // FØLG VEJLEDNING //
    /////////////////////
    
  if (opskiftsider1 == 2) {
    //SIDE TO
    fill(255);
    rect (125,372,1030,263);
    fill(0); //farve på tekst
    textSize(50);
    text("Kom melet (300g) i en skål og pisk mælken", 135, 442);
    text("(9 dl) i lidt efter lidt til en “klumpfri” jævning", 135, 502);
  }
  
  if (opskiftsider1 == 3) {
    //SIDE TRE
    fill(255);
    rect (125,372,1030,263);
    fill(0); //farve på tekst
    textSize(50);
    text("Smelt (100g) smørret i en stegepande", 135, 442);
    text("og kom det i blandingen", 135, 502);
  }
  
  if (opskiftsider1 == 4) {
    //SIDE FIRE
    fill(255);
    rect (125,372,1030,263);
    fill(0); //farve på tekst
    textSize(50);
    text("Tilsæt æg (6 stk) og salt (1 tsk), pisk dejen", 135, 442);
    text("godt igennem og lad den hvile i ca. ½ time.", 135, 502);
  }
  
  if (opskiftsider1 == 5) {
    //SIDE FEM
    fill(255);
    rect (125,372,1030,263);
    fill(0); //farve på tekst
    textSize(50);
    text("Bag en pandekage ad gangen (½-¾ dl dej pr.", 135, 442);
    text("pandekage) ved kraftig varme, ca. 1 min. på", 135, 502);
    text("hver side, eller til de er gyldne.", 135, 562);
  }
  
  if (opskiftsider1 == 6) {
    //SIDE SEKS
    fill(255);
    rect (125,372,1030,263);
    fill(0); //farve på tekst
    textSize(50);
    text("Hold pandekagerne varme under alufolie og ", 135, 442);
    text("gentag med resten af dejen", 135, 502);
  }
  
  if (opskiftsider1 >= 7) {
    //SIDE SYV
    fill(255);
    rect (125,372,1030,263);
    fill(0); //farve på tekst
    textSize(75);
    text("Tillykke, du er færdig", 135, 467);
  }
    
}
}


void mouseReleased () { 
  if (Opskrifter == true && antalOpskrifter == 1) {
    if (opskiftsider1 <= 6) {
      if((mouseY<(673+87))&&(mouseY>(673))){
        if((mouseX<(955+291))&&(mouseX>(955))){
          opskiftsider1 = opskiftsider1 + 1;
        }
      }
    }
  }
  
  if (Opskrifter == true && antalOpskrifter == 1) {
    if (opskiftsider1 >= 2) {
      if((mouseY<(673+87))&&(mouseY>(673))){
        if((mouseX<(614+291))&&(mouseX>(614))){
          opskiftsider1 = opskiftsider1 - 1;
        }
      }
    }
  }
}
  

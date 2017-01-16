program TD_CarreMagique;

uses crt;

const
        taille=5;

type Tableau2D=array[1..taille,1..taille] of integer;

procedure InitiaTabl (T1:Tableau2D);

var
        i,j,compteur,curseurligne,curseurcolonne:integer;

begin
        //Initialisation des coordonnees du point de depart et du compteur:
        curseurligne:=taille div 2;
        curseurcolonne:=taille div 2+1;
        compteur:=1;

        //Creation du tableau:
        for i:=1 to taille do
        begin
                for j:=1 to taille do
                begin
                        T1[i,j]:=0;
                        write(T1[i,j]);
                end;
        writeln;
        end;

        //Initialisation du point de depart:
        T1[curseurligne,curseurcolonne]:=compteur;
        compteur:=compteur+1;

end;

procedure DeplacementDroite (T1:Tableau2D ; compteur,curseurligne,curseurcolonne:integer);

begin
        //Teste pour savoir si la case est vide:
        if (T1[curseurligne-1,curseurcolonne+1]=0) then
        begin
                //Cas oó le curseur est sur la premiäre ligne, correction:
                if (curseurligne=1 and 0<curseurcolonne<taille) then
                begin
                        T1[curseurligne+(taille-1),curseurcolonne+1]:=compteur;
                        curseurligne:=curseurligne+(taille-1);
                        curseurcolonne:=curseurcolonne+1;
                        compteur:=compteur+1;
                end;

                //Cas oó le curseur est sur la derniäre colonne, correction:
                if (0<curseurligne<taille and curseurcolonne=1) then
                begin
                        T1[curseurligne-1,curseurcolonne-(taille-1)]:=compteur;
                        curseurligne:=curseurligne-1;
                        curseurcolonne:=curseurcolonne-(taille-1);
                        compteur:=compteur+1;
                end;

                //Cas oó le curseur est sur la premiäre ligne ET derniäre colonne, correction:
                if (curseurligne=1 and curseurcolonne=taille) then
                begin
                        T1[curseurligne+(taille-1),curseurcolonne-(taille-1)]:=compteur;
                        curseurligne:=curseurligne+(taille-1);
                        curseurcolonne:=curseurcolonne-(taille-1);
                        compteur:=compteur+1;
                end;
                else
                begin
                        T1[curseurligne-1,curseurcolonne+1]:=compteur;
                        curseurligne:=curseurligne-1;
                        curseurcolonne:=curseurcolonne+1;
                        compteur:=compteur+1;
                end;
        end;
end;

procedure DeplacementGauche (T1:Tableau2D ; compteur,curseurligne,curseurcolonne:integer);

begin
        //Teste pour savoir si la case est pleine:
        if (T1[curseurligne-1,curseurcolonne+1]=0) then
        begin
                //Cas oó le curseur est sur la premiäre colonne, correction:
                if (1<curseurligne<(taille+1) and curseurcolonne=1) then
                begin
                        T1[curseurligne-1,curseurcolonne+(taille-1)]:=compteur;
                        curseurligne:=curseurligne-1;
                        curseurcolonne:=curseurcolonne+(taille-1);
                        compteur:=compteur+1;
                end;

                //Cas oó le curseur est sur la premiäre ligne, correction:
                if (curseurligne=1 and 1<curseurcolonne<taille+1) then
                begin
                        T1[curseurligne+(taille-1),curseurcolonne-1]:=compteur;
                        curseurligne:=curseurligne+(taille-1);
                        curseurcolonne:=curseurcolonne-1;
                        compteur:=compteur+1;
                end;

                //Cas oó le curseur est sur la premiäre ligne ET colonne, correction:
                if (curseurligne=1 and curseurcolonne=1) then
                begin
                        T1[curseurligne+(taille-1),curseurcolonne+(taille-1)]:=compteur;
                        curseurligne:=curseurligne+(taille-1);
                        curseurcolonne:=curseurcolonne+(taille-1);
                        compteur:=compteur+1;
                end;
                else
                begin
                        T1[curseurligne-1,curseurcolonne-1]:=compteur;
                        curseurligne:=curseurligne-1;
                        curseurcolonne:=curseurcolonne-1;
                        compteur:=compteur+1;
                end;
        end;
end;



//Programme Principal:

var
        Matrice:array[1..taille,1..taille] of integer;
        i,j,k:integer;

BEGIN
        clrscr;
        InitiaTabl(Matrice);
        for k:=1 to 25 do
        begin
                DeplacementDroite;
                DeplacementGauche;
        end;
        for i:=1 to taille do
        begin
                for j:=1 to taille do
                begin
                        write(T1[i,j]);
                end;
        writeln;
        end;


        readln;
END.
















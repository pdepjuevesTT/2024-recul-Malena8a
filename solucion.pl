% Solución en Prolog


% Malena Ochoa

%Punto1)

%propiedad(Persona,Vivienda).
%Vivienda(Atributos).
    %casa(metros cuadrados).
    %dpto(ambientes,baños).
    %loft(año de construccion).
propiedad(juan,casa(120)).
propiedad(nico,departamento(3,2)).
propiedad(alf,departamento(3,1)).
propiedad(julian,loft(2000)).
propiedad(vale,departamento(4,1)).
propiedad(fer,casa(110)).

%viveEn(Persona,Barrio).
viveEn(alf,almagro).
viveEn(juan,almagro).
viveEn(nico,almagro).
viveEn(julian,almagro).
viveEn(vale,flores).
viveEn(fer,flores).

%Punto2)

barrioCopado(Barrio):-
    viveEn(_,Barrio),
    foreach(viveEn(Persona,Barrio), tienePropiedadCopada(Persona)).

tienePropiedadCopada(Persona):-
    propiedad(Persona,_),
    cumpleRequisitosCopada(Persona).

cumpleRequisitosCopada(Persona):-
    propiedad(Persona,casa(Metros)),
    Metros > 100.

cumpleRequisitosCopada(Persona):-
    propiedad(Persona,departamento(Ambientes,_)),
    Ambientes >3.

cumpleRequisitosCopada(Persona):-
    propiedad(Persona,loft(Anio)),
    Anio > 2015.

cumpleRequisitosCopada(Persona):-
    propiedad(Persona,departamento(_,Banio)),
    Banio >1.

%Punto3)
barrioCaro(Barrio):-
    viveEn(_,Barrio),
    foreach(viveEn(Alguien,Barrio), tienePropiedadCopada(Alguien)).


%Punto4)
tasas(juan,150000).
tasas(nico,80000).
tasas(alf,75000).
tasas(julian,140000).
tasas(vale,95000).
tasas(fer,60000).


sublista([],[]).
sublista([_|Cola],Sublista):- sublista(Cola,Sublista).
sublista([Cabeza|Cola],[Cabeza|Sublista]):- sublista(Cola,Sublista).


sePuedeComprar(Dinero,Propiedad):-
    tasas(_,Valor),
    Dinero>= Valor,
    tasas(Alguien,Valor),
    propiedad(Alguien,Propiedad).


comprarPropiedad(Dinero,Resto,UnaProp):-
    propiedad(Alguien,Propiedad),
    tasas(Alguien,Valor),
    Dinero>= Valor,
    Resto is Dinero -Valor.

quePuedoComprar(Dinero,Resto,SublistaProps):-
    Resto is Dinero,
    alcanza(Dinero,PropiedadesParaLasQueAlcanza),
    sublista(PropiedadesParaLasQueAlcanza,[UnaProp|Cola]),
    comprarPropiedad(Dinero,Resto2,UnaProp),
    alcanza(Dinero,Resto2,)
    
alcanza(Dinero,Lista):-
    findall(Propiedad,sePuedeComprar(Dinero,Propiedad),Lista).


    /*
    compraPropiedad(Dinero,Resto2,UnaProp),
    quePuedoComprar(Resto2,_,([UnaProp|_])).
*/
compraPropiedad(Dinero,Resto,Propiedad):-
    propiedad(Alguien,Propiedad),
    tasas(Alguien,Valor),
    Resto is Dinero -Valor.

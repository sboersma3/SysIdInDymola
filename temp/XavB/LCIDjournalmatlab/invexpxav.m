% cette fonction invz=invexpxav(exposant,w) donne la valeur de exp(-jw*exposant)


function invz=invexpxav(exposant,w)
j=sqrt(-1);

invz=exp(-j*w*exposant);

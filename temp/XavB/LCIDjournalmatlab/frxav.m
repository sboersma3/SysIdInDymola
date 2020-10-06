function vect=frxav(sys,w)


frdiff=frd(sys,w);
diffw=frdata(frdiff);
nwdef=length(w);
vect=[];
for ii=1:nwdef,
vect=[vect,diffw(:,:,ii)];
end;
# latexmk configuration

# local texmf tree
ensure_path( 'TEXINPUTS', './texmf//' );
ensure_path( 'T1FONTS', './texmf/fonts/type1//' );
ensure_path( 'AFMFONTS', './texmf/fonts/afm//' );
ensure_path( 'TEXFONTMAPS', './texmf/fonts/map//' );
ensure_path( 'TFMFONTS', './texmf/fonts/tfm//' );
ensure_path( 'VFFONTS', './texmf/fonts/vf//' );
ensure_path( 'ENCFONTS', './texmf/fonts/enc//' );

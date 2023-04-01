#!/bin/bash
convert_to_png(){
    cd $HOME/Development/alura-shell/imagens-liavros/ 

    if [ ! -d pngs ]
    then
        mkdir pngs
        echo 'Foi criado o diretório /pngs'
    fi
    counter=0
    for image in *.jpg 
    do
        local image_name=$(ls $image | awk -F. '{ print $1 }')
        convert $image_name.jpg pngs/$image_name.png
        let counter++
    done
}

convert_to_png 2> erros.log

if [ $? -eq 0 ]
then
    echo image_name
    echo 'Foram convertidas' $counter 'imagens jpg para png com sucesso!'
else
    echo 'Houve um erro na conversão, mais detalhes em erros.log'
fi
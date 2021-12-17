#!/bin/bash
function tri(){
# permet de trier le dossier
    cd $dossier
    #récupère l'extension en retournant la ligne pour éviter les erreurs
    for extension in `find . -type f | rev | cut -d. -f1 | rev | tr '[:upper:]' '[:lower:]' | sort`
        do
            #crée les dossiers des extensions qu'il trouve
            mkdir "dossier$extension"
            #déplace les fichiers avec ces extensions dans les bons dossiers
            for file in `find . -iname "*.$extension" | sort -r`
                do
                    mv $file /dossier_$extension
                done
        done
}

#saisie du nom de dossier à trier
function saisirDossier(){
    read -p "Entrer le nom du dossier à trier : " dossier

}

#main pour executer le script
function main (){
    if [[ $# -eq 1 ]] 
        then dossier =$1
    else 
        saisirDossier
    fi
    tri $dossier
}

main $@
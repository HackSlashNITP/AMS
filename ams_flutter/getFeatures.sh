#!/usr/bin/env bash
set -e

# This script will create the folders and files
# Format : ./generateFeature.sh feature nameOfTheFeature

if [ -z "$1" ]
then 
    echo "No argument provided"
    exit
else 
    if [ $1 == "feature" ]
    then 
        # Create folders for $2
        mkdir lib/features/$2
        #==========================
        mkdir lib/features/$2/data
            mkdir lib/features/$2/data/datasources
                touch lib/features/$2/data/datasources/$2_data_source.dart
          
            mkdir lib/features/$2/data/models
                touch lib/features/$2/data/models/$2_model.dart

            mkdir lib/features/$2/data/repositories    
                touch lib/features/$2/data/repositories/$2_repository_impl.dart
        #==========================
        mkdir lib/features/$2/domain
            mkdir lib/features/$2/domain/entities
                touch lib/features/$2/domain/entities/$2_entity.dart

            mkdir lib/features/$2/domain/repositories
                touch lib/features/$2/domain/repositories/$2_repository.dart

            mkdir lib/features/$2/domain/usecases   
                touch lib/features/$2/domain/usecases/$2_usecase.dart
        #========================== 
        mkdir lib/features/$2/presentation
            mkdir lib/features/$2/presentation/pages
            mkdir lib/features/$2/presentation/widgets
        #==========================
    fi  
fi
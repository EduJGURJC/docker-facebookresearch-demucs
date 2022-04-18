#!/bin/bash

echo "Checking if \$AUDIO_NAME is not empty"
if [ -z "$AUDIO_NAME" ]
then
    echo "\$AUDIO_NAME is empty. Please, pass the audio name into the AUDIO_NAME environment variable"
    exit 1
else
    echo "\$AUDIO_NAME is not empty: '$AUDIO_NAME'"
    echo ""
fi

echo "Executing demucs to separate audio tracks..."
bash -x -c "demucs -o ${OUTPUT_PATH:=/output} \"${INPUT_PATH:=/input}/${AUDIO_NAME}\" ${OTHER_ARGS}"
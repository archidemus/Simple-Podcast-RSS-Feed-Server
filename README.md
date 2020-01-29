# Simple Python Podcast RSS Server

Podcast RSS server based in Python Flask server. My Spotify podcasts are served using this code, so it's fully functional. Note: It's a functional simple base and many improvements could be done, I know. Contributions are well received.

## Requirements

- Python3
- Flask `pip install Flask`

## Quick start

To run example podcasts server run `sh ./podcasts.sh` with option `1`

## Custom usage: Add my podcasts

Podcasts files are in static folder.

- Modify folders and files according to your podcast: Change image, add audios, change name of podcast folder.
- Adjust `podcasts.json` with new names and audio data.
- If you want, can change port in podcast.sh
- `sh ./podcasts.sh` with option `1`

## Production

Change ip 127.0.0.1 for 0.0.0.0 in podcasts.sh and podcasts.json

## Add new audio files

- Add mp3 file in `static/<podcast>/audios/<audiofile>.mp3`
- Add new item in `podcasts.json`
- Restart server using `sh ./podcasts.sh` with option `2`
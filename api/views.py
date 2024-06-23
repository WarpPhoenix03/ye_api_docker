from django.http import JsonResponse
from .models import Song
from .serializers import AlbumSerializer, SongSerializer


def get_song(request):
    songs = Song.objects.select_related('album').all()
    albums = {}
    favorites = {'name': 'Favorites', 'image': 'favorite', 'songs': []}

    for song in songs:
        album_name = song.album.name
        album_image = song.album.image

        if album_name not in albums:
            albums[album_name] = {'name': album_name, 'image': album_image, 'songs': []}

        albums[album_name]['songs'].append(SongSerializer(song).data)

        if song.favorite:
            favorites['songs'].append(SongSerializer(song).data)

    albums['Favorites'] = favorites
    serializer = AlbumSerializer(albums.values(), many=True)
    return JsonResponse(serializer.data, safe=False)


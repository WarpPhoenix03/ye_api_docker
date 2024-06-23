from django.db import models


class Album(models.Model):
    name = models.CharField(max_length=255)
    image = models.CharField(max_length=255)

    class Meta:
        db_table = 'api_album'  # specify the table name here

    def __str__(self):
        return self.name


class Song(models.Model):
    name = models.CharField(max_length=255)
    image = models.CharField(max_length=255)
    artist = models.CharField(max_length=255)
    favorite = models.BooleanField(default=False)
    fileName = models.CharField(max_length=255)
    album = models.ForeignKey(Album, on_delete=models.CASCADE, related_name='songs')

    class Meta:
        db_table = 'api_song'  # specify the table name here

    def __str__(self):
        return self.name


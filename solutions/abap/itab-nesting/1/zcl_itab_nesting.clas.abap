CLASS zcl_itab_nesting DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    TYPES: BEGIN OF artists_type,
             artist_id   TYPE string,
             artist_name TYPE string,
           END OF artists_type.
    TYPES artists TYPE STANDARD TABLE OF artists_type WITH KEY artist_id.
    TYPES: BEGIN OF albums_type,
             artist_id  TYPE string,
             album_id   TYPE string,
             album_name TYPE string,
           END OF albums_type.
    TYPES albums TYPE STANDARD TABLE OF albums_type WITH KEY artist_id album_id.
    TYPES: BEGIN OF songs_type,
             artist_id TYPE string,
             album_id  TYPE string,
             song_id   TYPE string,
             song_name TYPE string,
           END OF songs_type.
    TYPES songs TYPE STANDARD TABLE OF songs_type WITH KEY artist_id album_id song_id.


    TYPES: BEGIN OF song_nested_type,
             song_id   TYPE string,
             song_name TYPE string,
           END OF song_nested_type.
    TYPES: BEGIN OF album_song_nested_type,
             album_id   TYPE string,
             album_name TYPE string,
             songs      TYPE STANDARD TABLE OF song_nested_type WITH KEY song_id,
           END OF album_song_nested_type.
    TYPES: BEGIN OF artist_album_nested_type,
             artist_id   TYPE string,
             artist_name TYPE string,
             albums      TYPE STANDARD TABLE OF album_song_nested_type WITH KEY album_id,
           END OF artist_album_nested_type.
    TYPES nested_data TYPE STANDARD TABLE OF artist_album_nested_type WITH KEY artist_id.

    METHODS perform_nesting
      IMPORTING
        artists            TYPE artists
        albums             TYPE albums
        songs              TYPE songs
      RETURNING
        VALUE(nested_data) TYPE nested_data.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.

CLASS zcl_itab_nesting IMPLEMENTATION.

  METHOD perform_nesting.

  data: ls_nested type artist_album_nested_type,
        ls_albums type album_song_nested_type,
        ls_song_nest type song_nested_type,
        song_tab TYPE STANDARD TABLE OF song_nested_type WITH KEY song_id.
        
  loop at artists into data(ls_artists_line).
    loop at albums into data(ls_album_line) where artist_id = ls_artists_line-artist_id.
      ls_albums-album_id = ls_album_line-album_id.
      ls_albums-album_name = ls_album_line-album_name.
      loop at songs into data(ls_song) where album_id = ls_album_line-album_id
                                         and artist_id = ls_artists_line-artist_id.
          ls_song_nest-song_id = ls_song-song_id.
          ls_song_nest-song_name = ls_song-song_name.
          append ls_song_nest to song_tab.                               
      endloop.
      clear ls_song_nest.
      ls_albums-songs = song_tab.
      clear song_tab.
      append ls_albums to ls_nested-albums.
    endloop.
    free ls_albums-songs.
    clear ls_albums.
    ls_nested-artist_id = ls_artists_line-artist_id.
    ls_nested-artist_name = ls_artists_line-artist_name.
    append ls_nested to nested_data.
    free ls_nested-albums.
    clear ls_nested.
  endloop.
  
  ENDMETHOD.

ENDCLASS.

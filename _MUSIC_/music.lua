local music = {}

local link = "_MUSIC_/Corncob_Country.mp3"

function music.setAudio(num)
    if num == 0 then
        link = "_MUSIC_/Corncob_Country.mp3"
    elseif num == 1 then
        link = "_MUSIC_/Corncob_Country.mp3"
    elseif num == 2 then
        link = "_MUSIC_/Generations_Away.mp3"
    elseif num == 3 then
        link = "_MUSIC_/Corncob_Country.mp3"
    elseif num == 4 then
        link = "_MUSIC_/Corncob_Country.mp3"
    elseif num == 5 then
        link = "_MUSIC_/Corncob_Country.mp3"
    elseif num == 6 then
        link = "_MUSIC_/St_Francis.mp3"
    end
end

function music.loadStream()
    musicTrack = audio.loadStream(link)
end

function music.play()
    audio.play( musicTrack, { channel = 1, loops = -1 } )
end

function music.stop()
    audio.stop()
end

return music

require 'sinatra'
require 'set'

get '/' do
    erb :index 
end

get '/check_palindrome' do
    text = params["aText"]
    # Convierto el String a minúscula y luego en Array para manipular mejor los datos.
    text = text.downcase
    chars = text.chars
    word = ""
    magic_words = Set[]
    i = 0
    while (i < chars.length) do
        # Decidí usar un 'while' en lugar de un 'for' o un 'each' porque me conviene ir iterando
        # sobre bloques de caracteres en lugar de realizar una sola iteración por caracter.
        while ((chars[i] != " ") and (chars[i] != ".") and (chars[i] != ",") and (i != chars.length)) do
           # Mientras no sea el fin de la palabra y mientras el string no termine:
           word << chars[i] 
           i += 1
        end
        # Utilizo un set para no contabilizar las palabras mágicas repetidas.
        if (word == word.reverse) and (word != "") then
            magic_words << word
        end
        word = ""
        i += 1
    end
    result = magic_words.length()
    return "La cantidad de palabras magicas es:  #{result}" 
end
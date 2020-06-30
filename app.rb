require 'sinatra'

get '/' do
    <<-HTML
        <form action="/check_palindrome/:aText" method="post">
            <label>Texto:</label>
            <textarea name="post[aText]"></textarea>
            <input type="submit" value="Verificar">
        </form>
    HTML
end


post '/check_palindrome/:aText' do
    # Recibo parametro del form y lo guardo en str.
    @post = params[:post]
    text = @post["aText"]
    # Convierto el String a minúscula y luego en Array para manipular mejor los datos.
    text = text.downcase
    chars = text.chars
    word = ""
    magic_words = 0
    i = 0
    while (i < chars.length) do
        # Decidí usar un 'while' en lugar de un 'for' o un 'each' porque me conviene ir iterando
        # sobre bloques de caracteres en lugar de realizar una sola iteración por caracter.
        while ((chars[i] != " ") and (chars[i] != ".") and (chars[i] != ",") and (i != chars.length)) do
           # Mientras no sea el fin de la palabra y mientras el string no termine:
           word << chars[i] 
           i += 1
        end
        if (word == word.reverse) then
            magic_words += 1
        end
        word = ""
        i += 1
    end
    print "Palabras magicas: #{magic_words}   "
end


class Pokemon
    attr_accessor :id, :name, :type, :hp, :db

    def initialize(id:, name:, type:, db:, hp: nil)
        @id = id
        @name = name
        @type = type
        @db = db
        @hp = hp
    end

    def self.save(name, type, db)
        db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)", name, type)
    end

    def self.find(id_num, db)
        pokemon_find = db.execute("SELECT * FROM pokemon WHERE id = ?", id_num).first
        Pokemon.new(id: pokemon_find[0], name: pokemon_find[1], type: pokemon_find[2], hp: pokemon_find[3], db: db)
    end

    def alter_hp(new_hp, db)
        db.execute("UPDATE pokemon SET hp = ?, new_hp, self.id")
    end
end

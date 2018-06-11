require 'spec_helper'
require_relative '../services/zoo'

describe Zoo do
  describe '#inventory' do
    let(:alligator_roger) { Alligator.new(name: 'Roger', description: 'Likes to swim in the sewer') }
    let(:otter_marlene) { Otter.new(name: 'Marlene', description: 'Is a really smart female otter') }

    let(:gorilla_bada) do
      Gorilla.new(name: 'Bada', origin: 'Africa', description: 'Is not so smart, but he is big and strong')
    end
    let(:gorilla_bing) do
      Gorilla.new(name: 'Bing', origin: 'Bali', description: 'Looks exactly like Bada')
    end

    let(:penguin_skipper) { Penguin.new(name: 'Skipper', description: 'Is the main man here' ) }
    let(:penguin_rico) { Penguin.new(name: 'Rico', description: 'Eats everything' ) }
    let(:penguin_private) { Penguin.new(name: 'Private', description: 'Likes to be bossy' ) }
    let(:penguin_kowalski) { Penguin.new(name: 'Kowalski', description: 'Does not like to talk much' ) }

    let(:lemur_julien) do
      Lemur.new(name: 'Julien', kind: 'Ring tailed', description: 'Self-appointed king of everything')
    end
    let(:lemur_mort) do
      Lemur.new(name: 'Mort', kind: "Goodman's mouse", description: 'The cutest thing you will ever see')
    end

    it 'returns proper ZOO inventory when there are no animals present' do
      expect(subject.inventory).to eq 'Oh no! There are no animals in our ZOO!'
    end

    it 'returns proper ZOO inventory for one animal - Alligator Roger' do
      subject.add_animals([alligator_roger])

      expect(subject.inventory).to eq 'There is only one animal in our ZOO! '\
        'Alligator Roger likes to swim in the sewer. Hope you will enjoy your visit!'
    end

    it 'returns proper ZOO inventory for one animal - Gorilla Bada' do
      subject.add_animals([gorilla_bada])

      expect(subject.inventory).to eq 'There is only one animal in our ZOO! '\
        'Gorilla Bada from Africa is not so smart, but he is big and strong. '\
        'Hope you will enjoy your visit!'
    end

    it 'returns proper ZOO inventory for two animals - Otter Marlene and Gorilla Bada in alphabetical order' do
      subject.add_animals([otter_marlene, gorilla_bada])

      expect(subject.inventory).to eq 'For now there are only 2 animals here! '\
        'Gorilla Bada from Africa is not so smart, but he is big and strong and '\
        'Otter Marlene is a really smart female otter. '\
        'Hope you will enjoy your visit!'
    end

    it 'returns proper ZOO inventory for two gorillas - Bada and Bing' do
      subject.add_animals([gorilla_bada, gorilla_bing])

      expect(subject.inventory).to eq 'For now there are only 2 gorillas here! '\
        'Gorilla Bada from Africa is not so smart, but he is big and strong and '\
        'Gorilla Bing from Bali looks exactly like Bada. '\
        'Hope you will enjoy your visit!'
    end

    it 'returns alphabetically ordered ZOO inventory for four animals' do
      subject.add_animals([alligator_roger, otter_marlene, gorilla_bada, gorilla_bing])

      expect(subject.inventory).to eq 'For now there are only 4 animals here! '\
        'Gorilla Bada from Africa is not so smart, but he is big and strong, '\
        'Gorilla Bing from Bali looks exactly like Bada, '\
        'Otter Marlene is a really smart female otter, '\
        'Alligator Roger likes to swim in the sewer. '\
        'Hope you will enjoy your visit!'
    end

    it 'returns alphabetically ordered ZOO inventory for more than four animals' do
      animals = [alligator_roger, otter_marlene, gorilla_bada, gorilla_bing, penguin_skipper,
                 penguin_rico, penguin_private]

      subject.add_animals(animals)

      expect(subject.inventory).to eq 'There are 7 animals in our ZOO! '\
        'Gorilla Bada from Africa is not so smart, but he is big and strong, '\
        'Gorilla Bing from Bali looks exactly like Bada, '\
        'Otter Marlene is a really smart female otter, '\
        'Penguin Private likes to be bossy, '\
        'Penguin Rico eats everything, '\
        'Alligator Roger likes to swim in the sewer, '\
        'Penguin Skipper is the main man here. '\
        'Hope you will enjoy your visit!'
    end

    it 'returns alphabetically ordered ZOO inventory for ten animals' do
      animals = [alligator_roger, otter_marlene, gorilla_bada, gorilla_bing, penguin_skipper, penguin_rico,
                 penguin_private, penguin_kowalski, lemur_julien, lemur_mort]

      subject.add_animals(animals)

      expect(subject.inventory).to eq 'Yayy! We have 10 residents now! '\
        'Gorilla Bada from Africa is not so smart, '\
        'but he is big and strong, Gorilla Bing from Bali looks exactly like Bada, '\
        'Lemur (kind: Ring tailed) Julien - self-appointed king of everything, '\
        'Penguin Kowalski does not like to talk much, Otter Marlene is a really smart female otter, '\
        "Lemur (kind: Goodman's mouse) Mort - the cutest thing you will ever see, "\
        'Penguin Private likes to be bossy, Penguin Rico eats everything, '\
        'Alligator Roger likes to swim in the sewer, Penguin Skipper is the main man here. '\
        'You need to visit us as soon as possible!'
    end
  end
end

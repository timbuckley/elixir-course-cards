defmodule Cards do
  @moduledoc """
    Provides methods for creating and handling a deck of cards.
  """

  @doc """
    Returns a list of strings representing a deck of cards.
  """
  def create_deck do
    values = [
      "Ace", "Two", "Three", "Four", "Five",
      "Six", "Seven", "Eight", "Nine", "Ten",
      "Jack", "Queen", "King"
    ]
    suits = ["Spades", "Clubs", "Hearts", "Diamonds"]

    # List comprehension.
    for value <- values, suit <- suits do
      "#{value} of #{suit}"
    end
  end

  @doc """
    Divides a deck into a hand and the remained of the deck.
    The `hand_size` argument indicates how many cards should be in the hand.

  ## Examples
      iex> deck = Cards.create_deck
      iex> {hand, deck} = Cards.deal(deck, 1)
      iex> hand
      ["Ace of Spades"]
  """
  def deal(deck, hand_size) do
    Enum.split(deck, hand_size)
  end

  def shuffle(deck) do
    Enum.shuffle deck
  end

  @doc """
    Determines whether a deck contains a given card.

  ## Examples
      iex> deck = Cards.create_deck
      iex> Cards.contains?(deck, "Ace of Spades")
      true
  """

  def contains?(deck, card) do
    Enum.member?(deck, card)
  end

  def save(deck, filename) do
    binary = :erlang.term_to_binary deck
    File.write(filename, binary)
  end

  def load(filename) do
    case File.read(filename) do
      {:ok, binary} -> :erlang.binary_to_term binary
      {:error, _reason} -> "That file does not exist"
    end
  end


end
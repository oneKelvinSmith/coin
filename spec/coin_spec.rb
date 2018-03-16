RSpec.describe Coin do
  it 'has a version number' do
    expect(Coin::VERSION).not_to be nil
  end

  describe '.encrypt' do
    subject { described_class.encrypt(plaintext: 'madness') }

    it 'returns an object containing the AES encryption keys and ciphertext' do
      expect(subject).to match(
        data:  anything,
        key:   anything,
        nonce: anything,
        tag:   anything
      )
    end

    it 'returns the 32 byte key' do
      expect(subject[:key].bytesize).to be 32
    end

    it 'returns the 12 byte nonce' do
      expect(subject[:nonce].bytesize).to be 12
    end

    it 'returns the 16 byte tag' do
      expect(subject[:tag].bytesize).to be 16
    end
  end

  describe '.decrypt' do
    let(:encrypt_hash) { described_class.encrypt(plaintext: 'secret') }

    it 'returns a hash with the original plaintext' do
      expect(described_class.decrypt(encrypt_hash)).to eq(plaintext: 'secret')
    end
  end
end
